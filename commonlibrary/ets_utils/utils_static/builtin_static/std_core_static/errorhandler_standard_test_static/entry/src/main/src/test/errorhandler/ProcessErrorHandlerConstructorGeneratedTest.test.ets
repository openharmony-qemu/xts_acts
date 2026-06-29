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

class ProcessErrorHandlerGeneratedOwner {
  called: boolean = false;

  handle(error: Object): void {
    this.called = true;
  }

  static staticHandle(error: Object): void {
  }
}

class ProcessErrorHandlerGeneratedError extends Error {
  errCode: int = 0;

  constructor(message: string, errCode: int) {
    super(message);
    this.name = 'ProcessErrorHandlerGeneratedError';
    this.errCode = errCode;
  }
}

export default function ProcessErrorHandlerConstructorGeneratedTest(): void {
  describe('ProcessErrorHandlerConstructorGeneratedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0001
     * @tc.name testProcessErrorHandlerConstructorGenerated001
     * @tc.desc Verify callback uses if-else logic to distinguish different error types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let detected: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        if ((error as Error).name === 'TypeError') {
          detected.push('type');
        } else if ((error as Error).name === 'RangeError') {
          detected.push('range');
        } else {
          detected.push('other');
        }
      });
      handler.handleUncaughtError(new TypeError('type err'));
      expect(detected[0]).assertEqual('type');
      handler.handleUncaughtError(new RangeError('range err'));
      expect(detected[1]).assertEqual('range');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0002
     * @tc.name testProcessErrorHandlerConstructorGenerated002
     * @tc.desc Verify multiple handler instances have isolated handleUncaughtError behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let countA = 0;
      let countB = 0;
      let handlerA = new ProcessErrorHandler((error: Object): void => {
        countA++;
      });
      let handlerB = new ProcessErrorHandler((error: Object): void => {
        countB++;
      });
      handlerA.handleUncaughtError(new Error('a1'));
      handlerB.handleUncaughtError(new Error('b1'));
      handlerA.handleUncaughtError(new Error('a2'));
      expect(countA).assertEqual(2);
      expect(countB).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0003
     * @tc.name testProcessErrorHandlerConstructorGenerated003
     * @tc.desc Verify callback modifies external array observable after handleUncaughtError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        results.push((error as Error).name + ':' + (error as Error).message);
      });
      handler.handleUncaughtError(new Error('obs test'));
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual('Error:obs test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0004
     * @tc.name testProcessErrorHandlerConstructorGenerated004
     * @tc.desc Verify static class method callback construction succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let handler = new ProcessErrorHandler(ProcessErrorHandlerGeneratedOwner.staticHandle);
      expect(handler instanceof ProcessErrorHandler).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0005
     * @tc.name testProcessErrorHandlerConstructorGenerated005
     * @tc.desc Verify callback with empty function body can construct handler
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let handler = new ProcessErrorHandler((error: Object): void => {
      });
      expect(handler instanceof ProcessErrorHandler).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0006
     * @tc.name testProcessErrorHandlerConstructorGenerated006
     * @tc.desc Verify callback uses multiple Error properties in conditional branching logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let severity = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        let err = error as Error;
        if (err.name === 'TypeError' && err.message.length > 5) {
          severity = 'high';
        } else {
          severity = 'low';
        }
      });
      handler.handleUncaughtError(new TypeError('lengthy msg'));
      expect(severity).assertEqual('high');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0007
     * @tc.name testProcessErrorHandlerConstructorGenerated007
     * @tc.desc Verify callback can capture external variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 1;
      let handler = new ProcessErrorHandler((error: Object): void => {
        count++;
      });
      expect(handler instanceof ProcessErrorHandler).assertTrue();
      handler.handleUncaughtError(new Error('captured'));
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0008
     * @tc.name testProcessErrorHandlerConstructorGenerated008
     * @tc.desc Verify callback can invoke a utility function with observable result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        result = (error as Error).name + '|' + (error as Error).message;
      });
      handler.handleUncaughtError(new SyntaxError('util test'));
      expect(result).assertEqual('SyntaxError|util test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0009
     * @tc.name testProcessErrorHandlerConstructorGenerated009
     * @tc.desc Verify each constructor call returns an independent instance with its own callback state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received1 = '';
      let received2 = '';
      let handler1 = new ProcessErrorHandler((error: Object): void => {
        received1 = (error as Error).message;
      });
      let handler2 = new ProcessErrorHandler((error: Object): void => {
        received2 = (error as Error).message;
      });
      handler1.handleUncaughtError(new Error('first handler'));
      handler2.handleUncaughtError(new Error('second handler'));
      expect(handler1 === handler2).assertFalse();
      expect(received1).assertEqual('first handler');
      expect(received2).assertEqual('second handler');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0010
     * @tc.name testProcessErrorHandlerConstructorGenerated010
     * @tc.desc Verify handler construction succeeds and the instance remains an object at runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let handler = new ProcessErrorHandler((error: Object): void => {
      });
      let keys = Object.keys(handler);
      expect(handler instanceof Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0011
     * @tc.name testProcessErrorHandlerConstructorGenerated011
     * @tc.desc Verify callback receives the error message after handler construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let received = '';
      let handler = new ProcessErrorHandler((error: Object): void => {
        received = (error as Error).message;
      });
      handler.handleUncaughtError(new Error('json check'));
      expect(received).assertEqual('json check');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0012
     * @tc.name testProcessErrorHandlerConstructorGenerated012
     * @tc.desc Verify try catch finally flow around safe construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      let received = '';
      try {
        let handler = new ProcessErrorHandler((error: Object): void => {
          received = (error as Error).message;
        });
        handler.handleUncaughtError(new Error('finally flow'));
      } finally {
        finallyExecuted = true;
      }
      expect(received).assertEqual('finally flow');
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0013
     * @tc.name testProcessErrorHandlerConstructorGenerated013
     * @tc.desc Verify nested block flow around safe construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let handled = false;
      {
        {
          let handler = new ProcessErrorHandler((error: Object): void => {
            handled = (error as Error).message === 'nested block';
          });
          handler.handleUncaughtError(new Error('nested block'));
        }
      }
      expect(handled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0014
     * @tc.name testProcessErrorHandlerConstructorGenerated014
     * @tc.desc Verify custom Error callback object construction does not invoke callback immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let generatedError = new ProcessErrorHandlerGeneratedError('custom', 404);
      let observedCode = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {
        observedCode = (error as ProcessErrorHandlerGeneratedError).errCode;
      });
      expect(handler instanceof ProcessErrorHandler).assertTrue();
      handler.handleUncaughtError(generatedError);
      expect(observedCode).assertEqual(404);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0015
     * @tc.name testProcessErrorHandlerConstructorGenerated015
     * @tc.desc Verify public constructor and API availability through runtime construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let handler: ProcessErrorHandler = new ProcessErrorHandler((error: Object): void => {
      });
      expect(handler instanceof ProcessErrorHandler).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0016
     * @tc.name testProcessErrorHandlerConstructorGenerated016
     * @tc.desc Verify callback accumulates state across multiple handleUncaughtError calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let seen: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        if (seen.length === 0) {
          seen.push('first');
        } else {
          seen.push('subsequent');
        }
      });
      handler.handleUncaughtError(new Error('a'));
      handler.handleUncaughtError(new Error('b'));
      handler.handleUncaughtError(new Error('c'));
      expect(seen.length).assertEqual(3);
      expect(seen[0]).assertEqual('first');
      expect(seen[1]).assertEqual('subsequent');
      expect(seen[2]).assertEqual('subsequent');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0017
     * @tc.name testProcessErrorHandlerConstructorGenerated017
     * @tc.desc Verify construction inside async function succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await Utils.msSleep(1);
      let handler = new ProcessErrorHandler((error: Object): void => {
      });
      expect(handler instanceof ProcessErrorHandler).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0018
     * @tc.name testProcessErrorHandlerConstructorGenerated018
     * @tc.desc Verify construction inside Promise then succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let constructed = false;
      await Promise.resolve().then((): void => {
        new ProcessErrorHandler((error: Object): void => {
        });
        constructed = true;
      });
      expect(constructed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0019
     * @tc.name testProcessErrorHandlerConstructorGenerated019
     * @tc.desc Verify multiple Promise constructions complete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let count = 0;
      await Promise.resolve().then((): void => {
        new ProcessErrorHandler((error: Object): void => {
        });
        count++;
      });
      await Promise.resolve().then((): void => {
        new ProcessErrorHandler((error: Object): void => {
        });
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0020
     * @tc.name testProcessErrorHandlerConstructorGenerated020
     * @tc.desc Verify reset callback captures closure variable and modifies it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = 10;
      let handler = new ProcessErrorHandler((error: Object): void => {
      });
      handler.reset((error: Object): void => {
        x++;
      });
      handler.handleUncaughtError(new Error('closure test'));
      expect(x).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0021
     * @tc.name testProcessErrorHandlerConstructorGenerated021
     * @tc.desc Verify repeated construction creates expected number of instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      for (let i = 0; i < 100; i++) {
        new ProcessErrorHandler((error: Object): void => {
        });
        count++;
      }
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0022
     * @tc.name testProcessErrorHandlerConstructorGenerated022
     * @tc.desc Verify closure state can be updated when callback runs after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retained = true;
      let handler = new ProcessErrorHandler((error: Object): void => {
        retained = false;
      });
      handler.handleUncaughtError(new Error('release'));
      expect(handler instanceof ProcessErrorHandler).assertTrue();
      expect(retained).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0023
     * @tc.name testProcessErrorHandlerConstructorGenerated023
     * @tc.desc Verify rapid consecutive handleUncaughtError calls preserve message order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msgs: string[] = [];
      let handler = new ProcessErrorHandler((error: Object): void => {
        msgs.push((error as Error).message);
      });
      for (let i = 0; i < 100; i++) {
        handler.handleUncaughtError(new Error('bulk' + i));
      }
      expect(msgs.length).assertEqual(100);
      expect(msgs[0]).assertEqual('bulk0');
      expect(msgs[99]).assertEqual('bulk99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0024
     * @tc.name testProcessErrorHandlerConstructorGenerated024
     * @tc.desc Verify callback can read the optional error.stack property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stackValue: string | undefined = undefined;
      let handler = new ProcessErrorHandler((error: Object): void => {
        stackValue = (error as Error).stack;
      });
      handler.handleUncaughtError(new Error('stack access'));
      expect(stackValue !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0025
     * @tc.name testProcessErrorHandlerConstructorGenerated025
     * @tc.desc Verify that a callback set via constructor can be shared by multiple handlers without cross-contamination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let seq: string[] = [];
      let cb = (err: Object): void => {
        seq.push((err as Error).message);
      };
      let h1 = new ProcessErrorHandler(cb);
      let h2 = new ProcessErrorHandler(cb);
      h1.handleUncaughtError(new Error('one'));
      h2.handleUncaughtError(new Error('two'));
      expect(seq.length).assertEqual(2);
      expect(seq[0]).assertEqual('one');
      expect(seq[1]).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0026
     * @tc.name testProcessErrorHandlerConstructorGenerated026
     * @tc.desc Verify custom error object can be captured by callback after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let receivedCode = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {
        let generatedError = error as ProcessErrorHandlerGeneratedError;
        receivedCode = generatedError.errCode;
      });
      handler.handleUncaughtError(new ProcessErrorHandlerGeneratedError('custom', 500));
      expect(receivedCode).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0027
     * @tc.name testProcessErrorHandlerConstructorGenerated027
     * @tc.desc Verify custom Error subclass preserves name message and custom property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let captured: ProcessErrorHandlerGeneratedError | null = null;
      let handler = new ProcessErrorHandler((error: Object): void => {
        captured = error as ProcessErrorHandlerGeneratedError;
      });
      handler.handleUncaughtError(new ProcessErrorHandlerGeneratedError('sub test', 999));
      let cap = captured as ProcessErrorHandlerGeneratedError;
      expect(cap.message).assertEqual('sub test');
      expect(cap.errCode).assertEqual(999);
      expect(cap.name).assertEqual('ProcessErrorHandlerGeneratedError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_PROCESS_ERROR_HANDLER_CONSTRUCTOR_GENERATED_0028
     * @tc.name testProcessErrorHandlerConstructorGenerated028
     * @tc.desc Verify callback invocation count matches number of handleUncaughtError calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testProcessErrorHandlerConstructorGenerated028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount = 0;
      let handler = new ProcessErrorHandler((error: Object): void => {
        callCount++;
      });
      for (let i = 0; i < 5; i++) {
        handler.handleUncaughtError(new Error('count ' + i));
      }
      expect(callCount).assertEqual(5);
    });
  });
}


