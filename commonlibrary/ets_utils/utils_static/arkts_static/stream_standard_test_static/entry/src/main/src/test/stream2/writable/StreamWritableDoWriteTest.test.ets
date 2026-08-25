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

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall();
  }
}

class WriteNoImplBase extends stream.Writable {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';

  constructor() {
    super();
  }
}

class WriteThrowBase extends WritableTestBase {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    throw new Error('write error');
  }
}

class WriteNoCallbackBase extends WritableTestBase {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
  }
}

class WriteDoubleCallbackBase extends WritableTestBase {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class WriteErrorCallbackBase extends WritableTestBase {
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall(new Error('write failed'));
  }
}

class WriteCountBase extends WritableTestBase {
  public writeCount: int = 0;
  public chunks: string[] = [];

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
    this.chunks.push(chunk as string);
    callback.unsafeCall();
  }
}

export default function StreamWritableDoWriteTest(): void {
  describe('StreamWritableDoWriteTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_0100
     * @tc.name testStreamWritableDoWrite001
     * @tc.desc Verify string + utf8 write, doWrite receives correct parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let result = ws.write("test");
      expect(result).assertTrue();
      expect(ws.dataChunk as string).assertEqual("test");
      expect(ws.dataEncoding).assertEqual("utf-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_0200
     * @tc.name testStreamWritableDoWrite002
     * @tc.desc Verify multiple consecutive writes, each triggers doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteCountBase();
      ws.write("hello");
      expect(ws.chunks[0]).assertEqual("hello");
      ws.write("world");
      expect(ws.chunks[1]).assertEqual("world");
      ws.write("data");
      expect(ws.chunks[2]).assertEqual("data");
      expect(ws.writeCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_0300
     * @tc.name testStreamWritableDoWrite003
     * @tc.desc Verify end(chunk) triggers doWrite as the final data chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end("final");
      expect(ws.dataChunk as string).assertEqual("final");
      expect(ws.dataEncoding).assertEqual("utf-8");
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_0400
     * @tc.name testStreamWritableDoWrite004
     * @tc.desc Verify write does not trigger doWrite in corked state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.write("buffered");
      expect(ws.dataChunk).assertEqual('');
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_0500
     * @tc.name testStreamWritableDoWrite005
     * @tc.desc Verify a string or Uint8Array write after end() reports 10200036 without reaching doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let chunks: (string | Uint8Array)[] = ["x", new Uint8Array([0x6c, 0x61, 0x74, 0x65])];
        for (let i = 0; i < chunks.length; i++) {
          let ws = new WritableTestBase();
          let errName: string = '';
          let errCode: number = 0;
          let dataChunk: string = '';
          await new Promise<void>((resolve: (value: void) => void): void => {
            ws.end();
            ws.on('error', (err: Error): void => {
              errName = err.name;
              errCode = (err as BusinessError).code;
              dataChunk = ws.dataChunk as string;
              resolve(undefined as void);
            });
            ws.write(chunks[i]);
          });
          expect(errName).assertEqual("BusinessError");
          expect(errCode).assertEqual(10200036);
          expect(dataChunk).assertEqual('');
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_0600
     * @tc.name testStreamWritableDoWrite006
     * @tc.desc Verify normal doWrite does not trigger error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let errCaught: boolean = false;
      ws.on('error', (err: Error): void => {
        errCaught = true;
      });
      ws.write("valid");
      expect(errCaught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_0700
     * @tc.name testStreamWritableDoWrite007
     * @tc.desc Verify doWrite receives the chunk and gb18030, gb2312 or gbk encoding unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['测试工程师', '你好', 'Hello World'];
      let encodings: string[] = ['gb18030', 'gb2312', 'gbk'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new WritableTestBase();
        let result = ws.write(chunks[i], encodings[i]);
        expect(result).assertTrue();
        expect(ws.dataChunk as string).assertEqual(chunks[i]);
        expect(ws.dataEncoding).assertEqual(encodings[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_0800
     * @tc.name testStreamWritableDoWrite008
     * @tc.desc Verify Uint8Array + utf8 encoding, doWrite receives correct parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let data = new Uint8Array([49, 50, 51]);
      let result = ws.write(data);
      expect(result).assertTrue();
      let received = ws.dataChunk as Uint8Array;
      expect(received[0]).assertEqual(49);
      expect(received[2]).assertEqual(51);
      expect(ws.dataEncoding).assertEqual("utf-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_0900
     * @tc.name testStreamWritableDoWrite009
     * @tc.desc Verify empty string (0 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let errorCaught: boolean = false;
      try {
        ws.write("");
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(401);
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_1000
     * @tc.name testStreamWritableDoWrite010
     * @tc.desc Verify doWrite receives multi-language, emoji, symbol and control-character chunks unchanged with default utf-8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['a', '\0', '﻿', '😀测试', '<script>alert(1)</script>',
        'тест', '�', '\uDC04', '!@#$%^&*()', '\t', '😀',
        'テスト', 'الاختبار'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new WritableTestBase();
        let result = ws.write(chunks[i]);
        expect(result).assertTrue();
        expect(ws.dataChunk as string).assertEqual(chunks[i]);
        expect(ws.dataEncoding).assertEqual("utf-8");
        expect(ws.writable).assertTrue();
        expect(ws.writableLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_1100
     * @tc.name testStreamWritableDoWrite011
     * @tc.desc Verify 16384-byte ASCII string (equal to high water mark)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let chunk: string = 'a'.repeat(16384);
      let result = ws.write(chunk);
      expect(ws.dataChunk as string).assertEqual(chunk);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_1200
     * @tc.name testStreamWritableDoWrite012
     * @tc.desc Verify write returns false for strings of 16385, 65535 and 100000 characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lengths: int[] = [16385, 65535, 100000];
      for (let i = 0; i < lengths.length; i++) {
        let ws = new WritableTestBase();
        let chunk: string = 'a'.repeat(lengths[i]);
        let result = ws.write(chunk);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_1300
     * @tc.name testStreamWritableDoWrite013
     * @tc.desc Verify Uint8Array(0) construction (0 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let data = new Uint8Array(0);
      let result = ws.write(data);
      expect(result).assertTrue();
      expect((ws.dataChunk as Uint8Array).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_1400
     * @tc.name testStreamWritableDoWrite014
     * @tc.desc Verify Uint8Array(1) single zero byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let data = new Uint8Array(1);
      let result = ws.write(data);
      expect(result).assertTrue();
      expect((ws.dataChunk as Uint8Array).length).assertEqual(1);
      expect((ws.dataChunk as Uint8Array)[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_1500
     * @tc.name testStreamWritableDoWrite015
     * @tc.desc Verify Uint8Array(16384) equal to high water mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let data = new Uint8Array(16384);
      let result = ws.write(data);
      expect(result).assertFalse();
      expect((ws.dataChunk as Uint8Array).length).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_1600
     * @tc.name testStreamWritableDoWrite016
     * @tc.desc Verify write returns false for Uint8Array of 16385, 65536 and 102400 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [16385, 65536, 102400];
      for (let i = 0; i < sizes.length; i++) {
        let ws = new WritableTestBase();
        let data = new Uint8Array(sizes[i]);
        let result = ws.write(data);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_1700
     * @tc.name testStreamWritableDoWrite017
     * @tc.desc Verify Error passed to the doWrite callback reaches the write callback error parameter with default encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteErrorCallbackBase();
        let errName: string = '';
        let errMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
          ws.write("test", undefined, (err?: Error): void => {
            if (err !== undefined) {
              errName = err.name;
              errMessage = err.message;
              resolve(undefined as void);
              return;
            }
            reject(new Error('expected doWrite to report an error'));
            return;
          });
        });
        expect(errName).assertEqual("Error");
        expect(errMessage).assertEqual("write failed");
        expect(ws.dataEncoding).assertEqual("utf-8");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_1800
     * @tc.name testStreamWritableDoWrite018
     * @tc.desc Verify doWrite receives the GB series, empty, ascii and utf-8 encoding values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['测试', '测试', '测试', '测试', 'test',
        'test', 'test', 'test'];
      let encodings: string[] = ['gbk', 'gb18030', 'gb2312', 'GBK', '', 'ascii', 'UTF-8', 'utf-8'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new WritableTestBase();
        let result = ws.write(chunks[i], encodings[i]);
        expect(result).assertTrue();
        expect(ws.dataEncoding).assertEqual(encodings[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_1900
     * @tc.name testStreamWritableDoWrite019
     * @tc.desc Verify callback as arrow function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteCountBase();
      ws.write("data", "utf8", (err?: Error): void => {
      });
      expect(ws.writeCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_2000
     * @tc.name testStreamWritableDoWrite020
     * @tc.desc Verify callback as regular function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteCountBase();
        let writeCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
          ws.write("data", "utf8", (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
              return;
            }
            writeCount = ws.writeCount;
            resolve(undefined as void);
          });
        });
        expect(writeCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_2100
     * @tc.name testStreamWritableDoWrite021
     * @tc.desc Verify write in corked state does not trigger doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteCountBase();
      ws.cork();
      ws.write("data1");
      ws.write("data2");
      ws.write("data3");
      expect(ws.writeCount).assertEqual(0);
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.writableLength).assertEqual(15);
      ws.uncork();
      expect(ws.writeCount).assertEqual(3);
      expect(ws.chunks[0]).assertEqual("data1");
      expect(ws.chunks[1]).assertEqual("data2");
      expect(ws.chunks[2]).assertEqual("data3");
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_2200
     * @tc.name testStreamWritableDoWrite022
     * @tc.desc Verify cork nested x2 then uncork gradually resets to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.cork();
      ws.write("x");
      expect(ws.writableCorked).assertEqual(2);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.dataChunk).assertEqual('');
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_2300
     * @tc.name testStreamWritableDoWrite023
     * @tc.desc Verify end(chunk) triggers doWrite then stream ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end("final chunk", "utf8");
      expect(ws.dataChunk as string).assertEqual("final chunk");
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_2400
     * @tc.name testStreamWritableDoWrite024
     * @tc.desc Verify callback passing Error in doWrite triggers error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteErrorCallbackBase();
        let errName: string = '';
        let errMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: Error): void => {
            errName = err.name;
            errMessage = err.message;
            resolve(undefined as void);
          });
          ws.write("data");
        });
        expect(errName).assertEqual("Error");
        expect(errMessage).assertEqual("write failed");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_2500
     * @tc.name testStreamWritableDoWrite025
     * @tc.desc Verify doWrite receives all-zero, all-0xFF, control-character and UTF-8 encoded CJK Uint8Array chunks byte for byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let datas: Uint8Array[] = [new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00]),
        new Uint8Array([0xFF, 0xFF, 0xFF, 0xFF, 0xFF]), new Uint8Array([0x0A, 0x0D]),
        new Uint8Array([0xE4, 0xB8, 0xAD])];
      for (let i = 0; i < datas.length; i++) {
        let ws = new WritableTestBase();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_2600
     * @tc.name testStreamWritableDoWrite026
     * @tc.desc Verify doWrite subclass implementation throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteThrowBase();
      let errCaught: boolean = false;
      ws.on('error', (err: Error): void => {
        errCaught = true;
      });
      try {
        ws.write("test");
      } catch (e) {
        errCaught = true;
        expect(e.name).assertEqual("Error");
      }
      expect(errCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_2700
     * @tc.name testStreamWritableDoWrite027
     * @tc.desc Verify doWrite subclass implementation does not call callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteNoCallbackBase();
      ws.write("test");
      expect(ws.dataChunk as string).assertEqual("test");
      expect(ws.dataEncoding).assertEqual("utf-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_2800
     * @tc.name testStreamWritableDoWrite028
     * @tc.desc Verify chunk of number type (type error)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.write(123 as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_2900
     * @tc.name testStreamWritableDoWrite029
     * @tc.desc Verify encoding is invalid "xyz123"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      try {
        ws.write("test", "xyz123");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_3000
     * @tc.name testStreamWritableDoWrite030
     * @tc.desc Verify calling write without doWrite implementation triggers 10200035
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteNoImplBase();
      try {
        ws.write("data");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200035);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_3100
     * @tc.name testStreamWritableDoWrite031
     * @tc.desc Verify calling end(chunk) without doWrite implementation triggers 10200035
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WriteNoImplBase();
      try {
        ws.end("data");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200035);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_3200
     * @tc.name testStreamWritableDoWrite032
     * @tc.desc Verify calling callback synchronously twice in doWrite triggers 10200037
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WriteDoubleCallbackBase();
        let errName: string = '';
        let errCode: number = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: Error): void => {
            errName = err.name;
            errCode = (err as BusinessError).code;
            resolve(undefined as void);
          });
          ws.write("test");
        });
        expect(errName).assertEqual("BusinessError");
        expect(errCode).assertEqual(10200037);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITE_3300
     * @tc.name testStreamWritableDoWrite033
     * @tc.desc Verify doWrite receives Uint8Array length and both boundary byte values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWrite033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let dataChunk: Uint8Array = new Uint8Array(0);
        let dataEncoding: string = '';
        await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
          let chunk = new Uint8Array([0, 1, 254, 255]);
          ws.write(chunk, 'utf8', (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
              return;
            }
            dataChunk = ws.dataChunk as Uint8Array;
            dataEncoding = ws.dataEncoding;
            resolve(undefined as void);
          });
        });
        expect(dataChunk.length).assertEqual(4);
        expect(dataChunk[0]).assertEqual(0);
        expect(dataChunk[3]).assertEqual(255);
        expect(dataEncoding).assertEqual('utf8');
        done();
      });
  });
}
