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
      let inner: Error = new Error('\u200B');
      let err: AggregateError = new AggregateError([inner]);
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].message).assertEqual('\u200B');
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
      let first: Error = new Error('13800138000');
      let second: Error = new Error('\uFFFD');
      let err: AggregateError = new AggregateError([first, second], '0x123');
      expect(err.errors.length).assertEqual(2);
      expect(err.errors[0].message).assertEqual('13800138000');
      expect(err.errors[1].message).assertEqual('\uFFFD');
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
      let cause: Error = new Error('2026-13-01');
      let err: AggregateError = new AggregateError([new Error('leaf\u200B')], '123.45e6', { cause: cause });
      expect(err.message).assertEqual('123.45e6');
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
      values.add(new Error('test@example.com'));
      values.add(new Error('310101199001011234'));
      let err: AggregateError = new AggregateError(values, '<script>alert(1)</script>');
      expect(err.message).assertEqual('<script>alert(1)</script>');
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
      let nested: AggregateError = new AggregateError([new Error('25:00:00')], '0b1010');
      let err: AggregateError = new AggregateError([nested], '622202********1234');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('AggregateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_0700
     * @tc.name testErrorAggregateConstructor007
     * @tc.desc Verify AggregateError constructor stores alpha message and first error message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('alpha-inner')], 'alpha');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('alpha');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].message).assertEqual('alpha-inner');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_0800
     * @tc.name testErrorAggregateConstructor008
     * @tc.desc Verify AggregateError constructor keeps empty message with non-empty errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('');
      expect(err.message.length).assertEqual(0);
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('Error');
      expect(err.cause).assertUndefined();
      expect(err.errors[0].code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_0900
     * @tc.name testErrorAggregateConstructor009
     * @tc.desc Verify AggregateError constructor keeps whitespace message exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], ' ');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual(' ');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('Error');
      expect(err.errors[0].message).assertEqual('e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1000
     * @tc.name testErrorAggregateConstructor010
     * @tc.desc Verify AggregateError constructor stores symbol message with multiple errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('left'), new Error('right')], '!@#$');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('!@#$');
      expect(err.errors.length).assertEqual(2);
      expect(err.errors[1].message).assertEqual('right');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1100
     * @tc.name testErrorAggregateConstructor011
     * @tc.desc Verify AggregateError constructor treats JSON-like message as plain text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '{"a":1}');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('{"a":1}');
      expect(err.message.length).assertEqual(7);
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('Error');
      expect(err.errors[0].message).assertEqual('e');
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1200
     * @tc.name testErrorAggregateConstructor012
     * @tc.desc Verify AggregateError constructor stores URL message with cause option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('url-cause');
      let err: AggregateError = new AggregateError([new Error('e')], 'https://example.com', { cause: cause });
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('https://example.com');
      expect(err.errors.length).assertEqual(1);
      expect(err.cause).assertEqual(cause);
      expect(err.errors[0].message).assertEqual('e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1300
     * @tc.name testErrorAggregateConstructor013
     * @tc.desc Verify AggregateError constructor stores UUID message and preserves error order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('first'), new TypeError('second')], '123e4567-e89b-12d3-a456-426614174000');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('123e4567-e89b-12d3-a456-426614174000');
      expect(err.errors.length).assertEqual(2);
      expect(err.errors[0].message).assertEqual('first');
      expect(err.errors[1].name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1400
     * @tc.name testErrorAggregateConstructor014
     * @tc.desc Verify AggregateError constructor keeps hex-looking message textual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '0xFF');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('0xFF');
      expect(err.message.length).assertEqual(4);
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('Error');
      expect(err.errors[0].message).assertEqual('e');
      expect(err.errors[0].code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1500
     * @tc.name testErrorAggregateConstructor015
     * @tc.desc Verify AggregateError constructor keeps binary-looking message textual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '0b1010');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('0b1010');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('Error');
      expect(err.cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1600
     * @tc.name testErrorAggregateConstructor016
     * @tc.desc Verify AggregateError constructor keeps octal-looking message textual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '0o77');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('0o77');
      expect(err.message.length).assertEqual(4);
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('Error');
      expect(err.cause).assertUndefined();
      expect(err.errors[0].message).assertEqual('e');
      expect(err.errors[0].code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1700
     * @tc.name testErrorAggregateConstructor017
     * @tc.desc Verify AggregateError constructor keeps scientific notation message textual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('scientific-cause');
      let err: AggregateError = new AggregateError([new Error('e')], '1e308', { cause: cause });
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('1e308');
      expect(err.errors.length).assertEqual(1);
      expect(err.cause).assertEqual(cause);
      expect(err.errors[0].name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1800
     * @tc.name testErrorAggregateConstructor018
     * @tc.desc Verify AggregateError constructor keeps NaN message textual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], 'NaN');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('NaN');
      expect(err.message.length).assertEqual(3);
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('Error');
      expect(err.errors[0].message).assertEqual('e');
      expect(err.errors[0].cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_1900
     * @tc.name testErrorAggregateConstructor019
     * @tc.desc Verify AggregateError constructor keeps Infinity message textual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error('first');
      let second: Error = new Error('second');
      let err: AggregateError = new AggregateError([first, second], 'Infinity');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('Infinity');
      expect(err.errors.length).assertEqual(2);
      expect(err.errors[1]).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_2000
     * @tc.name testErrorAggregateConstructor020
     * @tc.desc Verify AggregateError constructor keeps negative zero message textual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], '-0');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('-0');
      expect(err.message.length).assertEqual(2);
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('Error');
      expect(err.cause).assertUndefined();
      expect(err.errors[0].message).assertEqual('e');
      expect(err.errors[0].cause).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_2100
     * @tc.name testErrorAggregateConstructor021
     * @tc.desc Verify AggregateError constructor preserves long message and inner error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError =
        new AggregateError([new Error('e')], 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(err.name).assertEqual('AggregateError');
      expect(err.message).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(err.message.length).assertEqual(64);
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0].name).assertEqual('Error');
      expect(err.errors[0].message).assertEqual('e');
      expect(err.errors[0].cause).assertUndefined();
      expect(err.cause).assertUndefined();
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
     * @tc.desc Verify AggregateError constructor preserves first middle and last error order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error('count3-first');
      let middle: TypeError = new TypeError('count3-middle');
      let last: RangeError = new RangeError('count3-last');
      let err: AggregateError = new AggregateError([first, middle, last], 'count-3-order');
      expect(err.errors.length).assertEqual(3);
      expect(err.errors[0]).assertEqual(first);
      expect(err.errors[1]).assertEqual(middle);
      expect(err.errors[2]).assertEqual(last);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3100
     * @tc.name testErrorAggregateConstructor031
     * @tc.desc Verify AggregateError constructor keeps repeated references at separate positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shared: Error = new Error('count4-shared');
      let err: AggregateError = new AggregateError([shared, new Error('count4-a'), shared, new Error('count4-b')],
        'count-4-repeat');
      expect(err.errors.length).assertEqual(4);
      expect(err.errors[0]).assertEqual(shared);
      expect(err.errors[2]).assertEqual(shared);
      expect(err.errors[3].message).assertEqual('count4-b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3200
     * @tc.name testErrorAggregateConstructor032
     * @tc.desc Verify AggregateError constructor stores mutable element references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tail: SyntaxError = new SyntaxError('count5-before');
      let err: AggregateError = new AggregateError([new Error('count5-0'), new Error('count5-1'),
        new Error('count5-2'), new Error('count5-3'), tail], 'count-5-reference');
      tail.message = 'count5-after';
      expect(err.errors.length).assertEqual(5);
      expect(err.errors[4]).assertEqual(tail);
      expect(err.errors[4].message).assertEqual('count5-after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3300
     * @tc.name testErrorAggregateConstructor033
     * @tc.desc Verify AggregateError constructor consumes Set elements in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<Error> = new Set<Error>();
      source.add(new Error('set0'));
      source.add(new Error('set1'));
      source.add(new RangeError('set2'));
      source.add(new Error('set3'));
      source.add(new Error('set4'));
      source.add(new TypeError('set5'));
      let err: AggregateError = new AggregateError(source, 'count-6-set');
      expect(err.errors.length).assertEqual(6);
      expect(err.errors[2].name).assertEqual('RangeError');
      expect(err.errors[5].name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3400
     * @tc.name testErrorAggregateConstructor034
     * @tc.desc Verify AggregateError constructor stores email message beside seven errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError =
        new AggregateError([new Error('mail0'), new Error('mail1'), new Error('mail2'), new Error('mail3'),
          new Error('mail4'), new Error('mail5'), new URIError('mail6')], 'tester@example.com');
      expect(err.message).assertEqual('tester@example.com');
      expect(err.errors.length).assertEqual(7);
      expect(err.errors[6].name).assertEqual('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3500
     * @tc.name testErrorAggregateConstructor035
     * @tc.desc Verify AggregateError constructor preserves subtype elements at both boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError =
        new AggregateError([new EvalError('eval-head'), new Error('mix1'), new Error('mix2'), new Error('mix3'),
          new Error('mix4'), new Error('mix5'), new Error('mix6'), new ReferenceError('ref-tail')], 'count-8-mixed');
      expect(err.errors.length).assertEqual(8);
      expect(err.errors[0].name).assertEqual('EvalError');
      expect(err.errors[7].name).assertEqual('ReferenceError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3600
     * @tc.name testErrorAggregateConstructor036
     * @tc.desc Verify AggregateError constructor snapshots a nine element source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [new Error('snap0'), new Error('snap1'), new Error('snap2'), new Error('snap3'),
        new Error('snap4'), new Error('snap5'), new Error('snap6'), new Error('snap7'), new Error('snap8')];
      let err: AggregateError = new AggregateError(source, 'count-9-snapshot');
      source[8] = new RangeError('snap-replaced');
      expect(err.errors.length).assertEqual(9);
      expect(err.errors[8].message).assertEqual('snap8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3700
     * @tc.name testErrorAggregateConstructor037
     * @tc.desc Verify AggregateError constructor accepts generated ten element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [];
      for (let i: int = 0; i < 10; i++) {
        source.push(new Error('generated-' + i.toString()));
      }
      let err: AggregateError = new AggregateError(source, 'count-10-generated');
      expect(err.errors.length).assertEqual(10);
      expect(err.errors[0].message).assertEqual('generated-0');
      expect(err.errors[9].message).assertEqual('generated-9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3800
     * @tc.name testErrorAggregateConstructor038
     * @tc.desc Verify AggregateError constructor consumes eleven Map values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Map<string, Error> = new Map<string, Error>();
      for (let i: int = 0; i < 11; i++) {
        source.set('k' + i.toString(), new Error('map-' + i.toString()));
      }
      let err: AggregateError = new AggregateError(source.values(), 'count-11-map');
      expect(err.errors.length).assertEqual(11);
      expect(err.errors[0].message).assertEqual('map-0');
      expect(err.errors[10].message).assertEqual('map-10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_3900
     * @tc.name testErrorAggregateConstructor039
     * @tc.desc Verify AggregateError constructor stores nested aggregate among twelve errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: AggregateError = new AggregateError([new Error('nested-leaf')], 'nested-count');
      let err: AggregateError =
        new AggregateError([new Error('n0'), new Error('n1'), new Error('n2'), new Error('n3'), new Error('n4'),
          nested, new Error('n6'), new Error('n7'), new Error('n8'), new Error('n9'), new Error('n10'),
          new Error('n11')], 'count-12-nested');
      expect(err.errors.length).assertEqual(12);
      expect(err.errors[5]).assertEqual(nested);
      expect((err.errors[5] as AggregateError).errors[0].message).assertEqual('nested-leaf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4000
     * @tc.name testErrorAggregateConstructor040
     * @tc.desc Verify AggregateError constructor preserves cause with thirteen errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: RangeError = new RangeError('count13-cause');
      let err: AggregateError =
        new AggregateError([new Error('c0'), new Error('c1'), new Error('c2'), new Error('c3'), new Error('c4'),
          new Error('c5'), new Error('c6'), new Error('c7'), new Error('c8'), new Error('c9'), new Error('c10'),
          new Error('c11'), new Error('c12')], 'count-13-cause', { cause: cause });
      expect(err.errors.length).assertEqual(13);
      expect(err.cause).assertEqual(cause);
      expect(err.errors[12].message).assertEqual('c12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4100
     * @tc.name testErrorAggregateConstructor041
     * @tc.desc Verify AggregateError constructor stores ISO date message with fourteen errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError =
        new AggregateError([new Error('d0'), new Error('d1'), new Error('d2'), new Error('d3'), new Error('d4'),
          new Error('d5'), new Error('d6'), new Error('d7'), new Error('x8'), new Error('x9'), new Error('d10'),
          new Error('d11'), new Error('d12'), new SyntaxError('d13')], '2026-07-11T00:00:00Z');
      expect(err.message).assertEqual('2026-07-11T00:00:00Z');
      expect(err.errors.length).assertEqual(14);
      expect(err.errors[13].name).assertEqual('SyntaxError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4200
     * @tc.name testErrorAggregateConstructor042
     * @tc.desc Verify AggregateError constructor preserves reversed fifteen element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [];
      for (let i: int = 14; i >= 0; i--) {
        source.push(new Error('reverse-' + i.toString()));
      }
      let err: AggregateError = new AggregateError(source, 'count-15-reverse');
      expect(err.errors.length).assertEqual(15);
      expect(err.errors[0].message).assertEqual('reverse-14');
      expect(err.errors[14].message).assertEqual('reverse-0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4300
     * @tc.name testErrorAggregateConstructor043
     * @tc.desc Verify AggregateError constructor keeps sixteenth boundary element readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError =
        new AggregateError([new Error('b0'), new Error('b1'), new Error('b2'), new Error('b3'), new Error('b4'),
          new Error('b5'), new Error('b6'), new Error('b7'), new Error('b8'), new Error('b9'), new Error('b10'),
          new Error('b11'), new Error('b12'), new Error('b13'), new Error('b14'), new URIError('b15')],
          'count-16-boundary');
      expect(err.errors.length).assertEqual(16);
      expect(err.errors[15].message).assertEqual('b15');
      expect(err.errors[15].name).assertEqual('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4400
     * @tc.name testErrorAggregateConstructor044
     * @tc.desc Verify AggregateError constructor preserves phone text message with seventeen errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError =
        new AggregateError([new Error('p0'), new Error('p1'), new Error('p2'), new Error('p3'), new Error('p4'),
          new Error('p5'), new Error('p6'), new Error('p7'), new Error('p8'), new Error('p9'), new Error('p10'),
          new Error('p11'), new Error('p12'), new Error('p13'), new Error('p14'), new Error('p15'), new Error('p16')],
          '+86-138-0013-8000');
      expect(err.message).assertEqual('+86-138-0013-8000');
      expect(err.errors.length).assertEqual(17);
      expect(err.errors[16].message).assertEqual('p16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4500
     * @tc.name testErrorAggregateConstructor045
     * @tc.desc Verify AggregateError constructor stores UUID message with eighteen errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError =
        new AggregateError([new Error('u0'), new Error('u1'), new Error('u2'), new Error('u3'), new Error('u4'),
          new Error('u5'), new Error('u6'), new Error('u7'), new Error('u8'), new Error('u9'), new Error('u10'),
          new Error('u11'), new Error('u12'), new Error('u13'), new Error('u14'), new Error('u15'), new Error('u16'),
          new Error('u17')], '123e4567-e89b-12d3-a456-426614174000');
      expect(err.message).assertEqual('123e4567-e89b-12d3-a456-426614174000');
      expect(err.errors.length).assertEqual(18);
      expect(err.errors[17].message).assertEqual('u17');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4600
     * @tc.name testErrorAggregateConstructor046
     * @tc.desc Verify AggregateError constructor keeps mixed subtype tail in nineteen errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError =
        new AggregateError([new Error('m0'), new Error('m1'), new Error('m2'), new Error('m3'), new Error('m4'),
          new Error('m5'), new Error('m6'), new Error('m7'), new Error('m8'), new Error('m9'), new Error('m10'),
          new Error('m11'), new Error('m12'), new Error('m13'), new Error('m14'), new Error('m15'), new Error('m16'),
          new FormatError('m17'), new TypeError('m18')], 'count-19-mixed-tail');
      expect(err.errors.length).assertEqual(19);
      expect(err.errors[17].name).assertEqual('FormatError');
      expect(err.errors[18].name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4700
     * @tc.name testErrorAggregateConstructor047
     * @tc.desc Verify AggregateError constructor preserves hex text message with twenty errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError =
        new AggregateError([new Error('h0'), new Error('h1'), new Error('h2'), new Error('h3'), new Error('h4'),
          new Error('h5'), new Error('h6'), new Error('h7'), new Error('h8'), new Error('h9'), new Error('h10'),
          new Error('h11'), new Error('h12'), new Error('h13'), new Error('h14'), new Error('h15'), new Error('h16'),
          new Error('h17'), new Error('h18'), new Error('h19')], '0xDEADBEEF');
      expect(err.message).assertEqual('0xDEADBEEF');
      expect(err.errors.length).assertEqual(20);
      expect(err.errors[19].message).assertEqual('h19');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4800
     * @tc.name testErrorAggregateConstructor048
     * @tc.desc Verify AggregateError constructor snapshots twenty one errors before source pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [];
      for (let i: int = 0; i < 21; i++) {
        source.push(new Error('pop-' + i.toString()));
      }
      let err: AggregateError = new AggregateError(source, 'count-21-pop');
      source.pop();
      expect(err.errors.length).assertEqual(21);
      expect(source.length).assertEqual(20);
      expect(err.errors[20].message).assertEqual('pop-20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_4900
     * @tc.name testErrorAggregateConstructor049
     * @tc.desc Verify AggregateError constructor preserves twenty second element identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tail: RangeError = new RangeError('identity-tail');
      let err: AggregateError =
        new AggregateError([new Error('id0'), new Error('id1'), new Error('id2'), new Error('id3'), new Error('id4'),
          new Error('id5'), new Error('id6'), new Error('id7'), new Error('id8'), new Error('id9'), new Error('id10'),
          new Error('id11'), new Error('id12'), new Error('id13'), new Error('id14'), new Error('id15'),
          new Error('id16'), new Error('id17'), new Error('id18'), new Error('id19'), new Error('id20'), tail],
          'count-22-identity');
      expect(err.errors.length).assertEqual(22);
      expect(err.errors[21]).assertEqual(tail);
      expect(err.errors[21].name).assertEqual('RangeError');
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
     * @tc.desc Verify AggregateError constructor preserves boolean cause value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('e')], 'boolean cause', { cause: true });
      expect(err.cause as boolean).assertTrue();
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
     * @tc.desc Verify AggregateError constructor creates independent instances
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_6400
     * @tc.name testErrorAggregateConstructor064
     * @tc.desc Verify AggregateError constructor snapshots Map values before map replacement
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error('map-first');
      let second: TypeError = new TypeError('map-second');
      let source: Map<string, Error> = new Map<string, Error>();
      source.set('left', first);
      source.set('right', second);
      let err: AggregateError = new AggregateError(source.values(), 'map-snapshot');
      source.set('left', new RangeError('map-replaced'));
      source.delete('right');
      expect(err.errors.length).assertEqual(2);
      expect(err.errors[0]).assertEqual(first);
      expect(err.errors[1]).assertEqual(second);
      expect(err.errors[1].name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_6500
     * @tc.name testErrorAggregateConstructor065
     * @tc.desc Verify AggregateError constructor keeps Set uniqueness and insertion order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplicate: Error = new Error('duplicate');
      let tail: URIError = new URIError('tail');
      let source: Set<Error> = new Set<Error>();
      source.add(duplicate);
      source.add(duplicate);
      source.add(tail);
      let err: AggregateError = new AggregateError(source, 'set-unique');
      expect(err.errors.length).assertEqual(2);
      expect(err.errors[0]).assertEqual(duplicate);
      expect(err.errors[1]).assertEqual(tail);
      expect(err.errors[1].name).assertEqual('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_6600
     * @tc.name testErrorAggregateConstructor066
     * @tc.desc Verify AggregateError constructor stores references to mutable error elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let syntax: SyntaxError = new SyntaxError('before-syntax');
      let evalErr: EvalError = new EvalError('before-eval');
      let err: AggregateError = new AggregateError([syntax, evalErr], 'mutable-elements');
      syntax.message = 'after-syntax';
      evalErr.name = 'EvalAlias';
      expect(err.errors[0]).assertEqual(syntax);
      expect(err.errors[0].message).assertEqual('after-syntax');
      expect(err.errors[1].name).assertEqual('EvalAlias');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_6700
     * @tc.name testErrorAggregateConstructor067
     * @tc.desc Verify AggregateError name and message writes leave constructor errors stable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leaf: Error = new Error('leaf-stable');
      let err: AggregateError = new AggregateError([leaf], 'before-write');
      err.name = 'WrittenAggregateName';
      err.message = 'after-write';
      expect(err.name).assertEqual('WrittenAggregateName');
      expect(err.message).assertEqual('after-write');
      expect(err.errors.length).assertEqual(1);
      expect(err.errors[0]).assertEqual(leaf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_6800
     * @tc.name testErrorAggregateConstructor068
     * @tc.desc Verify AggregateError constructor exposes errors key but hides message and cause keys
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: RangeError = new RangeError('enum-cause');
      let err: AggregateError = new AggregateError([new Error('enum-leaf')], 'enum-message', { cause: cause });
      let keys: string[] = Object.keys(err);
      expect(keys.indexOf('errors')).assertEqual(0);
      expect(keys.indexOf('message')).assertEqual(-1);
      expect(keys.indexOf('cause')).assertEqual(-1);
      expect(err.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_6900
     * @tc.name testErrorAggregateConstructor069
     * @tc.desc Verify AggregateError cause survives errors array replacement
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: TypeError = new TypeError('replace-cause');
      let err: AggregateError = new AggregateError([new Error('old-leaf')], 'replace-errors', { cause: cause });
      err.errors = [new RangeError('new-leaf'), new SyntaxError('next-leaf')];
      expect(err.cause).assertEqual(cause);
      expect((err.cause as Error).message).assertEqual('replace-cause');
      expect(err.errors.length).assertEqual(2);
      expect(err.errors[0].name).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_7000
     * @tc.name testErrorAggregateConstructor070
     * @tc.desc Verify AggregateError constructor keeps nested cause chain beside multiple errors
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error('cause-root');
      let middle: ReferenceError = new ReferenceError('cause-middle', { cause: root });
      let left: Error = new Error('left-leaf');
      let right: Error = new Error('right-leaf');
      let err: AggregateError = new AggregateError([left, right], 'two-leaf-cause', { cause: middle });
      expect(err.errors[0]).assertEqual(left);
      expect(err.errors[1]).assertEqual(right);
      expect((err.cause as Error).message).assertEqual('cause-middle');
      expect(((err.cause as Error).cause as Error).message).assertEqual('cause-root');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_7100
     * @tc.name testErrorAggregateConstructor071
     * @tc.desc Verify AggregateError can hold separate nested aggregates in errors and cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorsAggregate: AggregateError = new AggregateError([new Error('errors-child')], 'errors-aggregate');
      let causeAggregate: AggregateError = new AggregateError([new RangeError('cause-child')], 'cause-aggregate');
      let err: AggregateError = new AggregateError([errorsAggregate, new Error('plain-child')], 'outer-aggregate',
        { cause: causeAggregate });
      expect(err.errors[0]).assertEqual(errorsAggregate);
      expect(err.cause).assertEqual(causeAggregate);
      expect((err.errors[0] as AggregateError).errors[0].message).assertEqual('errors-child');
      expect((err.cause as AggregateError).errors[0].message).assertEqual('cause-child');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_7200
     * @tc.name testErrorAggregateConstructor072
     * @tc.desc Verify AggregateError nested construction isolates each source array mutation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstLeaf: Error = new Error('inner-first');
      let secondLeaf: Error = new Error('inner-second');
      let innerSource: Error[] = [firstLeaf, secondLeaf];
      let inner: AggregateError = new AggregateError(innerSource, 'inner-layer');
      let outerSource: Error[] = [inner, new Error('outer-second')];
      let outer: AggregateError = new AggregateError(outerSource, 'outer-layer');
      innerSource[0] = new Error('inner-replaced');
      outerSource.push(new Error('outer-late'));
      expect(inner.errors.length).assertEqual(2);
      expect(inner.errors[0]).assertEqual(firstLeaf);
      expect(outer.errors.length).assertEqual(2);
      expect(outer.errors[0]).assertEqual(inner);
      expect(outer.errors[1].message).assertEqual('outer-second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_7300
     * @tc.name testErrorAggregateConstructor073
     * @tc.desc Verify AggregateError constructor remains readable in an aggregate reference cycle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: AggregateError = new AggregateError([new Error('first-seed')], 'first-cycle');
      let second: AggregateError = new AggregateError([first], 'second-cycle');
      first.errors.push(second);
      expect(first.errors.length).assertEqual(2);
      expect((first.errors[1] as AggregateError).message).assertEqual('second-cycle');
      expect(((first.errors[1] as AggregateError).errors[0] as AggregateError).message).assertEqual('first-cycle');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_7400
     * @tc.name testErrorAggregateConstructor074
     * @tc.desc Verify AggregateError constructor preserves long escaped message and subtype element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message: string = 'prefix-' + '\u2603'.repeat(512) + '-suffix';
      let err: AggregateError = new AggregateError([new SyntaxError('unicode-leaf')], message);
      expect(err.message).assertEqual(message);
      expect(err.errors[0].name).assertEqual('SyntaxError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_7500
     * @tc.name testErrorAggregateConstructor075
     * @tc.desc Verify AggregateError JSON output tracks rewritten errors but omits cause and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('json-old')], 'json-message', { cause: 'json-cause' });
      err.errors = [new TypeError('json-new')];
      let text: string = JSON.stringify(err);
      expect(text.indexOf('errors')).not().assertEqual(-1);
      expect(text.indexOf('cause')).assertEqual(-1);
      expect(text.indexOf('message')).assertEqual(-1);
      expect(err.errors[0].name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_7600
     * @tc.name testErrorAggregateConstructor076
     * @tc.desc Verify AggregateError repeated reads stay stable after clearing source array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [new Error('stable-source')];
      let err: AggregateError = new AggregateError(source, 'stable-message');
      source.length = 0;
      for (let i: int = 0; i < 50; i++) {
        expect(err.message).assertEqual('stable-message');
        expect(err.errors.length).assertEqual(1);
        expect(err.errors[0].message).assertEqual('stable-source');
      }
      expect(source.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_7700
     * @tc.name testErrorAggregateConstructor077
     * @tc.desc Verify AggregateError rewritten name keeps nested element readable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: AggregateError = new AggregateError([new URIError('nested-uri')], 'nested-readable');
      let err: AggregateError = new AggregateError([nested], 'outer-readable');
      err.name = 'AliasAggregateError';
      expect(err.name).assertEqual('AliasAggregateError');
      expect(err.message).assertEqual('outer-readable');
      expect((err.errors[0] as AggregateError).errors[0].message).assertEqual('nested-uri');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_7800
     * @tc.name testErrorAggregateConstructor078
     * @tc.desc Verify AggregateError errors reassignment accepts new subtype sequence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: AggregateError = new AggregateError([new Error('original')], 'rewrite-sequence');
      err.errors = [new URIError('uri'), new EvalError('eval'), new RangeError('range')];
      let names: string[] = [];
      for (let item of err.errors) {
        names.push(item.name);
      }
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual('URIError');
      expect(names[2]).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_7900
     * @tc.name testErrorAggregateConstructor079
     * @tc.desc Verify AggregateError mixed subtype constructor keeps element references and order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let range: RangeError = new RangeError('range-ref');
      let syntax: SyntaxError = new SyntaxError('syntax-ref');
      let nested: AggregateError = new AggregateError([new Error('nested-ref')], 'nested-ref-msg');
      let err: AggregateError = new AggregateError([range, syntax, nested], 'mixed-ref');
      expect(err.errors[0]).assertEqual(range);
      expect(err.errors[1]).assertEqual(syntax);
      expect(err.errors[2]).assertEqual(nested);
      expect((err.errors[2] as AggregateError).errors[0].message).assertEqual('nested-ref');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_AGGREGATE_CONSTRUCTOR_8000
     * @tc.name testErrorAggregateConstructor080
     * @tc.desc Verify AggregateError stack writes do not change cause or constructor errors
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorAggregateConstructor080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('stack-cause');
      let leaf: Error = new Error('stack-leaf');
      let err: AggregateError = new AggregateError([leaf], 'stack-message', { cause: cause });
      err.stack = 'first-stack';
      err.stack = 'second-stack';
      expect(err.stack).assertEqual('second-stack');
      expect(err.cause).assertEqual(cause);
      expect(err.errors[0]).assertEqual(leaf);
    });
  });
}
