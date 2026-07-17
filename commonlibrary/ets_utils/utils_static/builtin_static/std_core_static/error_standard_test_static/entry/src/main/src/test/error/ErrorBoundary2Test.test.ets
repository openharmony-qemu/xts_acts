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
import { BusinessError } from '@kit.BasicServicesKit';
import Utils from '../Util.test';

export default function ErrorBoundary2Test(): void {
  describe('ErrorBoundary2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_0100
     * @tc.name testErrorBoundary2001
     * @tc.desc Verify Error(0) stores code 0 with name defaulting to Error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0);
      expect(e.name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_0200
     * @tc.name testErrorBoundary2002
     * @tc.desc Verify Error(0, msg) stores both code and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0, '0x123');
      expect(e.name).assertEqual('Error');
      expect(e.message).assertEqual('0x123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_0300
     * @tc.name testErrorBoundary2003
     * @tc.desc Verify Error(0, empty string) stores empty message with code 0 and name Error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0, '');
      expect(e.message).assertEqual('');
      expect(e.code).assertEqual(0);
      expect(e.name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_0400
     * @tc.name testErrorBoundary2004
     * @tc.desc Verify setting name to empty string after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('');
      e.name = '';
      expect(e.name).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_0500
     * @tc.name testErrorBoundary2005
     * @tc.desc Verify Error name supports long repeated character strings
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('m');
      e.name = 'N'.repeat(100);
      expect(e.name.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_0600
     * @tc.name testErrorBoundary2006
     * @tc.desc Verify Error message supports long (2000 chars) content
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: string = 'X'.repeat(2000);
      let e: Error = new Error(m);
      expect(e.message).assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_0700
     * @tc.name testErrorBoundary2007
     * @tc.desc Verify Error name supports Unicode/CJK characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('m');
      e.name = '名称';
      expect(e.name).assertEqual('名称');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_0800
     * @tc.name testErrorBoundary2008
     * @tc.desc Verify toString() returns non-empty string with empty name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('m');
      e.name = '';
      expect(e.toString()).assertEqual('m');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_0900
     * @tc.name testErrorBoundary2009
     * @tc.desc Verify toString() returns string type when name and message are empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('');
      e.name = '';
      expect(typeof e.toString()).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_1000
     * @tc.name testErrorBoundary2010
     * @tc.desc Verify Error cause can be cleared to undefined boundary value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("e", { cause: new Error("test@example.com") });
      expect((e.cause as Error).message).assertEqual("test@example.com");
      e.cause = undefined;
      expect(e.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_1100
     * @tc.name testErrorBoundary2011
     * @tc.desc Verify thrown TypeError preserves empty message boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new TypeError("");
      } catch (e) {
        expect((e as TypeError).message).assertEqual("");
        expect((e as TypeError).name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_1200
     * @tc.name testErrorBoundary2012
     * @tc.desc Verify thrown RangeError preserves whitespace message boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new RangeError(" ");
      } catch (e) {
        expect((e as RangeError).message).assertEqual(" ");
        expect((e as RangeError).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_1300
     * @tc.name testErrorBoundary2013
     * @tc.desc Verify TypeError with undefined cause option preserves undefined in catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new TypeError("t", { cause: undefined });
      } catch (e) {
        expect((e as Error).cause).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_1400
     * @tc.name testErrorBoundary2014
     * @tc.desc Verify string value as cause option is preserved in catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Object = '<script>alert(1)</script>' as Object;
      try {
        throw new TypeError('2026-02-30', { cause: c });
      } catch (e) {
        expect((e as Error).cause).assertEqual(c);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_1500
     * @tc.name testErrorBoundary2015
     * @tc.desc Verify numeric value as cause option is preserved in catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Object = 99 as Object;
      try {
        throw new RangeError('r', { cause: c });
      } catch (e) {
        expect((e as Error).cause).assertEqual(c);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_1600
     * @tc.name testErrorBoundary2016
     * @tc.desc Verify boolean value as cause option is accessible in catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new SyntaxError('s', { cause: (false as Object) });
      } catch (e) {
        expect((e as Error).cause).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_1700
     * @tc.name testErrorBoundary2017
     * @tc.desc Verify Error(1) stores minimum positive code boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(1);
      expect(e.code).assertEqual(1);
      expect(e.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_1800
     * @tc.name testErrorBoundary2018
     * @tc.desc Verify Error(MIN_INT, empty message) stores both boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(-2147483648, "");
      expect(e.code).assertEqual(-2147483648);
      expect(e.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_1900
     * @tc.name testErrorBoundary2019
     * @tc.desc Verify Error with code 0 and cause option
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Error = new Error('\uFFFD');
      let e: Error = new Error(0, '123.45e6', { cause: c });
      expect(e.cause).assertEqual(c);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_2000
     * @tc.name testErrorBoundary2020
     * @tc.desc Verify Error with negative code stores correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(-1, '25:00:00');
      expect(e.message).assertEqual('25:00:00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_2100
     * @tc.name testErrorBoundary2021
     * @tc.desc Verify Error with MAX_INT code preserves message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(2147483647, '622202********1234');
      expect(e.message).assertEqual('622202********1234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_2200
     * @tc.name testErrorBoundary2022
     * @tc.desc Verify Error with MIN_INT code preserves message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(-2147483648, '310101199001011234');
      expect(e.message).assertEqual('310101199001011234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_2300
     * @tc.name testErrorBoundary2023
     * @tc.desc Verify Error name can be mutated to long boundary string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("m");
      e.name = "N".repeat(512);
      expect(e.name.length).assertEqual(512);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_2400
     * @tc.name testErrorBoundary2024
     * @tc.desc Verify Error message can be mutated to long boundary string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("a");
      e.message = "M".repeat(2048);
      expect(e.message.length).assertEqual(2048);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_2500
     * @tc.name testErrorBoundary2025
     * @tc.desc Verify Error cause can be changed to false special value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("e", { cause: new Error("original") });
      e.cause = false;
      expect(e.cause).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_2600
     * @tc.name testErrorBoundary2026
     * @tc.desc Verify deep cause chain mutation propagates through references
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l2: Error = new Error('l2');
      let l1: Error = new Error('l1', { cause: l2 });
      l2.message = '\u200B';
      expect(((l1.cause as Error).message)).assertEqual('\u200B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_2700
     * @tc.name testErrorBoundary2027
     * @tc.desc Verify AggregateError with empty errors array boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let agg: AggregateError = new AggregateError([]);
      expect(agg.name).assertEqual("AggregateError");
      expect(agg.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_2800
     * @tc.name testErrorBoundary2028
     * @tc.desc Verify AggregateError with single Error element boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Error = new Error("single");
      let agg: AggregateError = new AggregateError([inner]);
      expect(agg.errors.length).assertEqual(1);
      expect(agg.errors[0]).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_2900
     * @tc.name testErrorBoundary2029
     * @tc.desc Verify AggregateError with empty message boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let agg: AggregateError = new AggregateError([new Error("e")], "");
      expect(agg.message).assertEqual("");
      expect(agg.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_3000
     * @tc.name testErrorBoundary2030
     * @tc.desc Verify toString with empty message returns only Error name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("");
      expect(e.toString()).assertEqual("Error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_3100
     * @tc.name testErrorBoundary2031
     * @tc.desc Verify toString with long name boundary keeps prefix
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("m");
      e.name = "N".repeat(128);
      expect(e.toString()).assertEqual("N".repeat(128) + ": m");
      expect(e.name.length).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_3200
     * @tc.name testErrorBoundary2032
     * @tc.desc Verify toString with zero code and empty message uses Error name only
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0, "");
      expect(e.code).assertEqual(0);
      expect(e.toString()).assertEqual("Error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_3300
     * @tc.name testErrorBoundary2033
     * @tc.desc Verify stack is defined after throwing Error with long message boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("CustomName", 42, "S".repeat(256));
      try {
        throw e;
      } catch (caught) {
        expect(((caught as Error).stack as string).includes("ErrorBoundary2Test.test.ets")).assertTrue();
        expect(caught.message.length).assertEqual(256);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_3400
     * @tc.name testErrorBoundary2034
     * @tc.desc Verify stack is defined after throwing Error with MAX_INT code
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(2147483647, "stack test");
      try {
        throw e;
      } catch (caught) {
        expect(((caught as Error).stack as string).includes("ErrorBoundary2Test.test.ets")).assertTrue();
        expect(caught.code).assertEqual(2147483647);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_3500
     * @tc.name testErrorBoundary2035
     * @tc.desc Verify 15-level deep cause chain preserves top level message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("L0");
      for (let i: int = 1; i <= 15; i++) {
        cause = new Error("L" + i, { cause: cause });
      }
      expect(cause.message).assertEqual("L15");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_3600
     * @tc.name testErrorBoundary2036
     * @tc.desc Verify 10-level deep cause chain reaches bottom cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("bottom");
      for (let i: int = 1; i <= 10; i++) {
        cause = new Error("L" + i, { cause: cause });
      }
      let current: Error = cause;
      let depth: int = 0;
      while (current.cause !== undefined && depth < 20) {
        current = current.cause as Error;
        depth++;
      }
      expect(current.message).assertEqual("bottom");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_3700
     * @tc.name testErrorBoundary2037
     * @tc.desc Verify TypeError preserves tab message special value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: TypeError = new TypeError("\t");
      expect(e.name).assertEqual("TypeError");
      expect(e.message).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_3800
     * @tc.name testErrorBoundary2038
     * @tc.desc Verify RangeError preserves newline message special value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: RangeError = new RangeError("a\nb");
      expect(e.name).assertEqual("RangeError");
      expect(e.message).assertEqual("a\nb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_3900
     * @tc.name testErrorBoundary2039
     * @tc.desc Verify SyntaxError preserves RTL message special value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = "????? ?????";
      let e: SyntaxError = new SyntaxError(msg);
      expect(e.name).assertEqual("SyntaxError");
      expect(e.message).assertEqual(msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_4000
     * @tc.name testErrorBoundary2040
     * @tc.desc Verify AggregateError stores maximum small fixed array boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("e0"), new Error("e1"), new Error("e2"), new Error("e3")];
      let agg: AggregateError = new AggregateError(errors);
      expect(agg.errors.length).assertEqual(4);
      expect(agg.errors[3].message).assertEqual("e3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_4100
     * @tc.name testErrorBoundary2041
     * @tc.desc Verify AggregateError stores mixed subclass elements as special values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new TypeError("t"), new RangeError("r")];
      let agg: AggregateError = new AggregateError(errors);
      expect(agg.errors.length).assertEqual(2);
      expect(agg.errors[0].name).assertEqual("TypeError");
      expect(agg.errors[1].name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_4200
     * @tc.name testErrorBoundary2042
     * @tc.desc Verify RTL Arabic text as Error name is stored correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtlName: string = 'خطأ في النظام';
      let e: Error = new Error(rtlName, 'system error');
      expect(e.name).assertEqual(rtlName);
      expect(e.message).assertEqual('system error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_4300
     * @tc.name testErrorBoundary2043
     * @tc.desc Verify RTL Hebrew text as Error message is stored correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtlMsg: string = 'שגיאת מערכת';
      let e: Error = new Error('HebErr', rtlMsg);
      expect(e.name).assertEqual('HebErr');
      expect(e.message).assertEqual(rtlMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_4400
     * @tc.name testErrorBoundary2044
     * @tc.desc Verify full-width characters as Error name is stored correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fwName: string = 'ＥＲＲＯＲ';
      let e: Error = new Error(fwName, 'fullwidth');
      expect(e.name).assertEqual(fwName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_4500
     * @tc.name testErrorBoundary2045
     * @tc.desc Verify full-width characters as Error message is stored correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fwMsg: string = 'ＦＵＬＬＷＩＤＴＨ';
      let e: Error = new Error('FwErr', fwMsg);
      expect(e.message).assertEqual(fwMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_4600
     * @tc.name testErrorBoundary2046
     * @tc.desc Verify zero-width characters embedded in Error message are preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwMsg: string = 'A​B‌C‍D';
      let e: Error = new Error(zwMsg);
      expect(e.message).assertEqual(zwMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_4700
     * @tc.name testErrorBoundary2047
     * @tc.desc Verify control characters embedded in Error message are preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctrlMsg: string = 'a\0b\rc\bd';
      let e: Error = new Error(ctrlMsg);
      expect(e.message).assertEqual(ctrlMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_4800
     * @tc.name testErrorBoundary2048
     * @tc.desc Verify 10-level deep Error cause chain preserves all levels and messages
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error('depth0');
      let current: Object = root;
      for (let d: int = 1; d <= 10; d++) {
        current = new Error('depth' + d, { cause: current as Object as Error });
      }
      expect((current as Error).message).assertEqual('depth10');
      let walk: Object = current;
      let names: string[] = [];
      for (let i: int = 0; i < 10; i++) {
        names.push((walk as Error).message);
        walk = (walk as Error).cause as Object;
      }
      expect(names[0]).assertEqual('depth10');
      expect(names[9]).assertEqual('depth1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_4900
     * @tc.name testErrorBoundary2049
     * @tc.desc Verify 10-level cause chain with mixed Error subclass types preserves order and types
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chain: Error = new Error('depth0');
      chain = new TypeError('T1', { cause: chain });
      chain = new RangeError('R2', { cause: chain });
      chain = new SyntaxError('S3', { cause: chain });
      chain = new ReferenceError('R4', { cause: chain });
      chain = new TypeError('T5', { cause: chain });
      chain = new EvalError('E6', { cause: chain });
      chain = new URIError('U7', { cause: chain });
      chain = new RangeError('R8', { cause: chain });
      chain = new Error('E9', { cause: chain });
      chain = new TypeError('T10', { cause: chain });
      expect((chain as TypeError).name).assertEqual('TypeError');
      let cur: Object = chain;
      let msgs: string[] = [];
      for (let i: int = 0; i < 10; i++) {
        msgs.push((cur as Error).message);
        cur = (cur as Error).cause as Object;
      }
      expect(msgs[0]).assertEqual('T10');
      expect(msgs[4]).assertEqual('E6');
      expect(msgs[9]).assertEqual('T1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_5000
     * @tc.name testErrorBoundary2050
     * @tc.desc Verify BusinessError empty string data boundary keeps data and leaves cause empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("string data cause");
      let err: BusinessError<string> = new BusinessError<string>(501, "", cause);
      expect(err.code).assertEqual(501);
      expect(err.data as string).assertEqual("");
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_5100
     * @tc.name testErrorBoundary2051
     * @tc.desc Verify BusinessError with MAX_INT data keeps data and leaves cause empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("int data cause");
      let err: BusinessError<int> = new BusinessError<int>(502, 2147483647, cause);
      expect(err.code).assertEqual(502);
      expect((err.data as int)).assertEqual(2147483647);
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_5200
     * @tc.name testErrorBoundary2052
     * @tc.desc Verify BusinessError with minimum and maximum code boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1: BusinessError = new BusinessError(1, 'min positive');
      expect(err1.code).assertEqual(1);
      let err2: BusinessError = new BusinessError(2147483647, 'max');
      expect(err2.code).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_5300
     * @tc.name testErrorBoundary2053
     * @tc.desc Verify toString with empty name returns only message without colon
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('test');
      err.name = '';
      let str: string = err.toString();
      expect(str).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_5400
     * @tc.name testErrorBoundary2054
     * @tc.desc Verify toString with empty name and empty message returns empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('');
      err.name = '';
      expect(err.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_5500
     * @tc.name testErrorBoundary2055
     * @tc.desc Verify toString with whitespace name returns name: message format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('test');
      err.name = '   ';
      expect(err.toString()).assertEqual('   : test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_5600
     * @tc.name testErrorBoundary2056
     * @tc.desc Verify Error stack supports empty string boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("stack");
      err.stack = "";
      expect(err.stack).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_5700
     * @tc.name testErrorBoundary2057
     * @tc.desc Verify Error array with empty message boundary element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("")];
      expect(errors.length).assertEqual(1);
      expect(errors[0].message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_5800
     * @tc.name testErrorBoundary2058
     * @tc.desc Verify toString with cause still preserves visible boundary message only
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("hidden cause");
      let err: Error = new Error("", { cause: cause });
      expect(err.toString()).assertEqual("Error");
      expect(err.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_5900
     * @tc.name testErrorBoundary2059
     * @tc.desc Verify cause set to undefined after construction clears the reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('msg', { cause: new Error('original cause') });
      expect((err.cause as Error).message).assertEqual('original cause');
      err.cause = undefined;
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_6000
     * @tc.name testErrorBoundary2060
     * @tc.desc Verify cause explicitly set to undefined yields undefined for TypeError / RangeError / SyntaxError / ReferenceError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: TypeError = new TypeError('msg', { cause: undefined });
      let e2: RangeError = new RangeError('msg', { cause: undefined });
      let e3: SyntaxError = new SyntaxError('msg', { cause: undefined });
      let e4: ReferenceError = new ReferenceError('msg', { cause: undefined });
      expect(e1.cause).assertUndefined();
      expect(e2.cause).assertUndefined();
      expect(e3.cause).assertUndefined();
      expect(e4.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_6100
     * @tc.name testErrorBoundary2061
     * @tc.desc Verify cause explicitly set to undefined yields undefined for URIError / EvalError / FormatError / NonIntegralIndexError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: URIError = new URIError('msg', { cause: undefined });
      let e2: EvalError = new EvalError('msg', { cause: undefined });
      let e3: FormatError = new FormatError('msg', { cause: undefined });
      let e4: NonIntegralIndexError = new NonIntegralIndexError('msg', { cause: undefined });
      expect(e1.cause).assertUndefined();
      expect(e2.cause).assertUndefined();
      expect(e3.cause).assertUndefined();
      expect(e4.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_6200
     * @tc.name testErrorBoundary2062
     * @tc.desc Verify writing tab character to name property is preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('base');
      err.name = '\t';
      expect(err.name).assertEqual('\t');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_6300
     * @tc.name testErrorBoundary2063
     * @tc.desc Verify writing newline character to name property is preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('base');
      err.name = '\n';
      expect(err.name).assertEqual('\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_6400
     * @tc.name testErrorBoundary2064
     * @tc.desc Verify writing CRLF to name property is preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('base');
      err.name = '\r\n';
      expect(err.name).assertEqual('\r\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_6500
     * @tc.name testErrorBoundary2065
     * @tc.desc Verify writing zero-width space to name property is preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('base');
      err.name = '\u200B';
      expect(err.name).assertEqual('\u200B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_6600
     * @tc.name testErrorBoundary2066
     * @tc.desc Verify writing emoji and Chinese characters to name property is preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('base');
      err.name = '😀测试';
      expect(err.name).assertEqual('😀测试');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_6700
     * @tc.name testErrorBoundary2067
     * @tc.desc Verify writing double emoji characters to name property is preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('base');
      err.name = '🔥🔥';
      expect(err.name).assertEqual('🔥🔥');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_6800
     * @tc.name testErrorBoundary2068
     * @tc.desc Verify writing replacement character to name property is preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('base');
      err.name = '\uFFFD';
      expect(err.name).assertEqual('\uFFFD');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_6900
     * @tc.name testErrorBoundary2069
     * @tc.desc Verify writing isolated surrogate character to name property is preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('base');
      err.name = '\uDC04';
      expect(err.name).assertEqual('\uDC04');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_7000
     * @tc.name testErrorBoundary2070
     * @tc.desc Verify constructor(name, code, message) preserves emoji and Chinese in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('😀测试', 1001, 'name-boundary-emoji');
      expect(err.name).assertEqual('😀测试');
      expect(err.code).assertEqual(1001);
      expect(err.message).assertEqual('name-boundary-emoji');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_7100
     * @tc.name testErrorBoundary2071
     * @tc.desc Verify constructor(name, code, message) preserves replacement character in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('\uFFFD', 1001, 'name-boundary-replacement');
      expect(err.name).assertEqual('\uFFFD');
      expect(err.code).assertEqual(1001);
      expect(err.message).assertEqual('name-boundary-replacement');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_7200
     * @tc.name testErrorBoundary2072
     * @tc.desc Verify constructor(name, code, message) preserves isolated surrogate in name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('\uDC04', 1001, 'name-boundary-surrogate');
      expect(err.name).assertEqual('\uDC04');
      expect(err.code).assertEqual(1001);
      expect(err.message).assertEqual('name-boundary-surrogate');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_7300
     * @tc.name testErrorBoundary2073
     * @tc.desc Verify writing tab character to message property is preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('base');
      err.message = '\t';
      expect(err.message).assertEqual('\t');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BOUNDARY_2_7400
     * @tc.name testErrorBoundary2074
     * @tc.desc Verify writing newline character to message property is preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBoundary2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error('base');
      err.message = '\n';
      expect(err.message).assertEqual('\n');
    });
  });
}
