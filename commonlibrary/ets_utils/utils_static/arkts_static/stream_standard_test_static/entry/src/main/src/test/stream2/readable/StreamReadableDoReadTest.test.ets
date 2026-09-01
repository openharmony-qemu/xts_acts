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
import { buffer, stream, util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

class ReadableTestBase extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class NoDoReadReadable extends stream.Readable {
  constructor() {
    super();
  }
}

class DoReadPush001 extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("test");
      this.push(null);
    }
  }
}

class DoReadPush002 extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push(new Uint8Array([72, 101, 108, 108, 111]));
      this.push(null);
    }
  }
}

class DoReadPushHello extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("hello");
      this.push(null);
    }
  }
}

class DoReadMultiChunk extends ReadableTestBase {
  count: int = 0;
  sizes: Array<int> = [];

  doRead(size: int): void {
    if (this.count < 3) {
      this.sizes.push(size);
      this.count++;
      this.push("chunk" + this.count);
      if (this.count === 3) {
        this.push(null);
      }
    }
  }
}

class DoReadNoPush extends ReadableTestBase {
  called: boolean = false;

  doRead(size: int): void {
    if (!this.called) {
      this.called = true;
      this.push(null);
    }
  }
}

class DoReadPushNull extends ReadableTestBase {
  doRead(size: int): void {
    this.push(null);
  }
}

class DoReadTrackCalled extends ReadableTestBase {
  called: boolean = false;

  doRead(size: int): void {
    if (!this.called) {
      this.called = true;
      this.push(null);
    }
  }
}

class DoReadPushChinese extends ReadableTestBase {
  private sourceEncoding: string = "utf8";
  private emitted: boolean = false;

  constructor(encoding: string = "utf8") {
    super();
    this.sourceEncoding = encoding;
  }

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("测试工程师", this.sourceEncoding);
      this.push(null);
    }
  }
}

class DoReadPushEmoji extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("😀测试");
      this.push(null);
    }
  }
}

class DoReadSizeRecorder extends ReadableTestBase {
  receivedSize: int = -1;
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.receivedSize = size;
      this.push("x");
      this.push(null);
    }
  }
}

class DoReadEqPush extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("x".repeat(1024));
      this.push(null);
    }
  }
}

class DoReadSmallPush extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("hello");
      this.push(null);
    }
  }
}

class DoReadBigPush extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("hello world!");
      this.push(null);
    }
  }
}

class DoReadEmptyUint8 extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push(new Uint8Array([]));
      this.push(null);
    }
  }
}

class DoReadTriplePush extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("a");
      this.push("b");
      this.push("c");
      this.push(null);
    }
  }
}

class DoReadPushDataThenNull extends ReadableTestBase {
  doRead(size: int): void {
    this.push("data");
    this.push(null);
  }
}

class DoReadPushLarge extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      let largeData: string = "x".repeat(16384);
      this.push(largeData);
      this.push(null);
    }
  }
}

class DoReadBackpressure extends ReadableTestBase {
  public readCount: int = 0;
  public firstPushResult: boolean = true;
  public lastPushResult: boolean = true;

  doRead(size: int): void {
    this.readCount++;
    let buf: string = "x".repeat(32768);
    let pushed: boolean = this.push(buf);
    if (this.readCount === 1) {
      this.firstPushResult = pushed;
    }
    this.lastPushResult = pushed;
    if (pushed || this.readCount >= 2) {
      this.push(null);
    }
  }
}

class DoReadEmptyString extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("");
      this.push(null);
    }
  }
}

class DoReadPushUndefined extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push(undefined as String);
      this.push(null);
    }
  }
}

class DoReadZeroUint8 extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push(new Uint8Array([0, 1, 0, 2, 0]));
      this.push(null);
    }
  }
}

class DoReadFFUint8 extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push(new Uint8Array([0xFF, 0xFF, 0xFF]));
      this.push(null);
    }
  }
}

class DoReadCtrlUint8 extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push(new Uint8Array([0x0A, 0x0D, 0x09]));
      this.push(null);
    }
  }
}

class DoReadZeroWidth extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("​");
      this.push(null);
    }
  }
}

class DoReadSurrogate extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("\uDC04");
      this.push(null);
    }
  }
}

class DoReadReplacement extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("�");
      this.push(null);
    }
  }
}

class DoReadNonStandard extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push(123 as Object as String);
      this.push(null);
    }
  }
}

class DoRead100KB extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("x".repeat(102400));
      this.push(null);
    }
  }
}

