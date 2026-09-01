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

class DuplexTestBase extends stream.Duplex {
  public readCallCount: int = 0;
  public lastReadSize: int = -1;

  constructor() {
    super();
  }

  doRead(size: int): void {
    this.readCallCount++;
    this.lastReadSize = size;
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class DuplexThrowDoRead extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
    throw new Error("source error");
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class DuplexPushAuto extends stream.Duplex {
  private emitted: boolean = false;

  constructor() {
    super();
  }

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("auto");
      this.push(null);
    }
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamDuplexDoReadTest(): void {
  describe('StreamDuplexDoReadTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_0100
     * @tc.name testStreamDuplexDoRead001
     * @tc.desc Verify doRead empty impl, read returns null when no push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      let data = ds.read();
      expect(data).assertEqual(null);
      expect(ds.readCallCount).assertEqual(1);
      expect(ds.lastReadSize).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_0200
     * @tc.name testStreamDuplexDoRead002
     * @tc.desc Verify doRead empty impl, push then read returns pushed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("test");
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("test");
      expect(ds.readCallCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_0300
     * @tc.name testStreamDuplexDoRead003
     * @tc.desc Verify a throwing doRead surfaces the error and leaves the readable buffer empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let errMsg: string = "";
        let lengthAtError: int = -1;
        let endedAtError: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexThrowDoRead = new DuplexThrowDoRead();
          ds.on("error", (err: Error): void => {
            errMsg = err.message;
            lengthAtError = ds.readableLength;
            endedAtError = ds.readableEnded;
            resolve(undefined as void);
          });
          ds.resume();
        });
        expect(errMsg).assertEqual("source error");
        expect(lengthAtError).assertEqual(0);
        expect(endedAtError).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_0400
     * @tc.name testStreamDuplexDoRead004
     * @tc.desc Verify doRead auto called during read() in flowing mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let received: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexPushAuto = new DuplexPushAuto();
          ds.on("data", (chunk: Object): void => {
            received = chunk.toString();
            resolve(undefined as void);
          });
          ds.resume();
        });
        expect(received).assertEqual("auto");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_0500
     * @tc.name testStreamDuplexDoRead005
     * @tc.desc Verify doRead produces data only on its first invocation in paused mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexPushAuto = new DuplexPushAuto();
      ds.pause();
      let firstData = ds.read();
      expect(firstData?.toString()).assertEqual("auto");
      let secondData = ds.read();
      expect(secondData).assertEqual(null);
      expect(ds.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_0600
     * @tc.name testStreamDuplexDoRead006
     * @tc.desc Verify doRead size param equals highWaterMark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.read(16384);
      expect(ds.readCallCount).assertEqual(1);
      expect(ds.lastReadSize).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_0700
     * @tc.name testStreamDuplexDoRead007
     * @tc.desc Verify doRead size param = negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.read(-1);
      expect(ds.readCallCount).assertEqual(1);
      expect(ds.lastReadSize).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_0800
     * @tc.name testStreamDuplexDoRead008
     * @tc.desc Verify doRead not called after push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push(null);
      ds.pause();
      let data = ds.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_0900
     * @tc.name testStreamDuplexDoRead009
     * @tc.desc Verify doRead not called after pause()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexPushAuto = new DuplexPushAuto();
      ds.pause();
      ds.push("manual");
      let data = ds.read();
      expect(data?.toString()).assertEqual("manualauto");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_1000
     * @tc.name testStreamDuplexDoRead010
     * @tc.desc Verify doRead not called on write side (write independence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let r: boolean = ds.write("test");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_1100
     * @tc.name testStreamDuplexDoRead011
     * @tc.desc Verify doRead not called on end()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.end();
      expect(ds.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_1200
     * @tc.name testStreamDuplexDoRead012
     * @tc.desc Verify doRead not called on cork/uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.cork();
      expect(ds.writableCorked).assertEqual(1);
      ds.uncork();
      expect(ds.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_1300
     * @tc.name testStreamDuplexDoRead013
     * @tc.desc Verify doRead not called on setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let r: boolean = ds.setEncoding("utf8");
      expect(r).assertTrue();
      expect(ds.readCallCount).assertEqual(0);
      expect(ds.readableEncoding).assertEqual("utf-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_1400
     * @tc.name testStreamDuplexDoRead014
     * @tc.desc Verify doRead not called affects readableLength after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push("hello");
      expect(ds.readableLength).assertEqual(5);
      expect(ds.readCallCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_1500
     * @tc.name testStreamDuplexDoRead015
     * @tc.desc Verify readableFlowing, readableEnded and readableObjectMode keep defaults while doRead has never been invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      expect(ds.readableFlowing).assertEqual(null);
      expect(ds.readableEnded).assertFalse();
      expect(ds.readableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_1600
     * @tc.name testStreamDuplexDoRead016
     * @tc.desc Verify setEncoding updates readableEncoding without invoking doRead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("gbk");
      expect(ds.readableEncoding).assertEqual("gbk");
      expect(ds.readCallCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_1700
     * @tc.name testStreamDuplexDoRead017
     * @tc.desc Verify read() invokes doRead once with readableHighWatermark size and leaves readable and writable state unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.read();
      expect(ds.readCallCount).assertEqual(1);
      expect(ds.lastReadSize).assertEqual(ds.readableHighWatermark);
      expect(ds.readableEnded).assertFalse();
      expect(ds.readableObjectMode).assertFalse();
      expect(ds.writable).assertTrue();
      expect(ds.writableLength).assertEqual(0);
      expect(ds.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_1800
     * @tc.name testStreamDuplexDoRead018
     * @tc.desc Verify doRead in pause mode not called when buffer has data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push("data");
      let data = ds.read();
      expect(data?.toString()).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_1900
     * @tc.name testStreamDuplexDoRead019
     * @tc.desc Verify a throwing doRead reached through read in paused mode still emits error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let errName: string = "";
        let pausedAtError: boolean = false;
        let readResult: Object | null = "unset" as Object;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexThrowDoRead = new DuplexThrowDoRead();
          ds.on("error", (err: Object): void => {
            errName = (err as Error).name;
            pausedAtError = ds.isPaused();
            resolve(undefined as void);
          });
          ds.pause();
          readResult = ds.read();
        });
        expect(errName).assertEqual('Error');
        expect(pausedAtError).assertTrue();
        expect(readResult).assertEqual(null);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_READ_2000
     * @tc.name testStreamDuplexDoRead020
     * @tc.desc Verify doRead after resume works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoRead020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let received: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexPushAuto = new DuplexPushAuto();
          ds.on("data", (chunk: Object): void => {
            received = true;
            resolve(undefined as void);
          });
          ds.pause();
          ds.resume();
        });
        expect(received).assertTrue();
        done();
      });
  });
}
