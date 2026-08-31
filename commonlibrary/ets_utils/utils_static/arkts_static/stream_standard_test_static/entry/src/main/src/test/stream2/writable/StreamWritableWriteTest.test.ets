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

class WriteTestBase extends stream.Writable {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall();
  }
}

class NoDoWriteBase extends stream.Writable {
  constructor() {
    super();
  }
}

class WriteErrorCb extends stream.Writable {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall(new Error('write cb failed'));
  }
}

class DoubleCallbackBase extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class TrackWriteBase extends stream.Writable {
  public doWriteCalled: boolean = false;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doWriteCalled = true;
    callback.unsafeCall();
  }
}

export default function StreamWritableWriteTest(): void {
  describe('StreamWritableWriteTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_0100
     * @tc.name testStreamWritableWrite001
     * @tc.desc Verify write returns true and forwards text and emoji strings unchanged with default utf-8 encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payloads: string[] = ["test", "Hello World", "😀", "テスト", "valid"];
      for (let i = 0; i < payloads.length; i++) {
        let ws = new WriteTestBase();
        let result = ws.write(payloads[i]);
        expect(result).assertTrue();
        expect(ws.dataChunk).assertEqual(payloads[i]);
        expect(ws.dataEncoding).assertEqual("utf-8");
        expect(ws.writable).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_0200
     * @tc.name testStreamWritableWrite002
     * @tc.desc Verify write returns true and forwards ASCII and all-zero Uint8Array chunks byte for byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let datas: Uint8Array[] = [new Uint8Array([72, 101, 108, 108, 111]),
        new Uint8Array([0, 0, 0, 0, 0])];
      for (let i = 0; i < datas.length; i++) {
        let ws = new WriteTestBase();
        let result = ws.write(datas[i]);
        expect(result).assertTrue();
        let received = ws.dataChunk as Uint8Array;
        expect(received.length).assertEqual(datas[i].length);
        for (let j = 0; j < datas[i].length; j++) {
          expect(received[j]).assertEqual(datas[i][j]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_0300
     * @tc.name testStreamWritableWrite003
     * @tc.desc Verify write with explicit utf8, gbk, gb18030 and gb2312 encodings forwards the chunk and encoding unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] =
        ['测试工程师', 'hello', '中文', '测试', '测试', 'AB12'];
      let encodings: string[] = ['gbk', 'utf8', 'gb18030', 'gb2312', 'gb18030', 'gb18030'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new WriteTestBase();
        let result = ws.write(chunks[i], encodings[i]);
        expect(result).assertTrue();
        expect(ws.dataChunk).assertEqual(chunks[i]);
        expect(ws.dataEncoding).assertEqual(encodings[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_0400
     * @tc.name testStreamWritableWrite004
     * @tc.desc Verify write with callback executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteTestBase();
        let callbackCalled: boolean = false;
        let result: boolean = false;
        try {
          await new Promise<void>((resolve: (value: void) => void,
            reject: (reason: Error) => void): void => {
            result = ws.write("data", "utf8", (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              callbackCalled = true;
              resolve(undefined as void);
            });
          });
          expect(result).assertTrue();
          expect(ws.dataChunk).assertEqual("data");
          expect(callbackCalled).assertTrue();
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_0500
     * @tc.name testStreamWritableWrite005
     * @tc.desc Verify write in corked state does not trigger doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TrackWriteBase();
      ws.cork();
      let result = ws.write("x");
      expect(result).assertTrue();
      expect(ws.doWriteCalled).assertFalse();
      expect(ws.writableLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_0600
     * @tc.name testStreamWritableWrite006
     * @tc.desc Verify write returns false under backpressure but data is queued
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let result = ws.write(new Uint8Array(20000));
      expect(result).assertFalse();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(20000);
      expect(ws.dataEncoding).assertEqual("utf-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_0700
     * @tc.name testStreamWritableWrite007
     * @tc.desc Verify Uint8Array+utf8 encoding write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let result = ws.write(new Uint8Array([49, 50, 51]), "utf8");
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(3);
      expect(received[0]).assertEqual(49);
      expect(received[2]).assertEqual(51);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_0800
     * @tc.name testStreamWritableWrite008
     * @tc.desc Verify empty string (0 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      try {
        ws.write("");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_0900
     * @tc.name testStreamWritableWrite009
     * @tc.desc Verify write forwards single-character, control, zero-width, emoji, XSS, multi-language, replacement, surrogate and symbol strings unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = [' ', 'a', 'data', '\0', '​', '😀测试',
        '<script>alert(1)</script>', 'тест', 'الاختبار',
        '�', '\uDC04', '\xe4', '!@#$%^&*()', '13800138000'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new WriteTestBase();
        let result = ws.write(chunks[i]);
        expect(result).assertTrue();
        expect(ws.dataChunk).assertEqual(chunks[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_1000
     * @tc.name testStreamWritableWrite010
     * @tc.desc Verify 16383-byte ASCII string (below waterline)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let big: string = '';
      for (let i = 0; i < 16383; i++) {
        big += 'a';
      }
      let result = ws.write(big);
      expect(result).assertTrue();
      expect((ws.dataChunk as string).length).assertEqual(16383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_1100
     * @tc.name testStreamWritableWrite011
     * @tc.desc Verify write returns false for strings of 16384, 16385 and 100000 characters while forwarding the full chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lengths: int[] = [16384, 16385, 100000];
      for (let n = 0; n < lengths.length; n++) {
        let ws = new WriteTestBase();
        let big: string = '';
        for (let i = 0; i < lengths[n]; i++) {
          big += 'a';
        }
        let result = ws.write(big);
        expect(result).assertFalse();
        expect((ws.dataChunk as string).length).assertEqual(lengths[n]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_1200
     * @tc.name testStreamWritableWrite012
     * @tc.desc Verify Uint8Array empty literal (0 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let result = ws.write(new Uint8Array([]));
      expect(result).assertTrue();
      expect((ws.dataChunk as Uint8Array).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_1300
     * @tc.name testStreamWritableWrite013
     * @tc.desc Verify Uint8Array(1) single zero byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let result = ws.write(new Uint8Array(1));
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(1);
      expect(received[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_1400
     * @tc.name testStreamWritableWrite014
     * @tc.desc Verify Uint8Array(16383) below waterline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let result = ws.write(new Uint8Array(16383));
      expect(result).assertTrue();
      expect((ws.dataChunk as Uint8Array).length).assertEqual(16383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_1500
     * @tc.name testStreamWritableWrite015
     * @tc.desc Verify write returns false for Uint8Array of 16384, 16385, 65536 and 102400 bytes while forwarding the full chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [16384, 16385, 65536, 102400];
      for (let i = 0; i < sizes.length; i++) {
        let ws = new WriteTestBase();
        let result = ws.write(new Uint8Array(sizes[i]));
        expect(result).assertFalse();
        expect((ws.dataChunk as Uint8Array).length).assertEqual(sizes[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_1600
     * @tc.name testStreamWritableWrite016
     * @tc.desc Verify explicit gbk encoding preserves a Uint8Array chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let result = ws.write(new Uint8Array([0x41, 0x42]), "gbk");
      expect(result).assertTrue();
      expect((ws.dataChunk as Uint8Array).length).assertEqual(2);
      expect((ws.dataChunk as Uint8Array)[0]).assertEqual(0x41);
      expect((ws.dataChunk as Uint8Array)[1]).assertEqual(0x42);
      expect(ws.dataEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_1700
     * @tc.name testStreamWritableWrite017
     * @tc.desc Verify Error reported for an explicit utf8 write reaches the write callback error parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteErrorCb();
        let errReported: boolean = false;
        let errName: string = '';
        let errMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.write("test", "utf8", (err?: Error): void => {
            if (err !== undefined) {
              errReported = true;
              errName = err.name;
              errMessage = err.message;
            }
            resolve(undefined as void);
          });
        });
        expect(errReported).assertTrue();
        expect(errName).assertEqual("Error");
        expect(errMessage).assertEqual("write cb failed");
        expect(ws.dataEncoding).assertEqual("utf8");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_1800
     * @tc.name testStreamWritableWrite018
     * @tc.desc Verify write accepts empty and unsupported ascii encoding values and forwards them unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ["", "ascii"];
      for (let i = 0; i < encodings.length; i++) {
        let ws = new WriteTestBase();
        let result = ws.write("test", encodings[i]);
        expect(result).assertTrue();
        expect(ws.dataEncoding).assertEqual(encodings[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_1900
     * @tc.name testStreamWritableWrite019
     * @tc.desc Verify callback=null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      try {
        ws.write("data", "utf8", null as Object as Function);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_2000
     * @tc.name testStreamWritableWrite020
     * @tc.desc Verify callback=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      try {
        ws.write("data", "utf8", undefined as Object as Function);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_2100
     * @tc.name testStreamWritableWrite021
     * @tc.desc Verify write data accumulates in corked state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TrackWriteBase();
      ws.cork();
      let r1 = ws.write("a");
      let r2 = ws.write("b");
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.doWriteCalled).assertFalse();
      expect(ws.writableLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_2200
     * @tc.name testStreamWritableWrite022
     * @tc.desc Verify uncork flushes buffer after cork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TrackWriteBase();
      ws.cork();
      ws.write("a");
      ws.write("b");
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.doWriteCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_2300
     * @tc.name testStreamWritableWrite023
     * @tc.desc Verify cork nested x2 then uncork resets to zero and flushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TrackWriteBase();
      ws.cork();
      ws.cork();
      ws.write("x");
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.doWriteCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_2400
     * @tc.name testStreamWritableWrite024
     * @tc.desc Verify drain event after backpressure triggers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteTestBase();
        let drainPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('drain', (): void => {
            resolve(undefined as void);
          });
        });
        let result = ws.write(new Uint8Array(20000));
        await drainPromise;
        expect(ws.writableLength).assertEqual(0);
        expect(result).assertFalse();
        expect((ws.dataChunk as Uint8Array).length).assertEqual(20000);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_2500
     * @tc.name testStreamWritableWrite025
     * @tc.desc Verify consecutive writes trigger backpressure boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let r1 = ws.write(new Uint8Array(16384));
      expect(r1).assertFalse();
      let r2 = ws.write(new Uint8Array(1));
      expect(r2).assertTrue();
      expect((ws.dataChunk as Uint8Array).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_2600
     * @tc.name testStreamWritableWrite026
     * @tc.desc Verify string write after an end chunk emits 10200036
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let errorPromise = new Promise<BusinessError>((resolve: (value: BusinessError) => void): void => {
          let ws = new WriteTestBase();
          ws.on('error', (err: BusinessError): void => {
            resolve(err);
          });
          ws.end("final", "utf8");
          ws.write("x");
        });
        let err = await errorPromise;
        expect(err.name).assertEqual("BusinessError");
        expect(err.code).assertEqual(10200036);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_2700
     * @tc.name testStreamWritableWrite027
     * @tc.desc Verify multiple writes under cork+uncork merge data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new TrackWriteBase();
      ws.cork();
      ws.write("a");
      ws.write("b");
      ws.write("c");
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.doWriteCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_2800
     * @tc.name testStreamWritableWrite028
     * @tc.desc Verify date format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let result = ws.write("2026-03-05");
      expect(result).assertTrue();
      expect(ws.dataChunk).assertEqual("2026-03-05");
      expect(ws.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_2900
     * @tc.name testStreamWritableWrite029
     * @tc.desc Verify all-max-byte (0xFF) array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let result = ws.write(new Uint8Array([0xFF, 0xFF, 0xFF, 0xFF, 0xFF]));
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(5);
      expect(received[0]).assertEqual(0xFF);
      expect(received[4]).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_3000
     * @tc.name testStreamWritableWrite030
     * @tc.desc Verify newline+carriage return control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let result = ws.write(new Uint8Array([0x0A, 0x0D]));
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(2);
      expect(received[0]).assertEqual(0x0A);
      expect(received[1]).assertEqual(0x0D);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_3100
     * @tc.name testStreamWritableWrite031
     * @tc.desc Verify UTF-8 encoded CJK character produces the expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let result = ws.write(new Uint8Array([0xE4, 0xB8, 0xAD]));
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(3);
      expect(received[0]).assertEqual(0xE4);
      expect(received[2]).assertEqual(0xAD);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_3200
     * @tc.name testStreamWritableWrite032
     * @tc.desc Verify chunk is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      try {
        ws.write(123 as Object as String);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_3300
     * @tc.name testStreamWritableWrite033
     * @tc.desc Verify chunk is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      try {
        ws.write(true as Object as String);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_3400
     * @tc.name testStreamWritableWrite034
     * @tc.desc Verify chunk is object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      try {
        ws.write({} as Object as String);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_3500
     * @tc.name testStreamWritableWrite035
     * @tc.desc Verify encoding is invalid "xyz123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      try {
        ws.write("test", "xyz123");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_3600
     * @tc.name testStreamWritableWrite036
     * @tc.desc Verify write without doWrite implemented
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new NoDoWriteBase();
      try {
        ws.write("test");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200035);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_3700
     * @tc.name testStreamWritableWrite037
     * @tc.desc Verify callback called twice in doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let errorPromise = new Promise<Error>((resolve: (value: Error) => void): void => {
          let ws = new DoubleCallbackBase();
          ws.on('error', (err: Error): void => {
            resolve(err);
          });
          ws.write("data", "utf8", (err?: Error): void => {

          });
        });
        let err: Error = new Error();
        err = await errorPromise;
        expect(err.name).assertEqual("BusinessError");
        expect((err as BusinessError).code).assertEqual(10200037);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_3800
     * @tc.name testStreamWritableWrite038
     * @tc.desc Verify write with NaN converted to Uint8Array yields zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let chunk = new Uint8Array(1);
      chunk[0] = NaN;
      ws.write(chunk, 'utf8', (err?: Error): void => {

      });
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(1);
      expect(received[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_3900
     * @tc.name testStreamWritableWrite039
     * @tc.desc Verify write with Infinity converted to Uint8Array yields zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteTestBase();
      let chunk = new Uint8Array(2);
      chunk[0] = Infinity;
      chunk[1] = -Infinity;
      ws.write(chunk, 'utf8', (err?: Error): void => {

      });
      let received = ws.dataChunk as Uint8Array;
      expect(received.length).assertEqual(2);
      expect(received[0]).assertEqual(0);
      expect(received[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_4000
     * @tc.name testStreamWritableWrite040
     * @tc.desc Verify write with Uint8Array overflow value truncated by AND 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteTestBase();
        let chunk = new Uint8Array(4);
        chunk[0] = 256;
        chunk[1] = 257;
        chunk[2] = 65536;
        chunk[3] = 511;
        try {
          await new Promise<void>((resolve: (value: void) => void,
            reject: (reason: Error) => void): void => {
            ws.write(chunk, 'utf8', (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              resolve(undefined as void);
            });
          });
          let received = ws.dataChunk as Uint8Array;
          expect(received.length).assertEqual(4);
          expect(received[0]).assertEqual(0);
          expect(received[1]).assertEqual(1);
          expect(received[2]).assertEqual(0);
          expect(received[3]).assertEqual(255);
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_4100
     * @tc.name testStreamWritableWrite041
     * @tc.desc Verify write with string containing lone surrogate code unit passes through
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteTestBase();
        let loneSurrogate = '\uD800';
        try {
          await new Promise<void>((resolve: (value: void) => void,
            reject: (reason: Error) => void): void => {
            ws.write(loneSurrogate, 'utf8', (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              resolve(undefined as void);
            });
          });
          expect(ws.dataChunk).assertEqual(loneSurrogate);
          expect(ws.dataEncoding).assertEqual('utf8');
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_4200
     * @tc.name testStreamWritableWrite042
     * @tc.desc Verify write with different encodings in sequence, each handled independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteTestBase();
        try {
          await new Promise<void>((resolve: (value: void) => void,
            reject: (reason: Error) => void): void => {
            ws.write("a", "utf8", (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
            });
            ws.write("b", "gbk", (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              resolve(undefined as void);
            });
          });
          expect(ws.dataChunk).assertEqual("b");
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_4300
     * @tc.name testStreamWritableWrite043
     * @tc.desc Verify write with async callback, stream status remains normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteTestBase();
        try {
          await new Promise<void>((resolve: (value: void) => void,
            reject: (reason: Error) => void): void => {
            ws.write("data", "utf8", (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              setTimeout((): void => {
                resolve(undefined as void);
              }, 100);
            });
          });
          expect(ws.writable).assertTrue();
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_4400
     * @tc.name testStreamWritableWrite044
     * @tc.desc Verify write with large chunk and invalid encoding throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteTestBase();
        let chunk: string = 'a'.repeat(20480);
        let result: boolean = false;
        try {
          await new Promise<void>((resolve: (value: void) => void,
            reject: (reason: Error) => void): void => {
            result = ws.write(chunk, "ascii", (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              resolve(undefined as void);
            });
          });
          expect(result).assertFalse();
          expect((ws.dataChunk as string).length).assertEqual(20480);
          expect(ws.dataEncoding).assertEqual("ascii");
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_WRITE_4500
     * @tc.name testStreamWritableWrite045
     * @tc.desc Verify write preserves Uint8Array zero and 255 boundary bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableWrite045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteTestBase();
        let chunk = new Uint8Array([0, 255]);
        let result: boolean = false;
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            result = ws.write(chunk, 'utf8', (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              resolve(undefined as void);
            });
          });
          expect(result).assertTrue();
          expect((ws.dataChunk as Uint8Array).length).assertEqual(2);
          expect((ws.dataChunk as Uint8Array)[0]).assertEqual(0);
          expect((ws.dataChunk as Uint8Array)[1]).assertEqual(255);
          expect(ws.writable).assertTrue();
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });
  });
}
