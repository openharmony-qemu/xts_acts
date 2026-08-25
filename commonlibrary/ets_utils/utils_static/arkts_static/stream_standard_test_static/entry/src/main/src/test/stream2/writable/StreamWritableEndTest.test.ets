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
import { BusinessError } from '@kit.BasicServicesKit';

class WritableTestBase extends stream.Writable {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    this.writeCount++;
    callback.unsafeCall();
  }
}

class WritableNoDoWrite extends stream.Writable {
  constructor() {
    super();
  }
}

class EndErrorWritable extends stream.Writable {
  public dataChunk: string | Uint8Array = '';

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    callback.unsafeCall(new Error('end write failed'));
  }
}

class WritableCallbackTwice extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

/**
 * A Writable that accumulates every received chunk into a single text buffer and records the total write
 * count, allowing a single object to verify a full write, cork, uncork, and end lifecycle in one test.
 */
class AccumWritable extends stream.Writable {
  public text: string = '';
  public writeCount: int = 0;

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
    if (typeof chunk === 'string') {
      this.text += chunk;
    } else {
      this.text += util.TextDecoder.create(encoding).decodeToString(chunk as Uint8Array);
    }
    callback.unsafeCall();
  }
}

export default function StreamWritableEndTest(): void {
  describe('StreamWritableEndTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_0100
     * @tc.name testStreamWritableEnd001
     * @tc.desc Verify end with no arguments ends the stream, returns Writable instance, triggers finish event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
        });
        let ret = ws.end();
        await finishPromise;
        expect(ws.writableFinished).assertTrue();
        expect(ret.writableEnded).assertTrue();
        expect(ws.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_0200
     * @tc.name testStreamWritableEnd002
     * @tc.desc Verify end with string as the final data chunk written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
        });
        ws.end("test");
        await finishPromise;
        expect(ws.writableFinished).assertTrue();
        expect(ws.dataChunk).assertEqual("test");
        expect(ws.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_0300
     * @tc.name testStreamWritableEnd003
     * @tc.desc Verify end with Uint8Array as the final binary data chunk written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
        });
        ws.end(new Uint8Array([72, 101, 108, 108, 111]));
        await finishPromise;
        expect(ws.writableFinished).assertTrue();
        let received = ws.dataChunk as Uint8Array;
        expect(received.length).assertEqual(5);
        expect(received[0]).assertEqual(72);
        expect(received[4]).assertEqual(111);
        expect(ws.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_0400
     * @tc.name testStreamWritableEnd004
     * @tc.desc Verify end forwards English and Chinese chunks with gbk encoding and marks the write side ended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let chunks: string[] = ["finish", "测试工程师"];
        for (let i = 0; i < chunks.length; i++) {
          let ws = new WritableTestBase();
          ws.end(chunks[i], "gbk");
          expect(ws.dataEncoding).assertEqual("gbk");
          expect(ws.dataChunk).assertEqual(chunks[i]);
          expect(ws.writableEnded).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_0500
     * @tc.name testStreamWritableEnd005
     * @tc.desc Verify writableEnded becomes true and writable becomes false after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.writable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_0600
     * @tc.name testStreamWritableEnd006
     * @tc.desc Verify off('finish') removes listener, end does not trigger finish callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let finishFired: boolean = false;
      let fn = (): void => {
        finishFired = true;
      };
      ws.on('finish', fn);
      ws.off('finish', fn);
      ws.end();
      expect(finishFired).assertFalse();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_0700
     * @tc.name testStreamWritableEnd007
     * @tc.desc Verify end without chunk does not trigger doWrite invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(ws.writableFinished).assertTrue();
        expect(ws.dataChunk).assertEqual('');
        expect(ws.writeCount).assertEqual(0);
        expect(ws.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_0800
     * @tc.name testStreamWritableEnd008
     * @tc.desc Verify chunk=Uint8Array binary data ends normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end(new Uint8Array([49, 50, 51]));
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(3);
      expect(received[0]).assertEqual(49);
      expect(received[2]).assertEqual(51);
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_0900
     * @tc.name testStreamWritableEnd009
     * @tc.desc Verify end with only callback, chunk omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let errorCaught: boolean = false;
      let callbackFired: boolean = false;
      try {
        ws.end(undefined as String, undefined as String, (err?: Error): void => {
          callbackFired = true;
        });
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(errorCaught).assertTrue();
      expect(callbackFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_1000
     * @tc.name testStreamWritableEnd010
     * @tc.desc Verify end forwards an empty string and an ordinary chunk through doWrite and marks the stream ended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ["", "data"];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new WritableTestBase();
        ws.end(chunks[i]);
        expect(ws.dataChunk).assertEqual(chunks[i]);
        expect(ws.writableEnded).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_1100
     * @tc.name testStreamWritableEnd011
     * @tc.desc Verify single space string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
          ws.end(" ");
        });
        expect(ws.dataChunk).assertEqual(" ");
        expect(ws.writableEnded).assertTrue();
        expect(ws.writableFinished).assertTrue();
        expect(finishFired).assertTrue();
        expect(ws.writable).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_1200
     * @tc.name testStreamWritableEnd012
     * @tc.desc Verify tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
          ws.end("\t");
        });
        expect(ws.dataChunk).assertEqual("\t");
        expect(ws.writableLength).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_1300
     * @tc.name testStreamWritableEnd013
     * @tc.desc Verify newline character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
          ws.end("\n");
        });
        expect(ws.dataChunk).assertEqual("\n");
        expect(ws.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_1400
     * @tc.name testStreamWritableEnd014
     * @tc.desc Verify carriage return character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
          ws.end("\r");
        });
        expect(ws.dataChunk).assertEqual("\r");
        expect(ws.writableObjectMode).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_1500
     * @tc.name testStreamWritableEnd015
     * @tc.desc Verify single character (minimum valid length 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
          ws.end("a");
        });
        expect(ws.dataChunk).assertEqual("a");
        expect(ws.writeCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_1600
     * @tc.name testStreamWritableEnd016
     * @tc.desc Verify highWaterMark-length string, 16384 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let largeStr: string = 'a'.repeat(16384);
      ws.end(largeStr);
      expect((ws.dataChunk as string).length).assertEqual(16384);
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_1700
     * @tc.name testStreamWritableEnd017
     * @tc.desc Verify varchar upper limit, 65535 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let hugeStr: string = 'a'.repeat(65535);
      ws.end(hugeStr);
      expect((ws.dataChunk as string).length).assertEqual(65535);
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_1800
     * @tc.name testStreamWritableEnd018
     * @tc.desc Verify Error reported for an empty Uint8Array reaches the end callback error parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new EndErrorWritable();
        let errName: string = '';
        let errMessage: string = '';
        let eventName: string = '';
        ws.on('error', (err: Error): void => {
          eventName = err.name;
        });
        ws.end(new Uint8Array([]), 'utf8', (err?: Error): void => {
          if (err !== undefined) {
            errName = err.name;
            errMessage = err.message;
          }
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          setTimeout((): void => resolve(undefined as void), 100);
        });
        expect(errName).assertEqual('Error');
        expect(errMessage).assertEqual('end write failed');
        expect(eventName).assertEqual('Error');
        expect((ws.dataChunk as Uint8Array).length).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_1900
     * @tc.name testStreamWritableEnd019
     * @tc.desc Verify end forwards the full Uint8Array for sizes of 1, 16384, 16385, 65536 and 102400 bytes and sets writableEnded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [1, 16384, 16385, 65536, 102400];
      for (let i = 0; i < sizes.length; i++) {
        let ws = new WritableTestBase();
        ws.end(new Uint8Array(sizes[i]));
        expect((ws.dataChunk as Uint8Array).length).assertEqual(sizes[i]);
        expect(ws.writableEnded).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_2000
     * @tc.name testStreamWritableEnd020
     * @tc.desc Verify end forwards the chunk and encoding unchanged for utf8, gbk, gb18030, gb2312, their uppercase forms, empty, ascii and ibm866
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] =
        ['test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '中文'];
      let encodings: string[] =
        ['utf8', 'gbk', 'gb18030', 'gb2312', 'UTF-8', 'GBK', 'GB18030', 'GB2312', '', 'ascii', 'ibm866', 'gb18030'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new WritableTestBase();
        ws.end(chunks[i], encodings[i]);
        expect(ws.dataChunk).assertEqual(chunks[i]);
        expect(ws.dataEncoding).assertEqual(encodings[i]);
        expect(ws.writableEnded).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_2100
     * @tc.name testStreamWritableEnd021
     * @tc.desc Verify callback=null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let errorCaught: boolean = false;
      try {
        ws.end(undefined as String, undefined as String, null as Object as Function);
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_2200
     * @tc.name testStreamWritableEnd022
     * @tc.desc Verify callback=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let errorCaught: boolean = false;
      try {
        ws.end(undefined as String, undefined as String, undefined as Object as Function);
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_2300
     * @tc.name testStreamWritableEnd023
     * @tc.desc Verify end() without a callback emits finish and completes the writable stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let capturedEnded: boolean = false;
        let capturedFinished: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            capturedEnded = ws.writableEnded;
            capturedFinished = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        ws.end();
        expect(ws.writableEnded).assertTrue();
        await finishPromise;
        expect(capturedEnded).assertTrue();
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_2400
     * @tc.name testStreamWritableEnd024
     * @tc.desc Verify cork>0 forces buffer flush and resets corked to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let capturedFinished: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            capturedFinished = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        ws.cork();
        ws.write("buffer");
        expect(ws.writableCorked).assertEqual(1);
        expect(ws.writeCount).assertEqual(0);
        ws.end("flush");
        expect(ws.writableCorked).assertEqual(0);
        expect(ws.writeCount).assertEqual(2);
        expect(ws.dataChunk).assertEqual("flush");
        expect(ws.writableEnded).assertTrue();
        await finishPromise;
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_2500
     * @tc.name testStreamWritableEnd025
     * @tc.desc Verify cork x2 nesting, end forcibly resets from 2 to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let capturedFinished: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            capturedFinished = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        ws.cork();
        ws.cork();
        ws.write("data");
        expect(ws.writableCorked).assertEqual(2);
        expect(ws.writeCount).assertEqual(0);
        ws.end("last");
        expect(ws.writableCorked).assertEqual(0);
        expect(ws.writeCount).assertEqual(2);
        expect(ws.dataChunk).assertEqual("last");
        expect(ws.writableEnded).assertTrue();
        await finishPromise;
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_2600
     * @tc.name testStreamWritableEnd026
     * @tc.desc Verify writableFinished becomes true after doWrite completes asynchronously following end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        ws.write("data");
        expect(ws.dataChunk).assertEqual("data");
        let capturedFinished: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            capturedFinished = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(capturedFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_2700
     * @tc.name testStreamWritableEnd027
     * @tc.desc Verify writableLength resets to zero after doWrite completes following end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        ws.write("data");
        expect(ws.dataChunk).assertEqual("data");
        let capturedLength: int = -1;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            capturedLength = ws.writableLength;
            resolve(undefined as void);
          });
        });
        ws.end();
        await finishPromise;
        expect(capturedLength).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_2800
     * @tc.name testStreamWritableEnd028
     * @tc.desc Verify callback called twice in doWrite triggers 10200037
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableCallbackTwice();
        let errName: string = '';
        let errCode: int = 0;
        let errorPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: Error): void => {
            errName = err.name;
            errCode = (err as BusinessError).code;
            resolve(undefined as void);
          });
        });
        ws.end("data", "utf8", (err?: Error): void => {
        });
        await errorPromise;
        expect(errName).assertEqual("BusinessError");
        expect(errCode).assertEqual(10200037);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_2900
     * @tc.name testStreamWritableEnd029
     * @tc.desc Verify a second end() call is rejected with BusinessError 10200036
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end();
      try {
        ws.end("again");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200036);
      }
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_3000
     * @tc.name testStreamWritableEnd030
     * @tc.desc Verify chunk=null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.end(null as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_3100
     * @tc.name testStreamWritableEnd031
     * @tc.desc Verify chunk=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.end(undefined as String);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_3200
     * @tc.name testStreamWritableEnd032
     * @tc.desc Verify chunk=emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
          ws.end("😀");
        });
        expect(ws.dataChunk).assertEqual("😀");
        expect(ws.writable).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_3300
     * @tc.name testStreamWritableEnd033
     * @tc.desc Verify chunk=emoji + Chinese mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();

        let finishFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
          ws.end("😀测试");
        });
        expect(ws.dataChunk).assertEqual("😀测试");
        expect(ws.writableObjectMode).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_3400
     * @tc.name testStreamWritableEnd034
     * @tc.desc Verify chunk=XSS attack string (pure data, not executed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
          ws.end("<script>alert(1)</script>");
        });
        expect(ws.dataChunk).assertEqual("<script>alert(1)</script>");
        expect(ws.writeCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_3500
     * @tc.name testStreamWritableEnd035
     * @tc.desc Verify chunk=special symbol combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();

        let finishFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
          ws.end("!@#$%^&*()");
        });
        expect(ws.dataChunk).assertEqual("!@#$%^&*()");
        expect(ws.writable).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_3600
     * @tc.name testStreamWritableEnd036
     * @tc.desc Verify chunk=zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();

        let finishFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
          ws.end("​");
        });
        expect(ws.dataChunk).assertEqual("​");
        expect(ws.writableHighWatermark).assertEqual(16384);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_3700
     * @tc.name testStreamWritableEnd037
     * @tc.desc Verify chunk=Japanese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
          ws.end("テスト");
        });
        expect(ws.dataChunk).assertEqual("テスト");
        expect(ws.writableCorked).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_3800
     * @tc.name testStreamWritableEnd038
     * @tc.desc Verify chunk=Russian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();

        let finishFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
          ws.end("тест");
        });
        expect(ws.dataChunk).assertEqual("тест");
        expect(ws.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_3900
     * @tc.name testStreamWritableEnd039
     * @tc.desc Verify chunk=Arabic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
          ws.end("الاختبار");
        });
        expect(ws.dataChunk).assertEqual("الاختبار");
        expect(ws.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_4000
     * @tc.name testStreamWritableEnd040
     * @tc.desc Verify chunk=Unicode replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();

        let finishFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
          ws.end("�");
        });
        expect(ws.dataChunk).assertEqual("�");
        expect(ws.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_4100
     * @tc.name testStreamWritableEnd041
     * @tc.desc Verify chunk=Uint8Array containing 0xFF boundary value mix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end(new Uint8Array([0, 255, 0]));
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(3);
      expect(received[1]).assertEqual(255);
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_4200
     * @tc.name testStreamWritableEnd042
     * @tc.desc Verify chunk=Uint8Array all zero bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end(new Uint8Array([0, 0, 0, 0, 0]));
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(5);
      expect(received[0]).assertEqual(0);
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_4300
     * @tc.name testStreamWritableEnd043
     * @tc.desc Verify chunk=Uint8Array containing CR + LF control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end(new Uint8Array([0x0A, 0x0D]));
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(2);
      expect(received[0]).assertEqual(0x0A);
      expect(received[1]).assertEqual(0x0D);
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_4400
     * @tc.name testStreamWritableEnd044
     * @tc.desc Verify chunk=number type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.end(123 as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_4500
     * @tc.name testStreamWritableEnd045
     * @tc.desc Verify chunk=boolean type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.end(true as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_4600
     * @tc.name testStreamWritableEnd046
     * @tc.desc Verify chunk=object type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.end({} as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_4700
     * @tc.name testStreamWritableEnd047
     * @tc.desc Verify doWrite not implemented and end with chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableNoDoWrite();
      try {
        ws.end("data");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200035);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_4800
     * @tc.name testStreamWritableEnd048
     * @tc.desc Verify end callback and finish callback both observe completed writable state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let endCallbackCalled: boolean = false;
        let capturedFinishEnded: boolean = false;
        let capturedFinishFinished: boolean = false;
        let capturedEndEnded: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            capturedFinishEnded = ws.writableEnded;
            capturedFinishFinished = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        ws.end('final', 'utf8', (): void => {
          endCallbackCalled = true;
          capturedEndEnded = ws.writableEnded;
        });

        await finishPromise;
        expect(capturedFinishEnded).assertTrue();
        expect(capturedFinishFinished).assertTrue();
        expect(endCallbackCalled).assertTrue();
        expect(capturedEndEnded).assertTrue();

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_4900
     * @tc.name testStreamWritableEnd049
     * @tc.desc Verify a full lifecycle on a single Writable: multiple mixed string/Uint8Array writes then cork buffers further writes (doWrite not invoked) then uncork flushes, and a final end() triggers the finish event with all accumulated data received in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new AccumWritable();
        ws.write('ab');
        ws.write(new Uint8Array([0x63, 0x64]));
        ws.cork();
        let buffered = ws.write('ef');
        let bufferedLen: int = ws.writableLength;
        expect(buffered).assertTrue();
        expect(ws.writeCount).assertEqual(2);
        ws.uncork();
        let textAtFinish: string = '';
        let writeCountAtFinish: int = 0;
        let writableAtFinish: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            textAtFinish = ws.text;
            writeCountAtFinish = ws.writeCount;
            writableAtFinish = ws.writable;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(bufferedLen).assertEqual(2);
        expect(textAtFinish).assertEqual('abcdef');
        expect(writeCountAtFinish).assertEqual(3);
        expect(writableAtFinish).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_END_5000
     * @tc.name testStreamWritableEnd050
     * @tc.desc Verify a single Writable after end() is no longer writable: the finish event fires and a subsequent write reports the stream as ended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEnd050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let finishFired: boolean = false;
        ws.write('a');
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(finishFired).assertTrue();
        expect(ws.writableEnded).assertTrue();
        expect(ws.writable).assertFalse();
        done();
      });
  });
}
