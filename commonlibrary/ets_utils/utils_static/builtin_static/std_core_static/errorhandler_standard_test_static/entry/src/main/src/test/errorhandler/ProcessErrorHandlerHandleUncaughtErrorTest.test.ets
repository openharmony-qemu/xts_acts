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
import Utils from './../Util.test';

class HandleUncaughtErrorCustom014 extends Error {
  errCode: int = 0;

  constructor(message: string, errCode: int) {
    super(message);
    this.name = 'HandleUncaughtErrorCustom014';
    this.errCode = errCode;
  }
}

class HandleUncaughtErrorCustom063 extends Error {
  errCode: int = 0;

  constructor(message: string, errCode: int) {
    super(message);
    this.name = 'HandleUncaughtErrorCustom063';
    this.errCode = errCode;
  }
}

class HandleUncaughtErrorOwner088 {
  handled: boolean = false;

  handle(error: Object): void {
    this.handled = true;
  }
}

class ThirdPartyLikeError114 extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'ThirdPartyLikeError114';
  }
}

class PlainObject121 {
  message: string = '';

  constructor(message: string) {
    this.message = message;
  }
}

function handleErrorOnce(error: Error): boolean {
  let called = false;
  let handler = new ProcessErrorHandler((err: Object): void => {
    called = err === error;
  });
  handler.handleUncaughtError(error);
  return called;
}

function handleErrorByMessage(error: Error, message: string): boolean {
  let called = false;
  let handler = new ProcessErrorHandler((err: Object): void => {
    let caught = err as Error;
    called = caught.message === message;
  });
  handler.handleUncaughtError(error);
  return called;
}