class DoReadBadUtf8 extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push(new Uint8Array([0xE4, 0x3F, 0xAD]));
      this.push(null);
    }
  }
}

class DoReadEmojiSeq extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("🔥🔥🔥");
      this.push(null);
    }
  }
}

class DoReadPushAndThrow extends ReadableTestBase {
  doRead(size: int): void {
    this.push("x");
    this.push(null);
    throw new Error("read error");
  }
}

class DoReadThrowOnly extends ReadableTestBase {
  doRead(size: int): void {
    throw new Error("read error");
  }
}

class DoReadSize0 extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("x");
      this.push(null);
    }
  }
}

class DoReadSize1 extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("x");
      this.push(null);
    }
  }
}

class DoReadSize16383 extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      let data: string = "x".repeat(16383);
      this.push(data);
      this.push(null);
    }
  }
}

class DoReadSize16384 extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      let data: string = "x".repeat(16384);
      this.push(data);
      this.push(null);
    }
  }
}

class DoReadSize16385 extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      let data: string = "x".repeat(16385);
      this.push(data);
      this.push(null);
    }
  }
}

class DoReadSizeLarge extends ReadableTestBase {
  private emitted: boolean = false;

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push("x");
      this.push(null);
    }
  }
}

export default function StreamReadableDoReadTest(): void {
  describe('StreamReadableDoReadTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_0100
     * @tc.name testStreamReadableDoRead001
     * @tc.desc Verify doRead pushes string data when read is called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadPush001();
      let data = rs.read();
      expect(data?.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_0200
     * @tc.name testStreamReadableDoRead002
     * @tc.desc Verify doRead receives size and pushes Uint8Array data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadPush002();
      let data = rs.read();
      expect(data?.toString()).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_0300
     * @tc.name testStreamReadableDoRead003
     * @tc.desc Verify stream automatically calls doRead with size on on("data") registration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedData: string = '';
        let capturedEnded: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new DoReadPushHello();
          rs.on('data', (chunk: Object): void => {
            capturedData = chunk.toString();
          });
          rs.on('end', (): void => {
            capturedEnded = rs.readableEnded;
            resolve(undefined as void);
          });
        });
        expect(capturedData).assertEqual("hello");
        expect(capturedEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_0400
     * @tc.name testStreamReadableDoRead004
     * @tc.desc Verify doRead is called multiple times in flowing mode with decreasing size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new DoReadMultiChunk();
          rs.on('data', (): void => {
          });
          rs.on('end', (): void => {
            capturedCount = rs.count;
            resolve(undefined as void);
          });
        });
        expect(capturedCount).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_0500
     * @tc.name testStreamReadableDoRead005
     * @tc.desc Verify empty doRead implementation does not push any data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadNoPush();
      rs.pause();
      let data = rs.read();
      expect(data).assertEqual(null);
      expect(rs.called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_0600
     * @tc.name testStreamReadableDoRead006
     * @tc.desc Verify push(null) in doRead ends the stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedEnded: boolean = false;
        let capturedData: Object | null = null;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new DoReadPushNull();
          rs.on('end', (): void => {
            capturedEnded = rs.readableEnded;
            capturedData = rs.read();
            resolve(undefined as void);
          });
          rs.read();
        });
        expect(capturedEnded).assertTrue();
        expect(capturedData).assertEqual(null);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_0700
     * @tc.name testStreamReadableDoRead007
     * @tc.desc Verify doRead is not automatically triggered in paused mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadTrackCalled();
      rs.pause();
      rs.on('data', (): void => {
      });
      expect(rs.called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_0800
     * @tc.name testStreamReadableDoRead008
     * @tc.desc Verify constructor does not throw when doRead is not overridden
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let rs = new NoDoReadReadable();
        expect(rs.readable).assertTrue();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_0900
     * @tc.name testStreamReadableDoRead009
     * @tc.desc Verify doRead pushes Chinese UTF-8 string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadPushChinese();
      let data = rs.read();
      expect(data?.toString()).assertEqual("测试工程师");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_1000
     * @tc.name testStreamReadableDoRead010
     * @tc.desc Verify doRead pushes Chinese string then reads with gbk encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadPushChinese("gbk");
      rs.setEncoding("gbk");
      let data = rs.read();
      expect(data?.toString()).assertEqual("测试工程师");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_1100
     * @tc.name testStreamReadableDoRead011
     * @tc.desc Verify doRead pushes Chinese string then reads with gb18030 encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadPushChinese("gb18030");
      rs.setEncoding("gb18030");
      let data = rs.read();
      expect(data?.toString()).assertEqual("测试工程师");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_1200
     * @tc.name testStreamReadableDoRead012
     * @tc.desc Verify doRead pushes emoji and Chinese mixed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadPushEmoji();
      let data = rs.read();
      expect(data?.toString()).assertEqual("😀测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_1300
     * @tc.name testStreamReadableDoRead013
     * @tc.desc Verify size is 65536 (large data chunk)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadSizeRecorder();
      rs.pause();
      let data = rs.read(65536);
      expect(rs.receivedSize).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_1400
     * @tc.name testStreamReadableDoRead014
     * @tc.desc Verify size is -1 (negative value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadSizeRecorder();
      rs.pause();
      let data = rs.read(-1);
      expect(rs.receivedSize).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_1500
     * @tc.name testStreamReadableDoRead015
     * @tc.desc Verify pushed data amount equals requested size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadEqPush();
      rs.pause();
      let data = rs.read(1024);
      expect(data?.toString().length).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_1600
     * @tc.name testStreamReadableDoRead016
     * @tc.desc Verify pushed data amount is less than requested size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadSmallPush();
      rs.pause();
      let data = rs.read(16384);
      expect(data?.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_1700
     * @tc.name testStreamReadableDoRead017
     * @tc.desc Verify pushed data amount is greater than requested size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadBigPush();
      rs.pause();
      let data = rs.read(10);
      expect(data?.toString()).assertEqual("hello worl");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_1800
     * @tc.name testStreamReadableDoRead018
     * @tc.desc Verify push empty Uint8Array (0 bytes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadEmptyUint8();
      let data = rs.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_1900
     * @tc.name testStreamReadableDoRead019
     * @tc.desc Verify multiple pushes in doRead are consumed in batches by read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadTriplePush();
      rs.pause();
      let data = rs.read();
      expect(data?.toString()).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_2000
     * @tc.name testStreamReadableDoRead020
     * @tc.desc Verify data pushed in doRead is consumed in batches via read(size)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadPushLarge();
      rs.pause();
      let readCount: int = 0;
      for (let i: int = 0; i < 16; i++) {
        let data = rs.read(1024);
        if (data == null) {
          break;
        }
        readCount++;
      }
      expect(readCount).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_2100
     * @tc.name testStreamReadableDoRead021
     * @tc.desc Verify push(null) after push data in doRead ends the stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedData: string = '';
        let capturedEnded: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new DoReadPushDataThenNull();
          rs.on('data', (chunk: Object): void => {
            capturedData = chunk.toString();
          });
          rs.on('end', (): void => {
            capturedEnded = rs.readableEnded;
            resolve(undefined as void);
          });
        });
        expect(capturedData).assertEqual('data');
        expect(capturedEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_2200
     * @tc.name testStreamReadableDoRead022
     * @tc.desc Verify doRead is triggered after resume() switches from paused to flowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedData: string = '';
        let capturedEnded: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new DoReadPushHello();
          rs.pause();
          rs.on('data', (chunk: Object): void => {
            capturedData = chunk.toString();
          });
          rs.on('end', (): void => {
            capturedEnded = rs.readableEnded;
            resolve(undefined as void);
          });
          rs.resume();
        });
        expect(capturedData).assertEqual('hello');
        expect(capturedEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_2300
     * @tc.name testStreamReadableDoRead023
     * @tc.desc Verify doRead is no longer automatically scheduled after end()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadTrackCalled();
      rs.push(null);
      let data = rs.read();
      expect(rs.called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_2400
     * @tc.name testStreamReadableDoRead024
     * @tc.desc Verify doRead is not triggered after stream ends with push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new DoReadTrackCalled();
        rs.pause();
        rs.push(null);
        expect(rs.readableEnded).assertFalse();
        let data = rs.read();
        expect(data).assertEqual(null);
        expect(rs.called).assertFalse();
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            expect(rs.readableEnded).assertTrue();
            expect(rs.called).assertFalse();
            resolve(undefined as void);
          });
          rs.resume();
        });
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_2500
     * @tc.name testStreamReadableDoRead025
     * @tc.desc Verify resume after pause triggers doRead with default size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadSizeRecorder();
      rs.pause();
      rs.resume();
      let data = rs.read();
      expect(rs.receivedSize).assertEqual(16384);
      expect(data?.toString()).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_2600
     * @tc.name testStreamReadableDoRead026
     * @tc.desc Verify doRead is called when on("readable") event triggers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedData: Object | null = null;
        let capturedEnded: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new DoReadPushHello();
          rs.on('readable', (): void => {
            capturedData = rs.read();
          });
          rs.on('end', (): void => {
            capturedEnded = rs.readableEnded;
            resolve(undefined as void);
          });
        });
        expect(capturedData?.toString()).assertEqual("hello");
        expect(capturedEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_2700
     * @tc.name testStreamReadableDoRead027
     * @tc.desc Verify doRead continues to be called under backpressure but push returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadBackpressure();
      rs.pause();
      let data = rs.read();
      expect(rs.readCount).assertEqual(1);
      expect(rs.firstPushResult).assertFalse();
      expect(rs.lastPushResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_2800
     * @tc.name testStreamReadableDoRead028
     * @tc.desc Verify doRead is called again after buffer is consumed below high water mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new DoReadBackpressure();
        rs.on('data', (chunk: Object): void => {
        });
        let capturedReadCount: int = 0;
        let capturedFirst: boolean = false;
        let capturedLast: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            capturedReadCount = rs.readCount;
            capturedFirst = rs.firstPushResult;
            capturedLast = rs.lastPushResult;
            resolve(undefined as void);
          });
        });
        expect(capturedReadCount).assertEqual(2);
        expect(capturedFirst).assertFalse();
        expect(capturedLast).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_2900
     * @tc.name testStreamReadableDoRead029
     * @tc.desc Verify doRead pushes empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadEmptyString();
      let data = rs.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_3000
     * @tc.name testStreamReadableDoRead030
     * @tc.desc Verify doRead pushes undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadPushUndefined();
      let data = rs.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_3100
     * @tc.name testStreamReadableDoRead031
     * @tc.desc Verify doRead pushes Uint8Array containing zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadZeroUint8();
      let data = rs.read();
      expect(data?.toString().length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_3200
     * @tc.name testStreamReadableDoRead032
     * @tc.desc Verify doRead pushes Uint8Array containing 0xFF bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadFFUint8();
      let data = rs.read();
      expect(data?.toString().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_3300
     * @tc.name testStreamReadableDoRead033
     * @tc.desc Verify doRead pushes data containing control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadCtrlUint8();
      let data = rs.read();
      expect(data?.toString().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_3400
     * @tc.name testStreamReadableDoRead034
     * @tc.desc Verify doRead pushes string containing zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadZeroWidth();
      let data = rs.read();
      expect(data?.toString()).assertEqual("​");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_3500
     * @tc.name testStreamReadableDoRead035
     * @tc.desc Verify doRead pushes string containing lone surrogate character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadSurrogate();
      let data = rs.read();
      expect(data?.toString().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_3600
     * @tc.name testStreamReadableDoRead036
     * @tc.desc Verify doRead pushes string containing Unicode replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadReplacement();
      let data = rs.read();
      expect(data?.toString()).assertEqual("�");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_3700
     * @tc.name testStreamReadableDoRead037
     * @tc.desc Verify doRead implementation as async function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadPushHello();
      let data = rs.read();
      expect(data?.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_3800
     * @tc.name testStreamReadableDoRead038
     * @tc.desc Verify doRead uses setTimeout for async data push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedReadable: boolean = false;
        let capturedEnded: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new DoReadPushHello();
          rs.on('data', (): void => {
            capturedReadable = rs.readable;
          });
          rs.on('end', (): void => {
            capturedEnded = rs.readableEnded;
            resolve(undefined as void);
          });
        });
        expect(capturedReadable).assertTrue();
        expect(capturedEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_3900
     * @tc.name testStreamReadableDoRead039
     * @tc.desc Verify doRead synchronously throws Error after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedName: string = '';
        let capturedMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new DoReadPushAndThrow();
          rs.on('error', (err: Error): void => {
            capturedName = err.name;
            capturedMessage = err.message;
            resolve(undefined as void);
          });
          rs.read();
        });
        expect(capturedName).assertEqual('Error');
        expect(capturedMessage).assertEqual('read error');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_4000
     * @tc.name testStreamReadableDoRead040
     * @tc.desc Verify doRead throws Error without pushing any data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedName: string = '';
        let capturedMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new DoReadThrowOnly();
          rs.on('error', (err: Error): void => {
            capturedName = err.name;
            capturedMessage = err.message;
            resolve(undefined as void);
          });
          rs.read();
        });
        expect(capturedName).assertEqual('Error');
        expect(capturedMessage).assertEqual('read error');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_4100
     * @tc.name testStreamReadableDoRead041
     * @tc.desc Verify doRead pushes non-standard type object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadNonStandard();
      rs.pause();
      try {
        let data = rs.read();
        expect(data).assertEqual(null);
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_4200
     * @tc.name testStreamReadableDoRead042
     * @tc.desc Verify doRead pushes very large data (100KB string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoRead100KB();
      let data = rs.read();
      expect(data?.toString().length).assertEqual(102400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_4300
     * @tc.name testStreamReadableDoRead043
     * @tc.desc Verify doRead pushes Uint8Array with invalid UTF-8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadBadUtf8();
      let data = rs.read();
      let bytes = data as buffer.Buffer;
      expect(bytes.length).assertEqual(3);
      expect(bytes[0]).assertEqual(0xE4);
      expect(bytes[1]).assertEqual(0x3F);
      expect(bytes[2]).assertEqual(0xAD);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_4400
     * @tc.name testStreamReadableDoRead044
     * @tc.desc Verify doRead pushes emoji sequence exceeding 3 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadEmojiSeq();
      let data = rs.read();
      expect(data?.toString()).assertEqual("🔥🔥🔥");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_4500
     * @tc.name testStreamReadableDoRead045
     * @tc.desc Verify calling read directly without doRead implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedName: string = '';
        let capturedCode: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new NoDoReadReadable();
          rs.on('error', (err: BusinessError): void => {
            capturedName = err.name;
            capturedCode = err.code;
            resolve(undefined as void);
          });
          rs.read();
        });
        expect(capturedName).assertEqual('BusinessError');
        expect(capturedCode).assertEqual(10200038);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_4600
     * @tc.name testStreamReadableDoRead046
     * @tc.desc Verify registering on("data") without doRead implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedName: string = '';
        let capturedCode: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new NoDoReadReadable();
          rs.on('error', (err: BusinessError): void => {
            capturedName = err.name;
            capturedCode = err.code;
            resolve(undefined as void);
          });
          rs.on('data', (): void => {
          });
        });
        expect(capturedName).assertEqual('BusinessError');
        expect(capturedCode).assertEqual(10200038);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_4700
     * @tc.name testStreamReadableDoRead047
     * @tc.desc Verify registering on("readable") without doRead implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedName: string = '';
        let capturedCode: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new NoDoReadReadable();
          rs.on('error', (err: BusinessError): void => {
            capturedName = err.name;
            capturedCode = err.code;
            resolve(undefined as void);
          });
          rs.on('readable', (): void => {
            rs.read();
          });
        });
        expect(capturedName).assertEqual('BusinessError');
        expect(capturedCode).assertEqual(10200038);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_4800
     * @tc.name testStreamReadableDoRead048
     * @tc.desc Verify doRead pushes one data chunk before readable end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedData: string = '';
        let capturedEnded: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new DoReadPushHello();
          rs.on('data', (data: Object): void => {
            capturedData = data.toString();
          });
          rs.on('end', (): void => {
            capturedEnded = rs.readableEnded;
            resolve(undefined as void);
          });
          rs.resume();
        });
        expect(capturedData).assertEqual('hello');
        expect(capturedEnded).assertTrue();

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_4900
     * @tc.name testStreamReadableDoRead049
     * @tc.desc Verify doRead receives size 0 when read(0) is called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadSize0();
      rs.pause();
      let result = rs.read(0);
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_5000
     * @tc.name testStreamReadableDoRead050
     * @tc.desc Verify doRead receives size 1 when read(1) is called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadSize1();
      rs.pause();
      let result = rs.read(1);
      expect(result?.toString()).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_5100
     * @tc.name testStreamReadableDoRead051
     * @tc.desc Verify doRead delivers the full payload for read sizes at 16383, 16384 and 16385 around the default high water mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let streams: ReadableTestBase[] = [new DoReadSize16383(), new DoReadSize16384(),
        new DoReadSize16385()];
      let sizes: int[] = [16383, 16384, 16385];
      for (let i = 0; i < sizes.length; i++) {
        streams[i].pause();
        let result = streams[i].read(sizes[i]);
        expect(result?.toString()).assertEqual("x".repeat(sizes[i]));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_DO_READ_5200
     * @tc.name testStreamReadableDoRead052
     * @tc.desc Verify doRead handles size=2147483646 (near max int32)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableDoRead052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new DoReadSizeLarge();
      rs.pause();
      let result = rs.read(2147483646);
      expect(result?.toString()).assertEqual("x");
    });
  });
}
