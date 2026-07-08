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

class DataSource {
  get data(): string {
    throw new NoDataError('Data source unavailable');
  }
}

class ConfigLoader {
  static config: string = '';
  static load(): void {
    try {
      throw new RuntimeError('Config file not accessible');
    } catch (e) {
      ConfigLoader.config = 'default';
    }
  }
}

class Counter {
  _count: int = 0;
  get count(): int {
    if (this._count >= 5) {
      throw new ArgumentOutOfRangeError('Count exceeded maximum: ' + this._count.toString());
    }
    return this._count;
  }
  increment(): void {
    this._count++;
  }
}

export default function exceptionsNewScenariosTest(): void {
  describe('exceptionsNewScenariosTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_0100
     * @tc.name testNewEdge001
     * @tc.desc Verify single-arg constructor preserves message and cause is undefined for all 6 types.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err1: NoDataError = new NoDataError('msg');
      const err2: ArgumentOutOfRangeError = new ArgumentOutOfRangeError('msg');
      const err3: IllegalStateError = new IllegalStateError('msg');
      const err4: UnsupportedOperationError = new UnsupportedOperationError('msg');
      const err5: IllegalArgumentError = new IllegalArgumentError('msg');
      const err6: RuntimeError = new RuntimeError('msg');
      expect(err1.message).assertEqual('msg');
      expect(err2.message).assertEqual('msg');
      expect(err3.message).assertEqual('msg');
      expect(err4.message).assertEqual('msg');
      expect(err5.message).assertEqual('msg');
      expect(err6.message).assertEqual('msg');
      expect(err1.cause).assertEqual(undefined);
      expect(err2.cause).assertEqual(undefined);
      expect(err3.cause).assertEqual(undefined);
      expect(err4.cause).assertEqual(undefined);
      expect(err5.cause).assertEqual(undefined);
      expect(err6.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_0200
     * @tc.name testNewEdge002
     * @tc.desc Verify cause=undefined and no options produce distinct results for IllegalArgumentError.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const withCause: IllegalArgumentError = new IllegalArgumentError('a', { cause: new Error('root') });
      const withUndefined: IllegalArgumentError = new IllegalArgumentError('a', { cause: undefined });
      const withoutOpt: IllegalArgumentError = new IllegalArgumentError('a');
      if (withCause.cause instanceof Error) {
        expect((withCause.cause as Error).message).assertEqual('root');
      } else {
        expect().assertFail();
      }
      expect(withUndefined.cause).assertEqual(undefined);
      expect(withoutOpt.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_0300
     * @tc.name testNewEdge003
     * @tc.desc Verify name of zero-arg instances for all 6 exception types.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err1: NoDataError = new NoDataError();
      const err2: ArgumentOutOfRangeError = new ArgumentOutOfRangeError();
      const err3: IllegalStateError = new IllegalStateError();
      const err4: UnsupportedOperationError = new UnsupportedOperationError();
      const err5: IllegalArgumentError = new IllegalArgumentError();
      const err6: RuntimeError = new RuntimeError();
      expect(err1.name).assertEqual('NoDataError');
      expect(err2.name).assertEqual('ArgumentOutOfRangeError');
      expect(err3.name).assertEqual('IllegalStateError');
      expect(err4.name).assertEqual('UnsupportedOperationError');
      expect(err5.name).assertEqual('IllegalArgumentError');
      expect(err6.name).assertEqual('RuntimeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_0400
     * @tc.name testNewEdge004
     * @tc.desc Verify Error standard properties (name, message, cause) are accessible on an Error instance.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: IllegalArgumentError = new IllegalArgumentError('test', { cause: new Error('root') });
      expect(err.name).assertEqual('IllegalArgumentError');
      expect(err.message).assertEqual('test');
      if (err.cause instanceof Error) {
        expect((err.cause as Error).message).assertEqual('root');
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_0500
     * @tc.name testNewEdge005
     * @tc.desc Verify message string literals are preserved as-is.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new IllegalArgumentError('123').message).assertEqual('123');
      expect(new IllegalArgumentError('true').message).assertEqual('true');
      expect(new IllegalArgumentError('{}').message).assertEqual('{}');
      expect(new IllegalArgumentError('[]').message).assertEqual('[]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_0600
     * @tc.name testNewEdge006
     * @tc.desc Verify full 6x6 instanceof cross-check: each type is instanceof itself and not instanceof others.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const errors: Error[] = [
        new NoDataError(), new ArgumentOutOfRangeError(), new IllegalStateError(),
        new UnsupportedOperationError(), new IllegalArgumentError(), new RuntimeError()
      ];
      const checks: ((e: Error) => boolean)[] = [
        (e: Error): boolean => e instanceof NoDataError,
        (e: Error): boolean => e instanceof ArgumentOutOfRangeError,
        (e: Error): boolean => e instanceof IllegalStateError,
        (e: Error): boolean => e instanceof UnsupportedOperationError,
        (e: Error): boolean => e instanceof IllegalArgumentError,
        (e: Error): boolean => e instanceof RuntimeError
      ];
      for (let i: int = 0; i < errors.length; i++) {
        for (let j: int = 0; j < errors.length; j++) {
          const matches: boolean = checks[j](errors[i]);
          if (i === j) {
            expect(matches).assertTrue();
          } else {
            expect(matches).assertFalse();
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_0700
     * @tc.name testNewEdge007
     * @tc.desc Verify same message across all 6 types produces different names but same message.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg: string = 'identical message';
      const e1: NoDataError = new NoDataError(msg);
      const e2: ArgumentOutOfRangeError = new ArgumentOutOfRangeError(msg);
      const e3: IllegalStateError = new IllegalStateError(msg);
      const e4: UnsupportedOperationError = new UnsupportedOperationError(msg);
      const e5: IllegalArgumentError = new IllegalArgumentError(msg);
      const e6: RuntimeError = new RuntimeError(msg);
      expect(e1.name).assertEqual('NoDataError');
      expect(e2.name).assertEqual('ArgumentOutOfRangeError');
      expect(e3.name).assertEqual('IllegalStateError');
      expect(e4.name).assertEqual('UnsupportedOperationError');
      expect(e5.name).assertEqual('IllegalArgumentError');
      expect(e6.name).assertEqual('RuntimeError');
      expect(e1.message).assertEqual(msg);
      expect(e2.message).assertEqual(msg);
      expect(e3.message).assertEqual(msg);
      expect(e4.message).assertEqual(msg);
      expect(e5.message).assertEqual(msg);
      expect(e6.message).assertEqual(msg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_0800
     * @tc.name testNewEdge008
     * @tc.desc Verify .stack property is populated (non-empty) for all 6 exception types. Stack content format is a runtime implementation detail and is not asserted.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names: string[] = ['NoDataError', 'ArgumentOutOfRangeError', 'IllegalStateError',
        'UnsupportedOperationError', 'IllegalArgumentError', 'RuntimeError'];
      const errors: Error[] = [
        new NoDataError('a'),
        new ArgumentOutOfRangeError('b'),
        new IllegalStateError('c'),
        new UnsupportedOperationError('d'),
        new IllegalArgumentError('e'),
        new RuntimeError('f')
      ];
      for (let i: int = 0; i < errors.length; i++) {
        expect(errors[i].name).assertEqual(names[i]);
        const stk: string | undefined = errors[i].stack;
        if (stk != undefined) {
          expect(stk.length).assertLarger(0);
        } else {
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_0900
     * @tc.name testNewEdge009
     * @tc.desc Verify all 6 exception instances are instanceof Error.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new NoDataError() instanceof Error).assertTrue();
      expect(new ArgumentOutOfRangeError() instanceof Error).assertTrue();
      expect(new IllegalStateError() instanceof Error).assertTrue();
      expect(new UnsupportedOperationError() instanceof Error).assertTrue();
      expect(new IllegalArgumentError() instanceof Error).assertTrue();
      expect(new RuntimeError() instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1000
     * @tc.name testNewEdge010
     * @tc.desc Verify message "000" is preserved as string, not converted to number 0.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: IllegalArgumentError = new IllegalArgumentError('000');
      expect(err.message).assertEqual('000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1100
     * @tc.name testNewEdge011
     * @tc.desc Verify exception factory function with options.cause preserves all properties.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const factory: (msg: string, cause: Error) => RuntimeError = (msg: string, cause: Error): RuntimeError => {
        return new RuntimeError(msg, { cause: cause });
      };
      const cause: Error = new Error('factory cause');
      const err: RuntimeError = factory('factory msg', cause);
      expect(err.message).assertEqual('factory msg');
      expect(err.cause).assertEqual(cause);
      expect(err.name).assertEqual('RuntimeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1200
     * @tc.name testNewEdge012
     * @tc.desc Verify message containing only mixed whitespace characters (\t \n space) is preserved for all 6 types.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ws: string = '\t \n\t ';
      expect(new NoDataError(ws).message).assertEqual(ws);
      expect(new ArgumentOutOfRangeError(ws).message).assertEqual(ws);
      expect(new IllegalStateError(ws).message).assertEqual(ws);
      expect(new UnsupportedOperationError(ws).message).assertEqual(ws);
      expect(new IllegalArgumentError(ws).message).assertEqual(ws);
      expect(new RuntimeError(ws).message).assertEqual(ws);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1300
     * @tc.name testNewEdge013
     * @tc.desc Verify exception thrown from a function invoked via ternary expression is caught correctly.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pick: (useFirst: boolean) => string = (useFirst: boolean): string => {
        if (useFirst) {
          return 'ok';
        }
        throw new IllegalStateError('ternary error');
      };
      try {
        false ? pick(true) : pick(false);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalStateError');
        expect(e instanceof IllegalStateError).assertTrue();
        expect(e.message).assertEqual('ternary error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1400
     * @tc.name testNewEdge014
     * @tc.desc Verify exception thrown from inside Array.forEach callback is caught by outer try-catch.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const items: int[] = [1, 2, 3];
      try {
        items.forEach((val: int) => {
          if (val === 2) {
            throw new IllegalArgumentError('invalid value: ' + val.toString());
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
        expect(e instanceof IllegalArgumentError).assertTrue();
        expect(e.message).assertEqual('invalid value: 2');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1500
     * @tc.name testNewEdge015
     * @tc.desc Verify exception thrown inside a property getter is caught correctly with preserved type.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ds: DataSource = new DataSource();
      try {
        ds.data;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
        expect(e instanceof NoDataError).assertTrue();
        expect(e.message).assertEqual('Data source unavailable');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1600
     * @tc.name testNewEdge016
     * @tc.desc Verify exception thrown in switch default case is caught correctly.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const code: int = 99;
      try {
        switch (code) {
          case 1:
            break;
          default:
            throw new UnsupportedOperationError('Unknown operation code: ' + code.toString());
        }
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('UnsupportedOperationError');
        expect(e instanceof UnsupportedOperationError).assertTrue();
        expect(e.message).assertEqual('Unknown operation code: 99');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1700
     * @tc.name testNewEdge017
     * @tc.desc Verify a class static method internally catches an exception and applies a default side effect.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      ConfigLoader.config = '';
      try {
        ConfigLoader.load();
        expect(ConfigLoader.config).assertEqual('default');
      } finally {
        ConfigLoader.config = '';
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1800
     * @tc.name testNewEdge018
     * @tc.desc Verify exception from a getter is caught by try-catch with correct instanceof.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c: Counter = new Counter();
      for (let i: int = 0; i < 4; i++) {
        c.increment();
      }
      expect(c.count).assertEqual(4);
      c.increment();
      try {
        c.count;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ArgumentOutOfRangeError');
        expect(e instanceof ArgumentOutOfRangeError).assertTrue();
        expect(e.message).assertEqual('Count exceeded maximum: 5');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_1900
     * @tc.name testNewEdge019
     * @tc.desc Verify 10-level cause chain preserves all layers and messages at each level.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let current: Error = new IllegalArgumentError('level0');
      for (let i: int = 1; i <= 10; i++) {
        const msg: string = 'level' + i.toString();
        if (i % 2 === 0) {
          current = new RuntimeError(msg, { cause: current });
        } else {
          current = new NoDataError(msg, { cause: current });
        }
      }
      expect(current.name).assertEqual('RuntimeError');
      expect(current.message).assertEqual('level10');
      let chain: Error = current;
      let depth: int = 0;
      while (chain.cause !== undefined) {
        const c: Error | undefined = chain.cause as Error | undefined;
        if (c instanceof Error) {
          chain = c;
          depth++;
        } else {
          break;
        }
      }
      expect(depth).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_2000
     * @tc.name testNewEdge020
     * @tc.desc Verify the name and message contract of an Error instance is preserved regardless of JSON serialization behavior.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('test');
      expect(err.name).assertEqual('NoDataError');
      expect(err.message).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_2100
     * @tc.name testNewEdge021
     * @tc.desc Verify Error instance can be stored in a Map and retrieved correctly.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('map value');
      const m: Map<Error, string> = new Map<Error, string>();
      m.set(err, 'value');
      expect(m.get(err)).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_2200
     * @tc.name testNewEdge022
     * @tc.desc Verify Error instances stored in a Set are deduplicated by reference.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err1: NoDataError = new NoDataError('a');
      const err2: NoDataError = new NoDataError('b');
      const s: Set<Error> = new Set<Error>();
      s.add(err1);
      s.add(err1);
      s.add(err2);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_2300
     * @tc.name testNewEdge023
     * @tc.desc Verify message property on Error instance can be modified after construction.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('sealed');
      err.message = 'modified';
      expect(err.message).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_2400
     * @tc.name testNewEdge024
     * @tc.desc Verify Error instance instanceof checks for NoDataError and RuntimeError.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err1: NoDataError = new NoDataError('a');
      const err2: RuntimeError = new RuntimeError('b');
      expect(err1.name).assertEqual('NoDataError');
      expect(err1.message).assertEqual('a');
      expect(err2.name).assertEqual('RuntimeError');
      expect(err2.message).assertEqual('b');
      expect(err1 instanceof NoDataError).assertTrue();
      expect(err2 instanceof RuntimeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_2500
     * @tc.name testNewEdge025
     * @tc.desc Verify Error message property returns the string passed to constructor.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('42');
      expect(err.message).assertEqual('42');
      const err2: NoDataError = new NoDataError('0');
      expect(err2.message).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_2600
     * @tc.name testNewEdge026
     * @tc.desc Verify Error.prototype.toString returns name and message in standard format.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('test message');
      const str: string = err.toString();
      expect(str).assertEqual('NoDataError: test message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_2700
     * @tc.name testNewEdge027
     * @tc.desc Verify the public contract (name, message, cause) of a NoDataError instance without a cause option.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const err: NoDataError = new NoDataError('test');
      expect(err.name).assertEqual('NoDataError');
      expect(err.message).assertEqual('test');
      expect(err.cause).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARKTS_STA_EXCEPTIONS_EDGE_2800
     * @tc.name testNewEdge028
     * @tc.desc Verify async function throws NoDataError and is caught via await.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testNewEdge028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncThrower: () => Promise<void> = async (): Promise<void> => {
        throw new NoDataError('async error');
      };
      try {
        await asyncThrower();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NoDataError');
        expect(e instanceof NoDataError).assertTrue();
        expect(e.message).assertEqual('async error');
      }
    });

});
}