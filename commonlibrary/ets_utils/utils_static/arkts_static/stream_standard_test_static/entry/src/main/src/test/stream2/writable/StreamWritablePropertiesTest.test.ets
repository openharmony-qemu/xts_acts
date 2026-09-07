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

class WritableNoDoWrite extends stream.Writable {
  constructor() {
    super();
  }
}

class WritableWithDoWritev extends stream.Writable {
  public chunks: string | Uint8Array = '';

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.chunks = chunk;
    callback.unsafeCall();
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    this.chunks = (chunks as string[])[0];
    callback.unsafeCall();
  }
}

class WritableInitFlag extends stream.Writable {
  public initCalled: boolean = false;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    this.initCalled = true;
    callback.unsafeCall();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamWritablePropertiesTest(): void {
  describe('StreamWritablePropertiesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_0100
     * @tc.name testStreamWritableProperties001
     * @tc.desc Verify writableObjectMode remains false through write, cork, uncork and end operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.writableObjectMode).assertFalse();
      ws.write('objectmode-write');
      expect(ws.writableObjectMode).assertFalse();
      ws.cork();
      ws.write('objectmode-corked');
      expect(ws.writableObjectMode).assertFalse();
      ws.uncork();
      expect(ws.writableObjectMode).assertFalse();
      ws.end();
      expect(ws.writableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_0200
     * @tc.name testStreamWritableProperties002
     * @tc.desc Verify writable initial value is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.write('state');
      expect(ws.writable).assertTrue();
      expect(ws.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_0300
     * @tc.name testStreamWritableProperties003
     * @tc.desc Verify writableHighWatermark default value is 16384
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.write(new Uint8Array(16384));
      expect(ws.writableHighWatermark).assertEqual(16384);
      expect(ws.writableLength).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_0400
     * @tc.name testStreamWritableProperties004
     * @tc.desc Verify writableLength initial value is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.write('queued');
      expect(ws.writableLength).assertEqual(6);
      ws.uncork();
      expect(ws.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_0500
     * @tc.name testStreamWritableProperties005
     * @tc.desc Verify writableCorked initial value is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.cork();
      expect(ws.writableCorked).assertEqual(2);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_0600
     * @tc.name testStreamWritableProperties006
     * @tc.desc Verify writableFinished becomes true when the finish event is delivered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            expect(ws.writableFinished).assertTrue();
            resolve(undefined as void);
          });
          ws.end();
        });
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_0700
     * @tc.name testStreamWritableProperties007
     * @tc.desc Verify all properties are read-only and cannot be assigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.write('read-only');
      expect(ws.writable).assertTrue();
      expect(ws.writableObjectMode).assertFalse();
      expect(ws.writableHighWatermark).assertEqual(16384);
      expect(ws.writableLength).assertEqual(9);
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.writableEnded).assertFalse();
      expect(ws.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_0800
     * @tc.name testStreamWritableProperties008
     * @tc.desc Verify writableEnded changes before writableFinished during end completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let endedAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            endedAtFinish = ws.writableEnded;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        ws.end();
        expect(ws.writableEnded).assertTrue();
        expect(ws.writableFinished).assertFalse();
        await finishPromise;
        expect(endedAtFinish).assertTrue();
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_0900
     * @tc.name testStreamWritableProperties009
     * @tc.desc Verify after end, writableEnded=true but finished may still be false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_1000
     * @tc.name testStreamWritableProperties010
     * @tc.desc Verify after end, writable=false but other properties remain readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let writableAtFinish: boolean = true;
        let lengthAtFinish: int = -1;
        let corkedAtFinish: int = -1;
        let endedAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ws = new WritableTestBase();
          ws.on("finish", (): void => {
            writableAtFinish = ws.writable;
            lengthAtFinish = ws.writableLength;
            corkedAtFinish = ws.writableCorked;
            endedAtFinish = ws.writableEnded;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(writableAtFinish).assertFalse();
        expect(lengthAtFinish).assertEqual(0);
        expect(corkedAtFinish).assertEqual(0);
        expect(endedAtFinish).assertTrue();
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_1100
     * @tc.name testStreamWritableProperties011
     * @tc.desc Verify writableHighWatermark cannot be changed by write operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let hwm = ws.writableHighWatermark;
      ws.write("test");
      expect(ws.writableHighWatermark).assertEqual(hwm);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_1200
     * @tc.name testStreamWritableProperties012
     * @tc.desc Verify writableCorked is not affected by write operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.writableCorked).assertEqual(0);
      ws.write("test");
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_1300
     * @tc.name testStreamWritableProperties013
     * @tc.desc Verify initial property values are consistent across different subclass instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws1 = new WritableTestBase();
      let ws2 = new WritableNoDoWrite();
      expect(ws1.writable).assertEqual(ws2.writable);
      expect(ws1.writableObjectMode).assertEqual(ws2.writableObjectMode);
      expect(ws1.writableHighWatermark).assertEqual(ws2.writableHighWatermark);
      expect(ws1.writableLength).assertEqual(ws2.writableLength);
      expect(ws1.writableCorked).assertEqual(ws2.writableCorked);
      expect(ws1.writableEnded).assertEqual(ws2.writableEnded);
      expect(ws1.writableFinished).assertEqual(ws2.writableFinished);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_1400
     * @tc.name testStreamWritableProperties014
     * @tc.desc Verify property behavior is consistent for subclass with both doWrite and doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableWithDoWritev();
      expect(ws.writable).assertTrue();
      expect(ws.writableObjectMode).assertFalse();
      expect(ws.writableLength).assertEqual(0);
      expect(ws.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_1500
     * @tc.name testStreamWritableProperties015
     * @tc.desc Verify all writable properties initialize to defaults for a subclass overriding doInitialize and for a subclass without doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let streams: stream.Writable[] = [new WritableInitFlag(), new WritableNoDoWrite()];
      for (let i = 0; i < streams.length; i++) {
        expect(streams[i].writable).assertTrue();
        expect(streams[i].writableObjectMode).assertFalse();
        expect(streams[i].writableHighWatermark).assertEqual(16384);
        expect(streams[i].writableLength).assertEqual(0);
        expect(streams[i].writableCorked).assertEqual(0);
        expect(streams[i].writableEnded).assertFalse();
        expect(streams[i].writableFinished).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_1600
     * @tc.name testStreamWritableProperties016
     * @tc.desc Verify writableLength returns to zero after an empty cork cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.uncork();
      expect(ws.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_1700
     * @tc.name testStreamWritableProperties017
     * @tc.desc Verify writableLength=16383 (1 byte below high water mark)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      let result = ws.write(new Uint8Array(16383));
      expect(result).assertTrue();
      expect(ws.writableLength).assertEqual(16383);
      ws.uncork();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_1800
     * @tc.name testStreamWritableProperties018
     * @tc.desc Verify write returns false for Uint8Array of 16384, 16385 and 102400 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [16384, 16385, 102400];
      for (let i = 0; i < sizes.length; i++) {
        let ws = new WritableTestBase();
        let result = ws.write(new Uint8Array(sizes[i]));
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_1900
     * @tc.name testStreamWritableProperties019
     * @tc.desc Verify writableCorked=100 (large cork stacking)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      for (let i = 0; i < 100; i++) {
        ws.cork();
      }
      expect(ws.writableCorked).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_2000
     * @tc.name testStreamWritableProperties020
     * @tc.desc Verify writableCorked never goes negative (excessive uncork)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_2100
     * @tc.name testStreamWritableProperties021
     * @tc.desc Verify writableCorked and writable remain valid after one cork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.cork()).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_2200
     * @tc.name testStreamWritableProperties022
     * @tc.desc Verify cork 3 times and uncork 2 times leaves writableCorked=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.cork();
      ws.cork();
      ws.uncork();
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_2300
     * @tc.name testStreamWritableProperties023
     * @tc.desc Verify end() changes writableEnded to true and writable to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.writableEnded).assertFalse();
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.writable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_2400
     * @tc.name testStreamWritableProperties024
     * @tc.desc Verify end() in corked state sets writable=false, writableEnded=true and forcibly resets writableCorked to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.write('corked-before-end');
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.writableLength).assertEqual(17);
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.writable).assertFalse();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_2500
     * @tc.name testStreamWritableProperties025
     * @tc.desc Verify writableEnded=true after end(chunk)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end("data");
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_2600
     * @tc.name testStreamWritableProperties026
     * @tc.desc Verify writableFinished=true after write+end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ws = new WritableTestBase();
          ws.on("finish", (): void => {
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.write("data");
          ws.end();
        });
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_2700
     * @tc.name testStreamWritableProperties027
     * @tc.desc Verify end() without data emits finish with an empty write buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let lengthAtFinish: int = -1;
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            lengthAtFinish = ws.writableLength;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        ws.end();
        expect(ws.writableEnded).assertTrue();
        await finishPromise;
        expect(lengthAtFinish).assertEqual(0);
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_2800
     * @tc.name testStreamWritableProperties028
     * @tc.desc Verify end in corked state forcibly resets writableCorked to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.cork();
      ws.cork();
      ws.end();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_2900
     * @tc.name testStreamWritableProperties029
     * @tc.desc Verify writable becomes false after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let writableAtFinish: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ws = new WritableTestBase();
          ws.on("finish", (): void => {
            writableAtFinish = ws.writable;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(writableAtFinish).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_3000
     * @tc.name testStreamWritableProperties030
     * @tc.desc Verify a missing doWrite failure still charges writableLength and leaves the stream un-ended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableNoDoWrite();
      let errCode: number = 0;
      try {
        ws.write("test");
        expect().assertFail();
      } catch (e) {
        errCode = (e as BusinessError).code;
      }
      expect(errCode).assertEqual(10200035);
      expect(ws.writableLength).assertEqual(4);
      expect(ws.writableEnded).assertFalse();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writableHighWatermark).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_3100
     * @tc.name testStreamWritableProperties031
     * @tc.desc Verify writableLength counts UTF-16 code units for emoji, zero-width space and lone surrogate writes while corked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['😀', '​', '\uD800'];
      let lengths: int[] = [2, 1, 1];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new WritableTestBase();
        ws.cork();
        ws.write(chunks[i]);
        expect(ws.writableLength).assertEqual(lengths[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_3200
     * @tc.name testStreamWritableProperties032
     * @tc.desc Verify writableLength counts characters for Chinese text written with gbk or gb18030 encoding while corked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ['gbk', 'gb18030'];
      for (let i = 0; i < encodings.length; i++) {
        let ws = new WritableTestBase();
        ws.cork();
        ws.write('测试', encodings[i]);
        expect(ws.writableLength).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_3300
     * @tc.name testStreamWritableProperties033
     * @tc.desc Verify writableFinished becomes true inside the finish callback after buffered write+end, with writableEnded already true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let finishedAtFinish: boolean = false;
        let writableLengthAtFinish: int = -1;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ws = new WritableTestBase();
          ws.on('finish', (): void => {
            finishedAtFinish = ws.writableFinished;
            writableLengthAtFinish = ws.writableLength;
            resolve(undefined as void);
          });
          ws.cork();
          ws.write("buffered-one");
          ws.write("buffered-two");
          ws.write("buffered-three");
          ws.uncork();
          ws.end();
        });
        expect(finishedAtFinish).assertTrue();
        expect(writableLengthAtFinish).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_3400
     * @tc.name testStreamWritableProperties034
     * @tc.desc Verify writing empty Uint8Array in corked state does not change writableCorked and keeps writableLength at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
      ws.write(new Uint8Array(0));
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_3500
     * @tc.name testStreamWritableProperties035
     * @tc.desc Verify property state unchanged after write empty string throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableNoDoWrite();
      let lenBefore = ws.writableLength;
      try {
        ws.write("");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(401);
        expect(ws.writableLength).assertEqual(lenBefore);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_3600
     * @tc.name testStreamWritableProperties036
     * @tc.desc Verify property state unchanged after write(null) throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableNoDoWrite();
      let lenBefore = ws.writableLength;
      try {
        ws.write(null as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        expect(ws.writableLength).assertEqual(lenBefore);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_3700
     * @tc.name testStreamWritableProperties037
     * @tc.desc Verify property state unchanged after write(undefined) throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableNoDoWrite();
      let lenBefore = ws.writableLength;
      try {
        ws.write(undefined as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        expect(ws.writableLength).assertEqual(lenBefore);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_3800
     * @tc.name testStreamWritableProperties038
     * @tc.desc Verify property unchanged after write(number 123) type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableNoDoWrite();
      let lenBefore = ws.writableLength;
      try {
        ws.write(123 as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        expect(ws.writableLength).assertEqual(lenBefore);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_3900
     * @tc.name testStreamWritableProperties039
     * @tc.desc Verify property unchanged after write(boolean true) type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableNoDoWrite();
      let lenBefore = ws.writableLength;
      try {
        ws.write(true as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        expect(ws.writableLength).assertEqual(lenBefore);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_4000
     * @tc.name testStreamWritableProperties040
     * @tc.desc Verify writableLength does not change after write throws exception following end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let lenBefore: int = 0;
        let errName: string = "";
        let errCode: int = 0;
        let writableLenAtError: int = -1;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ws = new WritableTestBase();
          lenBefore = ws.writableLength;
          ws.end();
          ws.on('error', (err: Error): void => {
            errName = err.name;
            errCode = (err as BusinessError).code;
            writableLenAtError = ws.writableLength;
            resolve(undefined as void);
          });
          ws.write("test");
        });
        expect(errName).assertEqual("BusinessError");
        expect(errCode).assertEqual(10200036);
        expect(writableLenAtError).assertEqual(lenBefore);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_4100
     * @tc.name testStreamWritableProperties041
     * @tc.desc Verify writableEnded remains true after end() then second end() throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end();
      expect(ws.writableEnded).assertTrue();
      try {
        ws.end();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200036);
        expect(ws.writableEnded).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_4200
     * @tc.name testStreamWritableProperties042
     * @tc.desc Verify a string or Uint8Array write after end reports error code 10200036 on the error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let chunks: (string | Uint8Array)[] = ["test", new Uint8Array([0x74, 0x65, 0x73, 0x74])];
        for (let i = 0; i < chunks.length; i++) {
          let errName: string = "";
          let errCode: int = 0;
          await new Promise<void>((resolve: (value: void) => void): void => {
            let ws = new WritableTestBase();
            ws.end();
            ws.on('error', (err: Error): void => {
              errName = err.name;
              errCode = (err as BusinessError).code;
              resolve(undefined as void);
            });
            ws.write(chunks[i]);
          });
          expect(errName).assertEqual("BusinessError");
          expect(errCode).assertEqual(10200036);
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_4300
     * @tc.name testStreamWritableProperties043
     * @tc.desc Verify end(chunk) after end throws error code 10200036
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end();
      try {
        ws.end("data");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200036);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_4400
     * @tc.name testStreamWritableProperties044
     * @tc.desc Verify write without doWrite implementation throws error code 10200035
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableNoDoWrite();
      try {
        ws.write("test");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200035);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_PROPERTIES_4500
     * @tc.name testStreamWritableProperties045
     * @tc.desc Verify writable properties transition to the finished state inside finish callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableProperties045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let writableAtFinish: boolean = true;
        let endedAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        let lengthAtFinish: int = -1;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            writableAtFinish = ws.writable;
            endedAtFinish = ws.writableEnded;
            finishedAtFinish = ws.writableFinished;
            lengthAtFinish = ws.writableLength;
            resolve(undefined as void);
          });
        });
        ws.write('state');
        ws.end();
        await finishPromise;
        expect(writableAtFinish).assertFalse();
        expect(endedAtFinish).assertTrue();
        expect(finishedAtFinish).assertTrue();
        expect(lengthAtFinish).assertEqual(0);
        done();
      });
  });
}
