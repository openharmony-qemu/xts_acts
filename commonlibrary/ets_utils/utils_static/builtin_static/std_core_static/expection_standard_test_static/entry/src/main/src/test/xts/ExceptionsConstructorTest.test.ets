'use static'
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

class CausePayload {
  code: int = 0;
  detail: string = '';
}

function throwByCode(code: int): void {
  if (code === 1) {
    throw new NoDataError('no data');
  } else if (code === 2) {
    throw new IllegalArgumentError('bad arg');
  } else if (code === 3) {
    throw new RuntimeError('unknown');
  } else {
    throw new IllegalArgumentError('unknown code: ' + code.toString());
  }
}

class ConstructorThrowingError extends Error {
  constructor() {
    super();
    throw new TypeError('ConstructorThrowingError intentionally throws after super call');
  }
}

class BadError extends Error {
  constructor(msg: string) {
    super(msg);
    this.name = 'Bad';
  }
}

class CustomObj {
  public toString(): string {
    return 'object message';
  }
}

export default function exceptionsConstructorTest(): void {
  describe('exceptionsConstructorTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_0100
     * @tc.name testExceptionsConstructor001
     * @tc.desc Verify zero-argument constructors create all six exceptions with empty messages.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new NoDataError().message).assertEqual('');
      expect(new NoDataError().name).assertEqual('NoDataError');
      expect(new ArgumentOutOfRangeError().message).assertEqual('');
      expect(new ArgumentOutOfRangeError().name).assertEqual('ArgumentOutOfRangeError');
      expect(new IllegalStateError().message).assertEqual('');
      expect(new IllegalStateError().name).assertEqual('IllegalStateError');
      expect(new UnsupportedOperationError().message).assertEqual('');
      expect(new UnsupportedOperationError().name).assertEqual('UnsupportedOperationError');
      expect(new IllegalArgumentError().message).assertEqual('');
      expect(new IllegalArgumentError().name).assertEqual('IllegalArgumentError');
      expect(new RuntimeError().message).assertEqual('');
      expect(new RuntimeError().name).assertEqual('RuntimeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_0200
     * @tc.name testExceptionsConstructor002
     * @tc.desc Verify two-argument constructors preserve message and cause across all six exception types.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cause: Error = new Error('root cause');
      const err1: NoDataError = new NoDataError('no data available', { cause: cause });
      const err2: ArgumentOutOfRangeError = new ArgumentOutOfRangeError('value exceeds limit', { cause: cause });
      const err3: IllegalStateError = new IllegalStateError('object disposed', { cause: cause });
      const err4: UnsupportedOperationError = new UnsupportedOperationError('operation blocked', { cause: cause });
      const err5: IllegalArgumentError = new IllegalArgumentError('negative count', { cause: cause });
      const err6: RuntimeError = new RuntimeError('unexpected failure', { cause: cause });
      expect(err1.message).assertEqual('no data available');
      expect(err1.cause).assertEqual(cause);
      expect(err2.message).assertEqual('value exceeds limit');
      expect(err2.cause).assertEqual(cause);
      expect(err3.message).assertEqual('object disposed');
      expect(err3.cause).assertEqual(cause);
      expect(err4.message).assertEqual('operation blocked');
      expect(err4.cause).assertEqual(cause);
      expect(err5.message).assertEqual('negative count');
      expect(err5.cause).assertEqual(cause);
      expect(err6.message).assertEqual('unexpected failure');
      expect(err6.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_0300
     * @tc.name testExceptionsConstructor003
     * @tc.desc Verify constructor preserves a 10000-character message string and length.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longMsg: string = 'a'.repeat(10000);
      const err: IllegalArgumentError = new IllegalArgumentError(longMsg);
      expect(err.message).assertEqual(longMsg);
      expect(err.message.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_0400
     * @tc.name testExceptionsConstructor004
     * @tc.desc Verify cause option supports Error subclasses and same-type exceptions.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const objCause: Error = new Error('server error');
      const arrayCause: IllegalArgumentError = new IllegalArgumentError('array cause');
      const inner: NoDataError = new NoDataError('inner no data');
      expect(new IllegalArgumentError('msg', { cause: objCause }).cause).assertEqual(objCause);
      expect(new IllegalArgumentError('msg', { cause: arrayCause }).cause).assertEqual(arrayCause);
      expect(new NoDataError('outer no data', { cause: inner }).cause).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_0500
     * @tc.name testExceptionsConstructor005
     * @tc.desc Verify empty object options and undefined options leave cause undefined.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err1: IllegalArgumentError = new IllegalArgumentError('msg', {});
      const err2: IllegalArgumentError = new IllegalArgumentError('msg', undefined);
      const err3: IllegalArgumentError = new IllegalArgumentError();
      expect(err1.message).assertEqual('msg');
      expect(err1.cause).assertEqual(undefined);
      expect(err2.cause).assertEqual(undefined);
      expect(err2.message).assertEqual('msg');
      expect(err3.cause).assertEqual(undefined);
      expect(err3.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_0600
     * @tc.name testExceptionsConstructor006
     * @tc.desc Verify exception instances compared by reference: distinct instances are not equal.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err1: RuntimeError = new RuntimeError('same');
      const err2: RuntimeError = new RuntimeError('same');
      expect(err1.message).assertEqual(err2.message);
      expect(err1.name).assertEqual(err2.name);
      err1.message = 'mutated';
      expect(err2.message).assertEqual('same');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_0700
     * @tc.name testExceptionsConstructor007
     * @tc.desc Verify standard Error and custom exception constructors differ by name while both inherit Error.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const stdErr: Error = new Error('standard error');
      const customErr: Error = new IllegalArgumentError('custom error');
      expect(stdErr.name).assertEqual('Error');
      expect(customErr.name).assertEqual('IllegalArgumentError');
      expect(stdErr.message).assertEqual('standard error');
      expect(customErr.message).assertEqual('custom error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_0800
     * @tc.name testExceptionsConstructor008
     * @tc.desc Verify exception name and message are readable after throw across a function boundary.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const throwIt: () => void = () => {
        throw new IllegalArgumentError('from function');
      };
      try {
        throwIt();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e.message).assertEqual('from function');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_0900
     * @tc.name testExceptionsConstructor009
     * @tc.desc Verify exception name and message properties are accessible after construction.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: IllegalArgumentError = new IllegalArgumentError('custom');
      expect(err.name).assertEqual('IllegalArgumentError');
      expect(err.message).assertEqual('custom');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_1000
     * @tc.name testExceptionsConstructor010
     * @tc.desc Verify cause property tolerates a non-Error array value without type enforcement.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const causeArr: int[] = [1, 2, 3];
      const err: IllegalArgumentError = new IllegalArgumentError('msg', { cause: causeArr });
      expect(err.message).assertEqual('msg');
      expect(err.cause).assertEqual(causeArr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_1100
     * @tc.name testExceptionsConstructor011
     * @tc.desc Verify cause property can be verified as instanceof a specific Error subclass.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const inner: RuntimeError = new RuntimeError('inner');
      const err: NoDataError = new NoDataError('outer', { cause: inner });
      expect(err.cause instanceof RuntimeError).assertTrue();
      if (err.cause instanceof RuntimeError) {
        expect((err.cause as Error).message).assertEqual('inner');
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_1200
     * @tc.name testExceptionsConstructor012
     * @tc.desc Verify cause property as plain object is preserved through constructor chain.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const causeObj: CausePayload = new CausePayload();
      causeObj.code = 500;
      causeObj.detail = 'server error';
      const err: IllegalArgumentError = new IllegalArgumentError('msg', { cause: causeObj });
      expect(err.cause).assertEqual(causeObj);
      expect(causeObj.code).assertEqual(500);
      expect(causeObj.detail).assertEqual('server error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_1300
     * @tc.name testExceptionsConstructor013
     * @tc.desc Verify all Error base properties exist on custom exception instance.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cause: Error = new Error('cause msg');
      const err: IllegalArgumentError = new IllegalArgumentError('test', { cause: cause });
      expect(err.name).assertEqual('IllegalArgumentError');
      expect(err.message).assertEqual('test');
      expect(err.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_1400
     * @tc.name testExceptionsConstructor014
     * @tc.desc Verify instanceof dispatch in catch block selects correct branch for each exception type.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        throwByCode(1);
        expect().assertFail();
      } catch (e) {
        if (e instanceof NoDataError) {
          expect(e.name).assertEqual('NoDataError');
        } else {
          expect().assertFail();
        }
      }
      try {
        throwByCode(2);
        expect().assertFail();
      } catch (e) {
        if (e instanceof IllegalArgumentError) {
          expect(e.name).assertEqual('IllegalArgumentError');
        } else {
          expect().assertFail();
        }
      }
      try {
        throwByCode(3);
        expect().assertFail();
      } catch (e) {
        if (e instanceof RuntimeError) {
          expect(e.name).assertEqual('RuntimeError');
        } else {
          expect().assertFail();
        }
      }
      try {
        throwByCode(99);
        expect().assertFail();
      } catch (e) {
        if (e instanceof IllegalArgumentError) {
          expect(e.name).assertEqual('IllegalArgumentError');
          expect(e.message).assertEqual('unknown code: 99');
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_1500
     * @tc.name testExceptionsConstructor015
     * @tc.desc Verify message property reassignment after construction for all 6 types.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const types: Error[] = [
        new NoDataError('a'),
        new ArgumentOutOfRangeError('a'),
        new IllegalStateError('a'),
        new UnsupportedOperationError('a'),
        new IllegalArgumentError('a'),
        new RuntimeError('a')
      ];
      const names: string[] = ['NoDataError', 'ArgumentOutOfRangeError', 'IllegalStateError',
        'UnsupportedOperationError', 'IllegalArgumentError', 'RuntimeError'];
      for (let i: int = 0; i < types.length; i++) {
        types[i].message = 'modified';
        expect(types[i].message).assertEqual('modified');
        expect(types[i].name).assertEqual(names[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_1600
     * @tc.name testExceptionsConstructor016
     * @tc.desc Verify explicit toString call on custom object produces expected message in Error constructor.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: CustomObj = new CustomObj();
      const err: NoDataError = new NoDataError(obj.toString());
      expect(err.message).assertEqual('object message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_1700
     * @tc.name testExceptionsConstructor017
     * @tc.desc Verify Error options with non-Error cause preserves the cause value as-is.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('msg', { cause: 'string cause' });
      expect(err.cause).assertEqual('string cause');
      const err2: NoDataError = new NoDataError('msg2', { cause: 42 });
      expect(err2.cause).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_1800
     * @tc.name testExceptionsConstructor018
     * @tc.desc Verify Error options with undefined cause sets cause property to undefined.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('msg', { cause: undefined });
      expect(err.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_1900
     * @tc.name testExceptionsConstructor019
     * @tc.desc Verify multiple Error instances created at same point have distinct references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err1: NoDataError = new NoDataError('first');
      const err2: NoDataError = new NoDataError('second');
      expect(err1.name).assertEqual('NoDataError');
      expect(err1.message).assertEqual('first');
      expect(err2.message).assertEqual('second');
      err1.message = 'mutated';
      expect(err2.message).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_2000
     * @tc.name testExceptionsConstructor020
     * @tc.desc Verify a throw inside a subclass constructor aborts instantiation so the new expression propagates the exception without producing a ConstructorThrowingError instance.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new ConstructorThrowingError();
        expect().assertFail();
      } catch (e) {
        expect(e instanceof ConstructorThrowingError).assertFalse();
        expect(e.name).assertEqual('TypeError');
        expect(e instanceof TypeError).assertTrue();
        expect(e.message).assertEqual('ConstructorThrowingError intentionally throws after super call');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_2100
     * @tc.name testExceptionsConstructor021
     * @tc.desc Verify new Error() with no arguments creates error with empty message.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: Error = new Error();
      expect(err.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_2200
     * @tc.name testExceptionsConstructor022
     * @tc.desc Verify new Error(undefined) produces an empty message string.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: Error = new Error(undefined);
      expect(err.message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_2300
     * @tc.name testExceptionsConstructor023
     * @tc.desc Verify Error constructed with new creates valid Error instance with correct message.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: Error = new Error('constructed with new');
      expect(err.message).assertEqual('constructed with new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_2400
     * @tc.name testExceptionsConstructor024
     * @tc.desc Verify Error subclass instances have correct prototype chain.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('test');
      expect(err instanceof NoDataError).assertTrue();
      expect(err instanceof RuntimeError).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_2500
     * @tc.name testExceptionsConstructor025
     * @tc.desc Verify multiple Error instances can share the same cause object.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cause: Error = new Error('shared cause');
      const err1: NoDataError = new NoDataError('first', { cause: cause });
      const err2: RuntimeError = new RuntimeError('second', { cause: cause });
      expect(err1.cause).assertEqual(cause);
      expect(err2.cause).assertEqual(cause);
      expect(err1.cause).assertEqual(err2.cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_2600
     * @tc.name testExceptionsConstructor026
     * @tc.desc Verify Error cause property preserves reference to another Error instance.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err1: NoDataError = new NoDataError('first');
      const err2: NoDataError = new NoDataError('second', { cause: err1 });
      expect(err2.cause).assertEqual(err1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_2700
     * @tc.name testExceptionsConstructor027
     * @tc.desc Verify NoDataError constructor with undefined options sets cause to undefined.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('msg', undefined);
      expect(err.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_CONSTRUCTOR_2800
     * @tc.name testExceptionsConstructor028
     * @tc.desc Verify Error subclass super call must access this after super.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: BadError = new BadError('test');
      expect(err.name).assertEqual('Bad');
      expect(err.message).assertEqual('test');
    });

});
}
