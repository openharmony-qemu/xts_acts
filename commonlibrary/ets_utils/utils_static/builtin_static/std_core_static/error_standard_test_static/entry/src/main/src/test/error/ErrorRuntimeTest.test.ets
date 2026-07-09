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

export default function ErrorRuntimeTest(): void {
  describe('ErrorRuntimeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_0100
     * @tc.name testErrorRuntime001
     * @tc.desc Verify ArithmeticError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArithmeticError = new ArithmeticError(undefined);
      expect(e.name).assertEqual('ArithmeticError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_0200
     * @tc.name testErrorRuntime002
     * @tc.desc Verify ArithmeticError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArithmeticError = new ArithmeticError('msg');
      expect(e.name).assertEqual('ArithmeticError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_0300
     * @tc.name testErrorRuntime003
     * @tc.desc Verify NullPointerError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: NullPointerError = new NullPointerError(undefined);
      expect(e.name).assertEqual('NullPointerError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_0400
     * @tc.name testErrorRuntime004
     * @tc.desc Verify NullPointerError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: NullPointerError = new NullPointerError('msg');
      expect(e.name).assertEqual('NullPointerError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_0500
     * @tc.name testErrorRuntime005
     * @tc.desc Verify ClassCastError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ClassCastError = new ClassCastError(undefined);
      expect(e.name).assertEqual('ClassCastError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_0600
     * @tc.name testErrorRuntime006
     * @tc.desc Verify ClassCastError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ClassCastError = new ClassCastError('msg');
      expect(e.name).assertEqual('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_0700
     * @tc.name testErrorRuntime007
     * @tc.desc Verify ArrayStoreError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArrayStoreError = new ArrayStoreError(undefined);
      expect(e.name).assertEqual('ArrayStoreError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_0800
     * @tc.name testErrorRuntime008
     * @tc.desc Verify ArrayStoreError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArrayStoreError = new ArrayStoreError('msg');
      expect(e.name).assertEqual('ArrayStoreError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_0900
     * @tc.name testErrorRuntime009
     * @tc.desc Verify ArrayStoreError toString format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArrayStoreError = new ArrayStoreError('store err');
      expect(e.toString()).assertEqual('ArrayStoreError: store err');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_1000
     * @tc.name testErrorRuntime010
     * @tc.desc Verify AssertionError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: AssertionError = new AssertionError(undefined);
      expect(e.name).assertEqual('AssertionError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_1100
     * @tc.name testErrorRuntime011
     * @tc.desc Verify AssertionError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: AssertionError = new AssertionError('msg');
      expect(e.name).assertEqual('AssertionError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_1200
     * @tc.name testErrorRuntime012
     * @tc.desc Verify AssertionError toString format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: AssertionError = new AssertionError('assert failed');
      expect(e.toString()).assertEqual('AssertionError: assert failed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_1300
     * @tc.name testErrorRuntime013
     * @tc.desc Verify FormatError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: FormatError = new FormatError(undefined);
      expect(e.name).assertEqual('FormatError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_1400
     * @tc.name testErrorRuntime014
     * @tc.desc Verify FormatError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: FormatError = new FormatError('msg');
      expect(e.name).assertEqual('FormatError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_1500
     * @tc.name testErrorRuntime015
     * @tc.desc Verify FormatError toString format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: FormatError = new FormatError('bad fmt');
      expect(e.toString()).assertEqual('FormatError: bad fmt');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_1600
     * @tc.name testErrorRuntime016
     * @tc.desc Verify InstantiationError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InstantiationError = new InstantiationError(undefined);
      expect(e.name).assertEqual('InstantiationError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_1700
     * @tc.name testErrorRuntime017
     * @tc.desc Verify InstantiationError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InstantiationError = new InstantiationError('msg');
      expect(e.name).assertEqual('InstantiationError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_1800
     * @tc.name testErrorRuntime018
     * @tc.desc Verify InstantiationError toString format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InstantiationError = new InstantiationError('instantiate err');
      expect(e.toString()).assertEqual('InstantiationError: instantiate err');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_1900
     * @tc.name testErrorRuntime019
     * @tc.desc Verify InternalError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InternalError = new InternalError(undefined);
      expect(e.name).assertEqual('InternalError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_2000
     * @tc.name testErrorRuntime020
     * @tc.desc Verify InternalError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InternalError = new InternalError('msg');
      expect(e.name).assertEqual('InternalError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_2100
     * @tc.name testErrorRuntime021
     * @tc.desc Verify CoroutinesLimitExceedError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: CoroutinesLimitExceedError = new CoroutinesLimitExceedError(undefined);
      expect(e.name).assertEqual('CoroutinesLimitExceedError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_2200
     * @tc.name testErrorRuntime022
     * @tc.desc Verify CoroutinesLimitExceedError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: CoroutinesLimitExceedError = new CoroutinesLimitExceedError('msg');
      expect(e.name).assertEqual('CoroutinesLimitExceedError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_2300
     * @tc.name testErrorRuntime023
     * @tc.desc Verify CoroutinesLimitExceedError toString format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: CoroutinesLimitExceedError = new CoroutinesLimitExceedError('limit');
      expect(e.toString()).assertEqual('CoroutinesLimitExceedError: limit');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_2400
     * @tc.name testErrorRuntime024
     * @tc.desc Verify ExceptionInInitializerError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ExceptionInInitializerError = new ExceptionInInitializerError(undefined);
      expect(e.name).assertEqual('ExceptionInInitializerError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_2500
     * @tc.name testErrorRuntime025
     * @tc.desc Verify ExceptionInInitializerError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ExceptionInInitializerError = new ExceptionInInitializerError('msg');
      expect(e.name).assertEqual('ExceptionInInitializerError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_2600
     * @tc.name testErrorRuntime026
     * @tc.desc Verify IllegalLockStateError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IllegalLockStateError = new IllegalLockStateError(undefined);
      expect(e.name).assertEqual('IllegalLockStateError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_2700
     * @tc.name testErrorRuntime027
     * @tc.desc Verify IllegalLockStateError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IllegalLockStateError = new IllegalLockStateError('msg');
      expect(e.name).assertEqual('IllegalLockStateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_2800
     * @tc.name testErrorRuntime028
     * @tc.desc Verify InvalidAsyncOperationError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidAsyncOperationError = new InvalidAsyncOperationError(undefined);
      expect(e.name).assertEqual('InvalidAsyncOperationError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_2900
     * @tc.name testErrorRuntime029
     * @tc.desc Verify InvalidAsyncOperationError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidAsyncOperationError = new InvalidAsyncOperationError('msg');
      expect(e.name).assertEqual('InvalidAsyncOperationError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_3000
     * @tc.name testErrorRuntime030
     * @tc.desc Verify InvalidJobOperationError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidJobOperationError = new InvalidJobOperationError(undefined);
      expect(e.name).assertEqual('InvalidJobOperationError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_3100
     * @tc.name testErrorRuntime031
     * @tc.desc Verify InvalidJobOperationError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidJobOperationError = new InvalidJobOperationError('msg');
      expect(e.name).assertEqual('InvalidJobOperationError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_3200
     * @tc.name testErrorRuntime032
     * @tc.desc Verify InvalidStoreAccessError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidStoreAccessError = new InvalidStoreAccessError(undefined);
      expect(e.name).assertEqual('InvalidStoreAccessError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_3300
     * @tc.name testErrorRuntime033
     * @tc.desc Verify InvalidStoreAccessError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidStoreAccessError = new InvalidStoreAccessError('msg');
      expect(e.name).assertEqual('InvalidStoreAccessError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_3400
     * @tc.name testErrorRuntime034
     * @tc.desc Verify JSONTypeError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: JSONTypeError = new JSONTypeError(undefined);
      expect(e.name).assertEqual('JSONTypeError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_3500
     * @tc.name testErrorRuntime035
     * @tc.desc Verify JSONTypeError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: JSONTypeError = new JSONTypeError('msg');
      expect(e.name).assertEqual('JSONTypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_3600
     * @tc.name testErrorRuntime036
     * @tc.desc Verify NonIntegralIndexError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: NonIntegralIndexError = new NonIntegralIndexError(undefined);
      expect(e.name).assertEqual('NonIntegralIndexError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_3700
     * @tc.name testErrorRuntime037
     * @tc.desc Verify NonIntegralIndexError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: NonIntegralIndexError = new NonIntegralIndexError('msg');
      expect(e.name).assertEqual('NonIntegralIndexError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_3800
     * @tc.name testErrorRuntime038
     * @tc.desc Verify NonIntegralIndexError toString format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: NonIntegralIndexError = new NonIntegralIndexError('index');
      expect(e.toString()).assertEqual('NonIntegralIndexError: index');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_3900
     * @tc.name testErrorRuntime039
     * @tc.desc Verify OutOfMemoryError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: OutOfMemoryError = new OutOfMemoryError(undefined);
      expect(e.name).assertEqual('OutOfMemoryError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_4000
     * @tc.name testErrorRuntime040
     * @tc.desc Verify OutOfMemoryError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: OutOfMemoryError = new OutOfMemoryError('msg');
      expect(e.name).assertEqual('OutOfMemoryError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_4100
     * @tc.name testErrorRuntime041
     * @tc.desc Verify StackOverflowError with undefined argument defaults name and empty message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: StackOverflowError = new StackOverflowError(undefined);
      expect(e.name).assertEqual('StackOverflowError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_4200
     * @tc.name testErrorRuntime042
     * @tc.desc Verify StackOverflowError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: StackOverflowError = new StackOverflowError('msg');
      expect(e.name).assertEqual('StackOverflowError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_4300
     * @tc.name testErrorRuntime043
     * @tc.desc Verify UncaughtExceptionError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: UncaughtExceptionError = new UncaughtExceptionError(undefined);
      expect(e.name).assertEqual('UncaughtExceptionError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_4400
     * @tc.name testErrorRuntime044
     * @tc.desc Verify UncaughtExceptionError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: UncaughtExceptionError = new UncaughtExceptionError('msg');
      expect(e.name).assertEqual('UncaughtExceptionError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_4500
     * @tc.name testErrorRuntime045
     * @tc.desc Verify UncaughtExceptionError toString format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: UncaughtExceptionError = new UncaughtExceptionError('uncaught');
      expect(e.toString()).assertEqual('UncaughtExceptionError: uncaught');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_4600
     * @tc.name testErrorRuntime046
     * @tc.desc Verify IndexOutOfBoundsError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IndexOutOfBoundsError = new IndexOutOfBoundsError(undefined);
      expect(e.name).assertEqual('IndexOutOfBoundsError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_4700
     * @tc.name testErrorRuntime047
     * @tc.desc Verify IndexOutOfBoundsError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IndexOutOfBoundsError = new IndexOutOfBoundsError('msg');
      expect(e.name).assertEqual('IndexOutOfBoundsError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_4800
     * @tc.name testErrorRuntime048
     * @tc.desc Verify runtime IndexOutOfBoundsError toString format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IndexOutOfBoundsError = new IndexOutOfBoundsError('out of bounds');
      expect(e.toString()).assertEqual('IndexOutOfBoundsError: out of bounds');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_4900
     * @tc.name testErrorRuntime049
     * @tc.desc Verify ArgumentsUnderapplicationError with undefined argument
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArgumentsUnderapplicationError = new ArgumentsUnderapplicationError(undefined);
      expect(e.name).assertEqual('ArgumentsUnderapplicationError');
      expect(e.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_5000
     * @tc.name testErrorRuntime050
     * @tc.desc Verify ArgumentsUnderapplicationError instanceof check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArgumentsUnderapplicationError = new ArgumentsUnderapplicationError('msg');
      expect(e.name).assertEqual('ArgumentsUnderapplicationError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_5100
     * @tc.name testErrorRuntime051
     * @tc.desc Verify ArithmeticError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArithmeticError = new ArithmeticError('msg');
      expect((e.stack as string).includes('ArithmeticError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_5200
     * @tc.name testErrorRuntime052
     * @tc.desc Verify ArrayStoreError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArrayStoreError = new ArrayStoreError('msg');
      expect((e.stack as string).includes('ArrayStoreError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_5300
     * @tc.name testErrorRuntime053
     * @tc.desc Verify AssertionError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: AssertionError = new AssertionError('msg');
      expect((e.stack as string).includes('AssertionError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_5400
     * @tc.name testErrorRuntime054
     * @tc.desc Verify FormatError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: FormatError = new FormatError('msg');
      expect((e.stack as string).includes('FormatError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_5500
     * @tc.name testErrorRuntime055
     * @tc.desc Verify InstantiationError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InstantiationError = new InstantiationError('msg');
      expect((e.stack as string).includes('InstantiationError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_5600
     * @tc.name testErrorRuntime056
     * @tc.desc Verify InternalError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InternalError = new InternalError('msg');
      expect((e.stack as string).includes('InternalError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_5700
     * @tc.name testErrorRuntime057
     * @tc.desc Verify CoroutinesLimitExceedError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: CoroutinesLimitExceedError = new CoroutinesLimitExceedError('msg');
      expect((e.stack as string).includes('CoroutinesLimitExceedError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_5800
     * @tc.name testErrorRuntime058
     * @tc.desc Verify ExceptionInInitializerError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ExceptionInInitializerError = new ExceptionInInitializerError('msg');
      expect((e.stack as string).includes('ExceptionInInitializerError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_5900
     * @tc.name testErrorRuntime059
     * @tc.desc Verify IllegalLockStateError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IllegalLockStateError = new IllegalLockStateError('msg');
      expect((e.stack as string).includes('IllegalLockStateError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_6000
     * @tc.name testErrorRuntime060
     * @tc.desc Verify InvalidAsyncOperationError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidAsyncOperationError = new InvalidAsyncOperationError('msg');
      expect((e.stack as string).includes('InvalidAsyncOperationError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_6100
     * @tc.name testErrorRuntime061
     * @tc.desc Verify InvalidJobOperationError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidJobOperationError = new InvalidJobOperationError('msg');
      expect((e.stack as string).includes('InvalidJobOperationError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_6200
     * @tc.name testErrorRuntime062
     * @tc.desc Verify InvalidStoreAccessError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidStoreAccessError = new InvalidStoreAccessError('msg');
      expect((e.stack as string).includes('InvalidStoreAccessError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_6300
     * @tc.name testErrorRuntime063
     * @tc.desc Verify JSONTypeError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: JSONTypeError = new JSONTypeError('msg');
      expect((e.stack as string).includes('JSONTypeError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_6400
     * @tc.name testErrorRuntime064
     * @tc.desc Verify NonIntegralIndexError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: NonIntegralIndexError = new NonIntegralIndexError('msg');
      expect((e.stack as string).includes('NonIntegralIndexError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_6500
     * @tc.name testErrorRuntime065
     * @tc.desc Verify OutOfMemoryError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: OutOfMemoryError = new OutOfMemoryError('msg');
      expect((e.stack as string).includes('OutOfMemoryError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_6600
     * @tc.name testErrorRuntime066
     * @tc.desc Verify UncaughtExceptionError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: UncaughtExceptionError = new UncaughtExceptionError('msg');
      expect((e.stack as string).includes('UncaughtExceptionError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_6700
     * @tc.name testErrorRuntime067
     * @tc.desc Verify IndexOutOfBoundsError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IndexOutOfBoundsError = new IndexOutOfBoundsError('msg');
      expect((e.stack as string).includes('IndexOutOfBoundsError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_6800
     * @tc.name testErrorRuntime068
     * @tc.desc Verify ArgumentsUnderapplicationError stack trace
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArgumentsUnderapplicationError = new ArgumentsUnderapplicationError('msg');
      expect((e.stack as string).includes('ArgumentsUnderapplicationError')).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_6900
     * @tc.name testErrorRuntime069
     * @tc.desc Verify BusinessError exposes Error-compatible name message and code
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: BusinessError = new BusinessError(500, 'business failed');
      expect(err.name).assertEqual('Error');
      expect(err.message).assertEqual('business failed');
      expect(err.code).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_7000
     * @tc.name testErrorRuntime070
     * @tc.desc Verify BusinessError constructor wraps base Error message with code
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error('root-error');
      let err: BusinessError = new BusinessError(700, root);
      expect(err.code).assertEqual(700);
      expect(err.message).assertEqual('root-error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_7100
     * @tc.name testErrorRuntime071
     * @tc.desc Verify BusinessError constructor wraps TypeError message with code
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: TypeError = new TypeError('typed-root');
      let err: BusinessError = new BusinessError(701, root);
      expect(err.code).assertEqual(701);
      expect(err.message).assertEqual('typed-root');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_7200
     * @tc.name testErrorRuntime072
     * @tc.desc Verify BusinessError cause property preserves Error reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: BusinessError = new BusinessError(500, 'cause-holder');
      let cause: Error = new Error('runtime-cause');
      err.cause = cause;
      expect(err.cause).assertEqual(cause);
      expect((err.cause as Error).message).assertEqual('runtime-cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_7300
     * @tc.name testErrorRuntime073
     * @tc.desc Verify thrown BusinessError preserves code and message after catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        throw new BusinessError(503, 'throw-business');
      } catch (e) {
        let caught: BusinessError = e as BusinessError;
        caughtCode = caught.code;
        caughtMessage = caught.message;
      }
      expect(caughtCode).assertEqual(503);
      expect(caughtMessage).assertEqual('throw-business');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_7400
     * @tc.name testErrorRuntime074
     * @tc.desc Verify caught BusinessError can be wrapped as Error cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let causeMessage: string = '';
      try {
        throw new BusinessError(504, 'business-origin');
      } catch (e) {
        let caught: BusinessError = e as BusinessError;
        let wrapped: Error = new Error('wrapped-business', { cause: caught });
        causeMessage = (wrapped.cause as BusinessError).message;
      }
      expect(causeMessage).assertEqual('business-origin');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_7500
     * @tc.name testErrorRuntime075
     * @tc.desc Verify BusinessError stack is readable after throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hasStack: boolean = false;
      try {
        throw new BusinessError(505, 'stack-business');
      } catch (e) {
        let caught: BusinessError = e as BusinessError;
        hasStack = caught.stack !== undefined && (caught.stack as string).length > 0;
      }
      expect(hasStack).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_7600
     * @tc.name testErrorRuntime076
     * @tc.desc Verify BusinessError rethrow preserves same object reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: BusinessError = new BusinessError(506, 'rethrow-business');
      let sameReference: boolean = false;
      try {
        try {
          throw original;
        } catch (e) {
          throw e;
        }
      } catch (e) {
        sameReference = (e as BusinessError) === original;
      }
      expect(sameReference).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_7700
     * @tc.name testErrorRuntime077
     * @tc.desc Verify BusinessError can participate in nested Error cause chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let business: BusinessError = new BusinessError(507, 'business-link');
      let outer: Error = new Error('outer-link', { cause: business });
      let resolved: BusinessError = outer.cause as BusinessError;
      expect(resolved.code).assertEqual(507);
      expect(resolved.message).assertEqual('business-link');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_RUNTIME_7800
     * @tc.name testErrorRuntime078
     * @tc.desc Verify nested try finally preserves thrown BusinessError values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorRuntime078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyRan: boolean = false;
      let caughtCode: number = 0;
      try {
        try {
          throw new BusinessError(508, 'nested-business');
        } finally {
          finallyRan = true;
        }
      } catch (e) {
        caughtCode = (e as BusinessError).code;
      }
      expect(finallyRan).assertEqual(true);
      expect(caughtCode).assertEqual(508);
    });
  });
}
