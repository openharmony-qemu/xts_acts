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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

function dangerousThrowOnly(): never {
  throw new NoDataError('before return');
}

export default function arktsStaExceptionsTest(): void {
  describe('ArktsStaExceptionsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_0100
     * @tc.name testExceptionsBranch001
     * @tc.desc Verify exception thrown and caught inside a loop does not break loop continuation.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let caught: int = 0;
      const excs: ((msg: string) => Error)[] = [
        (msg: string): Error => new NoDataError(msg),
        (msg: string): Error => new RuntimeError(msg),
        (msg: string): Error => new IllegalArgumentError(msg)
      ];
      const names: string[] = ['NoDataError', 'RuntimeError', 'IllegalArgumentError'];
      for (let i: int = 0; i < excs.length; i++) {
        try {
          throw excs[i]('err');
        } catch (e) {
          expect(e.name).assertEqual(names[i]);
          expect(e.message).assertEqual('err');
          caught++;
        }
      }
      expect(caught).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_0200
     * @tc.name testExceptionsBranch002
     * @tc.desc Verify a function that catches inner exception and returns outer exception preserves inner message.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const wrap: () => Error = (): Error => {
        try {
          throw new IllegalStateError('inner problem');
        } catch (inner) {
          expect(inner.name).assertEqual('IllegalStateError');
          return new RuntimeError('wrap: ' + inner.message);
        }
      };
      const result: Error = wrap();
      expect(result.name).assertEqual('RuntimeError');
      expect(result.message).assertEqual('wrap: inner problem');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_0300
     * @tc.name testExceptionsBranch003
     * @tc.desc Verify exception with message containing only digits and punctuation is preserved.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: IllegalStateError = new IllegalStateError('404: Not Found');
      expect(err.name).assertEqual('IllegalStateError');
      expect(err.message).assertEqual('404: Not Found');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_0400
     * @tc.name testExceptionsBranch004
     * @tc.desc Verify parentheses and brackets in exception message are preserved.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: UnsupportedOperationError = new UnsupportedOperationError('(group) [item] {key}');
      expect(err.name).assertEqual('UnsupportedOperationError');
      expect(err.message).assertEqual('(group) [item] {key}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_0500
     * @tc.name testExceptionsBranch005
     * @tc.desc Verify exception thrown and caught inside a function that returns boolean result.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const tryParse: (input: string) => boolean = (input: string): boolean => {
        try {
          if (input.length === 0) {
            throw new IllegalArgumentError('empty');
          }
          return true;
        } catch (e) {
          expect(e.name).assertEqual('IllegalArgumentError');
          return false;
        }
      };
      expect(tryParse('')).assertFalse();
      expect(tryParse('abc')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_0600
     * @tc.name testExceptionsBranch006
     * @tc.desc Verify message with forward slashes and backslashes is preserved.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: IllegalArgumentError = new IllegalArgumentError('path/to/file and path\\to\\file');
      expect(err.name).assertEqual('IllegalArgumentError');
      expect(err.message).assertEqual('path/to/file and path\\to\\file');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_0700
     * @tc.name testExceptionsBranch007
     * @tc.desc Verify re-assigning the caught exception variable does not affect the originally thrown object.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        throw new IllegalStateError('real error');
      } catch (e) {
        const orig: IllegalStateError = e as IllegalStateError;
        expect(e.name).assertEqual('IllegalStateError');
        expect(e.message).assertEqual('real error');
        e = new IllegalStateError('reassigned');
        expect(e.name).assertEqual('IllegalStateError');
        expect(e.message).assertEqual('reassigned');
        expect(orig.message).assertEqual('real error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_0800
     * @tc.name testExceptionsBranch008
     * @tc.desc Verify exception with message containing underscore characters is preserved.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: IllegalArgumentError = new IllegalArgumentError('value_must_be_positive');
      expect(err.name).assertEqual('IllegalArgumentError');
      expect(err.message).assertEqual('value_must_be_positive');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_0900
     * @tc.name testExceptionsBranch009
     * @tc.desc Verify exception cause field preserves the original cause reference.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cause: Error = new Error('underlying');
      const err: IllegalArgumentError = new IllegalArgumentError('test', { cause: cause });
      expect(err.message).assertEqual('test');
      expect(err.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_1000
     * @tc.name testExceptionsBranch010
     * @tc.desc Verify exception name is the type name even when the exception is assigned to Error variable.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: Error = new ArgumentOutOfRangeError('out of range');
      expect(err.name).assertEqual('ArgumentOutOfRangeError');
      expect(err.message).assertEqual('out of range');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_1100
     * @tc.name testExceptionsBranch011
     * @tc.desc Verify catch captures correct type when RuntimeError is thrown from a deeply nested call.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const level3: () => void = () => {
        throw new RuntimeError('deep error');
      };
      const level2: () => void = () => {
        level3();
      };
      const level1: () => void = () => {
        level2();
      };
      try {
        level1();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        expect(e.message).assertEqual('deep error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_1200
     * @tc.name testExceptionsBranch012
     * @tc.desc Verify multiple exception types thrown from separate try blocks are each caught with correct identity.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e1: NoDataError = new NoDataError('first');
      const e2: RuntimeError = new RuntimeError('second');
      try {
        throw e1;
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
        expect(e.message).assertEqual('first');
      }
      try {
        throw e2;
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        expect(e.message).assertEqual('second');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1300
     * @tc.name testExceptionsBranch013
     * @tc.desc Verify exception in while loop with break statement is caught and break is unreached.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let count: int = 0;
      try {
        while (true) {
          if (count === 3) {
            throw new NoDataError('while break');
          }
          count++;
        }
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
        expect(e.message).assertEqual('while break');
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1400
     * @tc.name testExceptionsBranch014
     * @tc.desc Verify exception thrown in do-while loop body is caught before loop condition check.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let count: int = 0;
      try {
        do {
          if (count === 2) {
            throw new RuntimeError('do while');
          }
          count++;
        } while (count < 5);
      } catch (e) {
        expect(e.name).assertEqual('RuntimeError');
        expect(e.message).assertEqual('do while');
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1500
     * @tc.name testExceptionsBranch015
     * @tc.desc Verify exception thrown in deeply nested if-else branches propagates correctly.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        const level: int = 3;
        if (level > 0) {
          if (level > 1) {
            if (level > 2) {
              throw new NoDataError('nested branch');
            }
          }
        }
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1600
     * @tc.name testExceptionsBranch016
     * @tc.desc Verify exception message containing tab character is preserved intact.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg: string = 'hello\tworld';
      const err: NoDataError = new NoDataError(msg);
      expect(err.message).assertEqual(msg);
      expect(err.message.includes('\t')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1700
     * @tc.name testExceptionsBranch017
     * @tc.desc Verify exception message containing form feed character is preserved intact.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg: string = 'before\fafter';
      const err: NoDataError = new NoDataError(msg);
      expect(err.message).assertEqual(msg);
      expect(err.message.includes('\f')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1800
     * @tc.name testExceptionsBranch018
     * @tc.desc Verify exception thrown in switch-case default branch propagates correctly.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const type: string = 'unknown';
      try {
        switch (type) {
          case 'a':
            break;
          case 'b':
            break;
          default:
            throw new NoDataError('switch default');
        }
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1900
     * @tc.name testExceptionsBranch019
     * @tc.desc Verify exception thrown during array iteration stops iteration.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const keys: string[] = ['a', 'b', 'c'];
      let count: int = 0;
      try {
        for (let k: int = 0; k < keys.length; k++) {
          count++;
          if (count === 2) {
            throw new NoDataError('index loop');
          }
        }
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
        expect(e.message).assertEqual('index loop');
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_2000
     * @tc.name testExceptionsBranch020
     * @tc.desc Verify exception thrown during integer array iteration stops iteration.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: int[] = [1, 2, 3, 4, 5];
      let count: int = 0;
      try {
        for (let idx: int = 0; idx < arr.length; idx++) {
          count++;
          if (count === 3) {
            throw new NoDataError('index loop');
          }
        }
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
        expect(e.message).assertEqual('index loop');
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_2100
     * @tc.name testExceptionsBranch021
     * @tc.desc Verify exception thrown in a function prevents assignment to caller's variable.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = 'not set';
      try {
        result = dangerousThrowOnly();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
      }
      expect(result).assertEqual('not set');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_2200
     * @tc.name testExceptionsBranch022
     * @tc.desc Verify exception message with vertical tab character is preserved.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testExceptionsBranch022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg: string = 'line1\vline2';
      const err: NoDataError = new NoDataError(msg);
      expect(err.message).assertEqual(msg);
      expect(err.message.includes('\v')).assertTrue();
    });

});
}