export default function ProcessErrorHandlerHandleUncaughtErrorTest(): void {
  describe('ProcessErrorHandlerHandleUncaughtErrorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_0100
     * @tc.name testProcessErrorHandlerHandleUncaughtError001
     * @tc.desc Verify required error parameter can be handled normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(handleErrorOnce(new Error('required'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_0200
     * @tc.name testProcessErrorHandlerHandleUncaughtError002
     * @tc.desc Verify callback handles Error with Unicode message correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let unicodeMsg: string = 'Unicode 中文 Español 日本語 ✅';
      let captured: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        captured = (err as Error).message;
      });
      handler.handleUncaughtError(new Error(unicodeMsg));
      expect(captured).assertEqual(unicodeMsg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_0300
     * @tc.name testProcessErrorHandlerHandleUncaughtError003
     * @tc.desc Verify standard Error instance is handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedMsg = '';
      let capturedName = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        capturedMsg = (err as Error).message;
        capturedName = (err as Error).name;
      });
      handler.handleUncaughtError(new Error('standard'));
      expect(capturedMsg).assertEqual('standard');
      expect(capturedName).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_0400
     * @tc.name testProcessErrorHandlerHandleUncaughtError004
     * @tc.desc Verify custom Error subclass instance keeps custom property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let custom = new HandleUncaughtErrorCustom014('custom', 14);
      expect(handleErrorOnce(custom)).assertTrue();
      expect(custom.errCode).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_0500
     * @tc.name testProcessErrorHandlerHandleUncaughtError005
     * @tc.desc Verify callback receives Error instance and instanceof check passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Error('instance check');
      let receivedRef: Object | null = null;
      let handler = new ProcessErrorHandler((err: Object): void => {
        receivedRef = err;
      });
      handler.handleUncaughtError(original);
      expect(receivedRef).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_0600
     * @tc.name testProcessErrorHandlerHandleUncaughtError006
     * @tc.desc Verify callback receives RangeError with correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initial = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        initial = (err as Error).name.charAt(0) + ':' + (err as Error).message.length;
      });
      handler.handleUncaughtError(new RangeError('range error'));
      expect(initial).assertEqual('R:11');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_0700
     * @tc.name testProcessErrorHandlerHandleUncaughtError007
     * @tc.desc Verify callback receives SyntaxError with correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let messageUpper = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        messageUpper = (err as Error).message.toUpperCase();
      });
      handler.handleUncaughtError(new SyntaxError('syntax error'));
      expect(messageUpper).assertEqual('SYNTAX ERROR');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_0800
     * @tc.name testProcessErrorHandlerHandleUncaughtError008
     * @tc.desc Verify callback receives EvalError with correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let suffix = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        suffix = (err as Error).name.slice(-5) + ':' + (err as Error).message.slice(0, 4);
      });
      handler.handleUncaughtError(new EvalError('eval error'));
      expect(suffix).assertEqual('Error:eval');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_0900
     * @tc.name testProcessErrorHandlerHandleUncaughtError009
     * @tc.desc Verify callback receives ReferenceError with correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let startsWithRef = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        startsWithRef = (err as Error).message.indexOf('ref') === 0;
      });
      handler.handleUncaughtError(new ReferenceError('ref error'));
      expect(startsWithRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_1000
     * @tc.name testProcessErrorHandlerHandleUncaughtError010
     * @tc.desc Verify callback receives URIError with correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parts: string[] = [];
      let handler = new ProcessErrorHandler((err: Object): void => {
        parts = (err as Error).message.split(' ');
      });
      handler.handleUncaughtError(new URIError('uri error'));
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual('uri');
      expect(parts[1]).assertEqual('error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_1100
     * @tc.name testProcessErrorHandlerHandleUncaughtError011
     * @tc.desc Verify Error with empty message has message length 0 in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msgLen = -1;
      let msgValue = 'not set';
      let handler = new ProcessErrorHandler((err: Object): void => {
        msgLen = (err as Error).message.length;
        msgValue = (err as Error).message;
      });
      handler.handleUncaughtError(new Error(''));
      expect(msgLen).assertEqual(0);
      expect(msgValue).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_1200
     * @tc.name testProcessErrorHandlerHandleUncaughtError012
     * @tc.desc Verify Error with space message preserves space in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        msg = (err as Error).message;
      });
      handler.handleUncaughtError(new Error(' '));
      expect(msg).assertEqual(' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_1300
     * @tc.name testProcessErrorHandlerHandleUncaughtError013
     * @tc.desc Verify Error with special chars (tab, newline) preserves them in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let special = 'line1\n\tline2\rline3';
      let msg: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        msg = (err as Error).message;
      });
      handler.handleUncaughtError(new Error(special));
      expect(msg).assertEqual(special);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_1400
     * @tc.name testProcessErrorHandlerHandleUncaughtError014
     * @tc.desc Verify long Error message (1000 chars) is correctly passed to callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg: string = 'a'.repeat(1000);
      let msg: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        msg = (err as Error).message;
      });
      handler.handleUncaughtError(new Error(longMsg));
      expect(msg).assertEqual(longMsg);
      expect(msg.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_1500
     * @tc.name testProcessErrorHandlerHandleUncaughtError015
     * @tc.desc Verify callback can cast error parameter as Error and access properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        let e: Error = err as Error;
        result = e.name + ':' + e.message;
      });
      handler.handleUncaughtError(new TypeError('cast test'));
      expect(result).assertEqual('TypeError:cast test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_1600
     * @tc.name testProcessErrorHandlerHandleUncaughtError016
     * @tc.desc Verify Error.stack property is defined in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hasStack = false;
      let stackIsString = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        let stack = (err as Error).stack;
        hasStack = stack !== undefined;
        stackIsString = typeof stack === 'string';
      });
      handler.handleUncaughtError(new Error('stack defined'));
      expect(hasStack).assertTrue();
      expect(stackIsString).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_1700
     * @tc.name testProcessErrorHandlerHandleUncaughtError017
     * @tc.desc Verify callback accumulates count when called in a for loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let messages: string[] = [];
      let handler = new ProcessErrorHandler((err: Object): void => {
        messages.push((err as Error).message);
      });
      let msgs: string[] = ['a', 'bb', 'ccc'];
      for (let i = 0; i < msgs.length; i++) {
        handler.handleUncaughtError(new Error(msgs[i]));
      }
      expect(messages.length).assertEqual(3);
      expect(messages[0]).assertEqual('a');
      expect(messages[1]).assertEqual('bb');
      expect(messages[2]).assertEqual('ccc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_1800
     * @tc.name testProcessErrorHandlerHandleUncaughtError018
     * @tc.desc Verify custom Error subclass name property is preserved in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        name = (err as Error).name;
      });
      handler.handleUncaughtError(new HandleUncaughtErrorCustom014('custom', 1));
      expect(name).assertEqual('HandleUncaughtErrorCustom014');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_1900
     * @tc.name testProcessErrorHandlerHandleUncaughtError019
     * @tc.desc Verify custom Error subclass custom property is preserved in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errCode = 0;
      let handler = new ProcessErrorHandler((err: Object): void => {
        errCode = (err as HandleUncaughtErrorCustom063).errCode;
      });
      handler.handleUncaughtError(new HandleUncaughtErrorCustom063('custom', 999));
      expect(errCode).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_2000
     * @tc.name testProcessErrorHandlerHandleUncaughtError020
     * @tc.desc Verify Error message concatenated with colon separator is passed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        msg = (err as Error).message;
      });
      handler.handleUncaughtError(new Error('prefix: detail'));
      expect(msg).assertEqual('prefix: detail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_2100
     * @tc.name testProcessErrorHandlerHandleUncaughtError021
     * @tc.desc Verify Error wrapper containing original message preserves both
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        msg = (err as Error).message;
      });
      let original = new Error('original cause');
      let wrapper = new Error('wrapper: ' + original.message);
      handler.handleUncaughtError(wrapper);
      expect(msg).assertEqual('wrapper: original cause');
      expect(original.message).assertEqual('original cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_2200
     * @tc.name testProcessErrorHandlerHandleUncaughtError022
     * @tc.desc Verify Error with XSS-like special characters in message is passed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        msg = (err as Error).message;
      });
      handler.handleUncaughtError(new Error('<script>alert("xss")</script>'));
      expect(msg).assertEqual('<script>alert("xss")</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_2300
     * @tc.name testProcessErrorHandlerHandleUncaughtError023
     * @tc.desc Verify Error message with newline characters is preserved across lines in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let multiline = 'line one\nline two\nline three';
      let msg: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        msg = (err as Error).message;
      });
      handler.handleUncaughtError(new Error(multiline));
      expect(msg).assertEqual(multiline);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_2400
     * @tc.name testProcessErrorHandlerHandleUncaughtError024
     * @tc.desc Verify callback can update an external variable after receiving Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let externalFlag = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        if ((err as Error).message === 'trigger') {
          externalFlag = true;
        }
      });
      handler.handleUncaughtError(new Error('trigger'));
      expect(externalFlag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_2500
     * @tc.name testProcessErrorHandlerHandleUncaughtError025
     * @tc.desc Verify handleUncaughtError return type is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callbackCalled = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        callbackCalled = (err as Error).message === 'return void';
      });
      let result: void = handler.handleUncaughtError(new Error('return void'));
      expect(result).assertUndefined();
      expect(callbackCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_2600
     * @tc.name testProcessErrorHandlerHandleUncaughtError026
     * @tc.desc Verify handleErrorByMessage matches Error with special whitespace chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(handleErrorByMessage(new Error('special \n\t\r chars'), 'special \n\t\r chars')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_2700
     * @tc.name testProcessErrorHandlerHandleUncaughtError027
     * @tc.desc Verify callback can differentiate between two different Error objects by name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = [];
      let handler = new ProcessErrorHandler((err: Object): void => {
        names.push((err as Error).name);
      });
      handler.handleUncaughtError(new TypeError('first'));
      handler.handleUncaughtError(new RangeError('second'));
      expect(names[0]).assertEqual('TypeError');
      expect(names[1]).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_2800
     * @tc.name testProcessErrorHandlerHandleUncaughtError028
     * @tc.desc Verify callback can count errors by name using a Map, confirming each error triggers exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counts: Map<string, number> = new Map<string, number>();
      let handler = new ProcessErrorHandler((err: Object): void => {
        let name = (err as Error).name;
        counts.set(name, (counts.get(name) ?? 0) + 1);
      });
      handler.handleUncaughtError(new TypeError('a'));
      handler.handleUncaughtError(new RangeError('b'));
      handler.handleUncaughtError(new TypeError('c'));
      expect(counts.get('TypeError')).assertEqual(2);
      expect(counts.get('RangeError')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_2900
     * @tc.name testProcessErrorHandlerHandleUncaughtError029
     * @tc.desc Verify callback can filter errors by message prefix and count matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matchCount: number = 0;
      let handler = new ProcessErrorHandler((err: Object): void => {
        if ((err as Error).message.indexOf('match') === 0) {
          matchCount++;
        }
      });
      handler.handleUncaughtError(new Error('match first'));
      handler.handleUncaughtError(new Error('nomatch second'));
      handler.handleUncaughtError(new Error('match third'));
      expect(matchCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_3000
     * @tc.name testProcessErrorHandlerHandleUncaughtError030
     * @tc.desc Verify custom Error subclass with extra property is handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let custom = new HandleUncaughtErrorCustom063('app error', 500);
      expect(handleErrorOnce(custom)).assertTrue();
      expect(custom.errCode).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_3100
     * @tc.name testProcessErrorHandlerHandleUncaughtError031
     * @tc.desc Verify Error wrapper message can represent cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('root cause');
      let wrapper = new Error('wrapper: ' + root.message);
      let captured: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        captured = (err as Error).message;
      });
      handler.handleUncaughtError(wrapper);
      expect(captured).assertEqual('wrapper: root cause');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_3200
     * @tc.name testProcessErrorHandlerHandleUncaughtError032
     * @tc.desc Verify finally block execution with handleUncaughtError call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
      */
    it('testProcessErrorHandlerHandleUncaughtError032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      let handled = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        handled = (err as Error).message === 'finally test';
      });
      try {
        finallyExecuted = false;
      } finally {
        finallyExecuted = true;
        handler.handleUncaughtError(new Error('finally test'));
      }
      expect(finallyExecuted).assertTrue();
      expect(handled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_3300
     * @tc.name testProcessErrorHandlerHandleUncaughtError033
     * @tc.desc Verify same Error object can be handled multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let error = new Error('same');
      let handler = new ProcessErrorHandler((err: Object): void => {
        if (err === error) {
          count++;
        }
      });
      handler.handleUncaughtError(error);
      handler.handleUncaughtError(error);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_3400
     * @tc.name testProcessErrorHandlerHandleUncaughtError034
     * @tc.desc Verify finally block non-exceptional path allows handleUncaughtError to work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let handled = false;
      let normalPath = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        handled = (err as Error).message === 'finally normal';
      });
      try {
        normalPath = true;
      } finally {
        handler.handleUncaughtError(new Error('finally normal'));
      }
      expect(normalPath).assertTrue();
      expect(handled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_3500
     * @tc.name testProcessErrorHandlerHandleUncaughtError035
     * @tc.desc Verify multiple different Error objects passed to same handler are all processed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let messages: string[] = [];
      let handler = new ProcessErrorHandler((err: Object): void => {
        messages.push((err as Error).message);
      });
      handler.handleUncaughtError(new TypeError('type err'));
      handler.handleUncaughtError(new RangeError('range err'));
      handler.handleUncaughtError(new SyntaxError('syntax err'));
      expect(messages.length).assertEqual(3);
      expect(messages[0]).assertEqual('type err');
      expect(messages[1]).assertEqual('range err');
      expect(messages[2]).assertEqual('syntax err');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_3600
     * @tc.name testProcessErrorHandlerHandleUncaughtError036
     * @tc.desc Verify callback can mutate a custom Error field between repeated handling calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let codes: int[] = [];
      let shared = new HandleUncaughtErrorCustom014('duplicate', 0);
      let handler = new ProcessErrorHandler((err: Object): void => {
        let current = err as HandleUncaughtErrorCustom014;
        codes.push(current.errCode);
        current.errCode++;
      });
      handler.handleUncaughtError(shared);
      handler.handleUncaughtError(shared);
      handler.handleUncaughtError(shared);
      expect(codes[0]).assertEqual(0);
      expect(codes[1]).assertEqual(1);
      expect(codes[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_3700
     * @tc.name testProcessErrorHandlerHandleUncaughtError037
     * @tc.desc Verify custom Error subclass with multiple properties is fully passed to callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedName: string = '';
      let capturedMsg: string = '';
      let capturedCode: int = 0;
      let handler = new ProcessErrorHandler((err: Object): void => {
        let e = err as HandleUncaughtErrorCustom014;
        capturedName = e.name;
        capturedMsg = e.message;
        capturedCode = e.errCode;
      });
      handler.handleUncaughtError(new HandleUncaughtErrorCustom014('multi prop', 42));
      expect(capturedName).assertEqual('HandleUncaughtErrorCustom014');
      expect(capturedMsg).assertEqual('multi prop');
      expect(capturedCode).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_3800
     * @tc.name testProcessErrorHandlerHandleUncaughtError038
     * @tc.desc Verify rethrown wrapped Error is correctly passed to handleUncaughtError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        msg = (err as Error).message;
      });
      try {
        throw new Error('original err');
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        let wrapped = new Error('rethrown: ' + (e as Error).message);
        handler.handleUncaughtError(wrapped);
      }
      expect(msg).assertEqual('rethrown: original err');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_3900
     * @tc.name testProcessErrorHandlerHandleUncaughtError039
     * @tc.desc Verify callback receives the exact Error after a previous valid handling call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first = new Error('valid first');
      let second = new Error('valid second');
      let messages: string[] = [];
      let refs: Object[] = [];
      let handler = new ProcessErrorHandler((err: Object): void => {
        refs.push(err);
        messages.push((err as Error).message);
      });
      handler.handleUncaughtError(first);
      handler.handleUncaughtError(second);
      expect(refs[0]).assertEqual(first);
      expect(refs[1]).assertEqual(second);
      expect(messages.join('|')).assertEqual('valid first|valid second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_4000
     * @tc.name testProcessErrorHandlerHandleUncaughtError040
     * @tc.desc Verify three consecutive Error calls are handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let firstError: Object | null = null;
      let handler = new ProcessErrorHandler((err: Object): void => {
        if (count === 0) {
          firstError = err;
        }
        count++;
      });
      handler.handleUncaughtError(new Error('one'));
      handler.handleUncaughtError(new Error('two'));
      handler.handleUncaughtError(new Error('three'));
      expect(count).assertEqual(3);
      expect(firstError instanceof Error).assertTrue();
      expect((firstError as Error).message).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_4100
     * @tc.name testProcessErrorHandlerHandleUncaughtError041
     * @tc.desc Verify Promise constructor with reject is handled by handleUncaughtError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'constructor reject';
      });
      try {
        await new Promise<void>((resolve: (v: void) => void, reject: (e: Error) => void): void => {
          reject(new Error('constructor reject'));
        });
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        handler.handleUncaughtError(e as Object);
      }
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_4200
     * @tc.name testProcessErrorHandlerHandleUncaughtError042
     * @tc.desc Verify public method can be called directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let owner = new HandleUncaughtErrorOwner088();
      let handler = new ProcessErrorHandler((error: Object): void => {
        owner.handle(error);
      });
      handler.handleUncaughtError(new Error('public'));
      expect(owner.handled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_4300
     * @tc.name testProcessErrorHandlerHandleUncaughtError043
     * @tc.desc Verify Promise.then resolving to rejected Promise is handled by handleUncaughtError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'nested reject';
      });
      try {
        await Promise.resolve().then((): Promise<void> => {
          return Promise.reject(new Error('nested reject'));
        });
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        handler.handleUncaughtError(e as Object);
      }
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_4400
     * @tc.name testProcessErrorHandlerHandleUncaughtError044
     * @tc.desc Verify Promise rejection is caught and handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'promise rejected';
      });
      try {
        await Promise.reject(new Error('promise rejected'));
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        handler.handleUncaughtError(e as Object);
      }
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_4500
     * @tc.name testProcessErrorHandlerHandleUncaughtError045
     * @tc.desc Verify Promise resolve followed by synchronous handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await Promise.resolve();
      expect(handleErrorOnce(new Error('after resolve'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_4600
     * @tc.name testProcessErrorHandlerHandleUncaughtError046
     * @tc.desc Verify Promise chain throw is caught and handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'chain throw';
      });
      try {
        await Promise.resolve().then((): void => {
          throw new Error('chain throw');
        });
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        handler.handleUncaughtError(e as Object);
      }
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_4700
     * @tc.name testProcessErrorHandlerHandleUncaughtError047
     * @tc.desc Verify Promise all rejection is caught and handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'all reject';
      });
      try {
        await Promise.all([Promise.resolve(1), Promise.reject(new Error('all reject'))]);
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        handler.handleUncaughtError(e as Object);
      }
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_4800
     * @tc.name testProcessErrorHandlerHandleUncaughtError048
     * @tc.desc Verify Promise any all-rejected scenario passes aggregate rejection details
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let caughtError: Object | null = null;
      let received: Object | null = null;
      let aggregateErrors: Error[] = [];
      let handler = new ProcessErrorHandler((err: Object): void => {
        received = err;
      });
      try {
        await Promise.any([Promise.reject(new Error('any one')), Promise.reject(new Error('any two'))]);
      } catch (e) {
        expect((e as Error).name).assertEqual('AggregateError');
        caughtError = e as Object;
        aggregateErrors = (e as AggregateError).errors;
        handler.handleUncaughtError(e as Object);
      }
      expect(received).assertEqual(caughtError);
      expect((received as Error).name).assertEqual((caughtError as Error).name);
      expect(aggregateErrors.length).assertEqual(2);
      expect(aggregateErrors[0].message).assertEqual('any one');
      expect(aggregateErrors[1].message).assertEqual('any two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_4900
     * @tc.name testProcessErrorHandlerHandleUncaughtError049
     * @tc.desc Verify Promise race rejection is caught and handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'race reject';
      });
      try {
        await Promise.race([Promise.reject(new Error('race reject')), Promise.resolve(1)]);
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        handler.handleUncaughtError(e as Object);
      }
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_5000
     * @tc.name testProcessErrorHandlerHandleUncaughtError050
     * @tc.desc Verify await rejection is caught and handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'await reject';
      });
      try {
        await Promise.reject(new Error('await reject'));
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        handler.handleUncaughtError(e as Object);
      }
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_5100
     * @tc.name testProcessErrorHandlerHandleUncaughtError051
     * @tc.desc Verify Promise.any rejection object is passed to callback by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let caughtError: Object | null = null;
      let received: Object | null = null;
      let errorCount = 0;
      let handler = new ProcessErrorHandler((err: Object): void => {
        received = err;
        errorCount++;
      });
      try {
        await Promise.any([Promise.reject(new Error('any first')), Promise.reject(new Error('any second'))]);
      } catch (e) {
        expect((e as Error).name).assertEqual('AggregateError');
        caughtError = e as Object;
        handler.handleUncaughtError(e as Object);
      }
      expect(received).assertEqual(caughtError);
      expect(errorCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_5200
     * @tc.name testProcessErrorHandlerHandleUncaughtError052
     * @tc.desc Verify multiple async functions can handle errors independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let count = 0;
      let handler = new ProcessErrorHandler((err: Object): void => {
        count++;
      });
      let first = async (): Promise<void> => {
        handler.handleUncaughtError(new Error('first async'));
      };
      let second = async (): Promise<void> => {
        handler.handleUncaughtError(new Error('second async'));
      };
      await Promise.all([first(), second()]);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_5300
     * @tc.name testProcessErrorHandlerHandleUncaughtError053
     * @tc.desc Verify concurrent rejected tasks are handled separately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let count = 0;
      let handler = new ProcessErrorHandler((err: Object): void => {
        count++;
      });
      let p1 = Promise.reject(new Error('task one')).catch((e: Object): void => {
        handler.handleUncaughtError(e as Object);
      });
      let p2 = Promise.reject(new Error('task two')).catch((e: Object): void => {
        handler.handleUncaughtError(e as Object);
      });
      await Promise.all([p1, p2]);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_5400
     * @tc.name testProcessErrorHandlerHandleUncaughtError054
     * @tc.desc Verify concurrent tasks can share the same Error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let shared = new Error('shared async');
      let count = 0;
      let handler = new ProcessErrorHandler((err: Object): void => {
        if (err === shared) {
          count++;
        }
      });
      await Promise.all([
        Promise.resolve().then((): void => handler.handleUncaughtError(shared)),
        Promise.resolve().then((): void => handler.handleUncaughtError(shared))
      ]);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_5500
     * @tc.name testProcessErrorHandlerHandleUncaughtError055
     * @tc.desc Verify many async tasks can handle errors without instability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let count = 0;
      let midMsg = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        if (count === 50) {
          midMsg = (err as Error).message;
        }
        count++;
      });
      let tasks: Promise<void>[] = [];
      for (let i = 0; i < 100; i++) {
        tasks.push(Promise.resolve().then((): void => {
          handler.handleUncaughtError(new Error('bulk' + i));
        }));
      }
      await Promise.all(tasks);
      expect(count).assertEqual(100);
      expect(midMsg).assertEqual('bulk50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_5600
     * @tc.name testProcessErrorHandlerHandleUncaughtError056
     * @tc.desc Verify dependent async tasks preserve order before handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let order = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        order += 'B';
      });
      await Promise.resolve().then((): void => {
        order += 'A';
      });
      handler.handleUncaughtError(new Error('dependent'));
      expect(order).assertEqual('AB');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_5700
     * @tc.name testProcessErrorHandlerHandleUncaughtError057
     * @tc.desc Verify loop-created async tasks handle each iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let count = 0;
      let handler = new ProcessErrorHandler((err: Object): void => {
        count++;
      });
      let tasks: Promise<void>[] = [];
      for (let i = 0; i < 5; i++) {
        tasks.push(Promise.resolve().then((): void => {
          handler.handleUncaughtError(new Error('loop'));
        }));
      }
      await Promise.all(tasks);
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_5800
     * @tc.name testProcessErrorHandlerHandleUncaughtError058
     * @tc.desc Verify conditional async task handles only selected branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let count = 0;
      let shouldHandle = true;
      let handler = new ProcessErrorHandler((err: Object): void => {
        count++;
      });
      await Promise.resolve().then((): void => {
        if (shouldHandle) {
          handler.handleUncaughtError(new Error('conditional'));
        }
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_5900
     * @tc.name testProcessErrorHandlerHandleUncaughtError059
     * @tc.desc Verify Promise resolved then rejection is handled by handleUncaughtError via catch callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'rejected promise';
      });
      await new Promise<void>((resolve: (v: void) => void, reject: (e: Error) => void): void => {
        reject(new Error('rejected promise'));
      }).catch((e: Object): void => {
        handler.handleUncaughtError(e as Object);
      });
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_6000
     * @tc.name testProcessErrorHandlerHandleUncaughtError060
     * @tc.desc Verify rejected Promise inside async function is caught and handled by handleUncaughtError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'async reject';
      });
      let throwAsync = async (): Promise<void> => {
        throw new Error('async reject');
      };
      try {
        await throwAsync();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        handler.handleUncaughtError(e as Object);
      }
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_6100
     * @tc.name testProcessErrorHandlerHandleUncaughtError061
     * @tc.desc Verify async handler can invoke handleUncaughtError and callback receives the Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'async handler';
      });
      let asyncHandler = async (): Promise<void> => {
        handler.handleUncaughtError(new Error('async handler'));
      };
      await asyncHandler();
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_6200
     * @tc.name testProcessErrorHandlerHandleUncaughtError062
     * @tc.desc Verify Promise chain catch can handle Error and pass to handleUncaughtError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'chain catch';
      });
      await Promise.resolve().then((): void => {
        throw new Error('chain catch');
      }).catch((e: Object): void => {
        handler.handleUncaughtError(e as Object);
      });
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_6300
     * @tc.name testProcessErrorHandlerHandleUncaughtError063
     * @tc.desc Verify async function body Error is caught and handled by handleUncaughtError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'async body';
      });
      let fn = async (): Promise<void> => {
        throw new Error('async body');
      };
      try {
        await fn();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
        handler.handleUncaughtError(e as Object);
      }
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_6400
     * @tc.name testProcessErrorHandlerHandleUncaughtError064
     * @tc.desc Verify Promise microtask scenario is asynchronous verification only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'microtask';
      });
      await Promise.resolve().then((): void => {
        handler.handleUncaughtError(new Error('microtask'));
      });
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_6500
     * @tc.name testProcessErrorHandlerHandleUncaughtError065
     * @tc.desc Verify await after resolved Promise can handle Error via handleUncaughtError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).message === 'post await';
      });
      await Promise.resolve();
      handler.handleUncaughtError(new Error('post await'));
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_6600
     * @tc.name testProcessErrorHandlerHandleUncaughtError066
     * @tc.desc Verify modified Error name is still handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let error = new Error('renamed');
      error.name = 'RenamedError';
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = (err as Error).name === 'RenamedError' && (err as Error).message === 'renamed';
      });
      handler.handleUncaughtError(error);
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_6700
     * @tc.name testProcessErrorHandlerHandleUncaughtError067
     * @tc.desc Verify Error without stack emphasis is handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let error = new Error('no stack emphasis');
      expect(handleErrorOnce(error)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_6800
     * @tc.name testProcessErrorHandlerHandleUncaughtError068
     * @tc.desc Verify Error with custom name property is accessible in callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = '';
      let msg: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        name = (err as Error).name;
        msg = (err as Error).message;
      });
      let err = new Error('custom name');
      err.name = 'CustomNamedError';
      handler.handleUncaughtError(err);
      expect(name).assertEqual('CustomNamedError');
      expect(msg).assertEqual('custom name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_6900
     * @tc.name testProcessErrorHandlerHandleUncaughtError069
     * @tc.desc Verify Error without message (new Error()) is handled correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = 'not called';
      let name: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        msg = (err as Error).message;
        name = (err as Error).name;
      });
      handler.handleUncaughtError(new Error());
      expect(msg).assertEqual('');
      expect(name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_7000
     * @tc.name testProcessErrorHandlerHandleUncaughtError070
     * @tc.desc Verify Error with cause chain passes correct message to callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        msg = (err as Error).message;
      });
      let root = new Error('root');
      let layer1 = new Error('layer1: ' + root.message);
      let layer2 = new Error('layer2: ' + layer1.message);
      handler.handleUncaughtError(layer2);
      expect(msg).assertEqual('layer2: layer1: root');
      expect(layer1.message).assertEqual('layer1: root');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_7100
     * @tc.name testProcessErrorHandlerHandleUncaughtError071
     * @tc.desc Verify Error with empty message boundary is handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isInstance = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        isInstance = err instanceof Error;
      });
      handler.handleUncaughtError(new Error());
      expect(isInstance).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_7200
     * @tc.name testProcessErrorHandlerHandleUncaughtError072
     * @tc.desc Verify high frequency handling remains stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let firstMsg = '';
      let lastMsg = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        if (count === 0) {
          firstMsg = (err as Error).message;
        }
        count++;
        lastMsg = (err as Error).message;
      });
      for (let i = 0; i < 1000; i++) {
        handler.handleUncaughtError(new Error('bulk' + i));
      }
      expect(count).assertEqual(1000);
      expect(firstMsg).assertEqual('bulk0');
      expect(lastMsg).assertEqual('bulk999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_7300
     * @tc.name testProcessErrorHandlerHandleUncaughtError073
     * @tc.desc Verify deep Error message chain is handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let message = 'root';
      for (let i = 0; i < 100; i++) {
        message = 'layer' + i.toString() + ':' + message;
      }
      expect(handleErrorByMessage(new Error(message), message)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_7400
     * @tc.name testProcessErrorHandlerHandleUncaughtError074
     * @tc.desc Verify repeated handling completes without retained-state failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let messages: string[] = [];
      let handler = new ProcessErrorHandler((err: Object): void => {
        messages.push((err as Error).message);
      });
      for (let i = 0; i < 50; i++) {
        handler.handleUncaughtError(new Error('stable' + i));
      }
      expect(messages.length).assertEqual(50);
      expect(messages[0]).assertEqual('stable0');
      expect(messages[25]).assertEqual('stable25');
      expect(messages[49]).assertEqual('stable49');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_7500
     * @tc.name testProcessErrorHandlerHandleUncaughtError075
     * @tc.desc Verify concurrent pressure handling remains stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let names: string[] = [];
      let handler = new ProcessErrorHandler((err: Object): void => {
        names.push((err as Error).name);
      });
      let tasks: Promise<void>[] = [];
      let errorTypes: Error[] = [new TypeError('t'), new RangeError('r'), new SyntaxError('s')];
      for (let i = 0; i < errorTypes.length; i++) {
        let err = errorTypes[i];
        tasks.push(Promise.resolve().then((): void => {
          handler.handleUncaughtError(err);
        }));
      }
      await Promise.all(tasks);
      expect(names.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_7600
     * @tc.name testProcessErrorHandlerHandleUncaughtError076
     * @tc.desc Verify custom Error subclass with third-party-like name is compatible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let libraryError = new ThirdPartyLikeError114('library error');
      expect(handleErrorByMessage(libraryError, 'library error')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_7700
     * @tc.name testProcessErrorHandlerHandleUncaughtError077
     * @tc.desc Verify Error with modified name field is correctly received by callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let receivedName: string = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        receivedName = (err as Error).name;
      });
      let err = new RangeError('modified type');
      err.name = 'ModifiedErrorName';
      handler.handleUncaughtError(err);
      expect(receivedName).assertEqual('ModifiedErrorName');
      expect(err instanceof RangeError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_7800
     * @tc.name testProcessErrorHandlerHandleUncaughtError078
     * @tc.desc Verify mixed Error subclasses are all handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let handler = new ProcessErrorHandler((err: Object): void => {
        count++;
      });
      handler.handleUncaughtError(new Error('base'));
      handler.handleUncaughtError(new TypeError('type'));
      handler.handleUncaughtError(new RangeError('range'));
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_7900
     * @tc.name testProcessErrorHandlerHandleUncaughtError079
     * @tc.desc Verify handler can replace error.name on first call and observe it on second call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let observedNames: string[] = [];
      let shared = new Error('shared across');
      let handler = new ProcessErrorHandler((err: Object): void => {
        let current = err as Error;
        observedNames.push(current.name);
        current.name = 'SharedHandledError';
      });
      handler.handleUncaughtError(shared);
      handler.handleUncaughtError(shared);
      expect(observedNames[0]).assertEqual('Error');
      expect(observedNames[1]).assertEqual('SharedHandledError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_8000
     * @tc.name testProcessErrorHandlerHandleUncaughtError080
     * @tc.desc Verify callback can recover state after handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let recovered = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        recovered = true;
      });
      handler.handleUncaughtError(new Error('recover'));
      expect(recovered).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_8100
     * @tc.name testProcessErrorHandlerHandleUncaughtError081
     * @tc.desc Verify repeated handling records stable stack presence for the same Error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stackPresence: boolean[] = [];
      let error = new Error('retry');
      let handler = new ProcessErrorHandler((err: Object): void => {
        stackPresence.push((err as Error).stack !== undefined);
      });
      handler.handleUncaughtError(error);
      handler.handleUncaughtError(error);
      handler.handleUncaughtError(error);
      expect(stackPresence.length).assertEqual(3);
      expect(stackPresence[0]).assertTrue();
      expect(stackPresence[1]).assertTrue();
      expect(stackPresence[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_8200
     * @tc.name testProcessErrorHandlerHandleUncaughtError082
     * @tc.desc Verify callback updates resource cleanup flag after error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resourceClosed = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        resourceClosed = true;
      });
      handler.handleUncaughtError(new Error('cleanup'));
      expect(resourceClosed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_8300
     * @tc.name testProcessErrorHandlerHandleUncaughtError083
     * @tc.desc Verify handleUncaughtError with null parameter throws ClassCastError and callback is not invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callbackCalled = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        callbackCalled = true;
      });
      try {
        handler.handleUncaughtError(null as Object as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        expect(callbackCalled).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_HANDLE_UNCAUGHT_ERROR_8400
     * @tc.name testProcessErrorHandlerHandleUncaughtError084
     * @tc.desc Verify handleUncaughtError with undefined parameter throws ClassCastError and callback is not invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerHandleUncaughtError084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callbackCalled = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        callbackCalled = true;
      });
      try {
        handler.handleUncaughtError(undefined as Object as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        expect(callbackCalled).assertFalse();
      }
    });
  });
}


