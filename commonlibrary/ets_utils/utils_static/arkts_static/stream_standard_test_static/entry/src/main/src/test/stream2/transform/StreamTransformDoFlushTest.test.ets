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
import { stream } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

class TransformTestBase extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class TransformFlushBase extends TransformTestBase {
  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class TransformThrow extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    throw new Error("transform_err");
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class FlushOrder extends TransformTestBase {
  doFlush(callback: Function): void {
    this.push("pre");
    setTimeout((): void => {
      callback.unsafeCall();
    }, 0);
  }
}

class FlushBoth extends TransformTestBase {
  doFlush(callback: Function): void {
    this.push("x");
    callback.unsafeCall(null, "y");
  }
}

class FlushNormal extends TransformTestBase {
  flushCalled: boolean = false;

  doFlush(callback: Function): void {
    this.flushCalled = true;
    callback.unsafeCall();
  }
}

class FlushFn extends TransformTestBase {
  flushCalled: boolean = false;

  doFlush(callback: Function): void {
    this.flushCalled = true;
    let fn = (): void => {
      callback.unsafeCall();
    };
    fn();
  }
}

class FlushError extends TransformTestBase {
  public flushCalled: boolean = false;

  doFlush(callback: Function): void {
    this.flushCalled = true;
    callback.unsafeCall(new Error("fail"));
  }
}

class FlushTwice extends TransformTestBase {
  flushCalled: boolean = false;

