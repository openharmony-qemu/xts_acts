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

let constructor004CapturedMsg = '';

class ConstructorNonFunction034 {
}

function constructor004ErrorCallback(err: Object): void {
  constructor004CapturedMsg = (err as Error).message;
}

export default function ProcessErrorHandlerConstructorTest(): void {
  describe('ProcessErrorHandlerConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_0100
     * @tc.name testProcessErrorHandlerConstructor001
     * @tc.desc Verify that passing one required parameter of type UncaughtErrorListener creates the instance successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = true;
      });
      expect(handler instanceof ProcessErrorHandler).assertTrue();
      expect(typeof handler.handleUncaughtError).assertEqual('function');
      expect(typeof handler.reset).assertEqual('function');
      handler.handleUncaughtError(new Error('test'));
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_0200
     * @tc.name testProcessErrorHandlerConstructor002
     * @tc.desc Verify that callback is not invoked during construction but is invoked when handleUncaughtError is called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => { called = true; });
      expect(called).assertFalse();
      handler.handleUncaughtError(new Error('test'));
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_0300
     * @tc.name testProcessErrorHandlerConstructor003
     * @tc.desc Verify that two independent handler instances have separate callbacks that do not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = '';
      let result2 = '';
      let h1 = new ProcessErrorHandler((err: Object): void => { result1 = 'h1'; });
      let h2 = new ProcessErrorHandler((err: Object): void => { result2 = 'h2'; });
      h1.handleUncaughtError(new Error('e1'));
      expect(result1).assertEqual('h1');
      expect(result2).assertEqual('');
      h2.handleUncaughtError(new Error('e2'));
      expect(result2).assertEqual('h2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_0400
     * @tc.name testProcessErrorHandlerConstructor004
     * @tc.desc Verify that passing a function declared with the function keyword as cb parameter works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      constructor004CapturedMsg = '';
      let handler = new ProcessErrorHandler(constructor004ErrorCallback);
      expect(handler instanceof ProcessErrorHandler).assertTrue();
      handler.handleUncaughtError(new Error('callback test'));
      expect(constructor004CapturedMsg).assertEqual('callback test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_0500
     * @tc.name testProcessErrorHandlerConstructor005
     * @tc.desc Verify constructor callback can capture an Error object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Error('arrow reference');
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((err: Object): void => {
        received = err;
      });
      handler.handleUncaughtError(original);
      expect(received).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_0600
     * @tc.name testProcessErrorHandlerConstructor006
     * @tc.desc Verify constructor callback can preserve lexical constants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prefix = 'anonymous:';
      let captured = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        captured = prefix + (err as Error).message;
      });
      handler.handleUncaughtError(new Error('lexical'));
      expect(captured).assertEqual('anonymous:lexical');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_0700
     * @tc.name testProcessErrorHandlerConstructor007
     * @tc.desc Verify that the callback can access the name property of the received Error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = '';
      let handler = new ProcessErrorHandler((err: Object): void => { name = (err as Error).name; });
      handler.handleUncaughtError(new TypeError('type'));
      expect(name).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_0800
     * @tc.name testProcessErrorHandlerConstructor008
     * @tc.desc Verify that the callback can access the message property of the received Error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg = '';
      let handler = new ProcessErrorHandler((err: Object): void => { msg = (err as Error).message; });
      handler.handleUncaughtError(new Error('test message'));
      expect(msg).assertEqual('test message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_0900
     * @tc.name testProcessErrorHandlerConstructor009
     * @tc.desc Verify that the callback can access the stack property of the received Error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hasStack = false;
      let stackIsString = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        let stack = (err as Error).stack;
        hasStack = stack !== undefined;
        stackIsString = typeof stack === 'string';
      });
      handler.handleUncaughtError(new Error('stack check'));
      expect(hasStack).assertTrue();
      expect(stackIsString).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_1000
     * @tc.name testProcessErrorHandlerConstructor010
     * @tc.desc Verify that the same handler can call handleUncaughtError multiple times and each call triggers the callback with the correct message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: string[] = [];
      let handler = new ProcessErrorHandler((err: Object): void => {
        results.push((err as Error).message);
      });
      handler.handleUncaughtError(new Error('first'));
      handler.handleUncaughtError(new Error('second'));
      expect(results.length).assertEqual(2);
      expect(results[0]).assertEqual('first');
      expect(results[1]).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_1100
     * @tc.name testProcessErrorHandlerConstructor011
     * @tc.desc Verify replacing a callback with an empty body prevents previous side effects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = false;
      let handler = new ProcessErrorHandler((err: Object): void => {
        called = true;
      });
      handler.reset((err: Object): void => {});
      handler.handleUncaughtError(new Error('empty replacement'));
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_1200
     * @tc.name testProcessErrorHandlerConstructor012
     * @tc.desc Verify constructor callback can receive an Error with a mutated name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedName = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        capturedName = (err as Error).name;
      });
      let error = new Error('renamed by test');
      error.name = 'ConstructorRenamedError';
      handler.handleUncaughtError(error);
      expect(capturedName).assertEqual('ConstructorRenamedError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_1300
     * @tc.name testProcessErrorHandlerConstructor013
     * @tc.desc Verify that each call to new returns a new independent instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called1 = false;
      let called2 = false;
      let handler1 = new ProcessErrorHandler((err: Object): void => { called1 = true; });
      let handler2 = new ProcessErrorHandler((err: Object): void => { called2 = true; });
      expect(handler1 !== handler2).assertTrue();
      handler1.handleUncaughtError(new Error('test1'));
      expect(called1).assertTrue();
      expect(called2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_1400
     * @tc.name testProcessErrorHandlerConstructor014
     * @tc.desc Verify that the callback receives a TypeError and can access its message correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        msg = (err as Error).message;
      });
      handler.handleUncaughtError(new TypeError('type error msg'));
      expect(msg).assertEqual('type error msg');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_1500
     * @tc.name testProcessErrorHandlerConstructor015
     * @tc.desc Verify that the callback receives a RangeError and can access its name correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        name = (err as Error).name;
      });
      handler.handleUncaughtError(new RangeError('range'));
      expect(name).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_1600
     * @tc.name testProcessErrorHandlerConstructor016
     * @tc.desc Verify that the callback receives a SyntaxError and can process it with correct message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received: Object | null = null;
      let handler = new ProcessErrorHandler((err: Object): void => {
        received = err;
      });
      handler.handleUncaughtError(new SyntaxError('syntax test'));
      expect(received instanceof Error).assertTrue();
      expect((received as SyntaxError).message).assertEqual('syntax test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_1700
     * @tc.name testProcessErrorHandlerConstructor017
     * @tc.desc Verify that the finally block executes after a successful handleUncaughtError call in the try block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let order: string[] = [];
      let handler = new ProcessErrorHandler((err: Object): void => {
        order.push('callback');
      });
      try {
        handler.handleUncaughtError(new Error('test'));
        order.push('after');
      } finally {
        order.push('finally');
      }
      expect(order[0]).assertEqual('callback');
      expect(order[1]).assertEqual('after');
      expect(order[2]).assertEqual('finally');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_1800
     * @tc.name testProcessErrorHandlerConstructor018
     * @tc.desc Verify that the finally block always executes after handleUncaughtError returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      let handler = new ProcessErrorHandler((err: Object): void => {});
      try {
        handler.handleUncaughtError(new Error('test'));
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_1900
     * @tc.name testProcessErrorHandlerConstructor019
     * @tc.desc Verify that the registered callback receives an Error object when an uncaught error occurs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new Error('constructor030');
      let receivedError: Error | null = null;
      let handler = new ProcessErrorHandler((err: Object): void => {
        receivedError = err as Error;
      });
      handler.handleUncaughtError(original);
      expect(receivedError).assertEqual(original);
      expect((receivedError as Error).message).assertEqual('constructor030');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_2000
     * @tc.name testProcessErrorHandlerConstructor020
     * @tc.desc Verify that a handler can be passed to a function expecting ProcessErrorHandler type and instanceof check works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let handler = new ProcessErrorHandler((err: Object): void => {});
      let acceptHandler = (target: ProcessErrorHandler): boolean => {
        return target instanceof ProcessErrorHandler;
      }
      expect(handler instanceof ProcessErrorHandler).assertTrue();
      expect(acceptHandler(handler)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_2100
     * @tc.name testProcessErrorHandlerConstructor021
     * @tc.desc Verify callback created by factory function keeps factory-scoped state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let captured = '';
      let createListener = (label: string): (err: Object) => void => {
        return (err: Object): void => {
          captured = label + ':' + (err as Error).message;
        };
      }
      let handler = new ProcessErrorHandler(createListener('factory'));
      handler.handleUncaughtError(new Error('state'));
      expect(captured).assertEqual('factory:state');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_2200
     * @tc.name testProcessErrorHandlerConstructor022
     * @tc.desc Verify that a callback in a non-async synchronous context executes correctly when handleUncaughtError is called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = '';
      let handler = new ProcessErrorHandler((err: Object): void => {
        result = 'executed in sync context';
      });
      handler.handleUncaughtError(new Error('test'));
      expect(result).assertEqual('executed in sync context');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_2300
     * @tc.name testProcessErrorHandlerConstructor023
     * @tc.desc Verify that the callback can modify variables in the outer lexical scope when handleUncaughtError is called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerVar = 0;
      let handler = new ProcessErrorHandler((err: Object): void => {
        outerVar = 42;
      });
      expect(outerVar).assertEqual(0);
      handler.handleUncaughtError(new Error('test'));
      expect(outerVar).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_2400
     * @tc.name testProcessErrorHandlerConstructor024
     * @tc.desc Verify that constructing ProcessErrorHandler in a Promise chain works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let captured = '';
      let promise = Promise.resolve((err: Object): void => {
        captured = (err as Error).message;
      });
      await promise.then((cb: (err: Object) => void): void => {
        let handler = new ProcessErrorHandler(cb);
        expect(handler instanceof ProcessErrorHandler).assertTrue();
        handler.handleUncaughtError(new Error('promise constructed'));
      });
      expect(captured).assertEqual('promise constructed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_2500
     * @tc.name testProcessErrorHandlerConstructor025
     * @tc.desc Verify constructor throws ClassCastError when callback parameter is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new ProcessErrorHandler(null as Object as (err: Object) => void);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_2600
     * @tc.name testProcessErrorHandlerConstructor026
     * @tc.desc Verify constructor throws ClassCastError when callback parameter is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new ProcessErrorHandler(undefined as Object as (err: Object) => void);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_2700
     * @tc.name testProcessErrorHandlerConstructor027
     * @tc.desc Verify constructor throws ClassCastError when callback parameter is a non-function object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let nonFunction: Object = new ConstructorNonFunction034();
        new ProcessErrorHandler(nonFunction as (err: Object) => void);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });
  });
}


