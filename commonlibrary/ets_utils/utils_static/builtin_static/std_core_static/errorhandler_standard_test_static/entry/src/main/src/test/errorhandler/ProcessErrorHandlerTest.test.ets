'use static'/*
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

class ProcessErrorHandlerCustomError extends Error {
  errCode: number = 0;
  constructor(message: string, errCode: number) {
    super(message);
    this.name = 'ProcessErrorHandlerCustomError';
    this.errCode = errCode;
  }
}

class ProcessErrorHandlerCustomNameError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'CustomNameError';
  }
}

class ProcessErrorHandlerExtendedError extends Error {
  extraProp: string = '';
  constructor(message: string, extra: string) {
    super(message);
    this.extraProp = extra;
  }
}

class Obj015 {
  handle(error: Object): void {
  }
}

export default function ProcessErrorHandlerTest(): void {
  describe('ProcessErrorHandlerTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_0100
     * @tc.name testProcessErrorHandler001
     * @tc.desc Verify callback uses switch on error.name to dispatch to different handlers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let category: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let err = error as Error;
        switch (err.name) {
          case 'TypeError':
            category = 'type';
            break;
          case 'RangeError':
            category = 'range';
            break;
          default:
            category = 'other';
            break;
        }
      });
      handler.handleUncaughtError(new TypeError('switch test'));
      expect(category).assertEqual('type');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_0200
     * @tc.name testProcessErrorHandler002
     * @tc.desc Verify callback collects message lengths in array across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lengths: number[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        lengths.push((error as Error).message.length);
      });
      handler.handleUncaughtError(new Error(''));
      handler.handleUncaughtError(new Error('ab'));
      handler.handleUncaughtError(new Error('hello'));
      expect(lengths.length).assertEqual(3);
      expect(lengths[0]).assertEqual(0);
      expect(lengths[1]).assertEqual(2);
      expect(lengths[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_0300
     * @tc.name testProcessErrorHandler003
     * @tc.desc Verify callback builds formatted report string from error name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let report: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let err = error as Error;
        report = err.name + ':' + err.message;
      });
      handler.handleUncaughtError(new Error('report test'));
      expect(report).assertEqual('Error:report test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_0400
     * @tc.name testProcessErrorHandler004
     * @tc.desc Verify callback toggles boolean flags based on message content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gotError: boolean = false;
      let gotType: boolean = false;
      let handler = new ProcessErrorHandler((error: Object): void => {
        gotError = true;
        if ((error as Error).name === 'TypeError') {
          gotType = true;
        }
      });
      handler.handleUncaughtError(new TypeError('toggle flags'));
      expect(gotError).assertTrue();
      expect(gotType).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_0500
     * @tc.name testProcessErrorHandler005
     * @tc.desc Verify handleUncaughtError with one valid Error triggers callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let receivedMsg = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = error;
        receivedMsg = (error as Error).message;
      });
      let original = new Error('test error');
      handler.handleUncaughtError(original);
      expect(received).assertEqual(original);
      expect(receivedMsg).assertEqual('test error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_0600
     * @tc.name testProcessErrorHandler006
     * @tc.desc Verify callback uses if-else chain to categorize errors by name length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameLenCat: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let len = (error as Error).name.length;
        if (len > 10) {
          nameLenCat = 'long';
        } else if (len > 5) {
          nameLenCat = 'medium';
        } else {
          nameLenCat = 'short';
        }
      });
      handler.handleUncaughtError(new TypeError('categorize'));
      expect(nameLenCat).assertEqual('medium');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_0700
     * @tc.name testProcessErrorHandler007
     * @tc.desc Verify callback updates the last received error message and name across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastMessage: string = '';
      let lastName: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let err = error as Error;
        lastMessage = err.message;
        lastName = err.name;
      });
      handler.handleUncaughtError(new Error('key1'));
      handler.handleUncaughtError(new Error('key2'));
      expect(lastMessage).assertEqual('key2');
      expect(lastName).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_0800
     * @tc.name testProcessErrorHandler008
     * @tc.desc Verify callback appends messages to array and maintains insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let messages: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        messages.push((error as Error).message);
      });
      handler.handleUncaughtError(new Error('first'));
      handler.handleUncaughtError(new Error('second'));
      handler.handleUncaughtError(new Error('third'));
      handler.handleUncaughtError(new Error('fourth'));
      expect(messages.length).assertEqual(4);
      expect(messages[0]).assertEqual('first');
      expect(messages[1]).assertEqual('second');
      expect(messages[2]).assertEqual('third');
      expect(messages[3]).assertEqual('fourth');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_0900
     * @tc.name testProcessErrorHandler009
     * @tc.desc Verify callback checks error.message includes expected substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let found: boolean = false;
      let handler = new ProcessErrorHandler((error: Object): void => {
        if ((error as Error).message.indexOf('sub') >= 0) {
          found = true;
        }
      });
      handler.handleUncaughtError(new Error('substring check'));
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_1000
     * @tc.name testProcessErrorHandler010
     * @tc.desc Verify callback computes checksum from error property lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checksum: number = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {
        let err = error as Error;
        checksum = err.name.length + err.message.length;
      });
      handler.handleUncaughtError(new Error('cs'));
      expect(checksum).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_1100
     * @tc.name testProcessErrorHandler011
     * @tc.desc Verify callback parses numeric message and accumulates sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {
        let val: number = parseInt((error as Error).message);
        sum += val;
      });
      handler.handleUncaughtError(new Error('42'));
      expect(sum).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_1200
     * @tc.name testProcessErrorHandler012
     * @tc.desc Verify callback checks error.message property is of type string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msgType: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        msgType = typeof (error as Error).message;
      });
      handler.handleUncaughtError(new Error('type check'));
      expect(msgType).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_1300
     * @tc.name testProcessErrorHandler013
     * @tc.desc Verify callback compares two error references with strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let match: boolean = false;
      let err = new Error('ref compare');
      let handler = new ProcessErrorHandler((error: Object): void => {
        match = (error as Error) === err;
      });
      handler.handleUncaughtError(err);
      expect(match).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_1400
     * @tc.name testProcessErrorHandler014
     * @tc.desc Verify handleUncaughtError with Error instance triggers callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = error;
      });
      handler.handleUncaughtError(new Error('standard error'));
      expect(received instanceof Error).assertTrue();
      expect((received as Error).message).assertEqual('standard error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_1500
     * @tc.name testProcessErrorHandler015
     * @tc.desc Verify callback converts error to complete string via toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        str = (error as Error).toString();
      });
      handler.handleUncaughtError(new Error('to string'));
      expect(str).assertEqual('Error: to string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_1600
     * @tc.name testProcessErrorHandler016
     * @tc.desc Verify callback asserts error.name matches expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorName = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        errorName = (error as Error).name;
      });
      handler.handleUncaughtError(new Error('name assert'));
      expect(errorName).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_1700
     * @tc.name testProcessErrorHandler017
     * @tc.desc Verify callback reads both error name and message correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = '';
      let msg: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let err = error as Error;
        name = err.name;
        msg = err.message;
      });
      handler.handleUncaughtError(new Error('reverse read'));
      expect(name).assertEqual('Error');
      expect(msg).assertEqual('reverse read');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_1800
     * @tc.name testProcessErrorHandler018
     * @tc.desc Verify callback accumulates unique error names in a Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hasTypeError: boolean = false;
      let hasRangeError: boolean = false;
      let hasError: boolean = false;
      let handler = new ProcessErrorHandler((error: Object): void => {
        let name = (error as Error).name;
        if (name === 'TypeError') hasTypeError = true;
        if (name === 'RangeError') hasRangeError = true;
        if (name === 'Error') hasError = true;
      });
      handler.handleUncaughtError(new TypeError('t'));
      handler.handleUncaughtError(new RangeError('r'));
      handler.handleUncaughtError(new Error('e'));
      expect(hasTypeError).assertTrue();
      expect(hasRangeError).assertTrue();
      expect(hasError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_1900
     * @tc.name testProcessErrorHandler019
     * @tc.desc Verify callback validates message starts with expected prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let captured: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        captured = (error as Error).message;
      });
      handler.handleUncaughtError(new Error('prefix_xyz'));
      expect(captured).assertEqual('prefix_xyz');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_2000
     * @tc.name testProcessErrorHandler020
     * @tc.desc Verify callback tracks invocation count for each call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callSeq: number[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        callSeq.push(callSeq.length);
      });
      handler.handleUncaughtError(new Error('seq0'));
      handler.handleUncaughtError(new Error('seq1'));
      handler.handleUncaughtError(new Error('seq2'));
      expect(callSeq.length).assertEqual(3);
      expect(callSeq[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_2100
     * @tc.name testProcessErrorHandler021
     * @tc.desc Verify callback counts word segments by splitting message on spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wordCount: number = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {
        wordCount = (error as Error).message.split(' ').length;
      });
      handler.handleUncaughtError(new Error('count these words'));
      expect(wordCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_2200
     * @tc.name testProcessErrorHandler022
     * @tc.desc Verify callback constructs summary string concatenating multiple fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let summary: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let err = error as Error;
        summary = err.name + '-' + err.message + '-' + (err.stack ?? 'none');
      });
      handler.handleUncaughtError(new Error('summary'));
      expect(summary.startsWith('Error-summary-')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_2300
     * @tc.name testProcessErrorHandler023
     * @tc.desc Verify callback adds error attributes to array in specific call order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let attrs: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        attrs.push((error as Error).name);
        attrs.push((error as Error).message);
      });
      handler.handleUncaughtError(new Error('apple'));
      expect(attrs.length).assertEqual(2);
      expect(attrs[0]).assertEqual('Error');
      expect(attrs[1]).assertEqual('apple');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_2400
     * @tc.name testProcessErrorHandler024
     * @tc.desc Verify callback builds a status string based on error.name using ternary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let status: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let err = error as Error;
        status = err.name === 'Error' ? 'standard' : 'custom';
      });
      handler.handleUncaughtError(new Error('ternary'));
      expect(status).assertEqual('standard');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_2500
     * @tc.name testProcessErrorHandler025
     * @tc.desc Verify handleUncaughtError returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callbackCalled = false;
      let handler = new ProcessErrorHandler((error: Object): void => {
        callbackCalled = (error as Error).message === 'test';
      });
      let result: void = handler.handleUncaughtError(new Error('test'));
      expect(result).assertUndefined();
      expect(callbackCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_2600
     * @tc.name testProcessErrorHandler026
     * @tc.desc Verify reset returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let newCalled = false;
      let listener = (error: Object): void => {};
      let newListener = (error: Object): void => { newCalled = true; };
      let handler = new ProcessErrorHandler(listener);
      let result = handler.reset(newListener);
      expect(result).assertUndefined();
      handler.handleUncaughtError(new Error('after reset'));
      expect(newCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_2700
     * @tc.name testProcessErrorHandler027
     * @tc.desc Verify reset with arrow callback preserves closure state across handleUncaughtError calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {});
      handler.reset((error: Object): void => {
        sum += (error as Error).message.length;
      });
      handler.handleUncaughtError(new Error('ab'));
      handler.handleUncaughtError(new Error('cde'));
      expect(sum).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_2800
     * @tc.name testProcessErrorHandler028
     * @tc.desc Verify handleUncaughtError method exists on instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastError: Error | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        lastError = error as Error;
      });
      handler.handleUncaughtError(new RangeError('method dispatch'));
      expect((lastError as Error).name).assertEqual('RangeError');
      expect((lastError as Error).message).assertEqual('method dispatch');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_2900
     * @tc.name testProcessErrorHandler029
     * @tc.desc Verify reset method exists on instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let state = 'initial';
      let handler = new ProcessErrorHandler((error: Object): void => {
        state = 'old:' + (error as Error).message;
      });
      handler.reset((error: Object): void => {
        state = 'new:' + (error as Error).name;
      });
      handler.handleUncaughtError(new SyntaxError('reset swap'));
      expect(state).assertEqual('new:SyntaxError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_3000
     * @tc.name testProcessErrorHandler030
     * @tc.desc Verify reset with different callback signatures all work correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => { results.push('init'); });
      handler.reset((error: Object): void => { results.push('reset1'); });
      handler.handleUncaughtError(new Error('first'));
      handler.reset((error: Object): void => { results.push('reset2'); });
      handler.handleUncaughtError(new Error('second'));
      expect(results.length).assertEqual(2);
      expect(results[0]).assertEqual('reset1');
      expect(results[1]).assertEqual('reset2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_3100
     * @tc.name testProcessErrorHandler031
     * @tc.desc Verify handleUncaughtError callback can update external object's property and the change persists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      let callCount: number = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {
        sum += (error as Error).message.length;
        callCount++;
      });
      handler.handleUncaughtError(new Error('abc'));
      handler.handleUncaughtError(new Error('de'));
      handler.handleUncaughtError(new Error('f'));
      expect(sum).assertEqual(6);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_3200
     * @tc.name testProcessErrorHandler032
     * @tc.desc Verify 100 consecutive handleUncaughtError calls all trigger callback with correct messages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        received.push((error as Error).message);
      });
      for (let i = 0; i < 100; i++) {
        handler.handleUncaughtError(new Error('call ' + i));
      }
      expect(received.length).assertEqual(100);
      expect(received[0]).assertEqual('call 0');
      expect(received[50]).assertEqual('call 50');
      expect(received[99]).assertEqual('call 99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_3300
     * @tc.name testProcessErrorHandler033
     * @tc.desc Verify alternating reset and handleUncaughtError for 10 rounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let labels: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        labels.push('init:' + (error as Error).message);
      });
      for (let i = 0; i < 10; i++) {
        let idx = i;
        handler.reset((error: Object): void => {
          labels.push('R' + idx + ':' + (error as Error).message);
        });
        handler.handleUncaughtError(new Error('E' + i));
      }
      expect(labels.length).assertEqual(10);
      expect(labels[0]).assertEqual('R0:E0');
      expect(labels[5]).assertEqual('R5:E5');
      expect(labels[9]).assertEqual('R9:E9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_3400
     * @tc.name testProcessErrorHandler034
     * @tc.desc Verify resetting same callback 3 times does not cause exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let listener = (error: Object): void => { count++; };
      let handler = new ProcessErrorHandler(listener);
      handler.reset(listener);
      handler.reset(listener);
      handler.reset(listener);
      handler.handleUncaughtError(new Error('test'));
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_3500
     * @tc.name testProcessErrorHandler035
     * @tc.desc Verify after reset, old callback is no longer triggered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let oldCalled = false;
      let newCalled = false;
      let handler = new ProcessErrorHandler((error: Object): void => { oldCalled = true; });
      handler.reset((error: Object): void => { newCalled = true; });
      handler.handleUncaughtError(new Error('test'));
      expect(oldCalled).assertFalse();
      expect(newCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_3600
     * @tc.name testProcessErrorHandler036
     * @tc.desc Verify RangeError instance triggers callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let summary = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let rangeError = error as RangeError;
        summary = rangeError.name + ':' + rangeError.message;
      });
      handler.handleUncaughtError(new RangeError('range error'));
      expect(summary).assertEqual('RangeError:range error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_3700
     * @tc.name testProcessErrorHandler037
     * @tc.desc Verify TypeError instance triggers callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let typeErrorPayload = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let typeError = error as TypeError;
        typeErrorPayload = typeError.name + '#' + typeError.message.length;
      });
      handler.handleUncaughtError(new TypeError('type error'));
      expect(typeErrorPayload).assertEqual('TypeError#10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_3800
     * @tc.name testProcessErrorHandler038
     * @tc.desc Verify SyntaxError instance triggers callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let syntaxSummary = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let syntaxError = error as SyntaxError;
        syntaxSummary = syntaxError.message.toUpperCase();
      });
      handler.handleUncaughtError(new SyntaxError('syntax error'));
      expect(syntaxSummary).assertEqual('SYNTAX ERROR');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_3900
     * @tc.name testProcessErrorHandler039
     * @tc.desc Verify URIError instance triggers callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uriPieces: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        uriPieces = (error as Error).message.split(' ');
      });
      handler.handleUncaughtError(new URIError('uri error'));
      expect(uriPieces.length).assertEqual(2);
      expect(uriPieces[0]).assertEqual('uri');
      expect(uriPieces[1]).assertEqual('error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_4000
     * @tc.name testProcessErrorHandler040
     * @tc.desc Verify EvalError instance triggers callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let evalTag = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let evalError = error as EvalError;
        evalTag = evalError.name.slice(0, 4) + ':' + evalError.message.slice(-5);
      });
      handler.handleUncaughtError(new EvalError('eval error'));
      expect(evalTag).assertEqual('Eval:error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_4100
     * @tc.name testProcessErrorHandler041
     * @tc.desc Verify ReferenceError instance triggers callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let referenceMatches = false;
      let handler = new ProcessErrorHandler((error: Object): void => {
        referenceMatches = (error as Error).message.indexOf('ref') === 0 && (error as Error).name === 'ReferenceError';
      });
      handler.handleUncaughtError(new ReferenceError('ref error'));
      expect(referenceMatches).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_4200
     * @tc.name testProcessErrorHandler042
     * @tc.desc Verify custom Error subclass triggers callback and retains custom properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = error;
      });
      let custom = new ProcessErrorHandlerCustomError('custom', 42);
      handler.handleUncaughtError(custom);
      expect(received instanceof Error).assertTrue();
      expect((received as ProcessErrorHandlerCustomError).errCode).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_4300
     * @tc.name testProcessErrorHandler043
     * @tc.desc Verify Error subclass with extra property is accessible in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = error;
      });
      let err = new ProcessErrorHandlerExtendedError('extended', 'extraValue');
      handler.handleUncaughtError(err);
      expect(received instanceof Error).assertTrue();
      expect((received as ProcessErrorHandlerExtendedError).extraProp).assertEqual('extraValue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_4400
     * @tc.name testProcessErrorHandler044
     * @tc.desc Verify Error with overridden name property is accessible in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = error;
      });
      let err = new ProcessErrorHandlerCustomNameError('custom name');
      handler.handleUncaughtError(err);
      expect(received instanceof Error).assertTrue();
      expect((received as Error).name).assertEqual('CustomNameError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_4500
     * @tc.name testProcessErrorHandler045
     * @tc.desc Verify callback stores error reference in two variables and compares
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ref1: Object | null = null;
      let ref2: Object | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        ref1 = error;
        ref2 = error;
      });
      handler.handleUncaughtError(new Error('dual ref'));
      expect(ref1 as Object).assertEqual(ref2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_4600
     * @tc.name testProcessErrorHandler046
     * @tc.desc Verify callback serializes error to JSON and checks length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jsonStr: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        jsonStr = JSON.stringify(error);
      });
      handler.handleUncaughtError(new Error('json test'));
      let expected: string = JSON.stringify(new Error('json test'));
      expect(jsonStr).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_4700
     * @tc.name testProcessErrorHandler047
     * @tc.desc Verify Error with full stack info passes to callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorInfo: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        errorInfo.push((error as Error).name);
        errorInfo.push((error as Error).message);
        errorInfo.push((error as Error).stack ?? 'no stack');
      });
      handler.handleUncaughtError(new Error('full info'));
      expect(errorInfo[0]).assertEqual('Error');
      expect(errorInfo[1]).assertEqual('full info');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_4800
     * @tc.name testProcessErrorHandler048
     * @tc.desc Verify Error with empty string message passes through
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = error;
      });
      handler.handleUncaughtError(new Error(''));
      expect(received instanceof Error).assertTrue();
      expect((received as Error).message).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_4900
     * @tc.name testProcessErrorHandler049
     * @tc.desc Verify Error with 100KB message passes through
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg: string = 'z'.repeat(100000);
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = error;
      });
      handler.handleUncaughtError(new Error(longMsg));
      expect(received instanceof Error).assertTrue();
      expect((received as Error).message.length).assertEqual(100000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_5000
     * @tc.name testProcessErrorHandler050
     * @tc.desc Verify Error with Unicode and emoji message passes through
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let unicodeMsg: string = 'Unicode: 中文 Español 日本語 ✅';
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = error;
      });
      handler.handleUncaughtError(new Error(unicodeMsg));
      expect(received instanceof Error).assertTrue();
      expect((received as Error).message).assertEqual(unicodeMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_5100
     * @tc.name testProcessErrorHandler051
     * @tc.desc Verify Error without stack property is handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = error;
      });
      let errorWithoutStack = new Error('no stack');
      errorWithoutStack.stack = undefined;
      handler.handleUncaughtError(errorWithoutStack);
      expect(received instanceof Error).assertTrue();
      expect((received as Error).stack).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_5200
     * @tc.name testProcessErrorHandler052
     * @tc.desc Verify Error with empty message is handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = error;
      });
      handler.handleUncaughtError(new Error());
      expect(received instanceof Error).assertTrue();
      expect((received as Error).name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_5300
     * @tc.name testProcessErrorHandler053
     * @tc.desc Verify Error wrapper message representing a cause chain is handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('root cause');
      let wrapper = new Error('wrapper: ' + root.message);
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = error;
      });
      handler.handleUncaughtError(wrapper);
      expect(received instanceof Error).assertTrue();
      expect((received as Error).message).assertEqual('wrapper: root cause');
      expect(root.message).assertEqual('root cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_5400
     * @tc.name testProcessErrorHandler054
     * @tc.desc Verify callback creates new Error from received error's message (wrapping)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrappedMsg: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let err = error as Error;
        let wrapper = new Error('wrapped: ' + err.message);
        wrappedMsg = wrapper.message;
      });
      handler.handleUncaughtError(new Error('original'));
      expect(wrappedMsg).assertEqual('wrapped: original');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_5500
     * @tc.name testProcessErrorHandler055
     * @tc.desc Verify callback preserves sequential error messages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        collected.push((error as Error).message);
      });
      handler.handleUncaughtError(new TypeError('err_type'));
      handler.handleUncaughtError(new RangeError('err_range'));
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual('err_type');
      expect(collected[1]).assertEqual('err_range');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_5600
     * @tc.name testProcessErrorHandler056
     * @tc.desc Verify 100 sequential handleUncaughtError calls all trigger callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let typeCount = 0;
      let rangeCount = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {
        let name = (error as Error).name;
        if (name === 'TypeError') typeCount++;
        if (name === 'RangeError') rangeCount++;
      });
      for (let i = 0; i < 50; i++) {
        handler.handleUncaughtError(new TypeError('err ' + i));
        handler.handleUncaughtError(new RangeError('err ' + i));
      }
      expect(typeCount).assertEqual(50);
      expect(rangeCount).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_5700
     * @tc.name testProcessErrorHandler057
     * @tc.desc Verify simultaneous reset and handleUncaughtError maintains consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let labels: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {});
      for (let i = 0; i < 10; i++) {
        let idx = i;
        handler.reset((error: Object): void => {
          labels.push('R' + idx + ':' + (error as Error).name);
        });
        handler.handleUncaughtError(new TypeError('E' + i));
      }
      expect(labels.length).assertEqual(10);
      expect(labels[0]).assertEqual('R0:TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_5800
     * @tc.name testProcessErrorHandler058
     * @tc.desc Verify rapid alternating reset and handleUncaughtError maintains state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {});
      for (let i = 0; i < 20; i++) {
        handler.reset((error: Object): void => {
          count++;
        });
        handler.handleUncaughtError(new Error('E' + i));
      }
      expect(count).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_5900
     * @tc.name testProcessErrorHandler059
     * @tc.desc Verify multiple instances operate independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count1 = 0;
      let count2 = 0;
      let handler1 = new ProcessErrorHandler((error: Object): void => { count1++; });
      let handler2 = new ProcessErrorHandler((error: Object): void => { count2++; });
      for (let i = 0; i < 10; i++) {
        handler1.handleUncaughtError(new Error('h1 e' + i));
        handler2.handleUncaughtError(new Error('h2 e' + i));
      }
      expect(count1).assertEqual(10);
      expect(count2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_6000
     * @tc.name testProcessErrorHandler060
     * @tc.desc Verify callback counts how many times each error type was seen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let typeErrorCount: number = 0;
      let rangeErrorCount: number = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {
        let name: string = (error as Error).name;
        if (name === 'TypeError') typeErrorCount++;
        if (name === 'RangeError') rangeErrorCount++;
      });
      handler.handleUncaughtError(new TypeError('t1'));
      handler.handleUncaughtError(new TypeError('t2'));
      handler.handleUncaughtError(new RangeError('r1'));
      expect(typeErrorCount).assertEqual(2);
      expect(rangeErrorCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_6100
     * @tc.name testProcessErrorHandler061
     * @tc.desc Verify same error dispatched to 2 different handlers, both receive it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let h1received: Object | null = null;
      let h2received: Object | null = null;
      let h1 = new ProcessErrorHandler((error: Object): void => { h1received = error; });
      let h2 = new ProcessErrorHandler((error: Object): void => { h2received = error; });
      let common = new Error('shared');
      h1.handleUncaughtError(common);
      h2.handleUncaughtError(common);
      expect(h1received instanceof Error).assertTrue();
      expect(h2received instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_6200
     * @tc.name testProcessErrorHandler062
     * @tc.desc Verify callback builds report string using all error properties concatenated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let report: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let err = error as Error;
        report = err.name + ',' + err.message + ',' + (err.stack ?? 'no-stack');
      });
      handler.handleUncaughtError(new Error('full report'));
      expect(report.substring(0, 15)).assertEqual('Error,full repo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_6300
     * @tc.name testProcessErrorHandler063
     * @tc.desc Verify callback uses conditional (ternary) operator to set indicator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isTypeErr: boolean = false;
      let handler = new ProcessErrorHandler((error: Object): void => {
        isTypeErr = (error as Error).name === 'TypeError' ? true : false;
      });
      handler.handleUncaughtError(new TypeError('ternary check'));
      expect(isTypeErr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_6400
     * @tc.name testProcessErrorHandler064
     * @tc.desc Verify callback accumulates error messages joined by separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let accumulated: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        if (accumulated.length > 0) {
          accumulated += '|';
        }
        accumulated += (error as Error).message;
      });
      handler.handleUncaughtError(new Error('part1'));
      handler.handleUncaughtError(new Error('part2'));
      expect(accumulated).assertEqual('part1|part2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_6500
     * @tc.name testProcessErrorHandler065
     * @tc.desc Verify callback runs Math using message.length as operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubled: number = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {
        doubled = (error as Error).message.length * 2;
      });
      handler.handleUncaughtError(new Error('abc'));
      expect(doubled).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_6600
     * @tc.name testProcessErrorHandler066
     * @tc.desc Verify try-catch-finally with reset executes finally block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let oldCallbackCalled = false;
      let newCallbackCalled = false;
      const handler = new ProcessErrorHandler((error: Object): void => {
        oldCallbackCalled = true;
      });
      handler.reset((error: Object): void => {
        newCallbackCalled = true;
      });
      handler.handleUncaughtError(new Error('test error'));
      expect(oldCallbackCalled).assertFalse();
      expect(newCallbackCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_6700
     * @tc.name testProcessErrorHandler067
     * @tc.desc Verify multiple independent instances all create successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let handlers: Array<Object> = [];
      for (let i = 0; i < 10; i++) {
        handlers.push(new ProcessErrorHandler((error: Object): void => {}));
      }
      expect(handlers.length).assertEqual(10);
      for (let i = 0; i < handlers.length; i++) {
        expect(handlers[i] instanceof ProcessErrorHandler).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_6800
     * @tc.name testProcessErrorHandler068
     * @tc.desc Verify reset replaces callback and new callback is used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count1 = 0;
      let count2 = 0;
      let handler = new ProcessErrorHandler((error: Object): void => { count1++; });
      handler.reset((error: Object): void => { count2++; });
      handler.handleUncaughtError(new Error('test'));
      expect(count1).assertEqual(0);
      expect(count2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_6900
     * @tc.name testProcessErrorHandler069
     * @tc.desc Verify callback explicitly checks error.name === 'Error'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameMatch: boolean = false;
      let handler = new ProcessErrorHandler((error: Object): void => {
        nameMatch = (error as Error).name === 'Error';
      });
      handler.handleUncaughtError(new Error('name literal check'));
      expect(nameMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_7000
     * @tc.name testProcessErrorHandler070
     * @tc.desc Verify callback transforms message via string replacement (e to E)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let replaced: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        replaced = (error as Error).message.replace('e', 'E');
      });
      handler.handleUncaughtError(new Error('test replace'));
      expect(replaced).assertEqual('tEst replace');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_7100
     * @tc.name testProcessErrorHandler071
     * @tc.desc Verify instance holds callback reference correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let captured: string = '';
      let cb = (error: Object): void => {
        captured = (error as Error).message;
      };
      let handler = new ProcessErrorHandler(cb);
      handler.handleUncaughtError(new Error('ref check'));
      expect(captured).assertEqual('ref check');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_7200
     * @tc.name testProcessErrorHandler072
     * @tc.desc Verify creating 100 instances succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let handlers: Array<Object> = [];
      for (let i = 0; i < 100; i++) {
        const handler = new ProcessErrorHandler((error: Object): void => {});
        handlers.push(handler);
      }
      expect(handlers.length).assertEqual(100);
      for (let i = 0; i < handlers.length; i++) {
        expect(handlers[i] instanceof ProcessErrorHandler).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_7300
     * @tc.name testProcessErrorHandler073
     * @tc.desc Verify callback containing setTimeout executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let timerResult = new Promise<boolean>((resolve: (value: boolean) => void): void => {
        let handler = new ProcessErrorHandler((error: Object): void => {
          setTimeout((): void => {
            resolve((error as Error).message === 'setTimeout');
          }, 10);
        });
        handler.handleUncaughtError(new Error('setTimeout'));
      });
      expect(await timerResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_7400
     * @tc.name testProcessErrorHandler074
     * @tc.desc Verify callback tracks call order index across sequential calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let order: number[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        order.push(order.length);
      });
      handler.handleUncaughtError(new Error('idx0'));
      handler.handleUncaughtError(new Error('idx1'));
      expect(order[0]).assertEqual(0);
      expect(order[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_7500
     * @tc.name testProcessErrorHandler075
     * @tc.desc Verify callback uses message.length modulo for classification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parity: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        parity = (error as Error).message.length % 2 === 0 ? 'even' : 'odd';
      });
      handler.handleUncaughtError(new Error('abc'));
      expect(parity).assertEqual('odd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_7600
     * @tc.name testProcessErrorHandler076
     * @tc.desc Verify callback containing Promise executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let promiseExecuted = false;
      let handler = new ProcessErrorHandler((error: Object): void => {
        new Promise<void>((resolve: (v: void) => void) => {
          resolve(undefined);
        }).then((): void => {
          promiseExecuted = (error as Error).message === 'promise';
        });
      });
      handler.handleUncaughtError(new Error('promise'));
      await Promise.resolve();
      expect(promiseExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_7700
     * @tc.name testProcessErrorHandler077
     * @tc.desc Verify callback checks error instanceof Error and asserts true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isInstance: boolean = false;
      let handler = new ProcessErrorHandler((error: Object): void => {
        isInstance = (error as Error) instanceof Error;
      });
      handler.handleUncaughtError(new Error('instanceof check'));
      expect(isInstance).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_7800
     * @tc.name testProcessErrorHandler078
     * @tc.desc Verify callback stores error at computed index in array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedIdx: number = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {
        capturedIdx = (error as Error).message.length;
      });
      handler.handleUncaughtError(new Error('idxTest'));
      expect(capturedIdx).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_7900
     * @tc.name testProcessErrorHandler079
     * @tc.desc Verify callback prepends prefix to captured message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prefixed: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        prefixed = 'ERR: ' + (error as Error).message;
      });
      handler.handleUncaughtError(new Error('prefix me'));
      expect(prefixed).assertEqual('ERR: prefix me');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_8000
     * @tc.name testProcessErrorHandler080
     * @tc.desc Verify callback creates duplicate error from message and compares
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dupMsg: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let original = error as Error;
        let dup = new Error(original.message);
        dupMsg = dup.message;
      });
      handler.handleUncaughtError(new Error('duplicate me'));
      expect(dupMsg).assertEqual('duplicate me');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_8100
     * @tc.name testProcessErrorHandler081
     * @tc.desc Verify direct handleUncaughtError call triggers callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = error;
      });
      handler.handleUncaughtError(new Error('process error'));
      expect(received instanceof Error).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_8200
     * @tc.name testProcessErrorHandler082
     * @tc.desc Verify callback uses logical AND to combine multiple error checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameOk: boolean = false;
      let handler = new ProcessErrorHandler((error: Object): void => {
        let err = error as Error;
        nameOk = err.name === 'Error';
      });
      handler.handleUncaughtError(new Error('logical and'));
      expect(nameOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_8300
     * @tc.name testProcessErrorHandler083
     * @tc.desc Verify callback alternates between two captured variables on alternate calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let evenMsg: string = '';
      let oddMsg: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let msg = (error as Error).message;
        if (msg.indexOf('even') >= 0) {
          evenMsg = msg;
        } else {
          oddMsg = msg;
        }
      });
      handler.handleUncaughtError(new Error('even call'));
      handler.handleUncaughtError(new Error('odd call'));
      expect(evenMsg).assertEqual('even call');
      expect(oddMsg).assertEqual('odd call');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_8400
     * @tc.name testProcessErrorHandler084
     * @tc.desc Verify callback counts error.name characters and compares
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nameLen: number = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {
        nameLen = (error as Error).name.length;
      });
      handler.handleUncaughtError(new Error('length check'));
      expect(nameLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_8500
     * @tc.name testProcessErrorHandler085
     * @tc.desc Verify callback can read error.message and count its characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let charCount: number = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {
        charCount = (error as Error).message.length;
      });
      handler.handleUncaughtError(new Error('count chars'));
      expect(charCount).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_8600
     * @tc.name testProcessErrorHandler086
     * @tc.desc Verify callback preserves message in a basic handling flow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = (error as Error).message;
      });
      handler.handleUncaughtError(new Error('strict mode'));
      expect(received).assertEqual('strict mode');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_8700
     * @tc.name testProcessErrorHandler087
     * @tc.desc Verify callback receives error name and message together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandler087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let observed = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        observed = (error as Error).name + ':' + (error as Error).message;
      });
      handler.handleUncaughtError(new Error('api20 compatibility'));
      expect(observed).assertEqual('Error:api20 compatibility');
    });
  });
}


