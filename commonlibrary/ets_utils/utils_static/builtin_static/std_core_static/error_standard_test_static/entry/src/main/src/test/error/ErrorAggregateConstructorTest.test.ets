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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function ErrorAggregateConstructorTest(): void {
  describe('ErrorAggregateConstructorTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_0100
     * @tc.name testErrorAggregateConstructor001
     * @tc.desc Verify AggregateError constructor with empty array defaults name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([]);
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('');
      expect(err.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_0200
     * @tc.name testErrorAggregateConstructor002
     * @tc.desc Verify AggregateError constructor with one Error preserves errors length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Error = new Error('inner');
      let err: AggregateError = new AggregateError([inner]);
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].message).assertEqual('inner');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_0300
     * @tc.name testErrorAggregateConstructor003
     * @tc.desc Verify AggregateError constructor with two Errors preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error('first');
      let second: Error = new Error('second');
      let err: AggregateError = new AggregateError([first, second], 'two');
      expect(err.errors.length).assertEqual(2);
      expect(err.errors[0].message).assertEqual('first');
      expect(err.errors[1].message).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_0400
     * @tc.name testErrorAggregateConstructor004
     * @tc.desc Verify AggregateError constructor with cause preserves cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root');
      let err: AggregateError = new AggregateError([new Error('leaf')], 'msg', { cause: cause });
      expect(err.message).assertEqual('msg');
      expect(err.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_0500
     * @tc.name testErrorAggregateConstructor005
     * @tc.desc Verify AggregateError constructor with Set iterable preserves count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Set<Error> = new Set<Error>();
      values.add(new Error('a'));
      values.add(new Error('b'));
      let err: AggregateError = new AggregateError(values, 'set');
      expect(err.message).assertEqual('set');
      expect(err.errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_0600
     * @tc.name testErrorAggregateConstructor006
     * @tc.desc Verify AggregateError constructor with nested AggregateError preserves nested name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: AggregateError = new AggregateError([new Error('n')], 'nested');
      let err: AggregateError = new AggregateError([nested], 'outer');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_0700
     * @tc.name testErrorAggregateConstructor007
     * @tc.desc Verify AggregateError constructor message variant alpha
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], 'alpha');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('alpha');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_0800
     * @tc.name testErrorAggregateConstructor008
     * @tc.desc Verify AggregateError constructor message variant empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_0900
     * @tc.name testErrorAggregateConstructor009
     * @tc.desc Verify AggregateError constructor message variant space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], ' ');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual(' ');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1000
     * @tc.name testErrorAggregateConstructor010
     * @tc.desc Verify AggregateError constructor message variant symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '!@#$');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('!@#$');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1100
     * @tc.name testErrorAggregateConstructor011
     * @tc.desc Verify AggregateError constructor message variant json
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '{"a":1}');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('{"a":1}');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1200
     * @tc.name testErrorAggregateConstructor012
     * @tc.desc Verify AggregateError constructor message variant url
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], 'https://example.com');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('https://example.com');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1300
     * @tc.name testErrorAggregateConstructor013
     * @tc.desc Verify AggregateError constructor message variant uuid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '123e4567-e89b-12d3-a456-426614174000');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('123e4567-e89b-12d3-a456-426614174000');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1400
     * @tc.name testErrorAggregateConstructor014
     * @tc.desc Verify AggregateError constructor message variant hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '0xFF');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('0xFF');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1500
     * @tc.name testErrorAggregateConstructor015
     * @tc.desc Verify AggregateError constructor message variant binary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '0b1010');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('0b1010');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1600
     * @tc.name testErrorAggregateConstructor016
     * @tc.desc Verify AggregateError constructor message variant octal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '0o77');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('0o77');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1700
     * @tc.name testErrorAggregateConstructor017
     * @tc.desc Verify AggregateError constructor message variant scientific
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '1e308');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('1e308');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1800
     * @tc.name testErrorAggregateConstructor018
     * @tc.desc Verify AggregateError constructor message variant nan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], 'NaN');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('NaN');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1900
     * @tc.name testErrorAggregateConstructor019
     * @tc.desc Verify AggregateError constructor message variant infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], 'Infinity');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('Infinity');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_2000
     * @tc.name testErrorAggregateConstructor020
     * @tc.desc Verify AggregateError constructor message variant negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '-0');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('-0');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_2100
     * @tc.name testErrorAggregateConstructor021
     * @tc.desc Verify AggregateError constructor message variant long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(err.errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_2200
     * @tc.name testErrorAggregateConstructor022
     * @tc.desc Verify AggregateError constructor stores Error element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Error = new Error('Error message');
      let err: AggregateError = new AggregateError([inner], 'Error aggregate');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('Error');
      expect(err.errors[0].message).assertEqual('Error message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_2300
     * @tc.name testErrorAggregateConstructor023
     * @tc.desc Verify AggregateError constructor stores TypeError element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: TypeError = new TypeError('TypeError message');
      let err: AggregateError = new AggregateError([inner], 'TypeError aggregate');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('TypeError');
      expect(err.errors[0].message).assertEqual('TypeError message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_2400
     * @tc.name testErrorAggregateConstructor024
     * @tc.desc Verify AggregateError constructor stores RangeError element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: RangeError = new RangeError('RangeError message');
      let err: AggregateError = new AggregateError([inner], 'RangeError aggregate');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('RangeError');
      expect(err.errors[0].message).assertEqual('RangeError message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_2500
     * @tc.name testErrorAggregateConstructor025
     * @tc.desc Verify AggregateError constructor stores SyntaxError element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: SyntaxError = new SyntaxError('SyntaxError message');
      let err: AggregateError = new AggregateError([inner], 'SyntaxError aggregate');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('SyntaxError');
      expect(err.errors[0].message).assertEqual('SyntaxError message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_2600
     * @tc.name testErrorAggregateConstructor026
     * @tc.desc Verify AggregateError constructor stores ReferenceError element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: ReferenceError = new ReferenceError('ReferenceError message');
      let err: AggregateError = new AggregateError([inner], 'ReferenceError aggregate');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('ReferenceError');
      expect(err.errors[0].message).assertEqual('ReferenceError message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_2700
     * @tc.name testErrorAggregateConstructor027
     * @tc.desc Verify AggregateError constructor stores URIError element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: URIError = new URIError('URIError message');
      let err: AggregateError = new AggregateError([inner], 'URIError aggregate');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('URIError');
      expect(err.errors[0].message).assertEqual('URIError message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_2800
     * @tc.name testErrorAggregateConstructor028
     * @tc.desc Verify AggregateError constructor stores EvalError element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: EvalError = new EvalError('EvalError message');
      let err: AggregateError = new AggregateError([inner], 'EvalError aggregate');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('EvalError');
      expect(err.errors[0].message).assertEqual('EvalError message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_2900
     * @tc.name testErrorAggregateConstructor029
     * @tc.desc Verify AggregateError constructor stores FormatError element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: FormatError = new FormatError('FormatError message');
      let err: AggregateError = new AggregateError([inner], 'FormatError aggregate');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('FormatError');
      expect(err.errors[0].message).assertEqual('FormatError message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3000
     * @tc.name testErrorAggregateConstructor030
     * @tc.desc Verify AggregateError constructor stores 3 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2')], 'count 3');
      expect(err.message).assertEqual('count 3');
      expect(err.errors.length).assertEqual(3);
      expect(err.errors[2].message).assertEqual('e2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3100
     * @tc.name testErrorAggregateConstructor031
     * @tc.desc Verify AggregateError constructor stores 4 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3')], 'count 4');
      expect(err.message).assertEqual('count 4');
      expect(err.errors.length).assertEqual(4);
      expect(err.errors[3].message).assertEqual('e3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3200
     * @tc.name testErrorAggregateConstructor032
     * @tc.desc Verify AggregateError constructor stores 5 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4')], 'count 5');
      expect(err.message).assertEqual('count 5');
      expect(err.errors.length).assertEqual(5);
      expect(err.errors[4].message).assertEqual('e4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3300
     * @tc.name testErrorAggregateConstructor033
     * @tc.desc Verify AggregateError constructor stores 6 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5')], 'count 6');
      expect(err.message).assertEqual('count 6');
      expect(err.errors.length).assertEqual(6);
      expect(err.errors[5].message).assertEqual('e5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3400
     * @tc.name testErrorAggregateConstructor034
     * @tc.desc Verify AggregateError constructor stores 7 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6')], 'count 7');
      expect(err.message).assertEqual('count 7');
      expect(err.errors.length).assertEqual(7);
      expect(err.errors[6].message).assertEqual('e6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3500
     * @tc.name testErrorAggregateConstructor035
     * @tc.desc Verify AggregateError constructor stores 8 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7')], 'count 8');
      expect(err.message).assertEqual('count 8');
      expect(err.errors.length).assertEqual(8);
      expect(err.errors[7].message).assertEqual('e7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3600
     * @tc.name testErrorAggregateConstructor036
     * @tc.desc Verify AggregateError constructor stores 9 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8')], 'count 9');
      expect(err.message).assertEqual('count 9');
      expect(err.errors.length).assertEqual(9);
      expect(err.errors[8].message).assertEqual('e8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3700
     * @tc.name testErrorAggregateConstructor037
     * @tc.desc Verify AggregateError constructor stores 10 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8'), new Error('e9')], 'count 10');
      expect(err.message).assertEqual('count 10');
      expect(err.errors.length).assertEqual(10);
      expect(err.errors[9].message).assertEqual('e9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3800
     * @tc.name testErrorAggregateConstructor038
     * @tc.desc Verify AggregateError constructor stores 11 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8'), new Error('e9'), new Error('e10')], 'count 11');
      expect(err.message).assertEqual('count 11');
      expect(err.errors.length).assertEqual(11);
      expect(err.errors[10].message).assertEqual('e10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3900
     * @tc.name testErrorAggregateConstructor039
     * @tc.desc Verify AggregateError constructor stores 12 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8'), new Error('e9'), new Error('e10'), new Error('e11')], 'count 12');
      expect(err.message).assertEqual('count 12');
      expect(err.errors.length).assertEqual(12);
      expect(err.errors[11].message).assertEqual('e11');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4000
     * @tc.name testErrorAggregateConstructor040
     * @tc.desc Verify AggregateError constructor stores 13 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8'), new Error('e9'), new Error('e10'), new Error('e11'), new Error('e12')], 'count 13');
      expect(err.message).assertEqual('count 13');
      expect(err.errors.length).assertEqual(13);
      expect(err.errors[12].message).assertEqual('e12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4100
     * @tc.name testErrorAggregateConstructor041
     * @tc.desc Verify AggregateError constructor stores 14 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8'), new Error('e9'), new Error('e10'), new Error('e11'), new Error('e12'), new Error('e13')], 'count 14');
      expect(err.message).assertEqual('count 14');
      expect(err.errors.length).assertEqual(14);
      expect(err.errors[13].message).assertEqual('e13');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4200
     * @tc.name testErrorAggregateConstructor042
     * @tc.desc Verify AggregateError constructor stores 15 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8'), new Error('e9'), new Error('e10'), new Error('e11'), new Error('e12'), new Error('e13'), new Error('e14')], 'count 15');
      expect(err.message).assertEqual('count 15');
      expect(err.errors.length).assertEqual(15);
      expect(err.errors[14].message).assertEqual('e14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4300
     * @tc.name testErrorAggregateConstructor043
     * @tc.desc Verify AggregateError constructor stores 16 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8'), new Error('e9'), new Error('e10'), new Error('e11'), new Error('e12'), new Error('e13'), new Error('e14'), new Error('e15')], 'count 16');
      expect(err.message).assertEqual('count 16');
      expect(err.errors.length).assertEqual(16);
      expect(err.errors[15].message).assertEqual('e15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4400
     * @tc.name testErrorAggregateConstructor044
     * @tc.desc Verify AggregateError constructor stores 17 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8'), new Error('e9'), new Error('e10'), new Error('e11'), new Error('e12'), new Error('e13'), new Error('e14'), new Error('e15'), new Error('e16')], 'count 17');
      expect(err.message).assertEqual('count 17');
      expect(err.errors.length).assertEqual(17);
      expect(err.errors[16].message).assertEqual('e16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4500
     * @tc.name testErrorAggregateConstructor045
     * @tc.desc Verify AggregateError constructor stores 18 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8'), new Error('e9'), new Error('e10'), new Error('e11'), new Error('e12'), new Error('e13'), new Error('e14'), new Error('e15'), new Error('e16'), new Error('e17')], 'count 18');
      expect(err.message).assertEqual('count 18');
      expect(err.errors.length).assertEqual(18);
      expect(err.errors[17].message).assertEqual('e17');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4600
     * @tc.name testErrorAggregateConstructor046
     * @tc.desc Verify AggregateError constructor stores 19 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8'), new Error('e9'), new Error('e10'), new Error('e11'), new Error('e12'), new Error('e13'), new Error('e14'), new Error('e15'), new Error('e16'), new Error('e17'), new Error('e18')], 'count 19');
      expect(err.message).assertEqual('count 19');
      expect(err.errors.length).assertEqual(19);
      expect(err.errors[18].message).assertEqual('e18');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4700
     * @tc.name testErrorAggregateConstructor047
     * @tc.desc Verify AggregateError constructor stores 20 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8'), new Error('e9'), new Error('e10'), new Error('e11'), new Error('e12'), new Error('e13'), new Error('e14'), new Error('e15'), new Error('e16'), new Error('e17'), new Error('e18'), new Error('e19')], 'count 20');
      expect(err.message).assertEqual('count 20');
      expect(err.errors.length).assertEqual(20);
      expect(err.errors[19].message).assertEqual('e19');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4800
     * @tc.name testErrorAggregateConstructor048
     * @tc.desc Verify AggregateError constructor stores 21 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8'), new Error('e9'), new Error('e10'), new Error('e11'), new Error('e12'), new Error('e13'), new Error('e14'), new Error('e15'), new Error('e16'), new Error('e17'), new Error('e18'), new Error('e19'), new Error('e20')], 'count 21');
      expect(err.message).assertEqual('count 21');
      expect(err.errors.length).assertEqual(21);
      expect(err.errors[20].message).assertEqual('e20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4900
     * @tc.name testErrorAggregateConstructor049
     * @tc.desc Verify AggregateError constructor stores 22 Error elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e0'), new Error('e1'), new Error('e2'), new Error('e3'), new Error('e4'), new Error('e5'), new Error('e6'), new Error('e7'), new Error('e8'), new Error('e9'), new Error('e10'), new Error('e11'), new Error('e12'), new Error('e13'), new Error('e14'), new Error('e15'), new Error('e16'), new Error('e17'), new Error('e18'), new Error('e19'), new Error('e20'), new Error('e21')], 'count 22');
      expect(err.message).assertEqual('count 22');
      expect(err.errors.length).assertEqual(22);
      expect(err.errors[21].message).assertEqual('e21');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_5000
     * @tc.name testErrorAggregateConstructor050
     * @tc.desc Verify AggregateError constructor preserves string cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], 'string cause', { cause: 'cause text' });
      expect(err.cause).assertEqual('cause text');
      expect(err.message).assertEqual('string cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_5100
     * @tc.name testErrorAggregateConstructor051
     * @tc.desc Verify AggregateError constructor preserves number cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], 'number cause', { cause: 123 });
      expect(err.cause).assertEqual(123);
      expect(err.message).assertEqual('number cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_5200
     * @tc.name testErrorAggregateConstructor052
     * @tc.desc Verify AggregateError constructor preserves boolean cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], 'boolean cause', { cause: true });
      expect(err.cause).assertEqual(true);
      expect(err.message).assertEqual('boolean cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_5300
     * @tc.name testErrorAggregateConstructor053
     * @tc.desc Verify AggregateError constructor preserves array cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: string[] = ['a', 'b'];
      let err: AggregateError = new AggregateError([new Error('e')], 'array cause', { cause: cause });
      expect((err.cause as string[])[0]).assertEqual('a');
      expect(err.message).assertEqual('array cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_5400
     * @tc.name testErrorAggregateConstructor054
     * @tc.desc Verify AggregateError constructor preserves object cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('object root');
      let err: AggregateError = new AggregateError([new Error('e')], 'object cause', { cause: cause });
      expect((err.cause as Error).message).assertEqual('object root');
      expect(err.message).assertEqual('object cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_5500
     * @tc.name testErrorAggregateConstructor055
     * @tc.desc Verify AggregateError constructor independent instance 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: AggregateError = new AggregateError([new Error('a55')], 'first 55');
      let second: AggregateError = new AggregateError([new Error('b55')], 'second 55');
      expect(first.message).assertEqual('first 55');
      expect(second.message).assertEqual('second 55');
      expect(first.errors[0].message).assertEqual('a55');
      expect(second.errors[0].message).assertEqual('b55');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_5600
     * @tc.name testErrorAggregateConstructor056
     * @tc.desc Verify AggregateError constructor with undefined message keeps empty message and errors list
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [];
      let err: AggregateError = new AggregateError(errors, undefined);
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('');
      expect(err.errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_5700
     * @tc.name testErrorAggregateConstructor057
     * @tc.desc Verify AggregateError constructor consumes Map values iterable in insertion order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Map<string, Error> = new Map<string, Error>();
      source.set('first', new Error('map-first'));
      source.set('second', new RangeError('map-second'));
      let err: AggregateError = new AggregateError(source.values(), 'map values');
      expect(err.errors.length).assertEqual(2);
      expect(err.errors[0].message).assertEqual('map-first');
      expect(err.errors[1].name).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_5800
     * @tc.name testErrorAggregateConstructor058
     * @tc.desc Verify AggregateError keeps repeated error element references
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shared: Error = new Error('shared-element');
      let err: AggregateError = new AggregateError([shared, shared], 'repeat');
      expect(err.errors.length).assertEqual(2);
      expect(err.errors[0]).assertEqual(shared);
      expect(err.errors[1]).assertEqual(shared);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_5900
     * @tc.name testErrorAggregateConstructor059
     * @tc.desc Verify source array mutation after construction does not change AggregateError errors
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error('source-first');
      let source: Error[] = [first];
      let err: AggregateError = new AggregateError(source, 'copy-source');
      source.push(new Error('source-second'));
      expect(source.length).assertEqual(2);
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0]).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_6000
     * @tc.name testErrorAggregateConstructor060
     * @tc.desc Verify mutating AggregateError errors does not change source array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [new Error('source-only')];
      let err: AggregateError = new AggregateError(source, 'instance-mutation');
      err.errors.push(new TypeError('instance-only'));
      expect(source.length).assertEqual(1);
      expect(err.errors.length).assertEqual(2);
      expect(err.errors[1].name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_6100
     * @tc.name testErrorAggregateConstructor061
     * @tc.desc Verify AggregateError errors property can be reassigned to a new Error array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('old')], 'rewrite');
      let replacement: Error[] = [new SyntaxError('new-syntax')];
      err.errors = replacement;
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('SyntaxError');
      expect(err.errors).assertEqual(replacement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_6200
     * @tc.name testErrorAggregateConstructor062
     * @tc.desc Verify for-of iteration over AggregateError errors preserves element order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('left'), new RangeError('right')], 'iterate');
      let messages: string[] = [];
      for (let item of err.errors) {
        messages.push(item.message);
      }
      expect(messages.length).assertEqual(2);
      expect(messages[0]).assertEqual('left');
      expect(messages[1]).assertEqual('right');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_6300
     * @tc.name testErrorAggregateConstructor063
     * @tc.desc Verify AggregateError cause can reference itself and remain readable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([], 'self-cause');
      err.cause = err;
      expect((err.cause as AggregateError).message).assertEqual('self-cause');
      expect((err.cause as AggregateError).errors.length).assertEqual(0);
    });
  });
}
