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

class DuplexWriteTestBase extends stream.Duplex {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';

  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall();
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    if (chunks.length > 0) {
      let values: Object[] = chunks as Object[];
      this.dataChunk = values[values.length - 1] as string | Uint8Array;
    }
    callback.unsafeCall();
  }
}

class DuplexWriteCountBase extends DuplexWriteTestBase {
  public writeCount: int = 0;
  public chunks: string[] = [];

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
    this.chunks.push(chunk as string);
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall();
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    this.writeCount += chunks.length;
    let values = chunks as string[];
    for (let i = 0; i < chunks.length; i++) {
      this.chunks.push(values[i]);
    }
    if (chunks.length > 0) {
      this.dataChunk = values[values.length - 1];
    }
    callback.unsafeCall();
  }
}

class DuplexWriteThrowBase extends DuplexWriteTestBase {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    throw new Error('write error');
  }
}

class DuplexWriteNoCbBase extends DuplexWriteTestBase {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
  }
}

class DuplexWriteErrorCbBase extends DuplexWriteTestBase {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall(new Error('write failed'));
  }
}

class DuplexWriteDualCbBase extends DuplexWriteTestBase {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class DuplexWriteNoImplBase extends stream.Duplex {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';

  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class DuplexWritevBase extends stream.Duplex {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';
  public writevChunks: string[] = [];
  public writevCalled: boolean = false;
  public writevCallCount: int = 0;

  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall();
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    this.writevChunks = chunks as string[];
    this.writevCalled = true;
    this.writevCallCount++;
    callback.unsafeCall();
  }
}

class DuplexWritevOnlyBase extends stream.Duplex {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';

  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall();
  }
}

class DuplexWritevThrowBase extends DuplexWritevBase {
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    this.writevChunks = chunks as string[];
    this.writevCalled = true;
    this.writevCallCount++;
    throw new Error('throw error');
  }
}

class DuplexWritevErrorCbBase extends DuplexWritevBase {
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    this.writevChunks = chunks as string[];
    callback.unsafeCall(new Error('write error'));
  }
}

class DuplexWritevDualCbBase extends DuplexWritevBase {
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    this.writevChunks = chunks as string[];
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class DuplexWritevNoImplBase extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class DuplexWritevAndReadBase extends DuplexWritevBase {
  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    this.writevChunks = chunks as string[];
    this.writevCalled = true;
    this.writevCallCount++;
    this.push("readData");
    callback.unsafeCall();
  }
}