  doFlush(callback: Function): void {
    this.flushCalled = true;
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class FlushNoCb extends TransformTestBase {
  doFlush(callback: Function): void {
  }
}

class FlushSetTimeout extends TransformTestBase {
  doFlush(callback: Function): void {
    setTimeout((): void => {
      callback.unsafeCall();
    }, 50);
  }
}

class FlushSetInterval extends TransformTestBase {
  doFlush(callback: Function): void {
    let timer: int = 0;
    let intervalCallback: Function = (): void => {
      clearInterval(timer);
      callback.unsafeCall();
    };
    timer = setInterval(intervalCallback, 100);
  }
}

class FlushCbNullData extends TransformTestBase {
  doFlush(callback: Function): void {
    callback.unsafeCall(null, "flush");
  }
}

class FlushCbDataOnly extends TransformTestBase {
  doFlush(callback: Function): void {
    callback.unsafeCall(undefined, "x");
  }
}

class FlushPushValue extends TransformTestBase {
  private flushData: string = "";

  constructor(flushData: string) {
    super();
    this.flushData = flushData;
  }

  doFlush(callback: Function): void {
    this.push(this.flushData);
    callback.unsafeCall();
  }
}

class FlushPushEmpty extends TransformTestBase {
  doFlush(callback: Function): void {
    this.push("");
    callback.unsafeCall();
  }
}

class FlushPushSpace extends TransformTestBase {
  doFlush(callback: Function): void {
    this.push(" ");
    callback.unsafeCall();
  }
}

class FlushPushSingle extends TransformTestBase {
  doFlush(callback: Function): void {
    this.push("a");
    callback.unsafeCall();
  }
}

class FlushPush16383 extends TransformTestBase {
  doFlush(callback: Function): void {
    let str: string = "";
    for (let i = 0; i < 16383; i++) {
      str += "a";
    }
    this.push(str);
    callback.unsafeCall();
  }
}

class FlushPush16384 extends TransformTestBase {
  doFlush(callback: Function): void {
    let str: string = "";
    for (let i = 0; i < 16384; i++) {
      str += "a";
    }
    this.push(str);
    callback.unsafeCall();
  }
}

class FlushPush16385 extends TransformTestBase {
  doFlush(callback: Function): void {
    let buf = new Uint8Array(16385);
    this.push(buf);
    callback.unsafeCall();
  }
}

class FlushPush100K extends TransformTestBase {
  doFlush(callback: Function): void {
    let buf = new Uint8Array(102400);
    this.push(buf);
    callback.unsafeCall();
  }
}

class FlushPushNull extends TransformTestBase {
  doFlush(callback: Function): void {
    this.push(null);
    callback.unsafeCall();
  }
}

class FlushNoPush extends TransformTestBase {
  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class FlushPush3x extends TransformTestBase {
  doFlush(callback: Function): void {
    this.push("a");
    this.push("b");
    this.push("c");
    callback.unsafeCall();
  }
}

class FlushPush10x extends TransformTestBase {
  doFlush(callback: Function): void {
    for (let i = 0; i < 10; i++) {
      this.push("x");
    }
    callback.unsafeCall();
  }
}

class FlushAsyncPush extends TransformTestBase {
  doFlush(callback: Function): void {
    setTimeout((): void => {
      this.push("hello");
      callback.unsafeCall();
    }, 30);
  }
}

class FlushPushNullMid extends TransformTestBase {
  doFlush(callback: Function): void {
    this.push("h");
    this.push(null);
    this.push("t");
    callback.unsafeCall();
  }
}

class FlushThrow extends TransformTestBase {
  doFlush(callback: Function): void {
    throw new Error("flush_err");
  }
}

class FlushPushThenThrow extends TransformTestBase {
  doFlush(callback: Function): void {
    this.push("x");
    throw new Error("err");
  }
}

class FlushPushThenCbErr extends TransformTestBase {
  doFlush(callback: Function): void {
    this.push("x");
    callback.unsafeCall(new Error("err"));
  }
}

class FlushCbErrBefore extends TransformTestBase {
  doFlush(callback: Function): void {
    this.push("x");
    callback.unsafeCall(new Error("err"));
  }
}

class FlushOnEnd extends TransformTestBase {
  flushTriggered: boolean = false;

  doFlush(callback: Function): void {
    this.flushTriggered = true;
    callback.unsafeCall();
  }
}

export default function StreamTransformDoFlushTest(): void {
  describe('StreamTransformDoFlushTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_0100
     * @tc.name testStreamTransformDoFlush001
     * @tc.desc Verify doFlush is invoked when ending a transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushError();
      ws.end();
      expect(ws.flushCalled).assertTrue();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_0200
     * @tc.name testStreamTransformDoFlush002
     * @tc.desc Verify callback not called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new FlushNoCb();
        let finishCalled: boolean = false;
        ws.on("finish", (): void => {
          finishCalled = true;
        });
        ws.write("test");
        ws.end();
        await new Promise<void>((resolve: (value: void) => void): void => {
          setTimeout((): void => {
            resolve(undefined as void);
          }, 100);
        });
        expect(ws.writableEnded).assertTrue();
        expect(ws.writableFinished).assertFalse();
        expect(finishCalled).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_0300
     * @tc.name testStreamTransformDoFlush003
     * @tc.desc Verify async setTimeout cb
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new FlushSetTimeout();
        let endedAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        let finishedAtClose: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("finish", (): void => {
            endedAtFinish = ws.writableEnded;
            finishedAtFinish = ws.writableFinished;
          });
          ws.on("close", (): void => {
            finishedAtClose = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(endedAtFinish).assertTrue();
        expect(finishedAtFinish).assertTrue();
        expect(finishedAtClose).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_0400
     * @tc.name testStreamTransformDoFlush004
     * @tc.desc Verify async setInterval cb
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new FlushSetInterval();
        let endedAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        let finishedAtClose: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("finish", (): void => {
            endedAtFinish = ws.writableEnded;
            finishedAtFinish = ws.writableFinished;
          });
          ws.on("close", (): void => {
            finishedAtClose = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(endedAtFinish).assertTrue();
        expect(finishedAtFinish).assertTrue();
        expect(finishedAtClose).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_0500
     * @tc.name testStreamTransformDoFlush005
     * @tc.desc Verify cb passes null+data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushCbNullData();
      ws.write("test");
      let errorCaught: boolean = false;
      try {
        ws.end();
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_0600
     * @tc.name testStreamTransformDoFlush006
     * @tc.desc Verify cb passes data without err
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushCbDataOnly();
      ws.write("test");
      let errorCaught: boolean = false;
      try {
        ws.end();
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_0700
     * @tc.name testStreamTransformDoFlush007
     * @tc.desc Verify data pushed in doFlush is appended after the written data for plain, Chinese, numeric, symbol, XSS and emoji strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let writes: string[] = ['test', '测试', 'test', 'test', 'test', '😀'];
      let flushes: string[] = ['hello', '中文', '123456', '!@#$%^&*()', '<script>alert(1)</script>', '😀'];
      for (let i = 0; i < writes.length; i++) {
        let ws = new FlushPushValue(flushes[i]);
        let received: string = '';
        ws.on('data', (chunk: Object): void => {
          received += chunk.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('end', (): void => {
            resolve(undefined as void);
          });
          ws.write(writes[i]);
          ws.end();
        });
        expect(received).assertEqual(writes[i] + flushes[i]);
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_0800
     * @tc.name testStreamTransformDoFlush008
     * @tc.desc Verify an empty push in doFlush leaves the written data unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new FlushPushEmpty();
        let received: string = "";
        ws.on("data", (chunk: Object): void => {
          received += chunk.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("end", (): void => {
            resolve(undefined as void);
          });
          ws.write("test");
          ws.end();
        });
        expect(received).assertEqual("test");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_0900
     * @tc.name testStreamTransformDoFlush009
     * @tc.desc Verify push space + cb
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ws = new FlushPushSpace();
      let received: string = "";
      ws.on("data", (chunk: Object): void => {
        received += chunk.toString();
      });
      await new Promise<void>((resolve: (value: void) => void): void => {
        ws.on("end", (): void => {
          resolve(undefined as void);
        });
        ws.write(" ");
        ws.end();
      });
      expect(received).assertEqual("  ");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_1000
     * @tc.name testStreamTransformDoFlush010
     * @tc.desc Verify push single character + cb
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ws = new FlushPushSingle();
      let received: string = "";
      ws.on("data", (chunk: Object): void => {
        received += chunk.toString();
      });
      await new Promise<void>((resolve: (value: void) => void): void => {
        ws.on("end", (): void => {
          resolve(undefined as void);
        });
        ws.write("a");
        ws.end();
      });
      expect(received).assertEqual("aa");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_1100
     * @tc.name testStreamTransformDoFlush011
     * @tc.desc Verify a 16383-byte push in doFlush is delivered in full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new FlushPush16383();
        let received: string = "";
        ws.on("data", (chunk: Object): void => {
          received += chunk.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("end", (): void => {
            resolve(undefined as void);
          });
          ws.write("test");
          ws.end();
        });
        expect(received.length).assertEqual(4 + 16383);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_1200
     * @tc.name testStreamTransformDoFlush012
     * @tc.desc Verify push 16384B + cb
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushPush16384();
      ws.write("test");
      ws.end();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_1300
     * @tc.name testStreamTransformDoFlush013
     * @tc.desc Verify no push + cb
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushNoPush();
      ws.write("test");
      ws.end();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_1400
     * @tc.name testStreamTransformDoFlush014
     * @tc.desc Verify push x3 + cb
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ws = new FlushPush3x();
      let received: string = "";
      ws.on("data", (chunk: Object): void => {
        received += chunk.toString();
      });
      await new Promise<void>((resolve: (value: void) => void): void => {
        ws.on("end", (): void => {
          resolve(undefined as void);
        });
        ws.write("test");
        ws.end();
      });
      expect(received).assertEqual("testabc");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_1500
     * @tc.name testStreamTransformDoFlush015
     * @tc.desc Verify ten pushes in doFlush are delivered in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new FlushPush10x();
        let received: string = "";
        ws.on("data", (chunk: Object): void => {
          received += chunk.toString();
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("end", (): void => {
            resolve(undefined as void);
          });
          ws.write("test");
          ws.end();
        });
        expect(received).assertEqual("test" + "xxxxxxxxxx");
        done();
      });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_1600
     * @tc.name testStreamTransformDoFlush016
     * @tc.desc Verify end() completes the writable side of the stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushAsyncPush();
      ws.write("test");
      ws.end();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_1700
     * @tc.name testStreamTransformDoFlush017
     * @tc.desc Verify end() triggers doFlush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushOnEnd();
      ws.write("test");
      expect(ws.flushTriggered).assertFalse();
      expect(ws.writableEnded).assertFalse();
      ws.end();
      expect(ws.flushTriggered).assertTrue();
      expect(ws.writableEnded).assertTrue();
      let data = ws.read();
      expect(data?.toString()).assertEqual("test");
      expect(ws.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_1800
     * @tc.name testStreamTransformDoFlush018
     * @tc.desc Verify end(chunk) triggers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushOnEnd();
      ws.end("last");
      expect(ws.flushTriggered).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_1900
     * @tc.name testStreamTransformDoFlush019
     * @tc.desc Verify end not called does not trigger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushOnEnd();
      ws.write("test");
      expect(ws.flushTriggered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_2000
     * @tc.name testStreamTransformDoFlush020
     * @tc.desc Verify end x2 only once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ws = new FlushOnEnd();
      let flushAtError: boolean = false;
      let errName: string = "";
      let errCode: number = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        ws.on("error", (err: Error): void => {
          flushAtError = ws.flushTriggered;
          errName = err.name;
          errCode = (err as BusinessError).code;
          resolve(undefined as void);
        });
        ws.write("test");
        ws.end();
        ws.end();
      });
      expect(flushAtError).assertTrue();
      expect(errName).assertEqual("BusinessError");
      expect(errCode).assertEqual(10200036);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_2100
     * @tc.name testStreamTransformDoFlush021
     * @tc.desc Verify no doFlush implementation + end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformTestBase();
      ws.write("test");
      ws.end();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_2200
     * @tc.name testStreamTransformDoFlush022
     * @tc.desc Verify flowing mode end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushNormal();
      ws.on("data", (): void => {
      });
      ws.write("test");
      ws.end();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_2300
     * @tc.name testStreamTransformDoFlush023
     * @tc.desc Verify paused mode end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushNormal();
      ws.pause();
      ws.write("test");
      ws.end();
      expect(ws.writableEnded).assertTrue();
      ws.resume();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_2400
     * @tc.name testStreamTransformDoFlush024
     * @tc.desc Verify end empty stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushOnEnd();
      ws.end();
      expect(ws.flushTriggered).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_2500
     * @tc.name testStreamTransformDoFlush025
     * @tc.desc Verify throw Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushThrow();
      ws.write("test");
      try {
        ws.end();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_2600
     * @tc.name testStreamTransformDoFlush026
     * @tc.desc Verify push then throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushPushThenThrow();
      ws.write("test");
      try {
        ws.end();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_2700
     * @tc.name testStreamTransformDoFlush027
     * @tc.desc Verify cb(Error) before push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushCbErrBefore();
      ws.write("test");
      ws.end();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_2800
     * @tc.name testStreamTransformDoFlush028
     * @tc.desc Verify doTransform exception after doFlush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformThrow();
      try {
        ws.write("test");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_2900
     * @tc.name testStreamTransformDoFlush029
     * @tc.desc Verify pipe chain flush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new stream.Readable();
      let w = new stream.Writable();
      let result = r.pipe(w);
      expect(result).assertEqual(w);
      r.unpipe(w);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_3000
     * @tc.name testStreamTransformDoFlush030
     * @tc.desc Verify chained dual Transform flush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1 = new FlushNormal();
      let w = new stream.Writable();
      let result = t1.pipe(w);
      expect(result).assertEqual(w);
      t1.unpipe(w);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_3100
     * @tc.name testStreamTransformDoFlush031
     * @tc.desc Verify write x100 then end flush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushOnEnd();
      for (let i = 0; i < 100; i++) {
        ws.write("data" + i);
      }
      expect(ws.flushTriggered).assertFalse();
      ws.end();
      expect(ws.flushTriggered).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_3200
     * @tc.name testStreamTransformDoFlush032
     * @tc.desc Verify cannot write after flush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ws = new FlushNormal();
      let errName: string = "";
      let errCode: number = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        ws.on("error", (err: Error): void => {
          errName = err.name;
          errCode = (err as BusinessError).code;
          resolve(undefined as void);
        });
        ws.write("test");
        ws.end();
        ws.write("after");
      });
      expect(errName).assertEqual("BusinessError");
      expect(errCode).assertEqual(10200036);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_3300
     * @tc.name testStreamTransformDoFlush033
     * @tc.desc Verify push+cb async order in flush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushOrder();
      ws.write("test");
      ws.end();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_3400
     * @tc.name testStreamTransformDoFlush034
     * @tc.desc Verify cb(null,data) coexists with push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new FlushBoth();
      ws.write("test");
      let errorCaught: boolean = false;
      try {
        ws.end();
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_3500
     * @tc.name testStreamTransformDoFlush035
     * @tc.desc Verify asynchronous flush completion precedes stream close
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ws = new FlushSetTimeout();
      let finishCalled: boolean = false;
      let finishedAtFinish: boolean = false;
      let finishAtClose: boolean = false;
      let endedAtClose: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        ws.on('finish', (): void => {
          finishCalled = true;
          finishedAtFinish = ws.writableFinished;
        });
        ws.on('close', (): void => {
          finishAtClose = finishCalled;
          endedAtClose = ws.writableEnded;
          resolve(undefined as void);
        });
        ws.end();
      });
      expect(finishAtClose).assertTrue();
      expect(endedAtClose).assertTrue();
      expect(finishedAtFinish).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_FLUSH_3600
     * @tc.name testStreamTransformDoFlush036
     * @tc.desc Verify doFlush callback invoked through a local function completes the stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoFlush036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ws = new FlushFn();
      let finishCalled: boolean = false;
      let endedAtFinish: boolean = false;
      let finishedAtFinish: boolean = false;
      let finishAtClose: boolean = false;
      let writableAtClose: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        ws.on('finish', (): void => {
          finishCalled = true;
          endedAtFinish = ws.writableEnded;
          finishedAtFinish = ws.writableFinished;
        });
        ws.on('close', (): void => {
          finishAtClose = finishCalled;
          writableAtClose = ws.writable;
          resolve(undefined as void);
        });
        ws.end();
      });
      expect(finishAtClose).assertTrue();
      expect(writableAtClose).assertFalse();
      expect(endedAtFinish).assertTrue();
      expect(finishedAtFinish).assertTrue();

      done();
    });

  });
}
