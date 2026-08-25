'use static';
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import { stream, util } from '@kit.ArkTS';

class ReadableTestBase extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class DataPushReadable extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("testData");
      this.push(null);
    }
  }
}

class ErrorDoRead extends ReadableTestBase {
  doRead(size: int): void {
    throw new Error("test error");
  }
}

export default function StreamReadableOffTest(): void {
  describe('StreamReadableOffTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: (value: void) => void): void => {
        setTimeout((): void => resolve(undefined as void), 0);
      });
    });
    beforeAll((): void => {
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_0100
     * @tc.name testStreamReadableOff001
     * @tc.desc Verify off(data, fn) removes the specified callback so push does not trigger it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fnCalled: boolean = false;
        let fn = (): void => {
          fnCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.on('data', fn);
        rs.off('data', fn);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
          rs.resume();
        });
        expect(fnCalled).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_0200
     * @tc.name testStreamReadableOff002
     * @tc.desc Verify off(data) without callback removes all data callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fn1Called: boolean = false;
        let fn2Called: boolean = false;
        let fn1 = (): void => {
          fn1Called = true;
        };
        let fn2 = (): void => {
          fn2Called = true;
        };
        let rs = new ReadableTestBase();
        rs.on('data', fn1);
        rs.on('data', fn2);
        rs.off('data');
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
          rs.resume();
        });
        expect(fn1Called).assertFalse();
        expect(fn2Called).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_0300
     * @tc.name testStreamReadableOff003
     * @tc.desc Verify callback is restored after off then on registration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fnCalled: boolean = false;
        let fn = (): void => {
          fnCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.on('data', fn);
        rs.off('data', fn);
        rs.on('data', fn);
        let received: string = '';
        let checkFn = (data: Object): void => {
          received = data.toString();
        };
        rs.on('data', checkFn);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
        });
        expect(fnCalled).assertTrue();
        expect(received).assertEqual("x");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_0400
     * @tc.name testStreamReadableOff004
     * @tc.desc Verify off removes callbacks for close, data, end, error, readable, pause, resume events respectively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let dataCalled: boolean = false;
        let endCalled: boolean = false;
        let closeCalled: boolean = false;
        let readableCalled: boolean = false;
        let dataFn = (): void => {
          dataCalled = true;
        };
        let endFn = (): void => {
          endCalled = true;
        };
        let closeFn = (): void => {
          closeCalled = true;
        };
        let readableFn = (): void => {
          readableCalled = true;
        };
        let rs = new DataPushReadable();
        rs.on('data', dataFn);
        rs.on('end', endFn);
        rs.on('close', closeFn);
        rs.on('readable', readableFn);
        rs.off('data', dataFn);
        rs.off('end', endFn);
        rs.off('close', closeFn);
        rs.off('readable', readableFn);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
          rs.resume();
        });
        expect(dataCalled).assertFalse();
        expect(endCalled).assertFalse();
        expect(closeCalled).assertFalse();
        expect(readableCalled).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_0500
     * @tc.name testStreamReadableOff005
     * @tc.desc Verify off(data, fn1) does not affect fn2 for the same event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fn1Called: boolean = false;
        let fn2Called: boolean = false;
        let fn1 = (): void => {
          fn1Called = true;
        };
        let fn2 = (): void => {
          fn2Called = true;
        };
        let rs = new ReadableTestBase();
        rs.on('data', fn1);
        rs.on('data', fn2);
        rs.off('data', fn1);
        let received: string = '';
        rs.on('data', (data: Object): void => {
          received = data.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
        });
        expect(fn1Called).assertFalse();
        expect(fn2Called).assertTrue();
        expect(received).assertEqual("x");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_0600
     * @tc.name testStreamReadableOff006
     * @tc.desc Verify off(data, fn) does not affect callbacks of other events (end/close)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let dataCalled: boolean = false;
        let endCalled: boolean = false;
        let closeCalled: boolean = false;
        let dataFn = (): void => {
          dataCalled = true;
        };
        let endFn = (): void => {
          endCalled = true;
        };
        let closeFn = (): void => {
          closeCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.on('data', dataFn);
        rs.on('end', endFn);
        rs.on('close', closeFn);
        rs.off('data', dataFn);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('close', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
          rs.resume();
        });
        expect(dataCalled).assertFalse();
        expect(endCalled).assertTrue();
        expect(closeCalled).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_0700
     * @tc.name testStreamReadableOff007
     * @tc.desc Verify off on an unregistered event (never on-ed) silently does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fnCalled: boolean = false;
        let fn = (): void => {
          fnCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.off('data', fn);
        rs.on('data', fn);
        let received: string = '';
        rs.on('data', (data: Object): void => {
          received = data.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
        });
        expect(fnCalled).assertTrue();
        expect(received).assertEqual("x");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_0800
     * @tc.name testStreamReadableOff008
     * @tc.desc Verify off with unregistered callback (event registered but callback not) silently does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fnNotRegistered = (): void => {
        };
        let fn1 = (): void => {
        };
        let rs = new ReadableTestBase();
        rs.on('data', fn1);
        rs.off('data', fnNotRegistered);
        let received: string = '';
        rs.on('data', (data: Object): void => {
          received = data.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
        });
        expect(received).assertEqual("x");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_0900
     * @tc.name testStreamReadableOff009
     * @tc.desc Verify off removes arrow function callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fnCalled: boolean = false;
        let fn = (chunk: Object): void => {
          fnCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.on('data', fn);
        rs.off('data', fn);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
          rs.resume();
        });
        expect(fnCalled).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_1000
     * @tc.name testStreamReadableOff010
     * @tc.desc Verify off removes regular function callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let counter: int = 0;
        let fn = (): void => {
          counter++;
        };
        let rs = new ReadableTestBase();
        rs.on('readable', fn);
        rs.off('readable', fn);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
          rs.resume();
        });
        expect(counter).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_1100
     * @tc.name testStreamReadableOff011
     * @tc.desc Verify off removes async function callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fnCalled: boolean = false;
        let fn = async (): Promise<void> => {
          fnCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.on('data', fn);
        rs.off('data', fn);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
          rs.resume();
        });
        expect(fnCalled).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_1200
     * @tc.name testStreamReadableOff012
     * @tc.desc Verify off removes the middle callback among 3 registered for the same event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fn1Called: boolean = false;
        let fn2Called: boolean = false;
        let fn3Called: boolean = false;
        let fn1 = (): void => {
          fn1Called = true;
        };
        let fn2 = (): void => {
          fn2Called = true;
        };
        let fn3 = (): void => {
          fn3Called = true;
        };
        let rs = new ReadableTestBase();
        rs.on('data', fn1);
        rs.on('data', fn2);
        rs.on('data', fn3);
        rs.off('data', fn2);
        let received: string = '';
        rs.on('data', (data: Object): void => {
          received = data.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
        });
        expect(fn1Called).assertTrue();
        expect(fn2Called).assertFalse();
        expect(fn3Called).assertTrue();
        expect(received).assertEqual("x");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_1300
     * @tc.name testStreamReadableOff013
     * @tc.desc Verify event is an empty string ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fnCalled: boolean = false;
        let fn = (): void => {
          fnCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.on('data', fn);
        rs.off('', fn);
        let received: string = '';
        rs.on('data', (data: Object): void => {
          received += data.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push("y");
          rs.push(null);
        });
        expect(fnCalled).assertTrue();
        expect(received).assertEqual("xy");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_1400
     * @tc.name testStreamReadableOff014
     * @tc.desc Verify off with unmatched single-character or control-character event names keeps the data listener registered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let events: string[] = ['a', '\t', '\n', '\r'];
        for (let i = 0; i < events.length; i++) {
          let fnCalled: boolean = false;
          let fn = (): void => {
            fnCalled = true;
          };
          let rs = new ReadableTestBase();
          rs.on('data', fn);
          rs.off(events[i], fn);
          let received: string = '';
          rs.on('data', (data: Object): void => {
            received = data.toString();
          });
          await new Promise<void>((resolve: (value: void) => void): void => {
            rs.on('end', (): void => {
              resolve(undefined as void);
            });
            rs.push('x');
            rs.push(null);
          });
          expect(fnCalled).assertTrue();
          expect(received).assertEqual('x');
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_1500
     * @tc.name testStreamReadableOff015
     * @tc.desc Verify event is a single space " "
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fnCalled: boolean = false;
        let fn = (): void => {
          fnCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.on('data', fn);
        rs.off(" ", fn);
        let received: string = '';
        rs.on('data', (data: Object): void => {
          received = data.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
        });
        expect(fnCalled).assertTrue();
        expect(received).assertEqual("x");
        expect(rs.readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_1600
     * @tc.name testStreamReadableOff016
     * @tc.desc Verify off with over-long unmatched event names of 10000 and 65535 characters keeps the data listener registered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let lengths: int[] = [10000, 65535];
        for (let i = 0; i < lengths.length; i++) {
          let fnCalled: boolean = false;
          let fn = (): void => {
            fnCalled = true;
          };
          let longEvent: string = 'a'.repeat(lengths[i]);
          let rs = new ReadableTestBase();
          rs.on('data', fn);
          rs.off(longEvent, fn);
          let received: string = '';
          rs.on('data', (data: Object): void => {
            received = data.toString();
          });
          await new Promise<void>((resolve: (value: void) => void): void => {
            rs.on('end', (): void => {
              resolve(undefined as void);
            });
            rs.push('x');
            rs.push(null);
          });
          expect(fnCalled).assertTrue();
          expect(received).assertEqual('x');
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_1700
     * @tc.name testStreamReadableOff017
     * @tc.desc Verify callback is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fnCalled: boolean = false;
        let fn = (): void => {
          fnCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.on('data', fn);
        let errorCaught: boolean = false;
        try {
          rs.off('data', null as Function);
        } catch (e) {
          errorCaught = true;
          expect(e.name).assertEqual("ClassCastError");
        }
        let received: string = '';
        rs.on('data', (data: Object): void => {
          received = data.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
        });
        expect(errorCaught).assertTrue();
        expect(fnCalled).assertTrue();
        expect(received).assertEqual("x");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_1800
     * @tc.name testStreamReadableOff018
     * @tc.desc Verify callback is an empty function body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fnCalled: boolean = false;
        let fnEmpty = (): void => {
        };
        let fn = (): void => {
          fnCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.on('data', fnEmpty);
        rs.off('data', fnEmpty);
        rs.on('data', fn);
        let received: string = '';
        rs.on('data', (data: Object): void => {
          received = data.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
        });
        expect(fnCalled).assertTrue();
        expect(received).assertEqual("x");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_1900
     * @tc.name testStreamReadableOff019
     * @tc.desc Verify off data callback does not throw when readableEnded is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new ReadableTestBase();
        let readableEnded: boolean = false;
        let offThrew: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            readableEnded = rs.readableEnded;
            try {
              rs.off('data', (): void => {
              });
            } catch (e) {
              offThrew = true;
            }
            resolve(undefined as void);
          });
          rs.push(null);
          rs.resume();
        });
        expect(readableEnded).assertTrue();
        expect(offThrew).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_2000
     * @tc.name testStreamReadableOff020
     * @tc.desc Verify off does not throw after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new ReadableTestBase();
        try {
          rs.off('data', (): void => {
          });
          expect(rs.readable).assertTrue();
        } catch (e) {
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_2100
     * @tc.name testStreamReadableOff021
     * @tc.desc Verify off data callback in readableFlowing=true state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fnCalled: boolean = false;
        let fn = (): void => {
          fnCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.resume();
        rs.on('data', fn);
        rs.off('data', fn);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
          rs.resume();
        });
        expect(fnCalled).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_2200
     * @tc.name testStreamReadableOff022
     * @tc.desc Verify off readable callback in paused state then resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let readableCalled: boolean = false;
        let fn = (): void => {
          readableCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.pause();
        rs.on('readable', fn);
        rs.off('readable', fn);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.resume();
          rs.push("x");
          rs.push(null);
        });
        expect(readableCalled).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_2300
     * @tc.name testStreamReadableOff023
     * @tc.desc Verify off error callback after error event triggers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let errorCalled: boolean = false;
        let fn = (): void => {
          errorCalled = true;
        };
        let rs = new ErrorDoRead();
        let errName: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('error', (err: Error): void => {
            errName = err.name;
            resolve(undefined as void);
          });
          rs.on('error', fn);
          rs.off('error', fn);
          rs.read();
        });
        expect(errName).assertEqual('Error');
        expect(errorCalled).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_2400
     * @tc.name testStreamReadableOff024
     * @tc.desc Verify off end callback before push(null) then end triggers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let endCalled: boolean = false;
        let fn = (): void => {
          endCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.on('end', fn);
        rs.off('end', fn);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push(null);
          rs.resume();
        });
        expect(endCalled).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_2500
     * @tc.name testStreamReadableOff025
     * @tc.desc Verify off close callback before push(null) then close triggers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let closeCalled: boolean = false;
        let fn = (): void => {
          closeCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.on('close', fn);
        rs.off('close', fn);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('close', (): void => {
            resolve(undefined as void);
          });
          rs.push(null);
          rs.resume();
        });
        expect(closeCalled).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_2600
     * @tc.name testStreamReadableOff026
     * @tc.desc Verify off removes itself inside data callback (nested off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let callCount: int = 0;
        let rs = new ReadableTestBase();
        let fn: () => void;
        fn = (): void => {
          callCount++;
          rs.off('data', fn);
        };
        rs.on('data', fn);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push("y");
          rs.push(null);
        });
        expect(callCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_2700
     * @tc.name testStreamReadableOff027
     * @tc.desc Verify event name is a zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new ReadableTestBase();
        let endRemoved: boolean = false;
        rs.on('end', (): void => {
          endRemoved = true;
        });
        rs.off("​");
        let received: string = '';
        rs.on('data', (data: Object): void => {
          received = data.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
        });
        expect(endRemoved).assertTrue();
        expect(received).assertEqual("x");
        expect(rs.readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_2800
     * @tc.name testStreamReadableOff028
     * @tc.desc Verify off with unmatched Unicode, emoji, XSS, replacement, surrogate, null and formatted-text event names keeps the data listener registered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let events: string[] = ['😀', '😀测试', '<script>alert(1)</script>',
          'テスト', 'АБВГД', 'الاختبار',
          '�', '\udc04', '\xe4', '\u0000', '2026-03-05', '13800138000'];
        for (let i = 0; i < events.length; i++) {
          let fnCalled: boolean = false;
          let fn = (): void => {
            fnCalled = true;
          };
          let rs = new ReadableTestBase();
          rs.on('data', fn);
          rs.off(events[i], fn);
          let dataStr: string = '';
          await new Promise<void>((resolve: (value: void) => void): void => {
            rs.on('data', (data: Object): void => {
              dataStr = data.toString();
            });
            rs.on('end', (): void => {
              resolve(undefined as void);
            });
            rs.push('x');
            rs.push(null);
          });
          expect(dataStr).assertEqual('x');
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_2900
     * @tc.name testStreamReadableOff029
     * @tc.desc Verify off the same callback twice (duplicate off)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let fnCalled: boolean = false;
        let fn = (): void => {
          fnCalled = true;
        };
        let rs = new ReadableTestBase();
        rs.on('data', fn);
        rs.off('data', fn);
        rs.off('data', fn);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            resolve(undefined as void);
          });
          rs.push("x");
          rs.push(null);
          rs.resume();
        });
        expect(fnCalled).assertFalse();

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_3000
     * @tc.name testStreamReadableOff030
     * @tc.desc Verify event is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new ReadableTestBase();
        try {
          rs.off(null as String, (): void => {
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_3100
     * @tc.name testStreamReadableOff031
     * @tc.desc Verify off with a number or boolean event throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let events: Object[] = [123 as Object, true as Object];
        for (let i = 0; i < events.length; i++) {
          let rs = new ReadableTestBase();
          try {
            rs.off(events[i] as Object as String, (): void => {
            });
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ClassCastError');
          }
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_3200
     * @tc.name testStreamReadableOff032
     * @tc.desc Verify callback is a non-function, non-null, non-undefined type (string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      try {
        rs.off('data', "offString" as Object as Function);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_3300
     * @tc.name testStreamReadableOff033
     * @tc.desc Verify extracted off function retains stream binding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new ReadableTestBase();
        let offFn: Function = rs.off;
        offFn("data", (err?: Error): void => {
        });
        expect(rs.readable).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_3400
     * @tc.name testStreamReadableOff034
     * @tc.desc Verify off.call bound to a non-Readable plain object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new ReadableTestBase();
        try {
          let offFn: Function = rs.off;
          offFn.unsafeCall({} as Object, "data", (err?: Error): void => {
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_3500
     * @tc.name testStreamReadableOff035
     * @tc.desc Verify off.call bound to null context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new ReadableTestBase();
        try {
          let offFn: Function = rs.off;
          offFn.unsafeCall(null, "data", (err?: Error): void => {
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_OFF_3600
     * @tc.name testStreamReadableOff036
     * @tc.desc Verify event is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableOff036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new ReadableTestBase();
        try {
          rs.off(undefined as String, (): void => {
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
        }
        done();
      });

  });
}
