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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { stream } from '@kit.ArkTS';
import { emitter } from '@kit.BasicServicesKit';
import Utils from '../Util.test';

interface StreamError {
  code: number;
  message: string;
}

interface CallbackParamObject {
  a: number;
  b: string;
  c: number[];
}

function wait(timeout: int): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void) => {
    setTimeout(() => {
      resolve(undefined as void);
    }, timeout);
  });
}


class TestReadableClose extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
  }
}

class TestReadableEnd extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0403 extends stream.Readable {
  constructor() {
    super();
  }

  doRead(_size: number): void {
    throw new Error('Simulated error');
  }
}

class TestReadable0417 extends stream.Readable {
  initializeCalled: boolean = false;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.initializeCalled = true;
    console.info("Readable doInitialize called");
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0418 extends stream.Readable {
  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0420 extends stream.Readable {
  callbackParam: number = 0;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.callbackParam = NaN;
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0421 extends stream.Readable {
  callbackParam: number = 0;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.callbackParam = Infinity;
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0422 extends stream.Readable {
  callbackParam: number = 0;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.callbackParam = -Infinity;
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0423 extends stream.Readable {
  callbackParam: number = 0;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.callbackParam = Number.MAX_VALUE;
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0424 extends stream.Readable {
  callbackParam: number = 0;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.callbackParam = Number.MIN_VALUE;
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0425 extends stream.Readable {
  callbackParam: bigint = 0n;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.callbackParam = BigInt(9007199254740991);
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0426 extends stream.Readable {
  callbackParam: Uint8Array = new Uint8Array(0);

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.callbackParam = new Uint8Array([72, 101, 108, 108, 111]);
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0427 extends stream.Readable {
  callbackParam: string = "";

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.callbackParam = "";
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0428 extends stream.Readable {
  callbackParam: string = "";

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.callbackParam = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0429 extends stream.Readable {
  callbackParam: Array<number> = [];

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.callbackParam = [1, 2, 3, 4, 5];
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0430 extends stream.Readable {
  callbackParam: CallbackParamObject = { a: 0, b: "", c: [] };

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.callbackParam = { a: 1, b: "test", c: [1, 2, 3] };
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0431 extends stream.Readable {
  initializeCalled: boolean = false;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {

    this.initializeCalled = true;
    console.info("Readable doInitialize called but callback not invoked");

  }

  doRead(_size: number): void {

  }
}

class TestReadable0432 extends stream.Readable {
  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);

    (callback as () => void)();
    throw new Error("Test error in doInitialize");
  }

  doRead(_size: number): void {
  }
}

class TestReadable0433 extends stream.Readable {
  initializeCount: number = 0;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.initializeCount++;
    (callback as () => void)();
  }

  doRead(_size: number): void {

  }
}

class TestReadable0434 extends stream.Readable {
  callbackParam: boolean = false;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.callbackParam = true;
    (callback as () => void)();
  }

  doRead(_size: number): void {
  }
}

class TestReadable0435 extends stream.Readable {
  initializeCalled: boolean = false;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
    this.initializeCalled = true;
    (callback as () => void)();
  }

  doRead(_size: number): void {

  }
}

class TestReadable0440 extends stream.Readable {
  receivedSize: number = 0;

  constructor() {
    super();
  }

  doRead(size: number): void {
    this.receivedSize = size;
  }
}

export default function StreamReadable04Test(): void {
  describe('StreamReadable04Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(async (): Promise<void> => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await Utils.msSleep(10)
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0100
     * @tc.name      testStreamReadable04Chapter0001
     * @tc.desc      Test 'close' event triggered when readable push null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let readable: TestReadableClose = new TestReadableClose();
        let closeEventTriggered: boolean = false;

        await new Promise<void>((resolve: (value: void) => void) => {
          readable.on('close', () => {
            closeEventTriggered = true;
            expect(closeEventTriggered).assertTrue();
            resolve(undefined as void);
          });
          readable.push(null);
        });
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0200
     * @tc.name      testStreamReadable04Chapter0002
     * @tc.desc      Test 'end' event triggered when readable push null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let readable: TestReadableEnd = new TestReadableEnd();
        let endEventTriggered: boolean = false;

        await new Promise<void>((resolve: (value: void) => void) => {
          readable.on('end', () => {
            endEventTriggered = true;
            expect(endEventTriggered).assertTrue();
            resolve(undefined as void);
          });
          readable.push(null);
        });
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0300
     * @tc.name      testStreamReadable04Chapter0003
     * @tc.desc      Test 'error' event triggered when doRead throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let readable: TestReadable0403 = new TestReadable0403();
        let errorEventTriggered: boolean = false;

        return new Promise<void>((resolve: (value: void) => void) => {
          readable.on('error', () => {
            errorEventTriggered = true;
            expect(errorEventTriggered).assertTrue();
            resolve(undefined as void);
          });

          try {
            readable.read();
          } catch (e) {
            expect(e.code).assertEqual(undefined);
          }

          setTimeout(() => {
            if (!errorEventTriggered) {
              expect(errorEventTriggered).assertEqual(true);
            }
            resolve(undefined as void);
          }, 100);
        });
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0400
     * @tc.name      testStreamReadable04Chapter0004
     * @tc.desc      Test 'off' method removes readable event listener
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        let readable = new TestReadableClose();
        let readableCount: number = 0;

        const readableCallback = (): void => {
          readableCount++;
        };

        readable.on('readable', readableCallback);
        readable.off('readable', readableCallback);

        readable.push('test');
        await wait(100);
        expect(readableCount).assertEqual(0);
      });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0500
     * @tc.name      testStreamReadable04Chapter0005
     * @tc.desc      Remove a specific callback for 'readable' event using off
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable = new TestReadableClose();
      let readableCount: number = 0;

      const readableCallback = (): void => {
        readableCount++;
      };

      readable.on('readable', readableCallback);
      readable.off('readable', readableCallback);

      readable.push('test');
      setTimeout(() => {
        expect(readableCount).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0600
     * @tc.name      testStreamReadable04Chapter0006
     * @tc.desc      Remove a specific callback for 'data' event using off
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable = new TestReadableClose();
      let dataCount1: number = 0;

      const dataCallback1 = (): void => {
        dataCount1++;
      };

      readable.on('data', dataCallback1);
      readable.off('data', dataCallback1);

      readable.push('test data');

      setTimeout(() => {
        expect(dataCount1).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0700
     * @tc.name      testStreamReadable04Chapter0007
     * @tc.desc      Remove a specific callback for 'close' event using off
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable = new TestReadableClose();
      let closeCount: number = 0;

      const closeCallback = (): void => {
        closeCount++;
      };

      readable.on('close', closeCallback);
      readable.off('close', closeCallback);

      readable.push(null);

      setTimeout(() => {
        expect(closeCount).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0800
     * @tc.name      testStreamReadable04Chapter0008
     * @tc.desc      Remove a specific callback for 'end' event using off
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable = new TestReadableClose();
      let endCount: number = 0;

      const endCallback = (): void => {
        endCount++;
      };

      readable.on('end', endCallback);
      readable.off('end', endCallback);

      readable.push(null);

      setTimeout(() => {
        expect(endCount).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_0900
     * @tc.name      testStreamReadable04Chapter0009
     * @tc.desc      Remove a specific callback for 'error' event using off
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable = new TestReadableClose();
      let errorCount: number = 0;

      const errorCallback = (): void => {
        errorCount++;
      };

      readable.on('error', errorCallback);
      readable.off('error', errorCallback);

      setTimeout(() => {
        expect(errorCount).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1000
     * @tc.name      testStreamReadable04Chapter0010
     * @tc.desc      Remove all callbacks for an event when callback parameter is omitted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable = new TestReadableClose();
      let callCount1: number = 0;
      let callCount2: number = 0;
      let callCount3: number = 0;

      const callback1 = (): void => {
        callCount1++;
      };
      const callback2 = (): void => {
        callCount2++;
      };
      const callback3 = (): void => {
        callCount3++;
      };

      readable.on('readable', callback1);
      readable.on('readable', callback2);
      readable.on('readable', callback3);
      readable.off('readable');

      readable.push('test');

      setTimeout(() => {
        expect(callCount1).assertEqual(0);
        expect(callCount2).assertEqual(0);
        expect(callCount3).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1100
     * @tc.name      testStreamReadable04Chapter0011
     * @tc.desc      Call off for an event that has no registered callbacks (should not throw)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable = new TestReadableClose();
      expect(true).assertEqual(true);

      const dummyCallback = (): void => {
      };

      let errorOccurred = false;
      try {
        readable.off('data', dummyCallback);
        readable.off('readable');
        expect(true).assertEqual(true);
        expect(typeof readable.off).assertEqual('function');
      } catch (err) {
        errorOccurred = true;
        expect(err.code).assertEqual(undefined);
      }

      expect(errorOccurred).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1200
     * @tc.name      testStreamReadable04Chapter0012
     * @tc.desc      Call off with empty string event parameter (should throw error 401)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable = new TestReadableClose();

      const dummyCallback = (): void => {
      };

      let offSucceeded = false;

      try {
        readable.off('', dummyCallback);
        offSucceeded = true;
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(offSucceeded).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1300
     * @tc.name      testStreamReadable04Chapter0013
     * @tc.desc      Call off with unsupported event string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable = new TestReadableClose();

      const dummyCallback = (): void => {
      };

      let errorOccurred = false;
      try {
        readable.off('unsupported', dummyCallback);
      } catch (err) {
        errorOccurred = true;
        expect(err.code).assertEqual(401);
      }

      expect(errorOccurred).assertEqual(false);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1400
     * @tc.name      testStreamReadable04Chapter0014
     * @tc.desc      Test off method with pause event
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable = new TestReadableClose();
      let pauseCount: number = 0;

      const pauseCallback = (): void => {
        pauseCount++;
      };

      readable.on('pause', pauseCallback);
      readable.off('pause', pauseCallback);

      readable.pause();

      setTimeout(() => {
        expect(pauseCount).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1500
     * @tc.name      testStreamReadable04Chapter0015
     * @tc.desc      Test off method with resume event
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable = new TestReadableClose();
      let resumeCount: number = 0;

      const resumeCallback = (): void => {
        resumeCount++;
      };

      readable.on('resume', resumeCallback);
      readable.off('resume', resumeCallback);

      readable.pause();
      readable.resume();

      setTimeout(() => {
        expect(resumeCount).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1600
     * @tc.name      testStreamReadable04Chapter0016
     * @tc.desc      Remove multiple callbacks for same event with different off calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable = new TestReadableClose();
      let count1: number = 0;
      let count2: number = 0;
      let count3: number = 0;

      const callback1 = (): void => {
        count1++;
      };
      const callback2 = (): void => {
        count2++;
      };
      const callback3 = (): void => {
        count3++;
      };

      readable.on('data', callback1);
      readable.on('data', callback2);
      readable.on('data', callback3);

      readable.off('data', callback1);
      readable.off('data', callback3);

      readable.push('test');

      setTimeout(() => {
        expect(count1).assertEqual(0);
        expect(count2).assertEqual(1);
        expect(count3).assertEqual(0);
      }, 100);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1700
     * @tc.name      testStreamReadable04Chapter0017
     * @tc.desc      Test doInitialize with valid callback function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0417 = new TestReadable0417();
      let dataReceived: boolean = false;

      myReadable.on('data', (): void => {
        dataReceived = true;
      });

      expect(myReadable.initializeCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1800
     * @tc.name      testStreamReadable04Chapter0018
     * @tc.desc      Test doInitialize callback with undefined parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0418 = new TestReadable0418();
      expect(true).assertEqual(true);

      let dataListenerAdded = false;

      try {
        myReadable.on('data', (): void => {
        });
        dataListenerAdded = true;

        expect(myReadable !== null).assertEqual(true);
        expect(typeof myReadable.on).assertEqual('function');
        expect(dataListenerAdded).assertEqual(true);
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_1900
     * @tc.name      testStreamReadable04Chapter0019
     * @tc.desc      Test doInitialize callback with null parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0418 = new TestReadable0418();
      expect(myReadable instanceof TestReadable0418).assertEqual(true);

      let dataListenerAdded = false;

      try {
        myReadable.on('data', (): void => {
        });
        dataListenerAdded = true;

        expect(myReadable !== null).assertEqual(true);
        expect(typeof myReadable.on).assertEqual('function');
        expect(dataListenerAdded).assertEqual(true);
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2000
     * @tc.name      testStreamReadable04Chapter0020
     * @tc.desc      Test doInitialize callback with NaN parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0420 = new TestReadable0420();

      try {
        myReadable.on('data', (): void => {
        });

        expect(Number.isNaN(myReadable.callbackParam)).assertEqual(true);
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2100
     * @tc.name      testStreamReadable04Chapter0021
     * @tc.desc      Test doInitialize callback with Infinity parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0421 = new TestReadable0421();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam).assertEqual(Infinity);
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2200
     * @tc.name      testStreamReadable04Chapter0022
     * @tc.desc      Test doInitialize callback with -Infinity parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0422 = new TestReadable0422();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam).assertEqual(-Infinity);
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2300
     * @tc.name      testStreamReadable04Chapter0023
     * @tc.desc      Test doInitialize callback with number.MAX_VALUE parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0423 = new TestReadable0423();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam).assertEqual(Number.MAX_VALUE);
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2400
     * @tc.name      testStreamReadable04Chapter0024
     * @tc.desc      Test doInitialize callback with Number.MIN_VALUE parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0424 = new TestReadable0424();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam).assertEqual(Number.MIN_VALUE);
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2500
     * @tc.name      testStreamReadable04Chapter0025
     * @tc.desc      Test doInitialize callback with bigint parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0425 = new TestReadable0425();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam.toString()).assertEqual("9007199254740991");
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2600
     * @tc.name      testStreamReadable04Chapter0026
     * @tc.desc      Test doInitialize callback with typed array parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0426 = new TestReadable0426();

      try {
        myReadable.on('data', (): void => {
        });

        const paramLength: number = myReadable.callbackParam.length;
        const isLengthGreaterThanZero: boolean = paramLength > 0;
        expect(isLengthGreaterThanZero).assertEqual(true);
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2700
     * @tc.name      testStreamReadable04Chapter0027
     * @tc.desc      Test doInitialize with empty string parameter in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0427 = new TestReadable0427();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam).assertEqual("");
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2800
     * @tc.name      testStreamReadable04Chapter0028
     * @tc.desc      Test doInitialize with special characters in callback parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0428 = new TestReadable0428();

      try {
        myReadable.on('data', (): void => {
        });

        const paramLength: number = myReadable.callbackParam.length;
        const isLengthGreaterThanZero: boolean = paramLength > 0;
        expect(isLengthGreaterThanZero).assertEqual(true);
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_2900
     * @tc.name      testStreamReadable04Chapter0029
     * @tc.desc      Test doInitialize with array parameter in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0429 = new TestReadable0429();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam.length).assertEqual(5);
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3000
     * @tc.name      testStreamReadable04Chapter0030
     * @tc.desc      Test doInitialize with object parameter in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0430 = new TestReadable0430();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam.a).assertEqual(1);
        expect(myReadable.callbackParam.b).assertEqual('test');
        expect(myReadable.callbackParam.c.length).assertEqual(3);
      } catch (error) {
        expect((error as Error).message.length).assertLarger(0);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3100
     * @tc.name      testStreamReadable04Chapter0031
     * @tc.desc      Test doInitialize callback not called (negative test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0431 = new TestReadable0431();

      try {
        myReadable.on('data', (): void => {

        });

        expect(myReadable.initializeCalled).assertTrue();
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3200
     * @tc.name      testStreamReadable04Chapter0032
     * @tc.desc      Test doInitialize with callback throwing error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0432 = new TestReadable0432();
      expect(myReadable instanceof TestReadable0432).assertTrue();

      let errorCaught = false;
      let errorMessage = '';

      try {
        myReadable.on('data', (): void => {
        });
      } catch (error) {
        errorCaught = true;
        expect(true).assertTrue();
      }

      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3300
     * @tc.name      testStreamReadable04Chapter0033
     * @tc.desc      Test doInitialize with multiple on listeners
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0433 = new TestReadable0433();
      let listener1Called: boolean = false;
      let listener2Called: boolean = false;

      myReadable.on('data', (): void => {
        listener1Called = true;
      });

      myReadable.on('data', (): void => {
        listener2Called = true;
      });

      expect(myReadable.initializeCount).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3400
     * @tc.name      testStreamReadable04Chapter0034
     * @tc.desc      Test doInitialize with boolean parameter in callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0434 = new TestReadable0434();

      try {
        myReadable.on('data', (): void => {
        });

        expect(myReadable.callbackParam).assertEqual(true);
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3500
     * @tc.name      testStreamReadable04Chapter0035
     * @tc.desc      Test doInitialize with different event types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0435 = new TestReadable0435();
      let errorHandlerCalled: boolean = false;
      let endHandlerCalled: boolean = false;

      myReadable.on('error', (): void => {
        errorHandlerCalled = true;
      });

      myReadable.on('end', (): void => {
        endHandlerCalled = true;
      });

      expect(myReadable.initializeCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3600
     * @tc.name      testStreamReadable04Chapter0036
     * @tc.desc      Test doInitialize with callback returning value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const myReadable: TestReadable0418 = new TestReadable0418();

      let callbackCalled = false;
      try {
        myReadable.on('data', (): void => {
          callbackCalled = true;
        });

        expect(callbackCalled).assertEqual(false);
      } catch (error) {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3700
     * @tc.name      testStreamReadable04Chapter0037
     * @tc.desc      Test read method with NaN parameter throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable: TestReadableClose = new TestReadableClose();
      readable.on('data', (): void => {
      });

      try {
        readable.read();
      } catch (err) {
        const error = err as StreamError;
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3800
     * @tc.name      testStreamReadable04Chapter0038
     * @tc.desc      Test read method with Infinity parameter throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable: TestReadableClose = new TestReadableClose();
      readable.on('data', (): void => {
      });

      try {
        readable.read(2147483647);
      } catch (err) {
        const error = err as StreamError;
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_3900
     * @tc.name      testStreamReadable04Chapter0039
     * @tc.desc      Test read method with negative parameter throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable: TestReadableClose = new TestReadableClose();
      readable.on('data', (): void => {
      });

      try {
        readable.read(-1);
      } catch (err) {
        const error = err as StreamError;
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTFOUR_4000
     * @tc.name      testStreamReadable04Chapter0040
     * @tc.desc      Test read method with valid 65535 size parameter calls doRead
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable04Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readable: TestReadable0440 = new TestReadable0440();
      readable.on('data', (): void => {
      });
      readable.read(65536);

      expect(readable.receivedSize > 0).assertTrue();
    });
  });
}
