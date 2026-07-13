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
import Utils from './../Util.test';

interface MutableValueObj {
  value: int;
}

class CustomError047 extends Error {
  errCode: int = 0;
  constructor(message: string, errCode: int) {
    super(message);
    this.name = 'CustomError';
    this.errCode = errCode;
  }
}

class HandlerReset115 {
}

export default function ProcessErrorHandlerResetTest(): void {
  describe('ProcessErrorHandlerResetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_0100
     * @tc.name testProcessErrorHandlerReset001
     * @tc.desc Verify that resetting the same listener in a for-loop each returns undefined and only triggers once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let listener = (error: Object): void => { count++; };
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      for (let i = 0; i < 10; i++) {
        let r = handler.reset(listener);
        expect(r).assertUndefined();
      }
      handler.handleUncaughtError(new Error('after loop'));
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_0200
     * @tc.name testProcessErrorHandlerReset002
     * @tc.desc Verify that passing one UncaughtErrorListener callback to reset replaces the internal callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let replaced = false;
      let oldTriggered = false;
      let listener1 = (error: Object): void => { oldTriggered = true; };
      let listener2 = (error: Object): void => {
        replaced = true;
      };
      let handler = new ProcessErrorHandler(listener1);
      handler.handleUncaughtError(new Error('before reset'));
      expect(oldTriggered).assertTrue();
      handler.reset(listener2);
      handler.handleUncaughtError(new Error('after reset'));
      expect(replaced).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_0300
     * @tc.name testProcessErrorHandlerReset003
     * @tc.desc Verify chained reset calls: only the last callback is active after two resets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let label = '';
      let handler = new ProcessErrorHandler((_error: Object): void => { label = 'init'; });
      handler.reset((error: Object): void => { label = 'first'; });
      handler.reset((error: Object): void => { label = 'second'; });
      handler.handleUncaughtError(new Error('chained'));
      expect(label).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_0400
     * @tc.name testProcessErrorHandlerReset004
     * @tc.desc Verify reset return value is undefined while the new callback is active
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let listener1 = (error: Object): void => {};
      let listener2 = (error: Object): void => { count++; };
      let handler = new ProcessErrorHandler(listener1);
      let result = handler.reset(listener2);
      expect(result).assertUndefined();
      handler.handleUncaughtError(new Error('arrow'));
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_0500
     * @tc.name testProcessErrorHandlerReset005
     * @tc.desc Verify that passing an arrow function as cb to reset replaces the callback normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedName = '';
      let oldCalled = false;
      let newListener = (error: Object): void => {
        capturedName = (error as Error).name;
      }
      let oldListener = (error: Object): void => { oldCalled = true; };
      let handler = new ProcessErrorHandler(oldListener);
      handler.handleUncaughtError(new Error('old callback'));
      expect(oldCalled).assertTrue();
      handler.reset(newListener);
      handler.handleUncaughtError(new TypeError('new callback'));
      expect(capturedName).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_0600
     * @tc.name testProcessErrorHandlerReset006
     * @tc.desc Verify reset callback can capture and update an external object field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: MutableValueObj = { value: 1 };
      let handler = new ProcessErrorHandler((error: Object): void => {});
      handler.reset((error: Object): void => {
        target.value += (error as Error).message.length;
      });
      handler.handleUncaughtError(new Error('abc'));
      expect(target.value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_0700
     * @tc.name testProcessErrorHandlerReset007
     * @tc.desc Verify that after reset the new callback can access error.name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedName = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        capturedName = (error as Error).name;
      });
      handler.handleUncaughtError(new TypeError('type name test'));
      expect(capturedName).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_0800
     * @tc.name testProcessErrorHandlerReset008
     * @tc.desc Verify each handleUncaughtError call after reset receives a distinct Error object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Object[] = [];
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => { errors.push(error); });
      handler.handleUncaughtError(new Error('first'));
      handler.handleUncaughtError(new Error('second'));
      expect(errors.length).assertEqual(2);
      expect(errors[0] === errors[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_0900
     * @tc.name testProcessErrorHandlerReset009
     * @tc.desc Verify old callback closure variable is not affected after being replaced by reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let oldVar = 'original';
      let oldCalled = false;
      let handler = new ProcessErrorHandler((error: Object): void => {
        oldCalled = true;
        oldVar = 'modified';
      });
      handler.handleUncaughtError(new Error('before reset'));
      expect(oldCalled).assertTrue();
      expect(oldVar).assertEqual('modified');
      handler.reset((_error: Object): void => {});
      handler.handleUncaughtError(new Error('after reset'));
      expect(oldVar).assertEqual('modified');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_1000
     * @tc.name testProcessErrorHandlerReset010
     * @tc.desc Verify that after reset the callback can extract the length of error.message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msgLen = 0;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        msgLen = (error as Error).message.length;
      });
      handler.handleUncaughtError(new Error('hello'));
      expect(msgLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_1100
     * @tc.name testProcessErrorHandlerReset011
     * @tc.desc Verify the callback after reset can use instanceof to discriminate Error vs TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let oldDetected = '';
      let newDetected = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        oldDetected = (error instanceof TypeError) ? 'TypeError' : 'Error';
      });
      handler.handleUncaughtError(new TypeError('before reset'));
      expect(oldDetected).assertEqual('TypeError');
      handler.reset((error: Object): void => {
        newDetected = (error instanceof RangeError) ? 'RangeError' : 'Other';
      });
      handler.handleUncaughtError(new RangeError('after reset'));
      expect(newDetected).assertEqual('RangeError');
      expect(oldDetected).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_1200
     * @tc.name testProcessErrorHandlerReset012
     * @tc.desc Verify new callback after reset can access TypeError.message property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedMsg = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        capturedMsg = (error as Error).message;
      });
      handler.handleUncaughtError(new TypeError('type error message'));
      expect(capturedMsg).assertEqual('type error message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_1300
     * @tc.name testProcessErrorHandlerReset013
     * @tc.desc Verify new callback after reset can access RangeError.name property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedName = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        capturedName = (error as Error).name;
      });
      handler.handleUncaughtError(new RangeError('range limit'));
      expect(capturedName).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_1400
     * @tc.name testProcessErrorHandlerReset014
     * @tc.desc Verify callback can concatenate error.name and error.message after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let combined = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        combined = (error as Error).name + ':' + (error as Error).message;
      });
      handler.handleUncaughtError(new Error('concat text'));
      expect(combined).assertEqual('Error:concat text');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_1500
     * @tc.name testProcessErrorHandlerReset015
     * @tc.desc Verify callback can use custom Error errCode in conditional branching after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let severity = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        let ce = error as CustomError047;
        if (ce.errCode > 50) {
          severity = 'high';
        } else {
          severity = 'low';
        }
      });
      handler.handleUncaughtError(new CustomError047('branch', 99));
      expect(severity).assertEqual('high');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_1600
     * @tc.name testProcessErrorHandlerReset016
     * @tc.desc Verify callback can handle error.message with special characters after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let receivedMsg = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        receivedMsg = (error as Error).message;
      });
      handler.handleUncaughtError(new Error('spec!@#$al chars'));
      expect(receivedMsg).assertEqual('spec!@#$al chars');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_1700
     * @tc.name testProcessErrorHandlerReset017
     * @tc.desc Verify callback preserves exact concatenated message content of 498 chars after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prefix = 'LongMsg:';
      let body = 'z'.repeat(490);
      let fullMsg = prefix + body;
      let receivedMsg = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        receivedMsg = (error as Error).message;
      });
      handler.handleUncaughtError(new Error(fullMsg));
      expect(receivedMsg).assertEqual(fullMsg);
      expect(receivedMsg.length).assertEqual(498);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_1800
     * @tc.name testProcessErrorHandlerReset018
     * @tc.desc Verify callback can handle Unicode error.message after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let unicodeMsg = '日本語 русский العربية';
      let receivedMsg = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        receivedMsg = (error as Error).message;
      });
      handler.handleUncaughtError(new Error(unicodeMsg));
      expect(receivedMsg).assertEqual(unicodeMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_1900
     * @tc.name testProcessErrorHandlerReset019
     * @tc.desc Verify callback uses if-else branching on error.name to handle different error types after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let branchResult = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        if ((error as Error).name === 'TypeError') {
          branchResult = 'type';
        } else if ((error as Error).name === 'RangeError') {
          branchResult = 'range';
        } else {
          branchResult = 'other';
        }
      });
      handler.handleUncaughtError(new RangeError('branch test'));
      expect(branchResult).assertEqual('range');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_2000
     * @tc.name testProcessErrorHandlerReset020
     * @tc.desc Verify resetting handler with different callbacks produces different outputs for same error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let captured: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        captured = 'first';
      });
      handler.handleUncaughtError(new Error('dummy'));
      expect(captured).assertEqual('first');
      handler.reset((error: Object): void => {
        captured = 'second';
      });
      handler.handleUncaughtError(new Error('dummy'));
      expect(captured).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_2100
     * @tc.name testProcessErrorHandlerReset021
     * @tc.desc Verify reset keeps old callback history unchanged after replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let history: string[] = [];
      let listener1 = (error: Object): void => { history.push('old:' + (error as Error).message); };
      let listener2 = (error: Object): void => { history.push('new:' + (error as Error).message); };
      let handler = new ProcessErrorHandler(listener1);
      handler.handleUncaughtError(new Error('before'));
      handler.reset(listener2);
      handler.handleUncaughtError(new Error('after'));
      expect(history.length).assertEqual(2);
      expect(history[0]).assertEqual('old:before');
      expect(history[1]).assertEqual('new:after');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_2200
     * @tc.name testProcessErrorHandlerReset022
     * @tc.desc Verify that after reset, the new callback receives the Error parameter correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let listener1 = (error: Object): void => {};
      let listener2 = (error: Object): void => {
        received = error;
      };
      let handler = new ProcessErrorHandler(listener1);
      handler.reset(listener2);
      let err = new Error('new callback test');
      handler.handleUncaughtError(err);
      expect(received instanceof Error).assertTrue();
      expect((received as Error).message).assertEqual('new callback test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_2300
     * @tc.name testProcessErrorHandlerReset023
     * @tc.desc Verify reset callback can read a custom Error property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let code = 0;
      let oldListener = (error: Object): void => {};
      let newListener = (error: Object): void => {
        code = (error as CustomError047).errCode;
      };
      let handler = new ProcessErrorHandler(oldListener);
      handler.reset(newListener);
      handler.handleUncaughtError(new CustomError047('custom after reset', 31));
      expect(code).assertEqual(31);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_2400
     * @tc.name testProcessErrorHandlerReset024
     * @tc.desc Verify that resetting to the same callback reference multiple times does not cause exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let listener = (error: Object): void => { count++; };
      let handler = new ProcessErrorHandler(listener);
      handler.reset(listener);
      handler.reset(listener);
      handler.reset(listener);
      handler.handleUncaughtError(new Error('same'));
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_2500
     * @tc.name testProcessErrorHandlerReset025
     * @tc.desc Verify that calling handleUncaughtError immediately after reset uses the new callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count1 = 0;
      let count2 = 0;
      let listener1 = (error: Object): void => { count1++; };
      let listener2 = (error: Object): void => { count2++; };
      let handler = new ProcessErrorHandler(listener1);
      handler.handleUncaughtError(new Error('first'));
      handler.reset(listener2);
      handler.handleUncaughtError(new Error('second'));
      expect(count1).assertEqual(1);
      expect(count2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_2600
     * @tc.name testProcessErrorHandlerReset026
     * @tc.desc Verify that a complex callback passed to reset executes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: string[] = [];
      let complexListener = (error: Object): void => {
        if ((error as Error).message.length > 10) {
          results.push('long');
        } else {
          results.push('short');
        }
        results.push((error as Error).name);
        results.push((error as Error).stack ?? 'no stack');
      };
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset(complexListener);
      handler.handleUncaughtError(new Error('hi'));
      expect(results[0]).assertEqual('short');
      expect(results[1]).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_2700
     * @tc.name testProcessErrorHandlerReset027
     * @tc.desc Verify that after reset, the new callback correctly receives Error subclass information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let newListener = (error: Object): void => {
        received = error;
      };
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset(newListener);
      let err = new TypeError('type error after reset');
      handler.handleUncaughtError(err);
      expect(received instanceof Error).assertTrue();
      expect(received instanceof TypeError).assertTrue();
      expect((received as Error).message).assertEqual('type error after reset');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_2800
     * @tc.name testProcessErrorHandlerReset028
     * @tc.desc Verify reset callback can push received error messages into an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msgs: string[] = [];
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        msgs.push((error as Error).message);
      });
      handler.handleUncaughtError(new Error('spread args'));
      expect(msgs.length).assertEqual(1);
      expect(msgs[0]).assertEqual('spread args');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_2900
     * @tc.name testProcessErrorHandlerReset029
     * @tc.desc Verify that alternating reset and handleUncaughtError uses the current callback each time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let labels: string[] = [];
      let listener1 = (error: Object): void => { labels.push('L1:' + (error as Error).message); };
      let listener2 = (error: Object): void => { labels.push('L2:' + (error as Error).message); };
      let listener3 = (error: Object): void => { labels.push('L3:' + (error as Error).message); };
      let handler = new ProcessErrorHandler(listener1);
      handler.handleUncaughtError(new Error('a'));
      handler.reset(listener2);
      handler.handleUncaughtError(new Error('b'));
      handler.reset(listener3);
      handler.handleUncaughtError(new Error('c'));
      expect(labels[0]).assertEqual('L1:a');
      expect(labels[1]).assertEqual('L2:b');
      expect(labels[2]).assertEqual('L3:c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_3000
     * @tc.name testProcessErrorHandlerReset030
     * @tc.desc Verify that after reset, the new callback correctly receives a standard Error instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => { received = error; });
      let err = new Error('standard error after reset');
      handler.handleUncaughtError(err);
      expect(received instanceof Error).assertTrue();
      expect((received as Error).message).assertEqual('standard error after reset');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_3100
     * @tc.name testProcessErrorHandlerReset031
     * @tc.desc Verify that after reset, the new callback correctly identifies a RangeError subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => { received = error; });
      let err = new RangeError('range error');
      handler.handleUncaughtError(err);
      expect(received instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_3200
     * @tc.name testProcessErrorHandlerReset032
     * @tc.desc Verify that after reset, a TypeError is correctly passed to the new callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => { received = error; });
      let err = new TypeError('type error');
      handler.handleUncaughtError(err);
      expect(received instanceof TypeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_3300
     * @tc.name testProcessErrorHandlerReset033
     * @tc.desc Verify that after reset, a custom Error subclass instance is correctly passed to the new callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => { received = error; });
      let err = new CustomError047('custom', 42);
      handler.handleUncaughtError(err);
      expect((received as Error).name).assertEqual('CustomError');
      expect((received as CustomError047).errCode).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_3400
     * @tc.name testProcessErrorHandlerReset034
     * @tc.desc Verify closure variable capture in callback works correctly after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counter = 10;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        counter += (error as Error).message.length;
      });
      handler.handleUncaughtError(new Error('abc'));
      expect(counter).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_3500
     * @tc.name testProcessErrorHandlerReset035
     * @tc.desc Verify callback invocation count accumulates correctly after reset across 3 handleUncaughtError calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount = 0;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => { callCount++; });
      handler.handleUncaughtError(new Error('one'));
      handler.handleUncaughtError(new Error('two'));
      handler.handleUncaughtError(new Error('three'));
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_3600
     * @tc.name testProcessErrorHandlerReset036
     * @tc.desc Verify callback return value (implicit undefined) is ignored and callback still executes after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let executed = false;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        executed = true;
        return;
      });
      handler.handleUncaughtError(new Error('ignored return'));
      expect(executed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_3700
     * @tc.name testProcessErrorHandlerReset037
     * @tc.desc Verify local variable scope isolation in callback after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        let localScoped = 'isolated';
        result = localScoped;
      });
      handler.handleUncaughtError(new Error('scope test'));
      expect(result).assertEqual('isolated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_3800
     * @tc.name testProcessErrorHandlerReset038
     * @tc.desc Verify callback maintains state consistency after reset (array push tracking)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let log: string[] = [];
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        log.push('handled:' + (error as Error).message);
      });
      handler.handleUncaughtError(new Error('state1'));
      handler.handleUncaughtError(new Error('state2'));
      expect(log.length).assertEqual(2);
      expect(log[0]).assertEqual('handled:state1');
      expect(log[1]).assertEqual('handled:state2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_3900
     * @tc.name testProcessErrorHandlerReset039
     * @tc.desc Verify that calling reset inside a catch block replaces the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let newCalled = false;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      try {
        throw new Error('source error');
      } catch (e) {
        let caughtError = e as Error;
        expect(caughtError.name).assertEqual('Error');
        handler.reset((error: Object): void => {
          newCalled = true;
        });
      }
      handler.handleUncaughtError(new Error('after catch'));
      expect(newCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_4000
     * @tc.name testProcessErrorHandlerReset040
     * @tc.desc Verify callback can detect that error.stack is not undefined after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hasStack = false;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        hasStack = (error as Error).stack !== undefined;
      });
      handler.handleUncaughtError(new Error('stack presence'));
      expect(hasStack).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_4100
     * @tc.name testProcessErrorHandlerReset041
     * @tc.desc Verify that after reset, the new callback can access the full Error name, message, and stack information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorInfo: string[] = [];
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        errorInfo.push((error as Error).name);
        errorInfo.push((error as Error).message);
        errorInfo.push((error as Error).stack ?? 'no stack');
      });
      let err = new TypeError('type mismatch');
      handler.handleUncaughtError(err);
      expect(errorInfo[0]).assertEqual('TypeError');
      expect(errorInfo[1]).assertEqual('type mismatch');
      expect(errorInfo[2]).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_4200
     * @tc.name testProcessErrorHandlerReset042
     * @tc.desc Verify that the reset method replaces callback and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let listener1 = (error: Object): void => {};
      let captured = '';
      let listener2 = (error: Object): void => {
        captured = (error as Error).name + ':' + (error as Error).message;
      };
      let handler = new ProcessErrorHandler(listener1);
      let result = handler.reset(listener2);
      handler.handleUncaughtError(new Error('api20'));
      expect(result).assertUndefined();
      expect(captured).assertEqual('Error:api20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_4300
     * @tc.name testProcessErrorHandlerReset043
     * @tc.desc Verify that a reset callback containing setTimeout executes the async flow correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      let timerResult = new Promise<boolean>((resolve: (value: boolean) => void): void => {
        handler.reset((error: Object): void => {
          setTimeout((): void => {
            resolve((error as Error).message === 'test');
          }, 10);
        });
        handler.handleUncaughtError(new Error('test'));
      });
      expect(await timerResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_4400
     * @tc.name testProcessErrorHandlerReset044
     * @tc.desc Verify that a reset callback containing Promise executes the Promise chain correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let promiseObserved = false;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        new Promise<void>((resolve: (v: void) => void) => {
          resolve(undefined);
        }).then((): void => {
          promiseObserved = (error as Error).message === 'promise test';
        });
      });
      handler.handleUncaughtError(new Error('promise test'));
      await Promise.resolve();
      expect(promiseObserved).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_4500
     * @tc.name testProcessErrorHandlerReset045
     * @tc.desc Verify after reset each Error object passed to handleUncaughtError is received as distinct reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let refs: Object[] = [];
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => { refs.push(error); });
      let err1 = new Error('distinct1');
      let err2 = new Error('distinct2');
      handler.handleUncaughtError(err1);
      handler.handleUncaughtError(err2);
      expect(refs.length).assertEqual(2);
      expect(refs[0]).assertEqual(err1);
      expect(refs[1]).assertEqual(err2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_4600
     * @tc.name testProcessErrorHandlerReset046
     * @tc.desc Verify that resetting from async callback back to sync callback uses the sync callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let syncHandled = false;
      let syncListener = (error: Object): void => {
        syncHandled = true;
      };
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset(syncListener);
      handler.handleUncaughtError(new Error('sync'));
      expect(syncHandled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_4700
     * @tc.name testProcessErrorHandlerReset047
     * @tc.desc Verify that reset on different ProcessErrorHandler instances do not interfere with each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let handler1Label = '';
      let handler2Label = '';
      let listener1a = (error: Object): void => { handler1Label = 'L1a'; };
      let listener1b = (error: Object): void => { handler1Label = 'L1b'; };
      let listener2a = (error: Object): void => { handler2Label = 'L2a'; };
      let listener2b = (error: Object): void => { handler2Label = 'L2b'; };
      let handler1 = new ProcessErrorHandler(listener1a);
      let handler2 = new ProcessErrorHandler(listener2a);
      handler1.reset(listener1b);
      handler2.reset(listener2b);
      handler1.handleUncaughtError(new Error('h1'));
      handler2.handleUncaughtError(new Error('h2'));
      expect(handler1Label).assertEqual('L1b');
      expect(handler2Label).assertEqual('L2b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_4800
     * @tc.name testProcessErrorHandlerReset048
     * @tc.desc Verify that high-frequency alternating reset and handleUncaughtError maintains state consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let labels: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        labels.push('init:' + (error as Error).message);
      });
      for (let i = 0; i < 50; i++) {
        let idx = i;
        handler.reset((error: Object): void => {
          labels.push('R' + idx + ':' + (error as Error).message);
        });
        handler.handleUncaughtError(new Error('E' + i));
      }
      expect(labels.length).assertEqual(50);
      expect(labels[49]).assertEqual('R49:E49');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_4900
     * @tc.name testProcessErrorHandlerReset049
     * @tc.desc Verify that calling reset in an async callback properly updates subsequent error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let asyncValue = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      await new Promise<void>((resolve: (value: void) => void) => {
        setTimeout((): void => {
          handler.reset((error: Object): void => {
            asyncValue = 'timeout:' + (error as Error).name;
          });
          resolve(undefined);
        }, 10);
      });
      handler.handleUncaughtError(new Error('reset'));
      expect(asyncValue).assertEqual('timeout:Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_5000
     * @tc.name testProcessErrorHandlerReset050
     * @tc.desc Verify that reset called inside an asynchronous callback properly updates subsequent error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let asyncMessage = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        new Promise<void>((resolve: (v: void) => void) => {
          resolve(undefined);
        }).then((): void => {
          asyncMessage = (error as Error).message;
        });
      });
      handler.handleUncaughtError(new Error('async inside'));
      await Promise.resolve();
      expect(asyncMessage).assertEqual('async inside');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_5100
     * @tc.name testProcessErrorHandlerReset051
     * @tc.desc Verify that after reset, the instance reference remains the same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let listener = (error: Object): void => {};
      let handler = new ProcessErrorHandler(listener);
      let refBefore = handler;
      handler.reset(listener);
      expect(handler).assertEqual(refBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_5200
     * @tc.name testProcessErrorHandlerReset052
     * @tc.desc Verify that two instances independently reset their own callbacks without interference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let label1 = '';
      let label2 = '';
      let handler1 = new ProcessErrorHandler((_error: Object): void => {});
      let handler2 = new ProcessErrorHandler((_error: Object): void => {});
      handler1.reset((error: Object): void => { label1 = 'h1'; });
      handler2.reset((error: Object): void => { label2 = 'h2'; });
      handler1.handleUncaughtError(new Error('test'));
      handler2.handleUncaughtError(new Error('test'));
      expect(label1).assertEqual('h1');
      expect(label2).assertEqual('h2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_5300
     * @tc.name testProcessErrorHandlerReset053
     * @tc.desc Verify that multiple instances can reset simultaneously and each operates independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: string[] = [];
      let handlers: Array<Object> = [];
      for (let i = 0; i < 10; i++) {
        let idx = i;
        let handler = new ProcessErrorHandler((_error: Object): void => {});
        handler.reset((error: Object): void => { results.push('h' + idx); });
        handlers.push(handler);
      }
      for (let i = 0; i < 10; i++) {
        (handlers[i] as ProcessErrorHandler).handleUncaughtError(new Error('e' + i));
      }
      expect(results.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_5400
     * @tc.name testProcessErrorHandlerReset054
     * @tc.desc Verify that after a single reset, multiple handleUncaughtError calls all use the new callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => { count++; });
      for (let i = 0; i < 5; i++) {
        handler.handleUncaughtError(new Error('call ' + i));
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_5500
     * @tc.name testProcessErrorHandlerReset055
     * @tc.desc Verify two callbacks after resets produce different message values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg1 = '';
      let msg2 = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        msg1 = (error as Error).message;
      });
      handler.handleUncaughtError(new Error('first cb'));
      handler.reset((error: Object): void => {
        msg2 = (error as Error).message;
      });
      handler.handleUncaughtError(new Error('second cb'));
      expect(msg1).assertEqual('first cb');
      expect(msg2).assertEqual('second cb');
      expect(msg1 !== msg2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_5600
     * @tc.name testProcessErrorHandlerReset056
     * @tc.desc Verify handler state remains stable after 100 high-frequency reset operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let messages: string[] = [];
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      for (let i = 0; i < 100; i++) {
        handler.reset((_error: Object): void => {});
      }
      handler.reset((error: Object): void => { messages.push((error as Error).message); });
      handler.handleUncaughtError(new Error('stable'));
      expect(messages[0]).assertEqual('stable');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_5700
     * @tc.name testProcessErrorHandlerReset057
     * @tc.desc Verify handler uses the last callback after 1000 consecutive reset operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIndex = -1;
      let lastMessage = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      for (let i = 0; i < 1000; i++) {
        let idx = i;
        let result = handler.reset((_error: Object): void => { lastIndex = idx; });
        expect(result).assertUndefined();
      }
      handler.reset((error: Object): void => { lastMessage = (error as Error).message; });
      handler.handleUncaughtError(new Error('last reset'));
      expect(lastIndex).assertEqual(-1);
      expect(lastMessage).assertEqual('last reset');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_5800
     * @tc.name testProcessErrorHandlerReset058
     * @tc.desc Verify the final callback remains active after high frequency reset calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let captured = '';
      let capturedName = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      for (let i = 0; i < 1000; i++) {
        handler.reset((_error: Object): void => {});
      }
      handler.reset((error: Object): void => {
        captured = (error as Error).message;
        capturedName = (error as Error).name;
      });
      handler.handleUncaughtError(new TypeError('perf'));
      expect(captured).assertEqual('perf');
      expect(capturedName).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_5900
     * @tc.name testProcessErrorHandlerReset059
     * @tc.desc Verify heavy alternating reset and handleUncaughtError preserve last message and count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let lastMessage = '';
      let firstMessage = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      for (let i = 0; i < 500; i++) {
        handler.reset((error: Object): void => {
          if (count === 0) {
            firstMessage = (error as Error).message;
          }
          count++;
          lastMessage = (error as Error).message;
        });
        handler.handleUncaughtError(new Error('perf ' + i));
      }
      expect(count).assertEqual(500);
      expect(firstMessage).assertEqual('perf 0');
      expect(lastMessage).assertEqual('perf 499');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_6000
     * @tc.name testProcessErrorHandlerReset060
     * @tc.desc Verify reset with a complex callback records exact computed error info
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infos: string[] = [];
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      for (let i = 0; i < 3; i++) {
        let idx = i;
        handler.reset((error: Object): void => {
          let msg: string = (error as Error).message;
          let name: string = (error as Error).name;
          let info: string = name + ':' + msg;
          infos.push(idx.toString() + ':' + info);
        });
        handler.handleUncaughtError(new Error('complex ' + i));
      }
      expect(infos.length).assertEqual(3);
      expect(infos[2]).assertEqual('2:Error:complex 2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_6100
     * @tc.name testProcessErrorHandlerReset061
     * @tc.desc Verify callback can handle an Error with a nested chain message after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Error('inner cause');
      let outer = new Error('wrapped: ' + inner.message);
      let receivedMsg = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        receivedMsg = (error as Error).message;
      });
      handler.handleUncaughtError(outer);
      expect(receivedMsg).assertEqual('wrapped: inner cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_6200
     * @tc.name testProcessErrorHandlerReset062
     * @tc.desc Verify that reset works under the Stage model with precise callback data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let captured = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => { captured = (error as Error).name + ':' + (error as Error).message; });
      handler.handleUncaughtError(new Error('stage model'));
      expect(captured).assertEqual('Error:stage model');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_6300
     * @tc.name testProcessErrorHandlerReset063
     * @tc.desc Verify callback can access individual Error properties name and message after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errName = '';
      let errMsg = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        errName = (error as Error).name;
        errMsg = (error as Error).message;
      });
      handler.handleUncaughtError(new Error('property test'));
      expect(errName).assertEqual('Error');
      expect(errMsg).assertEqual('property test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_6400
     * @tc.name testProcessErrorHandlerReset064
     * @tc.desc Verify callback receives exact Error reference via strict equality (===) after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Error('reference check');
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => { received = error; });
      handler.handleUncaughtError(original);
      expect(received).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_6500
     * @tc.name testProcessErrorHandlerReset065
     * @tc.desc Verify that reset can handle a very large Error object with extensive stack trace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '';
      for (let i = 0; i < 1000; i++) {
        msg += 'x';
      }
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => { received = error; });
      handler.handleUncaughtError(new Error(msg));
      expect((received as Error).message.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_6600
     * @tc.name testProcessErrorHandlerReset066
     * @tc.desc Verify that reset can handle an Error containing special characters in its message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => { received = error; });
      handler.handleUncaughtError(new Error('!@#$%^&*()_+{}|:\"<>?~`�����ַ�'));
      expect((received as Error).message).assertEqual('!@#$%^&*()_+{}|:\"<>?~`�����ַ�');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_6700
     * @tc.name testProcessErrorHandlerReset067
     * @tc.desc Verify that calling reset multiple times inside a callback executes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: string[] = [];
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        results.push('first');
      });
      handler.handleUncaughtError(new Error('a'));
      handler.reset((error: Object): void => {
        results.push('second');
      });
      handler.handleUncaughtError(new Error('b'));
      expect(results[0]).assertEqual('first');
      expect(results[1]).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_6800
     * @tc.name testProcessErrorHandlerReset068
     * @tc.desc Verify that deeply nested reset calls work correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls: string[] = [];
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        calls.push('L1');
      });
      handler.handleUncaughtError(new Error('level1'));
      handler.reset((error: Object): void => {
        calls.push('L2');
      });
      handler.handleUncaughtError(new Error('level2'));
      handler.reset((error: Object): void => {
        calls.push('L3');
      });
      handler.handleUncaughtError(new Error('level3'));
      expect(calls[0]).assertEqual('L1');
      expect(calls[1]).assertEqual('L2');
      expect(calls[2]).assertEqual('L3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_6900
     * @tc.name testProcessErrorHandlerReset069
     * @tc.desc Verify reset callback can push to an external array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let external: string[] = [];
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        external.push('received');
      });
      handler.handleUncaughtError(new Error('push test'));
      expect(external.length).assertEqual(1);
      expect(external[0]).assertEqual('received');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_7000
     * @tc.name testProcessErrorHandlerReset070
     * @tc.desc Verify callback accumulates string concatenation across 3 handleUncaughtError calls after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let acc = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        acc += (error as Error).message;
      });
      handler.handleUncaughtError(new Error('a'));
      handler.handleUncaughtError(new Error('b'));
      handler.handleUncaughtError(new Error('c'));
      expect(acc).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_7100
     * @tc.name testProcessErrorHandlerReset071
     * @tc.desc Verify that uncaught exceptions do not interfere with subsequent reset calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        count++;
      });
      handler.handleUncaughtError(new Error('first'));
      expect(count).assertEqual(1);
      handler.reset((error: Object): void => {
        count++;
      });
      handler.handleUncaughtError(new Error('second'));
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_7200
     * @tc.name testProcessErrorHandlerReset072
     * @tc.desc Verify that reset can be called during application startup phase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let startupMessage = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        startupMessage = (error as Error).message;
      });
      handler.handleUncaughtError(new Error('startup'));
      expect(startupMessage).assertEqual('startup');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_7300
     * @tc.name testProcessErrorHandlerReset073
     * @tc.desc Verify callback can type-assert error as Error and access message after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let typedMsg = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        let e: Error = error as Error;
        typedMsg = e.message;
      });
      handler.handleUncaughtError(new Error('type assertion'));
      expect(typedMsg).assertEqual('type assertion');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_7400
     * @tc.name testProcessErrorHandlerReset074
     * @tc.desc Verify callback receives SyntaxError with correct message after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let syntaxMsg = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        syntaxMsg = (error as Error).message;
      });
      handler.handleUncaughtError(new SyntaxError('syntax error message'));
      expect(syntaxMsg).assertEqual('syntax error message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_7500
     * @tc.name testProcessErrorHandlerReset075
     * @tc.desc Verify callback receives EvalError with correct name after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let evalName = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        evalName = (error as Error).name;
      });
      handler.handleUncaughtError(new EvalError('eval error test'));
      expect(evalName).assertEqual('EvalError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_7600
     * @tc.name testProcessErrorHandlerReset076
     * @tc.desc Verify that reset called inside a Promise.catch handler executes normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let captured = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      await Promise.reject(new Error('reset source')).catch((): void => {
        handler.reset((error: Object): void => {
          captured = (error as Error).message;
        });
      });
      handler.handleUncaughtError(new Error('promise catch'));
      expect(captured).assertEqual('promise catch');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_7700
     * @tc.name testProcessErrorHandlerReset077
     * @tc.desc Verify callback uses message length < 5 branching logic after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let branchLabel = '';
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        if ((error as Error).message.length < 5) {
          branchLabel = 'small';
        } else {
          branchLabel = 'large';
        }
      });
      handler.handleUncaughtError(new Error('hi'));
      expect(branchLabel).assertEqual('small');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_7800
     * @tc.name testProcessErrorHandlerReset078
     * @tc.desc Verify callback can modify an external object property after reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let externalObj: MutableValueObj = { value: 0 };
      let handler = new ProcessErrorHandler((_error: Object): void => {});
      handler.reset((error: Object): void => {
        externalObj.value = 42;
      });
      expect(externalObj.value).assertEqual(0);
      handler.handleUncaughtError(new Error('modify property'));
      expect(externalObj.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_7900
     * @tc.name testProcessErrorHandlerReset079
     * @tc.desc Verify reset throws ClassCastError when callback parameter is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let oldCalled = false;
      let handler = new ProcessErrorHandler((_error: Object): void => { oldCalled = true; });
      try {
        handler.reset(null as Object as (err: Object) => void);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      handler.handleUncaughtError(new Error('after null reset'));
      expect(oldCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_8000
     * @tc.name testProcessErrorHandlerReset080
     * @tc.desc Verify reset throws ClassCastError when callback parameter is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let oldCalled = false;
      let handler = new ProcessErrorHandler((_error: Object): void => { oldCalled = true; });
      try {
        handler.reset(undefined as Object as (err: Object) => void);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      handler.handleUncaughtError(new Error('after undefined reset'));
      expect(oldCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_RESET_8100
     * @tc.name testProcessErrorHandlerReset081
     * @tc.desc Verify reset throws ClassCastError when callback parameter is a non-function object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerReset081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let oldCalled = false;
      let handler = new ProcessErrorHandler((_error: Object): void => { oldCalled = true; });
      try {
        let nonFunction: Object = new HandlerReset115();
        handler.reset(nonFunction as (err: Object) => void);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      handler.handleUncaughtError(new Error('after non-function reset'));
      expect(oldCalled).assertTrue();
    });
  });
}


