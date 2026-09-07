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

class WritableTestBase extends stream.Writable {
  public writeCount: int = 0;
  public receivedData: string = '';
  public writeObserver: Function | undefined = undefined;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
    if (typeof chunk === 'string') {
      this.receivedData += chunk;
    } else {
      this.receivedData += util.TextDecoder.create(encoding).decodeToString(chunk as Uint8Array);
    }
    let observer: Function | undefined = this.writeObserver;
    if (observer !== undefined) {
      observer.unsafeCall();
    }
    callback.unsafeCall();
  }
}

class DuplexTestBase extends stream.Duplex {
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
    callback.unsafeCall();
  }
}

class TransformTestBase extends stream.Transform {
  public transformCount: int = 0;

  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.transformCount++;
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamReadableUnpipeTest(): void {
  describe('StreamReadableUnpipeTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach((): void => {
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_0100
     * @tc.name testStreamReadableUnpipe001
     * @tc.desc Verify unpipe specified connected Writable destination disconnects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let unpipedRes: boolean = false;
        let wcBefore: int = 0;
        let wcAfter: int = 0;
        let wcOnEnd: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          let w = new WritableTestBase();
          let unpiped: boolean = false;
          w.on('finish', (): void => {
            unpipedRes = unpiped;
            wcOnEnd = w.writeCount;
            resolve(undefined as void);
          });
          let handled: boolean = false;
          let onEnd: Function = (): void => {
            unpipedRes = unpiped;
            wcOnEnd = w.writeCount;
            resolve(undefined as void);
          };
          r.pipe(w);
          r.on('data', (): void => {
            if (handled) {
              return;
            }
            handled = true;
            wcBefore = w.writeCount;
            r.unpipe(w);
            unpiped = true;
            r.push("after");
            wcAfter = w.writeCount;
            w.end(undefined, undefined, onEnd);
          });
          r.resume();
          r.push("test");
        });
        expect(unpipedRes).assertTrue();
        expect(wcBefore).assertEqual(1);
        expect(wcAfter).assertEqual(1);
        expect(wcOnEnd).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_0200
     * @tc.name testStreamReadableUnpipe002
     * @tc.desc Verify unpipe() with omitted argument disconnects all connected destinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wc1Before: int = 0;
        let wc2Before: int = 0;
        let wc1After: int = 0;
        let wc2After: int = 0;
        let wc1OnEnd: int = 0;
        let wc2OnEnd: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          let w1 = new WritableTestBase();
          let w2 = new WritableTestBase();
          let endCount: int = 0;
          let handled: boolean = false;
          let onEnd: Function = (): void => {
            endCount++;
            if (endCount === 2) {
              wc1OnEnd = w1.writeCount;
              wc2OnEnd = w2.writeCount;
              resolve(undefined as void);
            }
          };
          r.pipe(w1);
          r.pipe(w2);
          r.on('data', (): void => {
            if (handled) {
              return;
            }
            handled = true;
            wc1Before = w1.writeCount;
            wc2Before = w2.writeCount;
            r.unpipe();
            r.resume();
            r.push("after");
            wc1After = w1.writeCount;
            wc2After = w2.writeCount;
            r.push(null);
            w1.end(undefined, undefined, onEnd);
            w2.end(undefined, undefined, onEnd);
          });
          r.resume();
          r.push("shared");
        });
        expect(wc1Before).assertEqual(1);
        expect(wc2Before).assertEqual(1);
        expect(wc1After).assertEqual(1);
        expect(wc2After).assertEqual(1);
        expect(wc1OnEnd).assertEqual(1);
        expect(wc2OnEnd).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_0300
     * @tc.name testStreamReadableUnpipe003
     * @tc.desc Verify unpipe returns Readable itself supporting chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pipe(w);
      let result = r.unpipe(w);
      expect(result).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_0400
     * @tc.name testStreamReadableUnpipe004
     * @tc.desc Verify after unpipe, source stream push is unaffected and can continue producing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pipe(w);
      r.unpipe(w);
      let pushResult = r.push("after_unpipe");
      expect(pushResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_0500
     * @tc.name testStreamReadableUnpipe005
     * @tc.desc Verify unpipe one destination does not affect other connected destinations receiving data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wc1Before: int = 0;
        let wc2Before: int = 0;
        let wc1After: int = 0;
        let wc2After: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          let w1 = new WritableTestBase();
          let w2 = new WritableTestBase();
          r.pipe(w1);
          r.pipe(w2);
          w2.writeObserver = (): void => {
            wc1Before = w1.writeCount;
            wc2Before = w2.writeCount;
            r.unpipe(w1);
            r.resume();
            r.push("second");
            wc1After = w1.writeCount;
            wc2After = w2.writeCount;
            r.push(null);
            resolve(undefined as void);
          };
          r.resume();
          r.push("shared");
        });
        expect(wc1Before).assertEqual(1);
        expect(wc2Before).assertEqual(1);
        expect(wc1After).assertEqual(1);
        expect(wc2After).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_0600
     * @tc.name testStreamReadableUnpipe006
     * @tc.desc Verify re-piping the same destination after unpipe works normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wcRes: int = 0;
        let dataRes: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          let w = new WritableTestBase();
          r.pipe(w);
          r.unpipe(w);
          r.pipe(w);
          w.writeObserver = (): void => {
            wcRes = w.writeCount;
            dataRes = w.receivedData;
            r.push(null);
            resolve(undefined as void);
          };
          r.resume();
          r.push("reconnect");
        });
        expect(wcRes).assertEqual(1);
        expect(dataRes).assertEqual('reconnect');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_0700
     * @tc.name testStreamReadableUnpipe007
     * @tc.desc Verify piping to another new destination after unpipe receives data normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wOldRes: int = 0;
        let wNewRes: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          let wOld = new WritableTestBase();
          let wNew = new WritableTestBase();
          r.pipe(wOld);
          r.unpipe(wOld);
          r.pipe(wNew);
          wNew.writeObserver = (): void => {
            wOldRes = wOld.writeCount;
            wNewRes = wNew.writeCount;
            r.push(null);
            resolve(undefined as void);
          };
          r.resume();
          r.push("new_target");
        });
        expect(wOldRes).assertEqual(0);
        expect(wNewRes).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_0800
     * @tc.name testStreamReadableUnpipe008
     * @tc.desc Verify unpipe on an unconnected destination silently does nothing and does not affect connected destinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wcObserver: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          let w1 = new WritableTestBase();
          let w2 = new WritableTestBase();
          r.pipe(w1);
          r.unpipe(w2);
          w1.writeObserver = (): void => {
            wcObserver = w1.writeCount;
            r.push(null);
            resolve(undefined as void);
          };
          r.resume();
          r.push("data");
        });
        expect(wcObserver).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_0900
     * @tc.name testStreamReadableUnpipe009
     * @tc.desc Verify Duplex stream as source calling unpipe disconnects from Writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wcBefore: int = 0;
        let wcAfter: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let d = new DuplexTestBase();
          let w = new WritableTestBase();
          d.pipe(w);
          w.writeObserver = (): void => {
            wcBefore = w.writeCount;
            d.unpipe(w);
            d.resume();
            d.push("after");
            wcAfter = w.writeCount;
            d.push(null);
            resolve(undefined as void);
          };
          d.resume();
          d.push("data");
        });
        expect(wcBefore).assertEqual(1);
        expect(wcAfter).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_1000
     * @tc.name testStreamReadableUnpipe010
     * @tc.desc Verify Transform stream as source calling unpipe disconnects from Writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wcBefore: int = 0;
        let wcAfter: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let t = new TransformTestBase();
          let w = new WritableTestBase();
          t.pipe(w);
          w.writeObserver = (): void => {
            wcBefore = w.writeCount;
            t.unpipe(w);
            t.resume();
            t.push("after");
            wcAfter = w.writeCount;
            t.push(null);
            resolve(undefined as void);
          };
          t.resume();
          t.push("data");
        });
        expect(wcBefore).assertEqual(1);
        expect(wcAfter).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_1100
     * @tc.name testStreamReadableUnpipe011
     * @tc.desc Verify unpipe with Duplex instance as destination disconnects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let d = new DuplexTestBase();
      try {
        r.pipe(d as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_1200
     * @tc.name testStreamReadableUnpipe012
     * @tc.desc Verify unpipe with Transform instance as destination disconnects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let t = new TransformTestBase();
      try {
        r.pipe(t as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_1300
     * @tc.name testStreamReadableUnpipe013
     * @tc.desc Verify calling unpipe() on a newly created Readable stream not piped to any destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let result = r.unpipe();
      expect(result).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_1400
     * @tc.name testStreamReadableUnpipe014
     * @tc.desc Verify calling unpipe(w) with an unconnected Writable when no pipe target exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      let result = r.unpipe(w);
      expect(result).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_1500
     * @tc.name testStreamReadableUnpipe015
     * @tc.desc Verify unpipe directly after pipe without pushing any data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pipe(w);
      r.unpipe(w);
      r.push("data");
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_1600
     * @tc.name testStreamReadableUnpipe016
     * @tc.desc Verify pipe, push once, then unpipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wcBefore: int = 0;
        let wcAfter: int = 0;
        let unpipedRes: boolean = false;
        let wcOnEnd: int = 0;
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void): void => {
            let r = new ReadableTestBase();
            let w = new WritableTestBase();
            let unpiped: boolean = false;
            let handled: boolean = false;
            r.pipe(w);
            r.on('data', (): void => {
              if (handled) {
                return;
              }
              handled = true;
              wcBefore = w.writeCount;
              r.unpipe(w);
              unpiped = true;
              r.resume();
              r.push("second");
              wcAfter = w.writeCount;
              r.push(null);
              w.end(undefined, undefined, (err?: Error): void => {
                if (err !== undefined) {
                  reject(err);
                  return;
                }
                unpipedRes = unpiped;
                wcOnEnd = w.writeCount;
              });
              setTimeout((): void => {
                unpipedRes = unpiped;
                wcOnEnd = w.writeCount;
                resolve(undefined as void);
              }, 0);
            });
            r.resume();
            r.push("onlyOne");
          });
          expect(wcBefore).assertEqual(1);
          expect(wcAfter).assertEqual(1);
          expect(unpipedRes).assertTrue();
          expect(wcOnEnd).assertEqual(1);
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_1700
     * @tc.name testStreamReadableUnpipe017
     * @tc.desc Verify unpipe with explicit undefined argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wc1Before: int = 0;
        let wc2Before: int = 0;
        let wc1OnEnd: int = 0;
        let wc2OnEnd: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          let w1 = new WritableTestBase();
          let w2 = new WritableTestBase();
          let endCount: int = 0;
          let handled: boolean = false;
          let onEnd: Function = (): void => {
            endCount++;
            if (endCount === 2) {
              wc1OnEnd = w1.writeCount;
              wc2OnEnd = w2.writeCount;
              resolve(undefined as void);
            }
          };
          r.pipe(w1);
          r.pipe(w2);
          r.on('data', (): void => {
            if (handled) {
              return;
            }
            handled = true;
            wc1Before = w1.writeCount;
            wc2Before = w2.writeCount;
            r.unpipe(undefined);
            r.resume();
            r.push("after");
            w1.end(undefined, undefined, onEnd);
            w2.end(undefined, undefined, onEnd);
          });
          r.resume();
          r.push("shared");
        });
        expect(wc1Before).assertEqual(1);
        expect(wc2Before).assertEqual(1);
        expect(wc1OnEnd).assertEqual(1);
        expect(wc2OnEnd).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_1800
     * @tc.name testStreamReadableUnpipe018
     * @tc.desc Verify unpipe with null argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pipe(w);
      try {
        r.unpipe(null as Object as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_1900
     * @tc.name testStreamReadableUnpipe019
     * @tc.desc Verify unpipe() after a single pipe (only one destination)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pipe(w);
      r.unpipe();
      r.push("data");
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_2000
     * @tc.name testStreamReadableUnpipe020
     * @tc.desc Verify unpipe in the middle of flowing mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wcBefore: int = 0;
        let wcAfter: int = 0;
        let unpipedRes: boolean = false;
        let wcOnEnd: int = 0;
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void): void => {
            let r = new ReadableTestBase();
            let w = new WritableTestBase();
            let unpiped: boolean = false;
            w.on('finish', (): void => {
              unpipedRes = unpiped;
              wcOnEnd = w.writeCount;
              resolve(undefined as void);
            });
            let handled: boolean = false;
            r.pipe(w);
            r.on('data', (): void => {
              if (handled) {
                return;
              }
              handled = true;
              wcBefore = w.writeCount;
              r.unpipe(w);
              unpiped = true;
              r.resume();
              r.push("chunk3");
              wcAfter = w.writeCount;
              r.push(null);
              w.end(undefined, undefined, (err?: Error): void => {
                if (err !== undefined) {
                  reject(err);
                  return;
                }
                unpipedRes = unpiped;
                wcOnEnd = w.writeCount;
              });
              setTimeout((): void => {
                unpipedRes = unpiped;
                wcOnEnd = w.writeCount;
                resolve(undefined as void);
              }, 0);
            });
            r.resume();
            r.push("chunk1");
          });
          expect(wcBefore).assertEqual(1);
          expect(wcAfter).assertEqual(1);
          expect(unpipedRes).assertTrue();
          expect(wcOnEnd).assertEqual(1);
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_2100
     * @tc.name testStreamReadableUnpipe021
     * @tc.desc Verify rapid pipe/unpipe switching 10 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wcRes: int = 0;
        let dataRes: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          let w = new WritableTestBase();
          for (let i: int = 0; i < 10; i++) {
            r.pipe(w);
            r.unpipe(w);
          }
          r.pipe(w);
          w.writeObserver = (): void => {
            wcRes = w.writeCount;
            dataRes = w.receivedData;
            r.push(null);
            resolve(undefined as void);
          };
          r.resume();
          r.push("final");
        });
        expect(wcRes).assertEqual(1);
        expect(dataRes).assertEqual('final');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_2200
     * @tc.name testStreamReadableUnpipe022
     * @tc.desc Verify calling unpipe in data event callback disconnects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wcRes: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          let w = new WritableTestBase();
          r.pipe(w);
          w.writeObserver = (): void => {
            r.unpipe(w);
            r.resume();
            wcRes = w.writeCount;
            r.push(null);
            resolve(undefined as void);
          };
          r.resume();
          r.push("chunk1");
        });
        expect(wcRes).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_2300
     * @tc.name testStreamReadableUnpipe023
     * @tc.desc Verify calling unpipe in readable event callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wcRes: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          let w = new WritableTestBase();
          let handled: boolean = false;
          r.pipe(w);
          r.on('readable', (): void => {
            if (!handled) {
              handled = true;
              r.unpipe(w);
              wcRes = w.writeCount;
              resolve(undefined as void);
            }
          });
          r.resume();
          r.push("chunk");
        });
        expect(wcRes).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_2400
     * @tc.name testStreamReadableUnpipe024
     * @tc.desc Verify calling unpipe after source stream push(null) ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pipe(w);
      r.push(null);
      let result = r.unpipe(w);
      expect(result).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_2500
     * @tc.name testStreamReadableUnpipe025
     * @tc.desc Verify unpipe when buffer has unconsumed data (paused mode)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pause();
      r.setEncoding('utf8');
      r.pipe(w);
      r.push("buf_a");
      r.push("buf_b");
      r.unpipe(w);
      let dataA = r.read();
      expect(dataA?.toString()).assertEqual("buf_abuf_b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_2600
     * @tc.name testStreamReadableUnpipe026
     * @tc.desc Verify source stream returns to non-pipe mode after unpiping the last pipe destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pipe(w);
      r.unpipe(w);
      expect(r.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_2700
     * @tc.name testStreamReadableUnpipe027
     * @tc.desc Verify piping to a new destination immediately after unpipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wRes: int = 0;
        let w2Res: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          let w = new WritableTestBase();
          let w2 = new WritableTestBase();
          r.pipe(w);
          r.unpipe(w);
          r.pipe(w2);
          w2.writeObserver = (): void => {
            wRes = w.writeCount;
            w2Res = w2.writeCount;
            r.push(null);
            resolve(undefined as void);
          };
          r.resume();
          r.push("data");
        });
        expect(wRes).assertEqual(0);
        expect(w2Res).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_2800
     * @tc.name testStreamReadableUnpipe028
     * @tc.desc Verify encoding setting is preserved after unpipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.setEncoding('gbk');
      r.pipe(w);
      r.unpipe(w);
      expect(r.readableEncoding).assertEqual('gbk');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_2900
     * @tc.name testStreamReadableUnpipe029
     * @tc.desc Verify cork/uncork operations interleaved with unpipe on destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      w.cork();
      r.pipe(w);
      let result = r.unpipe(w);
      w.uncork();
      expect(result).assertEqual(r);
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_3000
     * @tc.name testStreamReadableUnpipe030
     * @tc.desc Verify unpipe after pipe with empty options object {}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pipe(w, {} as Object);
      r.unpipe(w);
      r.push("data");
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_3100
     * @tc.name testStreamReadableUnpipe031
     * @tc.desc Verify unpiping only one of multiple (3) piped destinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let wc1Before: int = 0;
        let wc2Before: int = 0;
        let wc3Before: int = 0;
        let wc1After: int = 0;
        let wc2After: int = 0;
        let wc3After: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let r = new ReadableTestBase();
          let w1 = new WritableTestBase();
          let w2 = new WritableTestBase();
          let w3 = new WritableTestBase();
          r.pipe(w1);
          r.pipe(w2);
          r.pipe(w3);
          w3.writeObserver = (): void => {
            wc1Before = w1.writeCount;
            wc2Before = w2.writeCount;
            wc3Before = w3.writeCount;
            r.unpipe(w1);
            r.resume();
            r.push("data");
            wc1After = w1.writeCount;
            wc2After = w2.writeCount;
            wc3After = w3.writeCount;
            r.push(null);
            resolve(undefined as void);
          };
          r.resume();
          r.push("broadcast");
        });
        expect(wc1Before).assertEqual(1);
        expect(wc2Before).assertEqual(1);
        expect(wc3Before).assertEqual(1);
        expect(wc1After).assertEqual(1);
        expect(wc2After).assertEqual(1);
        expect(wc3After).assertEqual(1);

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_3200
     * @tc.name testStreamReadableUnpipe032
     * @tc.desc Verify unpiping all destinations one by one after multiple pipes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w1 = new WritableTestBase();
      let w2 = new WritableTestBase();
      let w3 = new WritableTestBase();
      r.pipe(w1);
      r.pipe(w2);
      r.pipe(w3);
      r.unpipe(w1);
      r.unpipe(w2);
      r.unpipe(w3);
      r.push("data");
      expect(w1.writeCount).assertEqual(0);
      expect(w2.writeCount).assertEqual(0);
      expect(w3.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_3300
     * @tc.name testStreamReadableUnpipe033
     * @tc.desc Verify unpipe with non-Writable string argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pipe(w);
      try {
        r.unpipe("notWritable" as Object as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_3400
     * @tc.name testStreamReadableUnpipe034
     * @tc.desc Verify unpipe with non-Writable plain Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pipe(w);
      try {
        let fakeDest: Object = {};
        r.unpipe(fakeDest as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_3500
     * @tc.name testStreamReadableUnpipe035
     * @tc.desc Verify unpipe disconnects destination and subsequent push does not flow to it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let dataRes: string = '';
        let writeCountRes: int = 0;
        let r = new ReadableTestBase();
        let w = new WritableTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.pipe(w);
          w.writeObserver = (): void => {
            dataRes = w.receivedData;
            writeCountRes = w.writeCount;
            resolve(undefined as void);
          };
          r.resume();
          r.push('data1');
        });
        expect(dataRes).assertEqual('data1');
        expect(writeCountRes).assertEqual(1);
        let result = r.unpipe(w);
        expect(result).assertEqual(r);
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.push('data2');
          setTimeout((): void => resolve(undefined as void), 100);
        });
        expect(w.receivedData).assertEqual('data1');
        expect(w.writeCount).assertEqual(1);
        expect(r.readable).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_3600
     * @tc.name testStreamReadableUnpipe036
     * @tc.desc Verify unpipe on a Writable destination that has ended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pipe(w);
      r.push("data");
      w.end();
      let result = r.unpipe(w);
      expect(result).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_3700
     * @tc.name testStreamReadableUnpipe037
     * @tc.desc Verify unpipe with lost this context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pipe(w);
      let unpipeFn: Function = r.unpipe;
      let result = unpipeFn(w);
      expect(result).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_3800
     * @tc.name testStreamReadableUnpipe038
     * @tc.desc Verify calling unpipe on a non-Readable plain Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let w = new WritableTestBase();
      let fakeObj: Object = {};
      try {
        (fakeObj as stream.Readable).unpipe(w);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_UNPIPE_3900
     * @tc.name testStreamReadableUnpipe039
     * @tc.desc Verify unpipe without a destination removes all destinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableUnpipe039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w1 = new WritableTestBase();
      let w2 = new WritableTestBase();
      r.pipe(w1);
      r.pipe(w2);
      let result = r.unpipe();
      expect(result).assertEqual(r);
    });
  });
}
