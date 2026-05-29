/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { stream } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

interface ApiError {
  code: number;
  message: string;
}

class TestWritableBasic extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    callback();
  }
}

class TestWritableError extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    callback(new Error());
  }
}

class TestWritableErrorMessage extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    callback(new Error('write error'));
  }
}

class TestWritableDelayed extends stream.Writable {
  highWaterMark: number = 1;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: (error?: Error) => void): void {
    setTimeout(() => {
      callback();
    }, 10);
  }
}

class CallbackHandler {
  private value: number = 0;

  public handleClose(): void {
    this.value = 100;
  }

  public getValue(): number {
    return this.value;
  }
}

class EventHandler {
  private callbackCalled: boolean = false;

  handleError(): void {
    this.callbackCalled = true;
  }

  getCallbackStatus(): boolean {
    return this.callbackCalled;
  }
}

function nestedCallbackTest(count: number): number {
  count++;
  if (count < 3) {
    return nestedCallbackTest(count);
  }
  return count;
}

export default function StreamWritable05Test(): void {
  describe('StreamWritable05Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(10)
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0100
     * @tc.name      testStreamWritable05Chapter0001
     * @tc.desc      Test on with invalid event name containing special character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      let callbackCalled = false;

      const callback: () => void = (): void => {
        callbackCalled = true;
      };

      try {
        writable.on('cl!ose', callback);
        expect(writable).not().assertUndefined();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(writable.writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0200
     * @tc.name      testStreamWritable05Chapter0002
     * @tc.desc      Test on with numeric event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      let callbackCalled = false;

      const callback: () => void = (): void => {
        callbackCalled = true;
      };

      try {
        writable.on('123', callback);
        expect(writable).not().assertUndefined();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(writable.writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0300
     * @tc.name      testStreamWritable05Chapter0003
     * @tc.desc      Test on with event name containing trailing space
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      let callbackCalled = false;

      const callback: () => void = (): void => {
        callbackCalled = true;
      };

      try {
        writable.on('close ', callback);
        expect(writable).not().assertUndefined();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(writable.writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0400
     * @tc.name      testStreamWritable05Chapter0004
     * @tc.desc      Test on with uppercase event name CLOSE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      let callbackCalled = false;

      const callback: () => void = (): void => {
        callbackCalled = true;
      };

      try {
        writable.on('CLOSE', callback);
        expect(writable).not().assertUndefined();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(writable.writable).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0500
     * @tc.name      testStreamWritable05Chapter0005
     * @tc.desc      Test registering multiple error callbacks on writable stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstCallbackCalled: boolean = false;
      let secondCallbackCalled: boolean = false;
      const writable: TestWritableError = new TestWritableError();
      const firstCallback: () => void = (): void => {
        firstCallbackCalled = true;
      };
      const secondCallback: () => void = (): void => {
        secondCallbackCalled = true;
      };

      writable.on('error', firstCallback);
      writable.on('error', secondCallback);
      writable.write('test', 'utf8', (): void => {
      });

      expect(firstCallbackCalled).assertFalse();
      expect(secondCallbackCalled).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0600
     * @tc.name      testStreamWritable05Chapter0007
     * @tc.desc      Test error event with EventHandler class instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const handler: EventHandler = new EventHandler();
      const writable: TestWritableError = new TestWritableError();

      writable.on('error', (): void => { handler.handleError() });
      writable.write('test', 'utf8', (): void => {
      });

      expect(handler.getCallbackStatus()).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0700
     * @tc.name      testStreamWritable05Chapter0008
     * @tc.desc      Test finish event after write and end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let finishCalled: boolean = false;
        const writable: TestWritableBasic = new TestWritableBasic();
        const finishCallback: () => void = (): void => {
          finishCalled = true;
        };

        writable.write('test', 'utf8', (): void => {
        });
        writable.on('finish', finishCallback);
        writable.end();

        expect(finishCalled).assertFalse();
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0800
     * @tc.name      testStreamWritable05Chapter0009
     * @tc.desc      Test error event with callback returning string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callbackCalled: boolean = false;
      const writable: TestWritableError = new TestWritableError();
      const errorCallback: () => string = (): string => {
        callbackCalled = true;
        return 'error handled';
      };

      writable.on('error', errorCallback);
      writable.write('test', 'utf8', (): void => {
      });

      expect(callbackCalled).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_0900
     * @tc.name      testStreamWritable05Chapter0010
     * @tc.desc      Test on with emoji in event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };

      let eventRegistered = false;
      try {
        writable.on('cl😀se', callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1000
     * @tc.name      testStreamWritable05Chapter0011
     * @tc.desc      Test on with control characters in event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };

      let eventRegistered = false;
      try {
        writable.on('cl\no\ts\re', callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1100
     * @tc.name      testStreamWritable05Chapter0013
     * @tc.desc      Test error event with nested callback invocation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableErrorMessage = new TestWritableErrorMessage();

      writable.on('error', (): void => {
        let globalCallCount = nestedCallbackTest(0);
        expect(globalCallCount).assertEqual(3);
      });

      writable.write('test', 'utf8');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1200
     * @tc.name      testStreamWritable05Chapter0014
     * @tc.desc      Test registering multiple events on same writable stream
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let closeCalled: boolean = false;
      let drainCalled: boolean = false;
      let errorCalled: boolean = false;
      let finishCalled: boolean = false;
      const writable: TestWritableError = new TestWritableError();
      const closeCallback: () => void = (): void => {
        closeCalled = true;
      };
      const drainCallback: () => void = (): void => {
        drainCalled = true;
      };
      const errorCallback: () => void = (): void => {
        errorCalled = true;
      };
      const finishCallback: () => void = (): void => {
        finishCalled = true;
      };

      writable.on('close', closeCallback);
      writable.on('drain', drainCallback);
      writable.on('error', errorCallback);
      writable.on('finish', finishCallback);

      writable.write('test', 'utf8', (): void => {
      });

      expect(errorCalled).assertFalse();
      expect(closeCalled).assertFalse();
      expect(drainCalled).assertFalse();
      expect(finishCalled).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1300
     * @tc.name      testStreamWritable05Chapter0015
     * @tc.desc      Test on with undefined event name from empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };

      let eventRegistered = false;
      try {
        const emptyArray: string[] = [];
        const eventName: string = emptyArray[0];
        writable.on(eventName, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(eventRegistered).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1400
     * @tc.name      testStreamWritable05Chapter0016
     * @tc.desc      Test on with empty string cast as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };

      let eventRegistered = false;
      try {
        const eventName: string = "" as string;
        writable.on(eventName, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1500
     * @tc.name      testStreamWritable05Chapter0017
     * @tc.desc      Test on with empty string event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };

      let eventRegistered = false;
      try {
        writable.on('', callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1600
     * @tc.name      testStreamWritable05Chapter0018
     * @tc.desc      Test on with special characters as individual event names
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };
      const specialChars: string = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';

      let allEventsRegistered = true;
      try {
        for (let i: int = 0; i < specialChars.length; i++) {
          writable.on(specialChars.substring(i, i + 1), callback);
        }
      } catch (err) {
        allEventsRegistered = false;
        expect(err.code).assertEqual(undefined);
      }

      expect(allEventsRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1700
     * @tc.name      testStreamWritable05Chapter0019
     * @tc.desc      Test on with full ASCII range as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };

      let eventRegistered = false;
      try {
        let asciiChars: string = '';
        for (let i: int = 32; i <= 125; i++) {
          asciiChars += String.fromCharCode(i);
        }
        writable.on(asciiChars, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1800
     * @tc.name      testStreamWritable05Chapter0020
     * @tc.desc      Test on with doubled special characters as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };
      const specialChars: string = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';

      let eventRegistered = false;
      try {
        writable.on(specialChars, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_1900
     * @tc.name      testStreamWritable05Chapter0021
     * @tc.desc      Test on with emoji appended to event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };
      const emojis: string[] = [
        '👆', '👿', '👀', '💯', '🎅', '😼', '🔧', '💇',
        '🤼‍♂️', '🛢', '🀄', '🏴'
      ];

      let allEventsRegistered = true;
      try {
        for (const emoji of emojis) {
          writable.on(`close${emoji}`, callback);
        }
      } catch (err) {
        allEventsRegistered = false;
        expect(err.code).assertEqual(undefined);
      }

      expect(allEventsRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2000
     * @tc.name      testStreamWritable05Chapter0022
     * @tc.desc      Test on with illegal Unicode characters in event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };
      const illegalUnicode: string[] = [
        '\udc04', '\ud83d', '\udff4'
      ];

      let allEventsRegistered = true;
      try {
        for (const code of illegalUnicode) {
          writable.on(`close${code}`, callback);
        }
      } catch (err) {
        allEventsRegistered = false;
        expect(err.code).assertEqual(undefined);
      }

      expect(allEventsRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2100
     * @tc.name      testStreamWritable05Chapter0023
     * @tc.desc      Test on with keywords 0, NaN and empty string as event names
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };
      const keywords: string[] = ['0', 'NaN', ''];

      let allEventsRegistered = true;
      try {
        for (const keyword of keywords) {
          writable.on(keyword, callback);
        }
      } catch (err) {
        allEventsRegistered = false;
        expect(err.code).assertEqual(undefined);
      }

      expect(allEventsRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2200
     * @tc.name      testStreamWritable05Chapter0024
     * @tc.desc      Test on with large JSON-like string as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const initTreeString = (size: number): string => {
        let ans: string = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };

      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };
      const treeString: string = initTreeString(10000);

      let eventRegistered = false;
      try {
        writable.on(treeString, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2300
     * @tc.name      testStreamWritable05Chapter0025
     * @tc.desc      Test on with truncated object-like string as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };
      const originalStr: string = "{k1:value1,k2:value2}";
      const slicedStr: string = originalStr.substring(0, originalStr.length - 2);

      let eventRegistered = false;
      try {
        writable.on(slicedStr, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2400
     * @tc.name      testStreamWritable05Chapter0026
     * @tc.desc      Test on with very large repeated string as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };
      const largeString: string = 'a'.repeat(1000000);

      let eventRegistered = false;
      try {
        writable.on(largeString, callback);
        eventRegistered = true;
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }

      expect(eventRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2500
     * @tc.name      testStreamWritable05Chapter0027
     * @tc.desc      Test on with callback capturing large closure data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0027",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const writable: TestWritableBasic = new TestWritableBasic();
        let callCount = 0;

        const createCallback = (): (() => void) => {
          const largeData: string = 'x'.repeat(10000);
          return (): void => {
            callCount++;
            console.log(largeData.length.toString());
          };
        };

        const callback = createCallback();

        writable.on('close', callback);

        writable.end();

        expect(callCount).assertEqual(0);
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2600
     * @tc.name      testStreamWritable05Chapter0028
     * @tc.desc      Test on with whitespace variations in event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const callback: () => void = (): void => {
      };
      const whitespaceVariations: string[] = [
        ' close', 'close ', ' close ', '\tclose', 'close\t', '\nclose', 'close\n'
      ];

      let allEventsRegistered = true;
      try {
        for (const eventName of whitespaceVariations) {
          writable.on(eventName, callback);
        }
      } catch (err) {
        allEventsRegistered = false;
        expect(err.code).assertEqual(undefined);
      }

      expect(allEventsRegistered).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2700
     * @tc.name      testStreamWritable05Chapter0029
     * @tc.desc      Test error event with arrow callback capturing outer scope variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableError = new TestWritableError();
      const outerValue: number = 42;
      let capturedValue: number = 0;

      const arrowCallback = (): void => {
        capturedValue = outerValue;
      };

      writable.on('error', arrowCallback);
      writable.write('test', 'utf8', (): void => {
      });

      expect(capturedValue).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2800
     * @tc.name      testStreamWritable05Chapter0030
     * @tc.desc      Test close event with CallbackHandler class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable: TestWritableBasic = new TestWritableBasic();
      const handler: CallbackHandler = new CallbackHandler();
      writable.on('close', handler.handleClose);
      writable.end();

      expect(handler.getValue()).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_2900
     * @tc.name      testStreamWritable05Chapter0033
     * @tc.desc      Test off with drain event after registration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let writableStream: stream.Writable = new TestWritableDelayed();
        let testListenerCalled: boolean = false;
        let testListener = (): void => {
          testListenerCalled = true;
        };
        writableStream.on('drain', testListener);
        writableStream.off('drain', testListener);
        let result: boolean = writableStream.write('test');
        if (!result) {
          expect(testListenerCalled).assertFalse();
        }
      } catch (err) {
        expect(err.code).assertEqual(10200035);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3000
     * @tc.name      testStreamWritable05Chapter0035
     * @tc.desc      Test off all finish listeners and verify none called
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      let testListener1Called: boolean = false;
      let testListener2Called: boolean = false;
      let testListener1 = (): void => {
        testListener1Called = true;
      };
      let testListener2 = (): void => {
        testListener2Called = true;
      };
      writableStream.on('finish', testListener1);
      writableStream.on('finish', testListener2);
      writableStream.off('finish');
      writableStream.end();
      setTimeout(() => {
        expect(testListener1Called).assertFalse();
        expect(testListener2Called).assertFalse();
      }, 10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3100
     * @tc.name      testStreamWritable05Chapter0036
     * @tc.desc      Test off with empty string event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();

      try {
        writableStream.off('');
      } catch (err) {
        expect(err.code).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3200
     * @tc.name      testStreamWritable05Chapter0037
     * @tc.desc      Test off with exclamation mark event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        writableStream.off('!');
        expect(writableStream.writable).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3300
     * @tc.name      testStreamWritable05Chapter0038
     * @tc.desc      Test off with full printable ASCII as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        writableStream.off('!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
        expect(writableStream.writable).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3400
     * @tc.name      testStreamWritable05Chapter0039
     * @tc.desc      Test off with doubled special characters as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        writableStream.off('!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~');
        expect(writableStream.writable).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3500
     * @tc.name      testStreamWritable05Chapter0040
     * @tc.desc      Test off with bell character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        let bellChar: string = '\x07';
        writableStream.off(bellChar);
        expect(writableStream.writable).assertTrue();
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3600
     * @tc.name      testStreamWritable05Chapter0041
     * @tc.desc      Test off with backspace character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        let backspaceChar: string = '\x08';
        writableStream.off(backspaceChar);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3700
     * @tc.name      testStreamWritable05Chapter0042
     * @tc.desc      Test off with form feed character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        let formFeedChar: string = '\x0C';
        writableStream.off(formFeedChar);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3800
     * @tc.name      testStreamWritable05Chapter0043
     * @tc.desc      Test off with newline character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        writableStream.off('\n');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_3900
     * @tc.name      testStreamWritable05Chapter0044
     * @tc.desc      Test off with carriage return character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        writableStream.off('\r');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4000
     * @tc.name      testStreamWritable05Chapter0045
     * @tc.desc      Test off with tab character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        writableStream.off('\t');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4100
     * @tc.name      testStreamWritable05Chapter0046
     * @tc.desc      Test off with vertical tab character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        let verticalTabChar: string = '\x0B';
        writableStream.off(verticalTabChar);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4200
     * @tc.name      testStreamWritable05Chapter0047
     * @tc.desc      Test off with backslash character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        writableStream.off('\\');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4300
     * @tc.name      testStreamWritable05Chapter0048
     * @tc.desc      Test off with single quote character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        writableStream.off("'");
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4400
     * @tc.name      testStreamWritable05Chapter0049
     * @tc.desc      Test off with double quote character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        writableStream.off('"');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4500
     * @tc.name      testStreamWritable05Chapter0050
     * @tc.desc      Test off with question mark character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        writableStream.off('?');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4600
     * @tc.name      testStreamWritable05Chapter0051
     * @tc.desc      Test off with null character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        let nullChar: string = '\x00';
        writableStream.off(nullChar);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4700
     * @tc.name      testStreamWritable05Chapter0052
     * @tc.desc      Test off with octal character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        let octalChar: string = '\x41';
        writableStream.off(octalChar);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4800
     * @tc.name      testStreamWritable05Chapter0053
     * @tc.desc      Test off with hex character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        let hexChar: string = '\x41';
        writableStream.off(hexChar);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_4900
     * @tc.name      testStreamWritable05Chapter0054
     * @tc.desc      Test off with emoji character as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        writableStream.off('👆');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_5000
     * @tc.name      testStreamWritable05Chapter0055
     * @tc.desc      Test off with multiple emoji characters as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        writableStream.off('👿👀💯🎅😼🔧💇');
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTFIVE_5100
     * @tc.name      testStreamWritable05Chapter0056
     * @tc.desc      Test off with invalid Unicode code point as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable05Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritableBasic();
      try {
        let invalidUnicode: string = String.fromCodePoint(0xDC04);
        writableStream.off(invalidUnicode);
        expect(writableStream.writable).assertEqual(true);
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });
  })
}
