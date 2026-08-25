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

class DuplexEndTestBase extends stream.Duplex {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    this.writeCount++;
    callback.unsafeCall();
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    let values = chunks as string[];
    for (let i = 0; i < chunks.length; i++) {
      this.dataChunk = values[i];
      this.writeCount++;
    }
    callback.unsafeCall();
  }
}

class DuplexEndNoDoWrite extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class DuplexEndErrorCb extends stream.Duplex {
  public dataChunk: string | Uint8Array = '';

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    callback.unsafeCall(new Error('duplex end failed'));
  }
}

class DuplexEndCbTwice extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class DuplexEndNoTransform extends stream.Transform {
  constructor() {
    super();
  }
}

export default function StreamDuplexEndTest(): void {
  describe('StreamDuplexEndTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_0100
     * @tc.name testStreamDuplexEnd001
     * @tc.desc Verify end() with no arguments ends write side, returns Duplex instance, triggers finish event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          d.on('finish', (): void => {
            finishedAtFinish = d.writableFinished;
            resolve(undefined as void);
          });
        });
        let ret = d.end();
        expect(ret.writableEnded).assertTrue();
        expect(d.writeCount).assertEqual(0);
        expect(d.writableEnded).assertTrue();
        await finishPromise;
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_0200
     * @tc.name testStreamDuplexEnd002
     * @tc.desc Verify end(chunk) passes string as the last data chunk to write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          d.on('finish', (): void => {
            finishedAtFinish = d.writableFinished;
            resolve(undefined as void);
          });
        });
        d.end("test");
        expect(d.dataChunk).assertEqual("test");
        expect(d.writableEnded).assertTrue();
        await finishPromise;
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_0300
     * @tc.name testStreamDuplexEnd003
     * @tc.desc Verify end(chunk) passes Uint8Array as the last binary data chunk to write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          d.on('finish', (): void => {
            finishedAtFinish = d.writableFinished;
            resolve(undefined as void);
          });
        });
        d.end(new Uint8Array([72, 101, 108, 108, 111]));
        let received = d.dataChunk as Uint8Array;
        expect(received.length).assertEqual(5);
        expect(received[0]).assertEqual(72);
        expect(received[4]).assertEqual(111);
        expect(d.writableEnded).assertTrue();
        await finishPromise;
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_0400
     * @tc.name testStreamDuplexEnd004
     * @tc.desc Verify end(chunk, encoding, callback) with all three parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        d.end("finish", "gbk");
        expect(d.dataChunk).assertEqual("finish");
        expect(d.dataEncoding).assertEqual("gbk");
        expect(d.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_0500
     * @tc.name testStreamDuplexEnd005
     * @tc.desc Verify writableEnded becomes true and writable becomes false after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.end();
      expect(d.writableEnded).assertTrue();
      expect(d.writable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_0600
     * @tc.name testStreamDuplexEnd006
     * @tc.desc Verify calling write after end is rejected with error code 10200036
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        let errName: string = '';
        let errCode: int = 0;
        let endedAtError: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on('error', (err: BusinessError): void => {
            errName = err.name;
            errCode = err.code;
            endedAtError = d.writableEnded;
            resolve(undefined as void);
          });
          d.end();
          let result = d.write('data');
          expect(result).assertFalse();
        });
        expect(errName).assertEqual('BusinessError');
        expect(errCode).assertEqual(10200036);
        expect(endedAtError).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_0700
     * @tc.name testStreamDuplexEnd007
     * @tc.desc Verify off('finish') removes listener, end does not trigger finish callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      let finishFired: boolean = false;
      let fn = (): void => {
        finishFired = true;
      };
      d.on('finish', fn);
      d.off('finish', fn);
      d.end();
      expect(finishFired).assertFalse();
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_0800
     * @tc.name testStreamDuplexEnd008
     * @tc.desc Verify end without chunk does not trigger doWrite call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          d.on('finish', (): void => {
            finishedAtFinish = d.writableFinished;
            resolve(undefined as void);
          });
        });
        d.end();
        expect(d.dataChunk).assertEqual('');
        expect(d.writeCount).assertEqual(0);
        expect(d.writableEnded).assertTrue();
        await finishPromise;
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_0900
     * @tc.name testStreamDuplexEnd009
     * @tc.desc Verify chunk is Uint8Array type, binary data ends normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.end(new Uint8Array([49, 50, 51]));
      let received = d.dataChunk as Uint8Array;
      expect(received.length).assertEqual(3);
      expect(received[0]).assertEqual(49);
      expect(received[2]).assertEqual(51);
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_1000
     * @tc.name testStreamDuplexEnd010
     * @tc.desc Verify chunk is Chinese + gbk encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        let callbackErr: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.end("测试工程师", "gbk", (err?: Error): void => {
            if (err !== undefined) {
              callbackErr = true;
            }
          });
          setTimeout((): void => {
            resolve(undefined as void);
          }, 0);
        });
        expect(callbackErr).assertFalse();
        expect(d.dataChunk).assertEqual("测试工程师");
        expect(d.dataEncoding).assertEqual("gbk");
        expect(d.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_1100
     * @tc.name testStreamDuplexEnd011
     * @tc.desc Verify end forwards the chunk and utf8, gbk, gb18030, gb2312, their uppercase forms and empty encoding unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['中文', 'hello', 'hello', '测试', '测试', '测试',
        '中文', '你好', '你好', 'test'];
      let encodings: string[] =
        ['gb18030', 'utf8', 'UTF-8', 'gbk', 'GBK', 'gb18030', 'GB18030', 'gb2312', 'GB2312', ''];
      for (let i = 0; i < chunks.length; i++) {
        let d = new DuplexEndTestBase();
        d.end(chunks[i], encodings[i]);
        expect(d.dataChunk).assertEqual(chunks[i]);
        expect(d.dataEncoding).assertEqual(encodings[i]);
        expect(d.writableEnded).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_1200
     * @tc.name testStreamDuplexEnd012
     * @tc.desc Verify callback only with omitted chunk, ends write side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        d.end("done", "utf8");
        expect(d.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_1300
     * @tc.name testStreamDuplexEnd013
     * @tc.desc Verify end forwards empty, whitespace, control, emoji, XSS, symbol, BOM, surrogate, replacement, multi-language and formatted-text chunks unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['', ' ', '  ', '\t', '\n', '\r', 'data', '😀',
        '😀测试', '<script>alert(1)</script>', '!@#$%^&*()', '﻿', '\uDC04',
        '\xE4', '�', 'тест', 'الاختبار',
        '13800138000', '0x123'];
      for (let i = 0; i < chunks.length; i++) {
        let d = new DuplexEndTestBase();
        d.end(chunks[i]);
        expect(d.dataChunk).assertEqual(chunks[i]);
        expect(d.writableEnded).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_1400
     * @tc.name testStreamDuplexEnd014
     * @tc.desc Verify single character (minimum valid length 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on('finish', (): void => {
            resolve(undefined as void);
          });
          d.end("a");
        });
        expect(d.dataChunk).assertEqual("a");
        expect(d.writeCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_1500
     * @tc.name testStreamDuplexEnd015
     * @tc.desc Verify end forwards the full string for lengths of 16384, 16385, 65535 and 102400 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lengths: int[] = [16384, 16385, 65535, 102400];
      for (let i = 0; i < lengths.length; i++) {
        let d = new DuplexEndTestBase();
        let largeStr: string = 'a'.repeat(lengths[i]);
        d.end(largeStr);
        expect((d.dataChunk as string).length).assertEqual(lengths[i]);
        expect(d.writableEnded).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_1600
     * @tc.name testStreamDuplexEnd016
     * @tc.desc Verify Error reported for an empty Uint8Array reaches the end callback error parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndErrorCb();
        let errName: string = '';
        let errMessage: string = '';
        let eventName: string = '';
        d.on('error', (err: Error): void => {
          eventName = err.name;
        });
        d.end(new Uint8Array([]), 'utf8', (err?: Error): void => {
          if (err !== undefined) {
            errName = err.name;
            errMessage = err.message;
          }
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          setTimeout((): void => resolve(undefined as void), 100);
        });
        expect(errName).assertEqual('Error');
        expect(errMessage).assertEqual('duplex end failed');
        expect(eventName).assertEqual('Error');
        expect((d.dataChunk as Uint8Array).length).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_1700
     * @tc.name testStreamDuplexEnd017
     * @tc.desc Verify single byte (minimum valid length 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.end(new Uint8Array([0]));
      let received = d.dataChunk as Uint8Array;
      expect(received.length).assertEqual(1);
      expect(received[0]).assertEqual(0);
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_1800
     * @tc.name testStreamDuplexEnd018
     * @tc.desc Verify min and max mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.end(new Uint8Array([0, 255]));
      let received = d.dataChunk as Uint8Array;
      expect(received.length).assertEqual(2);
      expect(received[1]).assertEqual(255);
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_1900
     * @tc.name testStreamDuplexEnd019
     * @tc.desc Verify all 0xFF maximum byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.end(new Uint8Array([255, 255, 255]));
      let received = d.dataChunk as Uint8Array;
      expect(received.length).assertEqual(3);
      expect(received[0]).assertEqual(255);
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_2000
     * @tc.name testStreamDuplexEnd020
     * @tc.desc Verify end forwards the full Uint8Array for sizes of 16384, 16385, 65536 and 102400 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [16384, 16385, 65536, 102400];
      for (let i = 0; i < sizes.length; i++) {
        let d = new DuplexEndTestBase();
        d.end(new Uint8Array(sizes[i]));
        expect((d.dataChunk as Uint8Array).length).assertEqual(sizes[i]);
        expect(d.writableEnded).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_2100
     * @tc.name testStreamDuplexEnd021
     * @tc.desc Verify default encoding (omitted)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.end("hello");
      expect(d.dataChunk).assertEqual("hello");
      expect(d.dataEncoding).assertEqual("utf-8");
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_2200
     * @tc.name testStreamDuplexEnd022
     * @tc.desc Verify callback is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      try {
        d.end(undefined as String, undefined as String, null as Object as Function);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_2300
     * @tc.name testStreamDuplexEnd023
     * @tc.desc Verify callback is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      try {
        d.end(undefined as String, undefined as String, undefined as Object as Function);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_2400
     * @tc.name testStreamDuplexEnd024
     * @tc.desc Verify callback is an empty function body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.end("test", "utf8", (err?: Error): void => {
      });
      expect(d.dataChunk).assertEqual("test");
      expect(d.dataEncoding).assertEqual("utf8");
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_2500
     * @tc.name testStreamDuplexEnd025
     * @tc.desc Verify callback is a multi-parameter function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.end("test", "utf8", (err?: Error, b?: int, c?: int, d?: int, e?: int): void => {
      });
      expect(d.dataChunk).assertEqual("test");
      expect(d.dataEncoding).assertEqual("utf8");
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_2600
     * @tc.name testStreamDuplexEnd026
     * @tc.desc Verify callback is an async arrow function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.end("test", "utf8", async (err?: Error): Promise<void> => {
      });
      expect(d.dataChunk).assertEqual("test");
      expect(d.dataEncoding).assertEqual("utf8");
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_2700
     * @tc.name testStreamDuplexEnd027
     * @tc.desc Verify cork > 0, end force-flushes the buffer and resets corked to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.cork();
      d.write("buffer");
      expect(d.writableCorked).assertEqual(1);
      expect(d.writeCount).assertEqual(0);
      d.end("flush");
      expect(d.writableCorked).assertEqual(0);
      expect(d.writeCount).assertEqual(2);
      expect(d.dataChunk).assertEqual("flush");
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_2800
     * @tc.name testStreamDuplexEnd028
     * @tc.desc Verify cork x2 nested, end force-flushes from 2 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.cork();
      d.cork();
      d.write("data");
      expect(d.writableCorked).assertEqual(2);
      expect(d.writeCount).assertEqual(0);
      d.end("last");
      expect(d.writableCorked).assertEqual(0);
      expect(d.writeCount).assertEqual(2);
      expect(d.dataChunk).assertEqual("last");
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_2900
     * @tc.name testStreamDuplexEnd029
     * @tc.desc Verify after end, wait for doWrite async completion, writableFinished becomes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        d.write("data");
        expect(d.dataChunk).assertEqual("data");
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on("finish", (): void => {
            finishedAtFinish = d.writableFinished;
            resolve(undefined as void);
          });
          d.end();
        });
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_3000
     * @tc.name testStreamDuplexEnd030
     * @tc.desc Verify after end, wait for doWrite to complete, writableLength resets to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.write("data");
      expect(d.dataChunk).assertEqual("data");
      d.end();
      expect(d.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_3100
     * @tc.name testStreamDuplexEnd031
     * @tc.desc Verify Duplex end with chunk completes when subclass does not override doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndNoDoWrite();
      d.end("data");
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_3200
     * @tc.name testStreamDuplexEnd032
     * @tc.desc Verify callback called twice in doWrite triggers error 10200037
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndCbTwice();
        let errName: string = '';
        let errCode: int = 0;
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            d.on('error', (err: BusinessError): void => {
              errName = err.name;
              errCode = err.code;
              resolve(undefined as void);
            });
            d.end("data", "utf8", (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
            });
          });
          expect(errName).assertEqual('BusinessError');
          expect(errCode).assertEqual(10200037);
        } catch (e) {
          expect().assertFail();
          return;
        }

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_3300
     * @tc.name testStreamDuplexEnd033
     * @tc.desc Verify a second end call reports the stream-ended BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        let errName: string = '';
        let errCode: int = 0;
        let endedAtError: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on('error', (err: BusinessError): void => {
            errName = err.name;
            errCode = err.code;
            endedAtError = d.writableEnded;
            resolve(undefined as void);
          });
          d.end();
          d.end();
        });
        expect(errName).assertEqual('BusinessError');
        expect(errCode).assertEqual(10200036);
        expect(endedAtError).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_3400
     * @tc.name testStreamDuplexEnd034
     * @tc.desc Verify [Duplex] after end, read side remains open, can read() buffered data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.write("Hello");
      d.push("World");
      d.end();
      expect(d.writableEnded).assertTrue();
      expect(d.read()?.toString()).assertEqual("World");
      expect(d.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_3500
     * @tc.name testStreamDuplexEnd035
     * @tc.desc Verify [Duplex] after end, push(null) closes the read side asynchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        d.write("data");
        d.end();
        expect(d.writableEnded).assertTrue();
        expect(d.readableEnded).assertFalse();
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on("end", (): void => {
            resolve(undefined as void);
          });
          d.push(null);
          d.read();
        });
        expect(d.readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_3600
     * @tc.name testStreamDuplexEnd036
     * @tc.desc Verify [Duplex] both ends close after end() and push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on("end", (): void => {
            resolve(undefined as void);
          });
          d.end();
          d.push(null);
          d.read();
        });
        expect(d.writableEnded).assertTrue();
        expect(d.readableEnded).assertTrue();
        expect(d.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_3700
     * @tc.name testStreamDuplexEnd037
     * @tc.desc Verify chunk is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      try {
        d.end(null as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_3800
     * @tc.name testStreamDuplexEnd038
     * @tc.desc Verify chunk is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      try {
        d.end(undefined as String);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_3900
     * @tc.name testStreamDuplexEnd039
     * @tc.desc Verify chunk is Japanese string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on('finish', (): void => {
            resolve(undefined as void);
          });
          d.end("テスト");
        });
        expect(d.dataChunk).assertEqual("テスト");
        expect(d.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_4000
     * @tc.name testStreamDuplexEnd040
     * @tc.desc Verify chunk is date format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on('finish', (): void => {
            resolve(undefined as void);
          });
          d.end("2026-03-05");
        });
        expect(d.dataChunk).assertEqual("2026-03-05");
        expect(d.writableLength).assertEqual(0);

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_4100
     * @tc.name testStreamDuplexEnd041
     * @tc.desc Verify chunk is all-zero Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.end(new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00]));
      let received = d.dataChunk as Uint8Array;
      expect(received.length).assertEqual(5);
      expect(received[0]).assertEqual(0x00);
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_4200
     * @tc.name testStreamDuplexEnd042
     * @tc.desc Verify chunk contains CR+LF control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.end(new Uint8Array([0x0A, 0x0D]));
      let received = d.dataChunk as Uint8Array;
      expect(received.length).assertEqual(2);
      expect(received[0]).assertEqual(0x0A);
      expect(received[1]).assertEqual(0x0D);
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_4300
     * @tc.name testStreamDuplexEnd043
     * @tc.desc Verify chunk encoded as UTF-8 produces the expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.end(new Uint8Array([0xE4, 0xB8, 0xAD]));
      let received = d.dataChunk as Uint8Array;
      expect(received.length).assertEqual(3);
      expect(received[0]).assertEqual(0xE4);
      expect(received[2]).assertEqual(0xAD);
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_4400
     * @tc.name testStreamDuplexEnd044
     * @tc.desc Verify chunk is number type (not allowed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      try {
        d.end(123 as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_4500
     * @tc.name testStreamDuplexEnd045
     * @tc.desc Verify chunk is boolean type (not allowed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      try {
        d.end(true as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_4600
     * @tc.name testStreamDuplexEnd046
     * @tc.desc Verify chunk is object type (not allowed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      try {
        d.end({} as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_4700
     * @tc.name testStreamDuplexEnd047
     * @tc.desc Verify Duplex end without a chunk completes without a doWrite override
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndNoDoWrite();
      d.end();
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_4800
     * @tc.name testStreamDuplexEnd048
     * @tc.desc Verify write after end returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndTestBase();
      d.end();
      expect(d.writableEnded).assertTrue();
      expect(d.writable).assertFalse();
      let r1 = d.write("data1");
      expect(r1).assertFalse();
      let r2 = d.write("data2");
      expect(r2).assertFalse();
      d.push("readableAlive");
      let readData = d.read();
      expect(readData?.toString()).assertEqual("readableAlive");
      expect(d.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_4900
     * @tc.name testStreamDuplexEnd049
     * @tc.desc Verify callback called twice for a Uint8Array end chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexEndCbTwice();
        let errName: string = '';
        let errCode: int = 0;
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            d.on('error', (err: BusinessError): void => {
              errName = err.name;
              errCode = err.code;
              resolve(undefined as void);
            });
            d.end(new Uint8Array([0x64]), "utf8", (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
            });
          });
          expect(errName).assertEqual('BusinessError');
          expect(errCode).assertEqual(10200037);
        } catch (e) {
          expect().assertFail();
          return;
        }

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_END_5000
     * @tc.name testStreamDuplexEnd050
     * @tc.desc Verify Transform end(chunk) reports the missing doTransform implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexEnd050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEndNoTransform();
      let code: int = 0;
      try {
        d.end("data");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(10200039);
    });

  });
}
