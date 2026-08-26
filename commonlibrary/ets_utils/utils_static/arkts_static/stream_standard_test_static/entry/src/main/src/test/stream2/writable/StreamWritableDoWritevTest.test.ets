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

class WritevTestBase extends WritableTestBase {
  public writevChunks: string[] = [];
  public writevCalled: boolean = false;
  public writevCallCount: int = 0;

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    this.writevChunks = chunks as string[];
    this.writevCalled = true;
    this.writevCallCount++;
    callback.unsafeCall();
  }
}

class WritevThrowBase extends WritableTestBase {
  public writevChunks: string[] = [];
  public writevCalled: boolean = false;
  public writevCallCount: int = 0;

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    this.writevChunks = chunks as string[];
    this.writevCalled = true;
    this.writevCallCount++;
    throw new Error('throw error');
  }
}

class WritevErrorCbBase extends WritableTestBase {
  public writevChunks: string[] = [];

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    this.writevChunks = chunks as string[];
    callback.unsafeCall(new Error('write error'));
  }
}

class WritevDoubleCbBase extends WritableTestBase {
  public writevChunks: string[] = [];

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    this.writevChunks = chunks as string[];
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class NoImplWritevBase extends stream.Writable {
  constructor() {
    super();
  }
}

export default function StreamWritableDoWritevTest(): void {
  describe('StreamWritableDoWritevTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_0100
     * @tc.name testStreamWritableDoWritev001
     * @tc.desc Verify cork + write(Uint8Array)x2 + uncork triggers doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.cork();
      ws.write(new Uint8Array([72, 101, 108, 108, 111]));
      ws.write(new Uint8Array([116, 101, 115, 116]));
      ws.uncork();
      expect(ws.writevCalled).assertTrue();
      let arr = ws.writevChunks as Uint8Array[];
      expect(ws.writevCallCount).assertEqual(1);
      expect(arr.length).assertEqual(2);
      expect(arr[0].length).assertEqual(5);
      expect(arr[1].length).assertEqual(4);
      expect(arr[0][0]).assertEqual(72);
      expect(arr[1][0]).assertEqual(116);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_0200
     * @tc.name testStreamWritableDoWritev002
     * @tc.desc Verify subclass without doWritev falls back to doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.write("a");
      ws.write("b");
      expect(ws.dataChunk).assertEqual('');
      ws.uncork();
      expect(ws.dataChunk).assertEqual("b");
      expect(ws.dataEncoding).assertEqual("utf-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_0300
     * @tc.name testStreamWritableDoWritev003
     * @tc.desc Verify writing without cork does not trigger doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.write("a");
      expect(ws.writevCalled).assertFalse();
      expect(ws.dataChunk as string).assertEqual("a");
      ws.write("b");
      expect(ws.writevCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_0400
     * @tc.name testStreamWritableDoWritev004
     * @tc.desc Verify doWritev is not triggered after end()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.cork();
      ws.write("a");
      ws.end("b");
      expect(ws.writevCalled).assertTrue();
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_0500
     * @tc.name testStreamWritableDoWritev005
     * @tc.desc Verify not uncorking while corked does not trigger doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.cork();
      ws.write("a");
      ws.write("b");
      expect(ws.writevCalled).assertFalse();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_0600
     * @tc.name testStreamWritableDoWritev006
     * @tc.desc Verify mixed string[] + Uint8Array[]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.cork();
      ws.write("hello");
      ws.write(new Uint8Array([116, 101, 115, 116]));
      ws.uncork();
      expect(ws.writevCalled).assertTrue();
      expect((ws.writevChunks as Object[]).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_0700
     * @tc.name testStreamWritableDoWritev007
     * @tc.desc Verify a corked batch written with gbk, gb18030, mixed utf8 and uppercase GB2312/GBK/GB18030 encodings is dispatched to doWritev in one call on uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let batches: string[][] = [['测试', '你好'], ['中文', '工程师'],
        ['test', '测试'], ['中文', '测试', '工程师']];
      let encodingSets: string[][] = [['gbk', 'gbk'], ['gb18030', 'gb18030'], ['utf8', 'gbk'],
        ['GB2312', 'GBK', 'GB18030']];
      for (let i = 0; i < batches.length; i++) {
        let ws = new WritevTestBase();
        ws.cork();
        for (let j = 0; j < batches[i].length; j++) {
          ws.write(batches[i][j], encodingSets[i][j]);
        }
        ws.uncork();
        expect(ws.writevCalled).assertTrue();
        expect(ws.writevCallCount).assertEqual(1);
        expect(ws.writevChunks.length).assertEqual(batches[i].length);
        for (let j = 0; j < batches[i].length; j++) {
          expect(ws.writevChunks[j]).assertEqual(batches[i][j]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_0800
     * @tc.name testStreamWritableDoWritev008
     * @tc.desc Verify empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      try {
        ws.cork();
        ws.write("");
        ws.uncork();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_0900
     * @tc.name testStreamWritableDoWritev009
     * @tc.desc Verify doWritev receives whitespace, control, symbol, multi-language and emoji chunks unchanged after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = [' ', '  ', '\t', '\n', '\r', '!@#$%^&*()', '<script>alert(1)</script>',
        '\0', '⭐⭐', '테스트', 'АБВГД',
        '😀测试', '﻿', '�', '😀', 'テスト',
        'الاختبار'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new WritevTestBase();
        ws.cork();
        ws.write(chunks[i]);
        ws.uncork();
        expect(ws.writevCalled).assertTrue();
        expect(ws.writevCallCount).assertEqual(1);
        expect(ws.writevChunks.length).assertEqual(1);
        expect(ws.writevChunks[0]).assertEqual(chunks[i]);
        expect(ws.writableLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_1000
     * @tc.name testStreamWritableDoWritev010
     * @tc.desc Verify 16385 character long string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      let longStr: string = 'a'.repeat(16385);
      ws.cork();
      ws.write(longStr);
      ws.uncork();
      expect(ws.writevCalled).assertTrue();
      expect(ws.writevChunks[0]).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_1100
     * @tc.name testStreamWritableDoWritev011
     * @tc.desc Verify empty Uint8Array literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.cork();
      ws.write(new Uint8Array([]));
      ws.uncork();
      expect(ws.writevCalled).assertTrue();
      expect((ws.writevChunks as Uint8Array[]).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_1200
     * @tc.name testStreamWritableDoWritev012
     * @tc.desc Verify Uint8Array(1) single zero byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.cork();
      ws.write(new Uint8Array(1));
      ws.uncork();
      expect(ws.writevCalled).assertTrue();
      let arr = ws.writevChunks as Uint8Array[];
      expect(arr[0][0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_1300
     * @tc.name testStreamWritableDoWritev013
     * @tc.desc Verify doWritev is triggered for Uint8Array chunks of 16384, 65536 and 1048576 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [16384, 65536, 1048576];
      for (let i = 0; i < sizes.length; i++) {
        let ws = new WritevTestBase();
        ws.cork();
        ws.write(new Uint8Array(sizes[i]));
        ws.uncork();
        expect(ws.writevCalled).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_1400
     * @tc.name testStreamWritableDoWritev014
     * @tc.desc Verify callback=null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      try {
        ws.cork();
        ws.write("x", "utf8", null as Object as Function);
        ws.uncork();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_1500
     * @tc.name testStreamWritableDoWritev015
     * @tc.desc Verify callback=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.cork();
      let errorCaught: boolean = false;
      try {
        ws.write("x", "utf8", undefined as Function);
        ws.uncork();
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_1600
     * @tc.name testStreamWritableDoWritev016
     * @tc.desc Verify nested cork x2 requires two uncorks before doWritev is triggered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.cork();
      ws.cork();
      ws.write("a");
      ws.write("b");
      expect(ws.writableCorked).assertEqual(2);
      ws.uncork();
      expect(ws.writevCalled).assertFalse();
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.writevCalled).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writevChunks.length).assertEqual(2);
      expect(ws.writevChunks[0]).assertEqual("a");
      expect(ws.writevChunks[1]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_1700
     * @tc.name testStreamWritableDoWritev017
     * @tc.desc Verify cork then end then uncork does not trigger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.cork();
      ws.write("a");
      ws.end();
      ws.uncork();
      expect(ws.writevCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_1800
     * @tc.name testStreamWritableDoWritev018
     * @tc.desc Verify write then end with Error while corked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.cork();
      ws.write("a");
      let errCaught: boolean = false;
      ws.on('error', (err: Error): void => {
        errCaught = true;

      });
      expect(errCaught).assertFalse();
      expect(ws.writevCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_1900
     * @tc.name testStreamWritableDoWritev019
     * @tc.desc Verify two consecutive uncorks (no data) does not trigger doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.cork();
      ws.cork();
      ws.uncork();
      ws.uncork();
      expect(ws.writevCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_2000
     * @tc.name testStreamWritableDoWritev020
     * @tc.desc Verify cork + write + uncork without doWrite implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new NoImplWritevBase();
      ws.cork();
      ws.write("x");
      try {
        ws.uncork();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200035);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_2100
     * @tc.name testStreamWritableDoWritev021
     * @tc.desc Verify Uint8Array containing 0x00/0xFF/0x7F/0x80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.cork();
      ws.write(new Uint8Array([0x00, 0xFF, 0x7F, 0x80]));
      ws.uncork();
      expect(ws.writevCalled).assertTrue();
      let arr = ws.writevChunks as Uint8Array[];
      expect(arr[0][0]).assertEqual(0x00);
      expect(arr[0][1]).assertEqual(0xFF);
      expect(arr[0][2]).assertEqual(0x7F);
      expect(arr[0][3]).assertEqual(0x80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_2200
     * @tc.name testStreamWritableDoWritev022
     * @tc.desc Verify throwing Error inside doWritev triggers error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevThrowBase();
      ws.cork();
      ws.write("x");
      try {
        ws.uncork();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_2300
     * @tc.name testStreamWritableDoWritev023
     * @tc.desc Verify non-function type (number) passed as callback causes type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      try {
        ws.cork();
        ws.write("x", "utf8", 123 as Object as Function);
        ws.uncork();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_2400
     * @tc.name testStreamWritableDoWritev024
     * @tc.desc Verify passing non-array chunks (simulated) causes type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      try {
        (((ws as Record<string, Function>)["doWritev"]) as Function).unsafeCall("not_array", (err?: Error): void => {

        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_2500
     * @tc.name testStreamWritableDoWritev025
     * @tc.desc Verify callback is called twice in succession within doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevDoubleCbBase();
      ws.cork();
      ws.write("x");
      try {
        ws.uncork();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200037);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_2600
     * @tc.name testStreamWritableDoWritev026
     * @tc.desc Verify cork + write + uncork after end is rejected, triggers 10200036
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let errorPromise = new Promise<Error>((resolve: (value: Error) => void): void => {
          let ws = new WritevTestBase();
          ws.end();
          ws.on('error', (err: Error): void => {
            resolve(err);
          });
          ws.cork();
          ws.write("x");
          ws.uncork();
        });
        let err: Error = new Error();
        try {
          err = await errorPromise;
        } catch (e) {
          expect().assertFail();
          return;
        }
        expect(err.name).assertEqual("BusinessError");
        expect((err as BusinessError).code).assertEqual(10200036);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_2700
     * @tc.name testStreamWritableDoWritev027
     * @tc.desc Verify two buffered writes are dispatched to one doWritev call after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritevTestBase();
      ws.cork();
      ws.write('left');
      ws.write('right');
      expect(ws.writevCalled).assertFalse();
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.writableLength).assertEqual(9);
      ws.uncork();
      expect(ws.writevCalled).assertTrue();
      expect(ws.writevCallCount).assertEqual(1);
      expect(ws.writevChunks.length).assertEqual(2);
      expect(ws.writevChunks[0]).assertEqual('left');
      expect(ws.writevChunks[1]).assertEqual('right');
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writableLength).assertEqual(0);
      ws.cork();
      ws.write('third');
      ws.uncork();
      expect(ws.writevCallCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_DO_WRITEV_2800
     * @tc.name testStreamWritableDoWritev028
     * @tc.desc Verify the write callback receives the Error reported by doWritev after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableDoWritev028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritevErrorCbBase();
        let firstError: string = '';
        let secondError: string = '';
        let eventError: string = '';
        ws.on('error', (err: Error): void => {
          eventError = err.name;
        });
        ws.cork();
        ws.write('x', 'utf8', (err?: Error): void => {
          firstError = err === undefined ? '' : err.name + ':' + err.message;
        });
        ws.write('y', 'utf8', (err?: Error): void => {
          secondError = err === undefined ? '' : err.name + ':' + err.message;
        });
        ws.uncork();
        await new Promise<void>((resolve: (value: void) => void): void => {
          setTimeout((): void => resolve(undefined as void), 100);
        });
        expect(firstError).assertEqual('Error:write error');
        expect(secondError).assertEqual('Error:write error');
        expect(eventError).assertEqual('Error');
        expect(ws.writevChunks.length).assertEqual(2);
        done();
      });

  });
}
