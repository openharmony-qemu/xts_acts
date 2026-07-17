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
import Utils from '../Util.test';

export default function ErrorBuiltinSubclassTest(): void {
  describe('ErrorBuiltinSubclassTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0010
     * @tc.name testErrorBuiltinSubclass001
     * @tc.desc Verify ArithmeticError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: ArithmeticError = new ArithmeticError('test@example.com');
      expect(err instanceof Error).assertTrue();
      let json: string = JSON.stringify(err);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0020
     * @tc.name testErrorBuiltinSubclass002
     * @tc.desc Verify NullPointerError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: NullPointerError = new NullPointerError('\u200B');
      expect(err instanceof Error).assertTrue();
      let json: string = JSON.stringify(err);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0030
     * @tc.name testErrorBuiltinSubclass003
     * @tc.desc Verify ClassCastError JSON.stringify round-trip
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: ClassCastError = new ClassCastError('2026-02-30');
      expect(err instanceof Error).assertTrue();
      let json: string = JSON.stringify(err);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0040
     * @tc.name testErrorBuiltinSubclass004
     * @tc.desc Verify ArrayStoreError code property can be read and mutated
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArrayStoreError = new ArrayStoreError('0x123');
      expect(e instanceof Error).assertTrue();
      expect(e.code).assertEqual(0);
      e.code = 0x7FFFFFFF;
      expect(e.code).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0050
     * @tc.name testErrorBuiltinSubclass005
     * @tc.desc Verify ArrayStoreError has stack after being thrown
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hasStack: boolean = false;
      try {
        throw new ArrayStoreError('<script>alert(1)</script>');
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        hasStack = e.stack !== undefined;
      }
      expect(hasStack).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0060
     * @tc.name testErrorBuiltinSubclass006
     * @tc.desc Verify ArrayStoreError message can be mutated after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArrayStoreError = new ArrayStoreError('original');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('original');
      e.message = '\uFFFD';
      expect(e.message).assertEqual('\uFFFD');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0070
     * @tc.name testErrorBuiltinSubclass007
     * @tc.desc Verify AssertionError code property can be read and mutated
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: AssertionError = new AssertionError('0b1010');
      expect(e instanceof Error).assertTrue();
      expect(e.code).assertEqual(0);
      e.code = -2147483648;
      expect(e.code).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0080
     * @tc.name testErrorBuiltinSubclass008
     * @tc.desc Verify AssertionError has stack after being thrown
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hasStack: boolean = false;
      try {
        throw new AssertionError('25:00:00');
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        hasStack = e.stack !== undefined;
      }
      expect(hasStack).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0090
     * @tc.name testErrorBuiltinSubclass009
     * @tc.desc Verify AssertionError message can be mutated after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: AssertionError = new AssertionError('original');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('original');
      e.message = '310101199001011234';
      expect(e.message).assertEqual('310101199001011234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0100
     * @tc.name testErrorBuiltinSubclass010
     * @tc.desc Verify FormatError code property can be read and mutated
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: FormatError = new FormatError('123.45e6');
      expect(e instanceof Error).assertTrue();
      expect(e.code).assertEqual(0);
      e.code = 0b1010;
      expect(e.code).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0110
     * @tc.name testErrorBuiltinSubclass011
     * @tc.desc Verify FormatError has stack after being thrown
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hasStack: boolean = false;
      try {
        throw new FormatError('622202********1234');
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        hasStack = e.stack !== undefined;
      }
      expect(hasStack).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0120
     * @tc.name testErrorBuiltinSubclass012
     * @tc.desc Verify FormatError message can be mutated after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: FormatError = new FormatError('original');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('original');
      e.message = '2026-13-01';
      expect(e.message).assertEqual('2026-13-01');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0130
     * @tc.name testErrorBuiltinSubclass013
     * @tc.desc Verify InstantiationError code property can be read and mutated
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InstantiationError = new InstantiationError('code test');
      expect(e instanceof Error).assertTrue();
      expect(e.code).assertEqual(0);
      e.code = 42;
      expect(e.code).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0140
     * @tc.name testErrorBuiltinSubclass014
     * @tc.desc Verify InstantiationError has stack after being thrown
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hasStack: boolean = false;
      try {
        throw new InstantiationError('stack test');
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        hasStack = e.stack !== undefined;
      }
      expect(hasStack).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0150
     * @tc.name testErrorBuiltinSubclass015
     * @tc.desc Verify InstantiationError message can be mutated after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InstantiationError = new InstantiationError('original');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('original');
      e.message = 'mutated';
      expect(e.message).assertEqual('mutated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0160
     * @tc.name testErrorBuiltinSubclass016
     * @tc.desc Verify InternalError code property can be read and mutated
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InternalError = new InternalError('code test');
      expect(e instanceof Error).assertTrue();
      expect(e.code).assertEqual(0);
      e.code = 42;
      expect(e.code).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0170
     * @tc.name testErrorBuiltinSubclass017
     * @tc.desc Verify InternalError has stack after being thrown
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hasStack: boolean = false;
      try {
        throw new InternalError('stack test');
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        hasStack = e.stack !== undefined;
      }
      expect(hasStack).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0180
     * @tc.name testErrorBuiltinSubclass018
     * @tc.desc Verify InternalError message can be mutated after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InternalError = new InternalError('original');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('original');
      e.message = 'mutated';
      expect(e.message).assertEqual('mutated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0190
     * @tc.name testErrorBuiltinSubclass019
     * @tc.desc Verify ArrayStoreError constructor accepts options.cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root');
      let e: ArrayStoreError = new ArrayStoreError('msg', { cause: cause });
      expect(e instanceof Error).assertTrue();
      expect(e.cause).assertEqual(cause);
      expect(e.message).assertEqual('msg');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0200
     * @tc.name testErrorBuiltinSubclass020
     * @tc.desc Verify AssertionError constructor accepts options.cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root');
      let e: AssertionError = new AssertionError('msg', { cause: cause });
      expect(e instanceof Error).assertTrue();
      expect(e.cause).assertEqual(cause);
      expect(e.message).assertEqual('msg');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0210
     * @tc.name testErrorBuiltinSubclass021
     * @tc.desc Verify FormatError constructor accepts options.cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root');
      let e: FormatError = new FormatError('msg', { cause: cause });
      expect(e instanceof Error).assertTrue();
      expect(e.cause).assertEqual(cause);
      expect(e.message).assertEqual('msg');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0220
     * @tc.name testErrorBuiltinSubclass022
     * @tc.desc Verify InstantiationError constructor accepts options.cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root');
      let e: InstantiationError = new InstantiationError('msg', { cause: cause });
      expect(e instanceof Error).assertTrue();
      expect(e.cause).assertEqual(cause);
      expect(e.message).assertEqual('msg');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0230
     * @tc.name testErrorBuiltinSubclass023
     * @tc.desc Verify InternalError constructor accepts options.cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root');
      let e: InternalError = new InternalError('msg', { cause: cause });
      expect(e instanceof Error).assertTrue();
      expect(e.cause).assertEqual(cause);
      expect(e.message).assertEqual('msg');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0240
     * @tc.name testErrorBuiltinSubclass024
     * @tc.desc Verify ArrayStoreError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArrayStoreError = new ArrayStoreError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0250
     * @tc.name testErrorBuiltinSubclass025
     * @tc.desc Verify AssertionError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: AssertionError = new AssertionError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0260
     * @tc.name testErrorBuiltinSubclass026
     * @tc.desc Verify FormatError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: FormatError = new FormatError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0270
     * @tc.name testErrorBuiltinSubclass027
     * @tc.desc Verify InstantiationError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InstantiationError = new InstantiationError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0280
     * @tc.name testErrorBuiltinSubclass028
     * @tc.desc Verify InternalError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InternalError = new InternalError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0290
     * @tc.name testErrorBuiltinSubclass029
     * @tc.desc Verify CoroutinesLimitExceedError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: CoroutinesLimitExceedError = new CoroutinesLimitExceedError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0300
     * @tc.name testErrorBuiltinSubclass030
     * @tc.desc Verify DivideByZeroError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: DivideByZeroError = new DivideByZeroError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0310
     * @tc.name testErrorBuiltinSubclass031
     * @tc.desc Verify ExceptionInInitializerError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ExceptionInInitializerError = new ExceptionInInitializerError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0320
     * @tc.name testErrorBuiltinSubclass032
     * @tc.desc Verify IllegalLockStateError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IllegalLockStateError = new IllegalLockStateError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0330
     * @tc.name testErrorBuiltinSubclass033
     * @tc.desc Verify InvalidAsyncOperationError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidAsyncOperationError = new InvalidAsyncOperationError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0340
     * @tc.name testErrorBuiltinSubclass034
     * @tc.desc Verify InvalidJobOperationError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidJobOperationError = new InvalidJobOperationError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0350
     * @tc.name testErrorBuiltinSubclass035
     * @tc.desc Verify InvalidStoreAccessError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidStoreAccessError = new InvalidStoreAccessError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0360
     * @tc.name testErrorBuiltinSubclass036
     * @tc.desc Verify JSONTypeError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: JSONTypeError = new JSONTypeError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0370
     * @tc.name testErrorBuiltinSubclass037
     * @tc.desc Verify NonIntegralIndexError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: NonIntegralIndexError = new NonIntegralIndexError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0380
     * @tc.name testErrorBuiltinSubclass038
     * @tc.desc Verify OutOfMemoryError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: OutOfMemoryError = new OutOfMemoryError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0390
     * @tc.name testErrorBuiltinSubclass039
     * @tc.desc Verify StackOverflowError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: StackOverflowError = new StackOverflowError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0400
     * @tc.name testErrorBuiltinSubclass040
     * @tc.desc Verify UncaughtExceptionError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: UncaughtExceptionError = new UncaughtExceptionError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0410
     * @tc.name testErrorBuiltinSubclass041
     * @tc.desc Verify IndexOutOfBoundsError JSON.stringify returns valid string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IndexOutOfBoundsError = new IndexOutOfBoundsError('json test');
      expect(e instanceof Error).assertTrue();
      let json: string = JSON.stringify(e);
      expect(json).assertEqual("{}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0420
     * @tc.name testErrorBuiltinSubclass042
     * @tc.desc Verify ArrayStoreError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ArrayStoreError = new ArrayStoreError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('ArrayStoreError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0430
     * @tc.name testErrorBuiltinSubclass043
     * @tc.desc Verify AssertionError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: AssertionError = new AssertionError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('AssertionError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0440
     * @tc.name testErrorBuiltinSubclass044
     * @tc.desc Verify FormatError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: FormatError = new FormatError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('FormatError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0450
     * @tc.name testErrorBuiltinSubclass045
     * @tc.desc Verify InstantiationError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InstantiationError = new InstantiationError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('InstantiationError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0460
     * @tc.name testErrorBuiltinSubclass046
     * @tc.desc Verify InternalError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InternalError = new InternalError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('InternalError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0470
     * @tc.name testErrorBuiltinSubclass047
     * @tc.desc Verify CoroutinesLimitExceedError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: CoroutinesLimitExceedError = new CoroutinesLimitExceedError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('CoroutinesLimitExceedError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0480
     * @tc.name testErrorBuiltinSubclass048
     * @tc.desc Verify DivideByZeroError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: DivideByZeroError = new DivideByZeroError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('DivideByZeroError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0490
     * @tc.name testErrorBuiltinSubclass049
     * @tc.desc Verify ExceptionInInitializerError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: ExceptionInInitializerError = new ExceptionInInitializerError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('ExceptionInInitializerError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0500
     * @tc.name testErrorBuiltinSubclass050
     * @tc.desc Verify IllegalLockStateError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IllegalLockStateError = new IllegalLockStateError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('IllegalLockStateError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0510
     * @tc.name testErrorBuiltinSubclass051
     * @tc.desc Verify InvalidAsyncOperationError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidAsyncOperationError = new InvalidAsyncOperationError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('InvalidAsyncOperationError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0520
     * @tc.name testErrorBuiltinSubclass052
     * @tc.desc Verify InvalidJobOperationError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidJobOperationError = new InvalidJobOperationError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('InvalidJobOperationError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0530
     * @tc.name testErrorBuiltinSubclass053
     * @tc.desc Verify InvalidStoreAccessError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: InvalidStoreAccessError = new InvalidStoreAccessError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('InvalidStoreAccessError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0540
     * @tc.name testErrorBuiltinSubclass054
     * @tc.desc Verify JSONTypeError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: JSONTypeError = new JSONTypeError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('JSONTypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0550
     * @tc.name testErrorBuiltinSubclass055
     * @tc.desc Verify NonIntegralIndexError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: NonIntegralIndexError = new NonIntegralIndexError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('NonIntegralIndexError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0560
     * @tc.name testErrorBuiltinSubclass056
     * @tc.desc Verify OutOfMemoryError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: OutOfMemoryError = new OutOfMemoryError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('OutOfMemoryError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0570
     * @tc.name testErrorBuiltinSubclass057
     * @tc.desc Verify StackOverflowError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: StackOverflowError = new StackOverflowError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('StackOverflowError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0580
     * @tc.name testErrorBuiltinSubclass058
     * @tc.desc Verify UncaughtExceptionError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: UncaughtExceptionError = new UncaughtExceptionError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('UncaughtExceptionError');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0590
     * @tc.name testErrorBuiltinSubclass059
     * @tc.desc Verify IndexOutOfBoundsError with Unicode message preserves text
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IndexOutOfBoundsError = new IndexOutOfBoundsError('错误消息');
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual('错误消息');
      expect(e.name).assertEqual('IndexOutOfBoundsError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0600
     * @tc.name testErrorBuiltinSubclass060
     * @tc.desc Verify ArithmeticError thrown and caught retains name 'ArithmeticError'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: ArithmeticError = new ArithmeticError();
      expect(err instanceof Error).assertTrue();
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual("ArithmeticError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0610
     * @tc.name testErrorBuiltinSubclass061
     * @tc.desc Verify NullPointerError thrown and caught retains name 'NullPointerError'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: NullPointerError = new NullPointerError();
      expect(err instanceof Error).assertTrue();
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual("NullPointerError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0620
     * @tc.name testErrorBuiltinSubclass062
     * @tc.desc Verify ClassCastError thrown and caught retains name 'ClassCastError'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: ClassCastError = new ClassCastError();
      expect(err instanceof Error).assertTrue();
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0630
     * @tc.name testErrorBuiltinSubclass063
     * @tc.desc Verify ArithmeticError can be used as cause in ErrorOptions
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: ArithmeticError = new ArithmeticError("inner");
      let outer: Error = new Error("wrapped", { cause: inner });
      expect(outer.cause).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0640
     * @tc.name testErrorBuiltinSubclass064
     * @tc.desc Verify NullPointerError can be used as cause in ErrorOptions
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: NullPointerError = new NullPointerError("inner");
      let outer: Error = new Error("wrapped", { cause: inner });
      expect(outer.cause).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0650
     * @tc.name testErrorBuiltinSubclass065
     * @tc.desc Verify ClassCastError can be used as cause in ErrorOptions
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: ClassCastError = new ClassCastError("inner");
      let outer: Error = new Error("wrapped", { cause: inner });
      expect(outer.cause).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0660
     * @tc.name testErrorBuiltinSubclass066
     * @tc.desc Verify Type Error With Cause001
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: TypeError = new TypeError("root cause");
      let e: TypeError = new TypeError("wrapper", { cause: c });
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual('TypeError');
      expect(e.message).assertEqual("wrapper");
      expect((e.cause as TypeError).message).assertEqual("root cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0670
     * @tc.name testErrorBuiltinSubclass067
     * @tc.desc Verify Range Error With Cause002
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: RangeError = new RangeError("range cause");
      let e: RangeError = new RangeError("out of range", { cause: c });
      expect(e instanceof Error).assertTrue();

      expect((e.cause as RangeError).message).assertEqual("range cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0680
     * @tc.name testErrorBuiltinSubclass068
     * @tc.desc Verify Syntax Error With Cause003
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: SyntaxError = new SyntaxError("parse error");
      let e: SyntaxError = new SyntaxError("syntax", { cause: c });
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual('SyntaxError');
      expect((e.cause as SyntaxError).message).assertEqual("parse error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0690
     * @tc.name testErrorBuiltinSubclass069
     * @tc.desc Verify Reference Error With Cause004
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: ReferenceError = new ReferenceError("ref cause");
      let e: ReferenceError = new ReferenceError("ref error", { cause: c });
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual('ReferenceError');
      expect((e.cause as ReferenceError).message).assertEqual("ref cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0700
     * @tc.name testErrorBuiltinSubclass070
     * @tc.desc Verify Eval Error With Cause005
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: EvalError = new EvalError("eval cause");
      let e: EvalError = new EvalError("eval error", { cause: c });
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual('EvalError');
      expect((e.cause as EvalError).message).assertEqual("eval cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0710
     * @tc.name testErrorBuiltinSubclass071
     * @tc.desc Verify Uri Error With Cause006
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: URIError = new URIError("uri cause");
      let e: URIError = new URIError("bad uri", { cause: c });
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual('URIError');
      expect((e.cause as URIError).message).assertEqual("uri cause");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0720
     * @tc.name testErrorBuiltinSubclass072
     * @tc.desc Verify Aggregate Error Errors007
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errs: Error[] = [new TypeError("t1"), new RangeError("r1")];
      let e: AggregateError = new AggregateError(errs, "aggregated");
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual('AggregateError');
      expect(e.message).assertEqual("aggregated");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0730
     * @tc.name testErrorBuiltinSubclass073
     * @tc.desc Verify Aggregate Error With Cause008
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error("root");
      let errs: Error[] = [new TypeError("t1")];
      let e: AggregateError = new AggregateError(errs, "wrapper", { cause: root });
      expect(e instanceof Error).assertTrue();
      expect(e.name).assertEqual('AggregateError');
      expect((e.cause as Error).message).assertEqual("root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0740
     * @tc.name testErrorBuiltinSubclass074
     * @tc.desc Verify Throw Subclass With Cause009
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let c: Error = new TypeError("root");
        throw new TypeError("wrapper", { cause: c });
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('TypeError');
        expect((e.cause as TypeError).message).assertEqual("root");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0750
     * @tc.name testErrorBuiltinSubclass075
     * @tc.desc Verify Subclass Cause Chain010
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l1: TypeError = new TypeError("L1");
      let l2: RangeError = new RangeError("L2", { cause: l1 });
      let l3: SyntaxError = new SyntaxError("L3", { cause: l2 });
      expect((l3.cause as RangeError).message).assertEqual("L2");
      expect(((l3.cause as RangeError).cause as TypeError).message).assertEqual("L1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0760
     * @tc.name testErrorBuiltinSubclass076
     * @tc.desc Verify IndexOutOfBoundsError with message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IndexOutOfBoundsError = new IndexOutOfBoundsError("index 5 out of bounds");
      expect(e instanceof Error).assertTrue();
      expect(e.message).assertEqual("index 5 out of bounds");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0770
     * @tc.name testErrorBuiltinSubclass077
     * @tc.desc Verify IndexOutOfBoundsError toString format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: IndexOutOfBoundsError = new IndexOutOfBoundsError("index -1");
      expect(e instanceof Error).assertTrue();
      expect(e.toString()).assertEqual("IndexOutOfBoundsError: index -1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0780
     * @tc.name testErrorBuiltinSubclass078
     * @tc.desc Verify IndexOutOfBoundsError with cause option
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("root cause");
      let e: IndexOutOfBoundsError = new IndexOutOfBoundsError("wrap", { cause });
      expect(e instanceof Error).assertTrue();
      expect(e.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0790
     * @tc.name testErrorBuiltinSubclass079
     * @tc.desc Verify ArgumentsUnderapplicationError thrown and caught retains name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: ArgumentsUnderapplicationError = new ArgumentsUnderapplicationError('caught msg');
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('ArgumentsUnderapplicationError');
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('ArgumentsUnderapplicationError');
        expect(e.message).assertEqual('caught msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0800
     * @tc.name testErrorBuiltinSubclass080
     * @tc.desc Verify ArgumentsUnderapplicationError.toString() returns correct format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: ArgumentsUnderapplicationError = new ArgumentsUnderapplicationError('display');
      expect(err instanceof Error).assertTrue();
      expect(err.toString()).assertEqual('ArgumentsUnderapplicationError: display');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0810
     * @tc.name testErrorBuiltinSubclass081
     * @tc.desc Verify ArgumentsUnderapplicationError with options.cause works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root cause');
      let err: ArgumentsUnderapplicationError = new ArgumentsUnderapplicationError('has cause', { cause: cause });
      expect(err instanceof Error).assertTrue();
      expect(err.cause).assertEqual(cause);
      expect(err.message).assertEqual('has cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0820
     * @tc.name testErrorBuiltinSubclass082
     * @tc.desc Verify CoroutinesLimitExceedError thrown and caught retains name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: CoroutinesLimitExceedError = new CoroutinesLimitExceedError('caught msg');
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('CoroutinesLimitExceedError');
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('CoroutinesLimitExceedError');
        expect(e.message).assertEqual('caught msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0830
     * @tc.name testErrorBuiltinSubclass083
     * @tc.desc Verify CoroutinesLimitExceedError.toString() returns correct format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: CoroutinesLimitExceedError = new CoroutinesLimitExceedError('display');
      expect(err instanceof Error).assertTrue();
      expect(err.toString()).assertEqual('CoroutinesLimitExceedError: display');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0840
     * @tc.name testErrorBuiltinSubclass084
     * @tc.desc Verify CoroutinesLimitExceedError with options.cause works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root cause');
      let err: CoroutinesLimitExceedError = new CoroutinesLimitExceedError('has cause', { cause: cause });
      expect(err instanceof Error).assertTrue();
      expect(err.cause).assertEqual(cause);
      expect(err.message).assertEqual('has cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0850
     * @tc.name testErrorBuiltinSubclass085
     * @tc.desc Verify DivideByZeroError thrown and caught retains name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: DivideByZeroError = new DivideByZeroError('caught msg');
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('DivideByZeroError');
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('DivideByZeroError');
        expect(e.message).assertEqual('caught msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0860
     * @tc.name testErrorBuiltinSubclass086
     * @tc.desc Verify DivideByZeroError.toString() returns correct format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: DivideByZeroError = new DivideByZeroError('display');
      expect(err instanceof Error).assertTrue();
      expect(err.toString()).assertEqual('DivideByZeroError: display');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0870
     * @tc.name testErrorBuiltinSubclass087
     * @tc.desc Verify DivideByZeroError with options.cause works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root cause');
      let err: DivideByZeroError = new DivideByZeroError('has cause', { cause: cause });
      expect(err instanceof Error).assertTrue();
      expect(err.cause).assertEqual(cause);
      expect(err.message).assertEqual('has cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0880
     * @tc.name testErrorBuiltinSubclass088
     * @tc.desc Verify ExceptionInInitializerError thrown and caught retains name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: ExceptionInInitializerError = new ExceptionInInitializerError('caught msg');
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('ExceptionInInitializerError');
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('ExceptionInInitializerError');
        expect(e.message).assertEqual('caught msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0890
     * @tc.name testErrorBuiltinSubclass089
     * @tc.desc Verify ExceptionInInitializerError.toString() returns correct format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: ExceptionInInitializerError = new ExceptionInInitializerError('display');
      expect(err instanceof Error).assertTrue();
      expect(err.toString()).assertEqual('ExceptionInInitializerError: display');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0900
     * @tc.name testErrorBuiltinSubclass090
     * @tc.desc Verify ExceptionInInitializerError with options.cause works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root cause');
      let err: ExceptionInInitializerError = new ExceptionInInitializerError('has cause', { cause: cause });
      expect(err instanceof Error).assertTrue();
      expect(err.cause).assertEqual(cause);
      expect(err.message).assertEqual('has cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0910
     * @tc.name testErrorBuiltinSubclass091
     * @tc.desc Verify IllegalLockStateError thrown and caught retains name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: IllegalLockStateError = new IllegalLockStateError('caught msg');
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('IllegalLockStateError');
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('IllegalLockStateError');
        expect(e.message).assertEqual('caught msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0920
     * @tc.name testErrorBuiltinSubclass092
     * @tc.desc Verify IllegalLockStateError.toString() returns correct format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: IllegalLockStateError = new IllegalLockStateError('display');
      expect(err instanceof Error).assertTrue();
      expect(err.toString()).assertEqual('IllegalLockStateError: display');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0930
     * @tc.name testErrorBuiltinSubclass093
     * @tc.desc Verify IllegalLockStateError with options.cause works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root cause');
      let err: IllegalLockStateError = new IllegalLockStateError('has cause', { cause: cause });
      expect(err instanceof Error).assertTrue();
      expect(err.cause).assertEqual(cause);
      expect(err.message).assertEqual('has cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0940
     * @tc.name testErrorBuiltinSubclass094
     * @tc.desc Verify InvalidAsyncOperationError thrown and caught retains name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: InvalidAsyncOperationError = new InvalidAsyncOperationError('caught msg');
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('InvalidAsyncOperationError');
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('InvalidAsyncOperationError');
        expect(e.message).assertEqual('caught msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0950
     * @tc.name testErrorBuiltinSubclass095
     * @tc.desc Verify InvalidAsyncOperationError.toString() returns correct format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: InvalidAsyncOperationError = new InvalidAsyncOperationError('display');
      expect(err instanceof Error).assertTrue();
      expect(err.toString()).assertEqual('InvalidAsyncOperationError: display');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0960
     * @tc.name testErrorBuiltinSubclass096
     * @tc.desc Verify InvalidAsyncOperationError with options.cause works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root cause');
      let err: InvalidAsyncOperationError = new InvalidAsyncOperationError('has cause', { cause: cause });
      expect(err instanceof Error).assertTrue();
      expect(err.cause).assertEqual(cause);
      expect(err.message).assertEqual('has cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0970
     * @tc.name testErrorBuiltinSubclass097
     * @tc.desc Verify InvalidJobOperationError thrown and caught retains name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: InvalidJobOperationError = new InvalidJobOperationError('caught msg');
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('InvalidJobOperationError');
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('InvalidJobOperationError');
        expect(e.message).assertEqual('caught msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0980
     * @tc.name testErrorBuiltinSubclass098
     * @tc.desc Verify InvalidJobOperationError.toString() returns correct format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: InvalidJobOperationError = new InvalidJobOperationError('display');
      expect(err instanceof Error).assertTrue();
      expect(err.toString()).assertEqual('InvalidJobOperationError: display');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_0990
     * @tc.name testErrorBuiltinSubclass099
     * @tc.desc Verify InvalidJobOperationError with options.cause works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root cause');
      let err: InvalidJobOperationError = new InvalidJobOperationError('has cause', { cause: cause });
      expect(err instanceof Error).assertTrue();
      expect(err.cause).assertEqual(cause);
      expect(err.message).assertEqual('has cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1000
     * @tc.name testErrorBuiltinSubclass100
     * @tc.desc Verify InvalidStoreAccessError thrown and caught retains name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: InvalidStoreAccessError = new InvalidStoreAccessError('caught msg');
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('InvalidStoreAccessError');
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('InvalidStoreAccessError');
        expect(e.message).assertEqual('caught msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1010
     * @tc.name testErrorBuiltinSubclass101
     * @tc.desc Verify InvalidStoreAccessError.toString() returns correct format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: InvalidStoreAccessError = new InvalidStoreAccessError('display');
      expect(err instanceof Error).assertTrue();
      expect(err.toString()).assertEqual('InvalidStoreAccessError: display');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1020
     * @tc.name testErrorBuiltinSubclass102
     * @tc.desc Verify InvalidStoreAccessError with options.cause works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root cause');
      let err: InvalidStoreAccessError = new InvalidStoreAccessError('has cause', { cause: cause });
      expect(err instanceof Error).assertTrue();
      expect(err.cause).assertEqual(cause);
      expect(err.message).assertEqual('has cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1030
     * @tc.name testErrorBuiltinSubclass103
     * @tc.desc Verify JSONTypeError thrown and caught retains name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: JSONTypeError = new JSONTypeError('caught msg');
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('JSONTypeError');
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('JSONTypeError');
        expect(e.message).assertEqual('caught msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1040
     * @tc.name testErrorBuiltinSubclass104
     * @tc.desc Verify JSONTypeError.toString() returns correct format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: JSONTypeError = new JSONTypeError('display');
      expect(err instanceof Error).assertTrue();
      expect(err.toString()).assertEqual('JSONTypeError: display');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1050
     * @tc.name testErrorBuiltinSubclass105
     * @tc.desc Verify JSONTypeError with options.cause works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root cause');
      let err: JSONTypeError = new JSONTypeError('has cause', { cause: cause });
      expect(err instanceof Error).assertTrue();
      expect(err.cause).assertEqual(cause);
      expect(err.message).assertEqual('has cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1060
     * @tc.name testErrorBuiltinSubclass106
     * @tc.desc Verify NonIntegralIndexError thrown and caught retains name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: NonIntegralIndexError = new NonIntegralIndexError('caught msg');
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('NonIntegralIndexError');
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('NonIntegralIndexError');
        expect(e.message).assertEqual('caught msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1070
     * @tc.name testErrorBuiltinSubclass107
     * @tc.desc Verify NonIntegralIndexError.toString() returns correct format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: NonIntegralIndexError = new NonIntegralIndexError('display');
      expect(err instanceof Error).assertTrue();
      expect(err.toString()).assertEqual('NonIntegralIndexError: display');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1080
     * @tc.name testErrorBuiltinSubclass108
     * @tc.desc Verify NonIntegralIndexError with options.cause works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root cause');
      let err: NonIntegralIndexError = new NonIntegralIndexError('has cause', { cause: cause });
      expect(err instanceof Error).assertTrue();
      expect(err.cause).assertEqual(cause);
      expect(err.message).assertEqual('has cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1090
     * @tc.name testErrorBuiltinSubclass109
     * @tc.desc Verify OutOfMemoryError thrown and caught retains name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: OutOfMemoryError = new OutOfMemoryError('caught msg');
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('OutOfMemoryError');
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('OutOfMemoryError');
        expect(e.message).assertEqual('caught msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1100
     * @tc.name testErrorBuiltinSubclass110
     * @tc.desc Verify OutOfMemoryError.toString() returns correct format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: OutOfMemoryError = new OutOfMemoryError('display');
      expect(err instanceof Error).assertTrue();
      expect(err.toString()).assertEqual('OutOfMemoryError: display');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1110
     * @tc.name testErrorBuiltinSubclass111
     * @tc.desc Verify OutOfMemoryError with options.cause works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root cause');
      let err: OutOfMemoryError = new OutOfMemoryError('has cause', { cause: cause });
      expect(err instanceof Error).assertTrue();
      expect(err.cause).assertEqual(cause);
      expect(err.message).assertEqual('has cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1120
     * @tc.name testErrorBuiltinSubclass112
     * @tc.desc Verify StackOverflowError thrown and caught retains name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: StackOverflowError = new StackOverflowError('caught msg');
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('StackOverflowError');
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('StackOverflowError');
        expect(e.message).assertEqual('caught msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1130
     * @tc.name testErrorBuiltinSubclass113
     * @tc.desc Verify StackOverflowError.toString() returns correct format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: StackOverflowError = new StackOverflowError('display');
      expect(err instanceof Error).assertTrue();
      expect(err.toString()).assertEqual('StackOverflowError: display');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1140
     * @tc.name testErrorBuiltinSubclass114
     * @tc.desc Verify StackOverflowError with options.cause works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root cause');
      let err: StackOverflowError = new StackOverflowError('has cause', { cause: cause });
      expect(err instanceof Error).assertTrue();
      expect(err.cause).assertEqual(cause);
      expect(err.message).assertEqual('has cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1150
     * @tc.name testErrorBuiltinSubclass115
     * @tc.desc Verify UncaughtExceptionError thrown and caught retains name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: UncaughtExceptionError = new UncaughtExceptionError('caught msg');
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('UncaughtExceptionError');
      try {
        throw err;
      } catch (e) {
        expect(e instanceof Error).assertTrue();
        expect(e.name).assertEqual('UncaughtExceptionError');
        expect(e.message).assertEqual('caught msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1160
     * @tc.name testErrorBuiltinSubclass116
     * @tc.desc Verify UncaughtExceptionError.toString() returns correct format
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: UncaughtExceptionError = new UncaughtExceptionError('display');
      expect(err instanceof Error).assertTrue();
      expect(err.toString()).assertEqual('UncaughtExceptionError: display');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1170
     * @tc.name testErrorBuiltinSubclass117
     * @tc.desc Verify UncaughtExceptionError with options.cause works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error('root cause');
      let err: UncaughtExceptionError = new UncaughtExceptionError('has cause', { cause: cause });
      expect(err instanceof Error).assertTrue();
      expect(err.cause).assertEqual(cause);
      expect(err.message).assertEqual('has cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_BUILTIN_SUBCLASS_1180
     * @tc.name testErrorBuiltinSubclass118
     * @tc.desc Verify NoDataError construction and name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorBuiltinSubclass118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: NoDataError = new NoDataError();
      expect(err instanceof Error).assertTrue();
      expect(err.name).assertEqual('NoDataError');
    });

  });
}
