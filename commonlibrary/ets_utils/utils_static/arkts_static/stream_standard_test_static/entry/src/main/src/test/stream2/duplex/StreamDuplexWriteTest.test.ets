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

class DuplexTestBase extends stream.Duplex {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';
  public writeCount: int = 0;
  public writevCount: int = 0;

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
    let values: Object[] = chunks as Object[];
    this.dataChunk = values[values.length - 1] as string | Uint8Array;
    this.writevCount++;
    callback.unsafeCall();
  }
}

class DuplexWriteErrorCb extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error('duplex write failed'));
  }
}

class DuplexRepeatCallback extends stream.Duplex {
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

class DuplexPipeTarget extends stream.Writable {
  public dataChunk: string | Uint8Array = '';

  doInitialize(callback: Function): void {
    callback.unsafeCall();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    callback.unsafeCall();
  }
}

class TransformNoDoTransform extends stream.Transform {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamDuplexWriteTest(): void {
  describe('StreamDuplexWriteTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_0100
     * @tc.name testStreamDuplexWrite001
     * @tc.desc Verify Uint8Array write returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write(new Uint8Array([72, 101, 108, 108, 111]));
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(5);
      expect(received[0]).assertEqual(72);
      expect(received[4]).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_0200
     * @tc.name testStreamDuplexWrite002
     * @tc.desc Verify write forwards the chunk and gbk, gb18030, gb2312, UTF-8 encodings and their uppercase forms unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['测试工程师', '中文', '测试', 'test',
        '测试', '测试', '测试', 'test'];
      let encodings: string[] = ['gbk', 'gb18030', 'gb2312', 'UTF-8', 'GBK', 'GB18030', 'GB2312', 'gb18030'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new DuplexTestBase();
        let result = ws.write(chunks[i], encodings[i]);
        expect(result).assertTrue();
        expect(ws.dataChunk).assertEqual(chunks[i]);
        expect(ws.dataEncoding).assertEqual(encodings[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_0300
     * @tc.name testStreamDuplexWrite003
     * @tc.desc Verify write with callback executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new DuplexTestBase();
        let callbackCalled: boolean = false;
        let result: boolean = false;
        try {
          await new Promise<void>((resolve: (value: void) => void,
            reject: (reason: Error) => void): void => {
            result = ws.write("data", "utf8", (err?: Error): void => {
              callbackCalled = true;
              if (err !== undefined) {
                reject(err);
                return;
              }
              resolve(undefined as void);
            });
          });
          expect(result).assertTrue();
          expect(callbackCalled).assertTrue();
          expect(ws.dataChunk).assertEqual("data");
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_0400
     * @tc.name testStreamDuplexWrite004
     * @tc.desc Verify write does not trigger doWrite in corked state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      let result = ws.write("x");
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.writeCount).assertEqual(0);
      expect(ws.writableLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_0500
     * @tc.name testStreamDuplexWrite005
     * @tc.desc Verify write returns false under backpressure but data is still queued
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write(new Uint8Array(20000));
      expect(result).assertFalse();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(20000);
      expect(ws.writeCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_0600
     * @tc.name testStreamDuplexWrite006
     * @tc.desc Verify write with an explicit utf8 encoding and omitted callback succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write("hello", "utf8");
      expect(result).assertTrue();
      expect(ws.dataChunk).assertEqual("hello");
      expect(ws.dataEncoding).assertEqual("utf8");
      expect(ws.writable).assertTrue();
      expect(ws.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_0700
     * @tc.name testStreamDuplexWrite007
     * @tc.desc Verify normal write does not trigger error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new DuplexTestBase();
        let errorFired: boolean = false;
        let result: boolean = false;
        try {
          await new Promise<void>((resolve: (value: void) => void,
            reject: (reason: Error) => void): void => {
            ws.on("error", (err: Error): void => {
              errorFired = true;
              reject(err);
            });
            result = ws.write("valid");
            setTimeout((): void => resolve(undefined as void), 50);
          });
          expect(result).assertTrue();
          expect(ws.dataChunk).assertEqual("valid");
          expect(errorFired).assertFalse();
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_0800
     * @tc.name testStreamDuplexWrite008
     * @tc.desc Verify Uint8Array + utf8 encoding write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write(new Uint8Array([49, 50, 51]), "utf8");
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(3);
      expect(received[0]).assertEqual(49);
      expect(ws.dataEncoding).assertEqual("utf8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_0900
     * @tc.name testStreamDuplexWrite009
     * @tc.desc Verify write forwards plain, whitespace, control, null, BOM, emoji, XSS, multi-language, replacement, surrogate, symbol, circled-number and formatted-text chunks unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['Hello World', ' ', 'a', 'data', '\0', '﻿', '😀',
        '😀测试', '<script>alert(1)</script>', 'テスト', '테스트',
        'тест', 'الاختبار', '�', '\uDC04',
        '\xE4', '!@#$%^&*()', '2026-03-05', '13800138000', '0x123', '①②③', '\n', '\t', '  '];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new DuplexTestBase();
        let result = ws.write(chunks[i]);
        expect(result).assertTrue();
        expect(ws.dataChunk).assertEqual(chunks[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_1000
     * @tc.name testStreamDuplexWrite010
     * @tc.desc Verify empty string (0 bytes) should be rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      try {
        ws.write("");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_1100
     * @tc.name testStreamDuplexWrite011
     * @tc.desc Verify 16383-byte ASCII string (1B below highWaterMark)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write("A".repeat(16383));
      expect(result).assertTrue();
      expect((ws.dataChunk as string).length).assertEqual(16383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_1200
     * @tc.name testStreamDuplexWrite012
     * @tc.desc Verify write returns false for strings of 16384, 16385, 65535 and 100000 characters while forwarding the full chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lengths: int[] = [16384, 16385, 65535, 100000];
      for (let i = 0; i < lengths.length; i++) {
        let ws = new DuplexTestBase();
        let result = ws.write('A'.repeat(lengths[i]));
        expect(result).assertFalse();
        expect((ws.dataChunk as string).length).assertEqual(lengths[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_1300
     * @tc.name testStreamDuplexWrite013
     * @tc.desc Verify Uint8Array empty literal (0 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write(new Uint8Array([]));
      expect(result).assertTrue();
      expect((ws.dataChunk as Uint8Array).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_1400
     * @tc.name testStreamDuplexWrite014
     * @tc.desc Verify write returns true for Uint8Array of 1 and 16383 bytes below the high water mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [1, 16383];
      for (let i = 0; i < sizes.length; i++) {
        let ws = new DuplexTestBase();
        let result = ws.write(new Uint8Array(sizes[i]));
        expect(result).assertTrue();
        expect((ws.dataChunk as Uint8Array).length).assertEqual(sizes[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_1500
     * @tc.name testStreamDuplexWrite015
     * @tc.desc Verify Uint8Array all 0xFF (255)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write(new Uint8Array([255, 255, 255]));
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(3);
      expect(received[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_1600
     * @tc.name testStreamDuplexWrite016
     * @tc.desc Verify Uint8Array min+max mixed [0,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write(new Uint8Array([0, 255]));
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(2);
      expect(received[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_1700
     * @tc.name testStreamDuplexWrite017
     * @tc.desc Verify write returns false for Uint8Array of 16384, 16385 and 65536 bytes at or above the high water mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [16385, 65536, 16384];
      for (let i = 0; i < sizes.length; i++) {
        let ws = new DuplexTestBase();
        let result = ws.write(new Uint8Array(sizes[i]));
        expect(result).assertFalse();
        expect((ws.dataChunk as Uint8Array).length).assertEqual(sizes[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_1800
     * @tc.name testStreamDuplexWrite018
     * @tc.desc Verify omitted encoding (default utf8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write("test");
      expect(result).assertTrue();
      expect(ws.dataChunk).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_1900
     * @tc.name testStreamDuplexWrite019
     * @tc.desc Verify encoding="gbk"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write("测试", "gbk");
      expect(result).assertTrue();
      expect(ws.dataChunk).assertEqual("测试");
      expect(ws.dataEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_2000
     * @tc.name testStreamDuplexWrite020
     * @tc.desc Verify encoding="gb18030"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write("测试", "gb18030");
      expect(result).assertTrue();
      expect(ws.dataChunk).assertEqual("测试");
      expect(ws.dataEncoding).assertEqual("gb18030");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_2100
     * @tc.name testStreamDuplexWrite021
     * @tc.desc Verify empty encoding is accepted and data is written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write("test", "");
      expect(result).assertTrue();
      expect(ws.dataChunk).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_2200
     * @tc.name testStreamDuplexWrite022
     * @tc.desc Verify callback=null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let errorCaught: boolean = false;
      try {
        ws.write("data", null as Object as String, null as Object as Function);
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_2300
     * @tc.name testStreamDuplexWrite023
     * @tc.desc Verify callback=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let errorCaught: boolean = false;
      try {
        ws.write("data", undefined as String, undefined as Function);
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_2400
     * @tc.name testStreamDuplexWrite024
     * @tc.desc Verify write data accumulates under corked state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      let r1 = ws.write("a");
      expect(r1).assertTrue();
      let r2 = ws.write("b");
      expect(r2).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.writeCount).assertEqual(0);
      expect(ws.writableLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_2500
     * @tc.name testStreamDuplexWrite025
     * @tc.desc Verify cork then uncork flushes write buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.write("a");
      ws.write("b");
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writevCount).assertEqual(1);
      expect(ws.dataChunk).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_2600
     * @tc.name testStreamDuplexWrite026
     * @tc.desc Verify cork nested x2 then uncork resets and flushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.cork();
      ws.write("x");
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.writeCount).assertEqual(0);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writevCount).assertEqual(1);
      expect(ws.dataChunk).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_2700
     * @tc.name testStreamDuplexWrite027
     * @tc.desc Verify drain event triggers after backpressure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let drainCalled: boolean = false;
      ws.on("drain", (): void => {
        drainCalled = true;
      });
      let result = ws.write(new Uint8Array(20000));
      expect(result).assertFalse();
      expect((ws.dataChunk as Uint8Array).length).assertEqual(20000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_2800
     * @tc.name testStreamDuplexWrite028
     * @tc.desc Verify consecutive writes trigger backpressure boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      let r1 = ws.write(new Uint8Array(16384));
      expect(r1).assertFalse();
      let r2 = ws.write(new Uint8Array(1));
      expect(r2).assertFalse();
      expect(ws.writableLength).assertEqual(16385);
      ws.uncork();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_2900
     * @tc.name testStreamDuplexWrite029
     * @tc.desc Verify multiple writes under cork + uncork data merging
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.write("a");
      ws.write("b");
      ws.write("c");
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writevCount).assertEqual(1);
      expect(ws.dataChunk).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_3000
     * @tc.name testStreamDuplexWrite030
     * @tc.desc Verify write still works normally when read side is paused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.pause();
      let result = ws.write("hello");
      expect(result).assertTrue();
      expect(ws.dataChunk).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_3100
     * @tc.name testStreamDuplexWrite031
     * @tc.desc Verify write triggers data flow when piped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new DuplexTestBase();
        let target = new DuplexPipeTarget();
        let received: Uint8Array = new Uint8Array(0);
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          target.on("finish", (): void => {
            received = target.dataChunk as Uint8Array;
            resolve(undefined as void);
          });
        });
        ws.pipe(target);
        ws.push("data");
        ws.push(null);
        await finishPromise;
        expect(received.length).assertEqual(4);
        expect(received[0]).assertEqual(100);
        expect(received[1]).assertEqual(97);
        expect(received[2]).assertEqual(116);
        expect(received[3]).assertEqual(97);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_3200
     * @tc.name testStreamDuplexWrite032
     * @tc.desc Verify all-zero byte array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write(new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00]));
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(5);
      expect(received[0]).assertEqual(0x00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_3300
     * @tc.name testStreamDuplexWrite033
     * @tc.desc Verify all-max-byte (0xFF) array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write(new Uint8Array([0xFF, 0xFF, 0xFF, 0xFF, 0xFF]));
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(5);
      expect(received[0]).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_3400
     * @tc.name testStreamDuplexWrite034
     * @tc.desc Verify CRLF control characters (\r\n)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write(new Uint8Array([0x0A, 0x0D]));
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(2);
      expect(received[0]).assertEqual(0x0A);
      expect(received[1]).assertEqual(0x0D);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_3500
     * @tc.name testStreamDuplexWrite035
     * @tc.desc Verify UTF-8 encoded CJK character uses 3 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write(new Uint8Array([0xE4, 0xB8, 0xAD]));
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(3);
      expect(received[0]).assertEqual(0xE4);
      expect(received[2]).assertEqual(0xAD);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_3600
     * @tc.name testStreamDuplexWrite036
     * @tc.desc Verify chunk is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      try {
        ws.write(123 as Object as String);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_3700
     * @tc.name testStreamDuplexWrite037
     * @tc.desc Verify chunk is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      try {
        ws.write(true as Object as String);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_3800
     * @tc.name testStreamDuplexWrite038
     * @tc.desc Verify chunk is plain object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      try {
        ws.write({} as Object as String);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_3900
     * @tc.name testStreamDuplexWrite039
     * @tc.desc Verify encoding is invalid "xyz123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      try {
        ws.write("test", "xyz123");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_4000
     * @tc.name testStreamDuplexWrite040
     * @tc.desc Verify write after end(chunk) on the stream is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.end("final");
      let result = ws.write("x");
      expect(result).assertFalse();
      expect(ws.writableEnded).assertTrue();
      expect(ws.dataChunk).assertEqual("final");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_4100
     * @tc.name testStreamDuplexWrite041
     * @tc.desc Verify callback called repeatedly in doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new DuplexRepeatCallback();
        let errName: string = '';
        let errCode: number = -1;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: BusinessError): void => {
            errName = err.name;
            errCode = err.code;
            resolve(undefined as void);
          });
          ws.write("data", "utf8");
        });
        expect(errName).assertEqual('BusinessError');
        expect(errCode).assertEqual(10200037);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_4200
     * @tc.name testStreamDuplexWrite042
     * @tc.desc Verify Transform subclass without doTransform calls write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TransformNoDoTransform();
      try {
        ws.write("x");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200039);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_4300
     * @tc.name testStreamDuplexWrite043
     * @tc.desc Verify a second default-encoding string on the same stream is delivered unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let firstResult = ws.write("first");
      let result = ws.write("world");
      expect(firstResult).assertTrue();
      expect(result).assertTrue();
      expect(ws.dataChunk).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_4400
     * @tc.name testStreamDuplexWrite044
     * @tc.desc Verify the Error reported by doWrite reaches the write callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new DuplexWriteErrorCb();
        let errReported: boolean = false;
        let errName: string = '';
        let errMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.write('data', 'utf8', (err?: Error): void => {
            if (err !== undefined) {
              errReported = true;
              errName = err.name;
              errMessage = err.message;
            }
            resolve(undefined as void);
          });
        });
        expect(errReported).assertTrue();
        expect(errName).assertEqual('Error');
        expect(errMessage).assertEqual('duplex write failed');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_4500
     * @tc.name testStreamDuplexWrite045
     * @tc.desc Verify a byte sequence containing zero and high-bit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write(new Uint8Array([0, 255, 1]));
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(3);
      expect(received[0]).assertEqual(0);
      expect(received[1]).assertEqual(255);
      expect(received[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_4600
     * @tc.name testStreamDuplexWrite046
     * @tc.desc Verify a short Uint8Array is written with exact element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.write(new Uint8Array([1, 2, 3]));
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(3);
      expect(received[0]).assertEqual(1);
      expect(received[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_4700
     * @tc.name testStreamDuplexWrite047
     * @tc.desc Verify write callback is invoked for a Uint8Array chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new DuplexTestBase();
        let callbackCalled: boolean = false;
        let result: boolean = false;
        try {
          await new Promise<void>((resolve: (value: void) => void,
            reject: (reason: Error) => void): void => {
            result = ws.write(new Uint8Array([7, 8]), "utf8", (err?: Error): void => {
              callbackCalled = true;
              if (err !== undefined) {
                reject(err);
                return;
              }
              resolve(undefined as void);
            });
          });
          expect(result).assertTrue();
          expect(callbackCalled).assertTrue();
          let received = ws.dataChunk as Uint8Array;
          expect(received.length).assertEqual(2);
          expect(received[0]).assertEqual(7);
          expect(received[1]).assertEqual(8);
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_4800
     * @tc.name testStreamDuplexWrite048
     * @tc.desc Verify a corked write is flushed when uncork is called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      let result = ws.write("queued");
      expect(result).assertTrue();
      expect(ws.writeCount).assertEqual(0);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.dataChunk).assertEqual("queued");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_4900
     * @tc.name testStreamDuplexWrite049
     * @tc.desc Verify a single Duplex object supports both directions: the writable side receives write() data via doWrite while the readable side independently delivers pushed data via read(), and both readable/writable properties stay true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let duplex = new DuplexTestBase();
        let writeResult: boolean = duplex.write('in', 'utf8');
        duplex.push('out');
        duplex.pause();
        let readBack: string = duplex.read()?.toString() ?? '';
        expect(writeResult).assertTrue();
        expect(duplex.dataChunk).assertEqual('in');
        expect(readBack).assertEqual('out');
        expect(duplex.readable).assertTrue();
        expect(duplex.writable).assertTrue();
        let endFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          duplex.on('end', (): void => {
            endFired = true;
            resolve(undefined as void);
          });
          duplex.resume();
          duplex.push(null);
        });
        expect(endFired).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_WRITE_5000
     * @tc.name testStreamDuplexWrite050
     * @tc.desc Verify end() with a final chunk on a single Duplex captures the last chunk in doWrite and then emits the finish event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexWrite050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let duplex = new DuplexTestBase();
        duplex.write('a');
        let finishFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          duplex.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
          duplex.end('z', 'utf8');
        });
        expect(finishFired).assertTrue();
        expect(duplex.dataChunk).assertEqual('z');
        expect(duplex.writableEnded).assertTrue();

        done();
      });

  });
}