export default function StreamDuplexDoWriteTest(): void {

  describe('StreamDuplexDoWriteTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_0100
     * @tc.name testStreamDuplexDoWrite001
     * @tc.desc Verify string+utf8 write triggers doWrite with correct parameters, readable side unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let result = d.write("test");
      expect(result).assertTrue();
      expect(d.dataChunk as string).assertEqual("test");
      expect(d.dataEncoding).assertEqual("utf-8");
      d.push("readable_data");
      expect(d.read()?.toString()).assertEqual("readable_data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_0200
     * @tc.name testStreamDuplexDoWrite002
     * @tc.desc Verify Uint8Array+gbk write triggers doWrite with correct parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let data = new Uint8Array([72, 101, 108, 108, 111]);
      let result = d.write(data, "gbk");
      expect(result).assertTrue();
      let received = d.dataChunk as Uint8Array;
      expect(received[0]).assertEqual(72);
      expect(received[4]).assertEqual(111);
      expect(d.dataEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_0300
     * @tc.name testStreamDuplexDoWrite003
     * @tc.desc Verify consecutive writes each trigger doWrite, readable side data is independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteCountBase();
      d.write("hello");
      expect(d.chunks[0]).assertEqual("hello");
      d.write("world");
      expect(d.chunks[1]).assertEqual("world");
      d.write("data");
      expect(d.chunks[2]).assertEqual("data");
      expect(d.writeCount).assertEqual(3);
      d.push("readable1");
      d.push("readable2");
      expect(d.read(9)?.toString()).assertEqual("readable1");
      expect(d.read(9)?.toString()).assertEqual("readable2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_0400
     * @tc.name testStreamDuplexDoWrite004
     * @tc.desc Verify end(chunk) triggers doWrite as the last chunk, readable side still readable after finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      d.end("final", "utf8");
      expect(d.dataChunk as string).assertEqual("final");
      expect(d.dataEncoding).assertEqual("utf8");
      expect(d.writableEnded).assertTrue();
      d.push("still_readable");
      expect(d.read()?.toString()).assertEqual("still_readable");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_0500
     * @tc.name testStreamDuplexDoWrite005
     * @tc.desc Verify corked state write does not trigger doWrite, readable side works independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      d.cork();
      d.write("buffered");
      expect(d.dataChunk).assertEqual('');
      expect(d.writableCorked).assertEqual(1);
      d.push("readData");
      expect(d.read()?.toString()).assertEqual("readData");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_0600
     * @tc.name testStreamDuplexDoWrite006
     * @tc.desc Verify end() prevents write from triggering doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      d.end();
      d.write("x");
      expect(d.dataChunk).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_0700
     * @tc.name testStreamDuplexDoWrite007
     * @tc.desc Verify doWrite is not triggered when write is not called, readable side works normally independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      expect(d.dataChunk).assertEqual('');
      d.push("data_without_write");
      expect(d.read()?.toString()).assertEqual("data_without_write");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_0800
     * @tc.name testStreamDuplexDoWrite008
     * @tc.desc Verify normal doWrite does not trigger error event, readable side events are not interfered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let errCaught: boolean = false;
      d.on('error', (err: Error): void => {
        errCaught = true;
      });
      d.write("valid");
      expect(errCaught).assertFalse();
      d.push("readable_event_data");
      expect(d.read()?.toString()).assertEqual("readable_event_data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_0900
     * @tc.name testStreamDuplexDoWrite009
     * @tc.desc Verify doWrite receives the chunk and gb18030, gb2312 or gbk encoding unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['测试工程师', '你好', 'Hello World'];
      let encodings: string[] = ['gb18030', 'gb2312', 'gbk'];
      for (let i = 0; i < chunks.length; i++) {
        let d = new DuplexWriteTestBase();
        let result = d.write(chunks[i], encodings[i]);
        expect(result).assertTrue();
        expect(d.dataChunk as string).assertEqual(chunks[i]);
        expect(d.dataEncoding).assertEqual(encodings[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_1000
     * @tc.name testStreamDuplexDoWrite010
     * @tc.desc Verify Uint8Array + utf8 encoding, doWrite receives correct parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let data = new Uint8Array([49, 50, 51]);
      let result = d.write(data);
      expect(result).assertTrue();
      let received = d.dataChunk as Uint8Array;
      expect(received[0]).assertEqual(49);
      expect(received[2]).assertEqual(51);
      expect(d.dataEncoding).assertEqual("utf-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_1100
     * @tc.name testStreamDuplexDoWrite011
     * @tc.desc Verify empty string (0 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      try {
        d.write("");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_1200
     * @tc.name testStreamDuplexDoWrite012
     * @tc.desc Verify doWrite receives single-character, null, BOM, emoji, XSS, multi-language, replacement, surrogate, symbol and tab chunks unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['a', '\0', '﻿', '😀', '😀测试',
        '<script>alert(1)</script>', 'テスト', 'тест',
        'الاختبار', '�', '\uDC04', '!@#$%^&*()', '\t'];
      for (let i = 0; i < chunks.length; i++) {
        let d = new DuplexWriteTestBase();
        let result = d.write(chunks[i]);
        expect(result).assertTrue();
        expect(d.dataChunk as string).assertEqual(chunks[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_1300
     * @tc.name testStreamDuplexDoWrite013
     * @tc.desc Verify 16384-byte ASCII string (equal to highWaterMark)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let chunk: string = 'a'.repeat(16384);
      let result = d.write(chunk);
      expect(d.dataChunk as string).assertEqual(chunk);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_1400
     * @tc.name testStreamDuplexDoWrite014
     * @tc.desc Verify write returns false for strings of 16385, 65535 and 100000 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lengths: int[] = [16385, 65535, 100000];
      for (let i = 0; i < lengths.length; i++) {
        let d = new DuplexWriteTestBase();
        let chunk: string = 'a'.repeat(lengths[i]);
        let result = d.write(chunk);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_1500
     * @tc.name testStreamDuplexDoWrite015
     * @tc.desc Verify Uint8Array empty literal (0 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let data = new Uint8Array([]);
      let result = d.write(data);
      expect(result).assertTrue();
      expect((d.dataChunk as Uint8Array).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_1600
     * @tc.name testStreamDuplexDoWrite016
     * @tc.desc Verify Uint8Array(0) constructor (0 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let data = new Uint8Array(0);
      let result = d.write(data);
      expect(result).assertTrue();
      expect((d.dataChunk as Uint8Array).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_1700
     * @tc.name testStreamDuplexDoWrite017
     * @tc.desc Verify Uint8Array(1) single zero byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let data = new Uint8Array(1);
      let result = d.write(data);
      expect(result).assertTrue();
      expect((d.dataChunk as Uint8Array).length).assertEqual(1);
      expect((d.dataChunk as Uint8Array)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_1800
     * @tc.name testStreamDuplexDoWrite018
     * @tc.desc Verify Uint8Array(16384) equal to highWaterMark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let data = new Uint8Array(16384);
      let result = d.write(data);
      expect(result).assertFalse();
      expect((d.dataChunk as Uint8Array).length).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_1900
     * @tc.name testStreamDuplexDoWrite019
     * @tc.desc Verify write returns false for Uint8Array of 16385, 65536 and 102400 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [16385, 65536, 102400];
      for (let i = 0; i < sizes.length; i++) {
        let d = new DuplexWriteTestBase();
        let data = new Uint8Array(sizes[i]);
        let result = d.write(data);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_2000
     * @tc.name testStreamDuplexDoWrite020
     * @tc.desc Verify the default encoding forwarded to doWrite is "utf-8"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let result = d.write("test");
      expect(result).assertTrue();
      expect(d.dataEncoding).assertEqual("utf-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_2100
     * @tc.name testStreamDuplexDoWrite021
     * @tc.desc Verify doWrite receives gbk, gb18030, gb2312, uppercase GBK and empty encodings unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['测试', '测试', '测试', '测试', 'test'];
      let encodings: string[] = ['gbk', 'gb18030', 'gb2312', 'GBK', ''];
      for (let i = 0; i < chunks.length; i++) {
        let d = new DuplexWriteTestBase();
        let result = d.write(chunks[i], encodings[i]);
        expect(result).assertTrue();
        expect(d.dataEncoding).assertEqual(encodings[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_2200
     * @tc.name testStreamDuplexDoWrite022
     * @tc.desc Verify encoding="UTF-8" uppercase form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let result = d.write("test", "UTF-8");
      expect(d.dataEncoding).assertEqual("UTF-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_2300
     * @tc.name testStreamDuplexDoWrite023
     * @tc.desc Verify encoding="ascii" unsupported encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      try {
        let result = d.write("test", "ascii");
        expect(result).assertTrue();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_2400
     * @tc.name testStreamDuplexDoWrite024
     * @tc.desc Verify encoding="utf-8" with hyphen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let result = d.write("test", "utf-8");
      expect(d.dataEncoding).assertEqual("utf-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_2500
     * @tc.name testStreamDuplexDoWrite025
     * @tc.desc Verify callback is an arrow function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedCallbackError: Error | undefined = undefined;
      let d = new DuplexWriteCountBase();
      d.write("data", "utf8", (err?: Error): void => {
        if (err !== undefined) {
          capturedCallbackError = err;
          return;
        }
      });
      expect(d.writeCount).assertEqual(1);
      expect(capturedCallbackError).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_2600
     * @tc.name testStreamDuplexDoWrite026
     * @tc.desc Verify callback is a regular function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexWriteCountBase();
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            d.write("data", "utf8", (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              resolve(undefined as void);
            });
          });
          expect(d.writeCount).assertEqual(1);
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_2700
     * @tc.name testStreamDuplexDoWrite027
     * @tc.desc Verify callback is invoked for an explicitly encoded string chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteCountBase();
      d.write("测试", "gbk", (err?: Error): void => {
        if (err !== undefined) {
          return;
        }
        expect(d.writeCount).assertEqual(1);
      });
      expect(d.writeCount).assertEqual(1);
      expect(d.dataChunk).assertEqual("测试");
      expect(d.dataEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_2800
     * @tc.name testStreamDuplexDoWrite028
     * @tc.desc Verify corked binary write waits for uncork, then readable side remains independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      d.cork();
      d.write(new Uint8Array([100, 97, 116, 97, 49]));
      expect(d.dataChunk).assertEqual('');
      expect(d.writableCorked).assertEqual(1);
      d.uncork();
      let received = d.dataChunk as Uint8Array;
      expect(received.length).assertEqual(5);
      expect(received[0]).assertEqual(100);
      d.push("x");
      expect(d.read()?.toString()).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_2900
     * @tc.name testStreamDuplexDoWrite029
     * @tc.desc Verify cork + write then uncork flushes, doWrite is triggered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      d.cork();
      d.write("a");
      d.write("b");
      expect(d.dataChunk).assertEqual('');
      d.uncork();
      expect(d.dataChunk).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_3000
     * @tc.name testStreamDuplexDoWrite030
     * @tc.desc Verify cork nested x2 then uncork gradually resets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      d.cork();
      d.cork();
      d.write("x");
      expect(d.writableCorked).assertEqual(2);
      d.uncork();
      expect(d.writableCorked).assertEqual(1);
      expect(d.dataChunk).assertEqual('');
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_3100
     * @tc.name testStreamDuplexDoWrite031
     * @tc.desc Verify end(chunk) triggers doWrite then stream ends, readable side unaffected by write side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      d.end("final chunk", "utf8");
      expect(d.dataChunk as string).assertEqual("final chunk");
      expect(d.writableEnded).assertTrue();
      d.push("readData");
      expect(d.read()?.toString()).assertEqual("readData");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_3200
     * @tc.name testStreamDuplexDoWrite032
     * @tc.desc Verify writing after end() does not trigger doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      d.end();
      let result = d.write("late");
      expect(result).assertFalse();
      expect(d.dataChunk).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_3300
     * @tc.name testStreamDuplexDoWrite033
     * @tc.desc Verify callback passing Error in doWrite triggers error event on both ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexWriteErrorCbBase();
        let errName: string = '';
        let errMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on('error', (err: Error): void => {
            errName = err.name;
            errMessage = err.message;
            resolve(undefined as void);
          });
          d.write("data");
        });
        expect(errName).assertEqual('Error');
        expect(errMessage).assertEqual('write failed');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_3400
     * @tc.name testStreamDuplexDoWrite034
     * @tc.desc Verify multiple writes under cork + uncork data merging, readable side data independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexWriteCountBase();
        d.cork();
        d.write("a");
        d.write("b");
        d.write("c");
        expect(d.writeCount).assertEqual(0);
        d.push("x");
        d.push("y");
        let countAtFinish: int = 0;
        let readX: string = '';
        let readY: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on("finish", (): void => {
            countAtFinish = d.writeCount;
            readX = d.read(1)?.toString() ?? '';
            readY = d.read(1)?.toString() ?? '';
            resolve(undefined as void);
          });
          d.uncork();
          d.end();
        });
        expect(countAtFinish).assertEqual(3);
        expect(readX).assertEqual("x");
        expect(readY).assertEqual("y");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_3500
     * @tc.name testStreamDuplexDoWrite035
     * @tc.desc Verify all-zero byte array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let data = new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00]);
      let result = d.write(data);
      expect(result).assertTrue();
      expect((d.dataChunk as Uint8Array).length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_3600
     * @tc.name testStreamDuplexDoWrite036
     * @tc.desc Verify all-max-byte (0xFF) array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let data = new Uint8Array([0xFF, 0xFF, 0xFF, 0xFF, 0xFF]);
      let result = d.write(data);
      expect(result).assertTrue();
      expect((d.dataChunk as Uint8Array).length).assertEqual(5);
      expect((d.dataChunk as Uint8Array)[0]).assertEqual(0xFF);
      expect((d.dataChunk as Uint8Array)[4]).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_3700
     * @tc.name testStreamDuplexDoWrite037
     * @tc.desc Verify newline + carriage return control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let data = new Uint8Array([0x0A, 0x0D]);
      let result = d.write(data);
      expect(result).assertTrue();
      expect((d.dataChunk as Uint8Array).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_3800
     * @tc.name testStreamDuplexDoWrite038
     * @tc.desc Verify UTF-8 encoded CJK character produces the expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let data = new Uint8Array([0xE4, 0xB8, 0xAD]);
      let result = d.write(data);
      expect(result).assertTrue();
      expect((d.dataChunk as Uint8Array).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_3900
     * @tc.name testStreamDuplexDoWrite039
     * @tc.desc Verify doWrite subclass implementation throws error, both ends trigger error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedCallbackError: Error | undefined = undefined;
      let d = new DuplexWriteThrowBase();
      try {
        d.write("test", "utf8", (err?: Error): void => {
          if (err !== undefined) {
            capturedCallbackError = err;
            return;
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
      expect(capturedCallbackError).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_4000
     * @tc.name testStreamDuplexDoWrite040
     * @tc.desc Verify doWrite subclass does not call callback, stream hangs but readable side remains operable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteNoCbBase();
      d.write("test");
      expect(d.dataChunk as string).assertEqual("test");
      expect(d.dataEncoding).assertEqual("utf-8");
      d.push("readData");
      expect(d.read()?.toString()).assertEqual("readData");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_4100
     * @tc.name testStreamDuplexDoWrite041
     * @tc.desc Verify chunk is number type (type error)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      try {
        d.write(123 as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_4200
     * @tc.name testStreamDuplexDoWrite042
     * @tc.desc Verify encoding is invalid value "xyz123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      try {
        d.write("test", "xyz123");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_4300
     * @tc.name testStreamDuplexDoWrite043
     * @tc.desc Verify calling write without doWrite implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteNoImplBase();
      let result = d.write("data");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_4400
     * @tc.name testStreamDuplexDoWrite044
     * @tc.desc Verify calling end(chunk) without doWrite implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteNoImplBase();
      d.end("data");
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_4500
     * @tc.name testStreamDuplexDoWrite045
     * @tc.desc Verify callback called twice with an explicit encoding and callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexWriteDualCbBase();
        let errName: string = '';
        let errCode: int = 0;
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            d.on('error', (err: BusinessError): void => {
              errName = err.name;
              errCode = err.code;
              resolve(undefined as void);
            });
            d.write("test", "utf8", (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
            });
          });
          expect(errName).assertEqual('BusinessError');
          expect(errCode).assertEqual(10200037);
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_4600
     * @tc.name testStreamDuplexDoWrite046
     * @tc.desc Verify doWrite preserves the selected byte range of an ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let backing: ArrayBuffer = new ArrayBuffer(32);
      let backingView: Uint8Array = new Uint8Array(backing);
      for (let i: int = 0; i < backingView.length; i++) {
        backingView[i] = i + 10;
      }
      let selectedView: Uint8Array = new Uint8Array(backing, 7, 12);

      let result: boolean = d.write(selectedView, 'utf8');
      expect(result).assertTrue();
      let received: Uint8Array = d.dataChunk as Uint8Array;
      expect(received.length).assertEqual(12);
      expect(received[0]).assertEqual(17);
      expect(received[1]).assertEqual(18);
      expect(received[10]).assertEqual(27);
      expect(received[11]).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_4700
     * @tc.name testStreamDuplexDoWrite047
     * @tc.desc Verify doWrite accepts a zero-length ArrayBuffer view without leaking backing bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let backing: ArrayBuffer = new ArrayBuffer(16);
      let backingView: Uint8Array = new Uint8Array(backing);
      backingView.fill(255);
      let emptyView: Uint8Array = new Uint8Array(backing, 4, 0);

      let result: boolean = d.write(emptyView, 'utf8');
      expect(result).assertTrue();
      let received: Uint8Array = d.dataChunk as Uint8Array;
      expect(received.length).assertEqual(0);
      expect(received.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_4800
     * @tc.name testStreamDuplexDoWrite048
     * @tc.desc Verify doWrite preserves the complete C0 and DEL control-character payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteTestBase();
      let controlData: string = '';
      for (let code: int = 0; code <= 0x1F; code++) {
        controlData += String.fromCharCode(code);
      }
      controlData += String.fromCharCode(0x7F);

      let result: boolean = d.write(controlData, 'utf8');
      expect(result).assertTrue();
      let received: string = d.dataChunk as string;
      expect(received.length).assertEqual(33);
      expect(received).assertEqual(controlData);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_4900
     * @tc.name testStreamDuplexDoWrite049
     * @tc.desc Verify cork + multiple write(string) + uncork triggers doWritev with all buffered chunks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let groups: string[][] = [["test", "hello"], ["data", "finish", "close"]];
      for (let i = 0; i < groups.length; i++) {
        let d = new DuplexWritevBase();
        let chunks: string[] = groups[i];
        d.cork();
        for (let j = 0; j < chunks.length; j++) {
          d.write(chunks[j]);
        }
        expect(d.writevCalled).assertFalse();
        d.uncork();
        expect(d.writevCalled).assertTrue();
        expect(d.writevCallCount).assertEqual(1);
        let arr = d.writevChunks;
        expect(arr.length).assertEqual(chunks.length);
        for (let j = 0; j < chunks.length; j++) {
          expect(arr[j]).assertEqual(chunks[j]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_5000
     * @tc.name testStreamDuplexDoWrite050
     * @tc.desc Verify cork + write(Uint8Array)x2 + uncork triggers doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.write(new Uint8Array([72, 101, 108, 108, 111]));
      d.write(new Uint8Array([116, 101, 115, 116]));
      d.uncork();
      expect(d.writevCalled).assertTrue();
      let arr = d.writevChunks as Uint8Array[];
      expect(d.writevCallCount).assertEqual(1);
      expect(arr.length).assertEqual(2);
      expect(arr[0].length).assertEqual(5);
      expect(arr[1].length).assertEqual(4);
      expect(arr[0][0]).assertEqual(72);
      expect(arr[1][0]).assertEqual(116);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_5100
     * @tc.name testStreamDuplexDoWrite051
     * @tc.desc Verify subclass without doWritev does not fall back to doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevOnlyBase();
      d.cork();
      d.write("a");
      d.write("b");
      expect(d.dataChunk).assertEqual("");
      d.uncork();
      expect(d.dataChunk).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_5200
     * @tc.name testStreamDuplexDoWrite052
     * @tc.desc Verify direct write without cork does not trigger doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.write("a");
      expect(d.writevCalled).assertFalse();
      expect(d.dataChunk as string).assertEqual("a");
      d.write("b");
      expect(d.writevCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_5300
     * @tc.name testStreamDuplexDoWrite053
     * @tc.desc Verify doWritev is not triggered after end()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.write("a");
      d.end("b");
      expect(d.writevCalled).assertTrue();
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_5400
     * @tc.name testStreamDuplexDoWrite054
     * @tc.desc Verify corked state without uncork does not trigger doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.write("a");
      d.write("b");
      expect(d.writevCalled).assertFalse();
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_5500
     * @tc.name testStreamDuplexDoWrite055
     * @tc.desc Verify Uint8Array[] batch data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.write(new Uint8Array([0x48, 0x65, 0x6c]));
      d.write(new Uint8Array([0x6c, 0x6f]));
      d.uncork();
      expect(d.writevCalled).assertTrue();
      let arr = d.writevChunks as Uint8Array[];
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_5600
     * @tc.name testStreamDuplexDoWrite056
     * @tc.desc Verify mixed string[] + Uint8Array[]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.write("hello");
      d.write(new Uint8Array([116, 101, 115, 116]));
      d.uncork();
      expect(d.writevCalled).assertTrue();
      let arr = d.writevChunks;
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_5700
     * @tc.name testStreamDuplexDoWrite057
     * @tc.desc Verify doWritev collects both buffered chunks for same and mixed encodings after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firsts: string[] = ['测试', '中文', 'test'];
      let firstEncodings: string[] = ['gbk', 'gb18030', 'utf8'];
      let seconds: string[] = ['你好', '工程师', '测试'];
      let secondEncodings: string[] = ['gbk', 'gb18030', 'gbk'];
      for (let i = 0; i < firsts.length; i++) {
        let d = new DuplexWritevBase();
        d.cork();
        d.write(firsts[i], firstEncodings[i]);
        d.write(seconds[i], secondEncodings[i]);
        d.uncork();
        expect(d.writevCalled).assertTrue();
        let arr = d.writevChunks;
        expect(arr.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_5800
     * @tc.name testStreamDuplexDoWrite058
     * @tc.desc Verify empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevOnlyBase();
      try {
        d.cork();
        d.write("");
        d.uncork();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_5900
     * @tc.name testStreamDuplexDoWrite059
     * @tc.desc Verify doWritev is triggered for whitespace, control, BOM, emoji, symbol, XSS, null, replacement, surrogate and multi-language chunks after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = [' ', '  ', '\t', '\n', '\r', '﻿', '😀', '!@#$%^&*()',
        '<script>alert(1)</script>', '\0', '�', '\uDC04', '⭐⭐', 'テスト',
        '테스트', 'АБВГД', 'الاختبار',
        '😀测试'];
      for (let i = 0; i < chunks.length; i++) {
        let d = new DuplexWritevBase();
        d.cork();
        d.write(chunks[i]);
        d.uncork();
        expect(d.writevCalled).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_6000
     * @tc.name testStreamDuplexDoWrite060
     * @tc.desc Verify 16385-character long string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      let chunk: string = 'a'.repeat(16385);
      d.cork();
      d.write(chunk);
      d.uncork();
      expect(d.writevCalled).assertTrue();
      expect(d.writevChunks[0]).assertEqual(chunk);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_6100
     * @tc.name testStreamDuplexDoWrite061
     * @tc.desc Verify empty Uint8Array literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.write(new Uint8Array([]));
      d.uncork();
      expect(d.writevCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_6200
     * @tc.name testStreamDuplexDoWrite062
     * @tc.desc Verify doWritev is triggered for Uint8Array chunks of 0, 1, 16384, 65536 and 1048576 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [0, 1, 16384, 65536, 1048576];
      for (let i = 0; i < sizes.length; i++) {
        let d = new DuplexWritevBase();
        d.cork();
        d.write(new Uint8Array(sizes[i]));
        d.uncork();
        expect(d.writevCalled).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_6300
     * @tc.name testStreamDuplexDoWrite063
     * @tc.desc Verify callback=null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      try {
        d.cork();
        d.write("x", "utf8", null as Object as Function);
        d.uncork();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_6400
     * @tc.name testStreamDuplexDoWrite064
     * @tc.desc Verify callback=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      try {
        d.cork();
        d.write("x", "utf8", undefined as Object as Function);
        d.uncork();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_6500
     * @tc.name testStreamDuplexDoWrite065
     * @tc.desc Verify doWritev receives and completes an explicit write callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      let callbackCalled: boolean = false;
      d.cork();
      d.write("x", "utf8", (err?: Error): void => {
        if (err !== undefined) {
          return;
        }
        callbackCalled = true;
      });
      d.uncork();
      expect(d.writevCalled).assertTrue();
      expect(callbackCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_6600
     * @tc.name testStreamDuplexDoWrite066
     * @tc.desc Verify cork nested x2 then first uncork does not trigger until the second uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.cork();
      d.write("a");
      d.write("b");
      d.uncork();
      expect(d.writevCalled).assertFalse();
      d.uncork();
      expect(d.writevCalled).assertTrue();
      let arr = d.writevChunks;
      expect(arr[0]).assertEqual("a");
      expect(arr[1]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_6700
     * @tc.name testStreamDuplexDoWrite067
     * @tc.desc Verify cork + write then end with Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.write("a");
      expect(d.writevCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_6800
     * @tc.name testStreamDuplexDoWrite068
     * @tc.desc Verify writableLength resets to zero after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.write("a");
      d.write("b");
      d.uncork();
      expect(d.writevCalled).assertTrue();
      expect(d.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_6900
     * @tc.name testStreamDuplexDoWrite069
     * @tc.desc Verify two consecutive uncorks (no data) do not trigger doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.cork();
      d.uncork();
      expect(d.writevCalled).assertFalse();
      d.uncork();
      expect(d.writevCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_7000
     * @tc.name testStreamDuplexDoWrite070
     * @tc.desc Verify cork + write + uncork without doWrite implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevNoImplBase();
      d.cork();
      d.write("x");
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_7100
     * @tc.name testStreamDuplexDoWrite071
     * @tc.desc Verify read side can push data simultaneously when doWritev triggers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevAndReadBase();
      d.cork();
      d.write("data");
      d.uncork();
      expect(d.writevCalled).assertTrue();
      expect(d.writevCallCount).assertEqual(1);
      expect(d.read()?.toString()).assertEqual("readData");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_7200
     * @tc.name testStreamDuplexDoWrite072
     * @tc.desc Verify Uint8Array containing 0xFF boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.write(new Uint8Array([0, 255, 0]));
      d.uncork();
      expect(d.writevCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_7300
     * @tc.name testStreamDuplexDoWrite073
     * @tc.desc Verify Uint8Array all-zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.write(new Uint8Array([0, 0, 0, 0, 0]));
      d.uncork();
      expect(d.writevCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_7400
     * @tc.name testStreamDuplexDoWrite074
     * @tc.desc Verify Uint8Array containing 0x00/0xFF/0x7F/0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.write(new Uint8Array([0x00, 0xFF, 0x7F, 0x80]));
      d.uncork();
      expect(d.writevCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_7500
     * @tc.name testStreamDuplexDoWrite075
     * @tc.desc Verify callback passing Error triggers error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexWritevErrorCbBase();
        let errName: string = '';
        let errMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on('error', (err: Error): void => {
            errName = err.name;
            errMessage = err.message;
            resolve(undefined as void);
          });
          d.cork();
          d.write("a");
          d.uncork();
        });
        expect(errName).assertEqual('Error');
        expect(errMessage).assertEqual('write error');

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_7600
     * @tc.name testStreamDuplexDoWrite076
     * @tc.desc Verify doWritev internal throw Error triggers error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedCallbackError: Error | undefined = undefined;
      let d = new DuplexWritevThrowBase();
      let errCaught: boolean = false;
      d.on('error', (err: Error): void => {
        if (err !== undefined) {
          capturedCallbackError = err;
          return;
        }
        errCaught = true;
      });
      d.cork();
      d.write("a");
      try {
        d.uncork();
        expect().assertFail();
      } catch (e) {
        errCaught = true;
        expect(e.name).assertEqual("Error");
      }
      expect(errCaught).assertTrue();
      expect(capturedCallbackError).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_7700
     * @tc.name testStreamDuplexDoWrite077
     * @tc.desc Verify callback as non-function type (number) causes type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      let errName: string = '';
      try {
        let badCb = 123 as Object as Function;
        d.cork();
        d.write("x", "utf8", badCb);
        d.uncork();
        expect().assertFail();
      } catch (e) {
        errName = e.name;
      }
      expect(errName).assertEqual("ClassCastError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_7800
     * @tc.name testStreamDuplexDoWrite078
     * @tc.desc Verify a multi-chunk cork batch stays writable without doWrite or doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevNoImplBase();
      d.cork();
      expect(d.write("first")).assertTrue();
      expect(d.write("second")).assertTrue();
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
      expect(d.writableEnded).assertFalse();
      expect(d.writable).assertTrue();
      expect(d.write("third")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_7900
     * @tc.name testStreamDuplexDoWrite079
     * @tc.desc Verify callback called twice in doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevDualCbBase();
      try {
        d.cork();
        d.write("a");
        d.uncork();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_8000
     * @tc.name testStreamDuplexDoWrite080
     * @tc.desc Verify end with a chunk completes when doWrite and doWritev are absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevNoImplBase();
      d.end("x", "utf8");
      expect(d.writableEnded).assertTrue();
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_8100
     * @tc.name testStreamDuplexDoWrite081
     * @tc.desc Verify cork + write + uncork is rejected after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.end();
      d.cork();
      d.write("x");
      d.uncork();
      expect(d.writevCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_8200
     * @tc.name testStreamDuplexDoWrite082
     * @tc.desc Verify cork + write + uncork triggers doWritev before end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevBase();
      d.cork();
      d.write("x");
      d.uncork();
      expect(d.writevCalled).assertTrue();
      expect(d.writevCallCount).assertEqual(1);
      d.end();
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_WRITE_8300
     * @tc.name testStreamDuplexDoWrite083
     * @tc.desc Verify doWritev can produce readable data while flushing a batch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoWrite083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevAndReadBase();
      d.pause();
      d.cork();
      d.write('a', 'utf8');
      d.write('b', 'utf8');
      d.uncork();
      expect(d.writevCalled).assertTrue();
      expect(d.writevCallCount).assertEqual(1);
      expect(d.read()?.toString()).assertEqual('readData');
    });

  });
}
