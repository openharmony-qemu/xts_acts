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

class PipeWritableBase extends stream.Writable {
  public receivedChunks: Object[] = [];
  public writeCount: int = 0;
  public writeObserver: Function | undefined = undefined;

  constructor() {
    super();
  }

  doWrite(data: string | Uint8Array, encoding: string, cb: Function): void {
    this.receivedChunks.push(data);
    this.writeCount++;
    let observer: Function | undefined = this.writeObserver;
    if (observer !== undefined) {
      observer.unsafeCall();
    }
    cb.unsafeCall();
  }
}

class NoDoWriteWritable extends stream.Writable {
  constructor() {
    super();
  }
}

class PipeDuplexBase extends stream.Duplex {
  public receivedChunks: Object[] = [];
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(data: string | Uint8Array, encoding: string, cb: Function): void {
    this.receivedChunks.push(data);
    this.writeCount++;
    cb.unsafeCall();
  }
}

class PipeTransformBase extends stream.Transform {
  public receivedChunks: Object[] = [];
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doTransform(data: string | Uint8Array, encoding: string, cb: Function): void {
    this.receivedChunks.push(data);
    this.writeCount++;
    this.push(data);
    cb.unsafeCall();
  }
}

class SingleChunkReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("test");
    this.push(null);
  }
}

class MultiChunkReadable extends ReadableTestBase {
  private index: int = 0;
  private chunks: string[] = ["chunk1", "chunk2", "chunk3"];

  doRead(size: int): void {
    if (this.index < this.chunks.length) {
      this.push(this.chunks[this.index]);
      this.index++;
    } else {
      this.push(null);
    }
  }
}

class EmptyReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push(null);
  }
}

class SingleByteReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("a");
    this.push(null);
  }
}

class HighWaterReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("A".repeat(16383));
    this.push(null);
  }
}

class ExactHighWaterReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("A".repeat(16384));
    this.push(null);
  }
}

class AboveHighWaterReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("A".repeat(16385));
    this.push(null);
  }
}

class LargeDataReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push(new Uint8Array(65536));
    this.push(null);
  }
}

class HundredKBReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("A".repeat(102400));
    this.push(null);
  }
}

class ErrorThrowReadable extends ReadableTestBase {
  doRead(size: int): void {
    throw new Error("source error");
  }
}

class EmojiReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("😀");
    this.push(null);
  }
}

class MixedEmojiReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("😀测试");
    this.push(null);
  }
}

class ZeroWidthReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("​");
    this.push(null);
  }
}

class SurrogateReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("\udc04");
    this.push(null);
  }
}

class ReplacementReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("�");
    this.push(null);
  }
}

class XssReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("<script>alert(1)</script>");
    this.push(null);
  }
}

class JapaneseReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("テスト");
    this.push(null);
  }
}

class RussianReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("тест");
    this.push(null);
  }
}

class AllZeroUint8Readable extends ReadableTestBase {
  doRead(size: int): void {
    this.push(new Uint8Array([0x00, 0x00, 0x00, 0x00, 0x00]));
    this.push(null);
  }
}

class AllMaxUint8Readable extends ReadableTestBase {
  doRead(size: int): void {
    this.push(new Uint8Array([0xFF, 0xFF, 0xFF, 0xFF, 0xFF]));
    this.push(null);
  }
}

class MixedUint8Readable extends ReadableTestBase {
  doRead(size: int): void {
    this.push(new Uint8Array([0x00, 0xFF, 0x7F, 0x80]));
    this.push(null);
  }
}

class CrLfUint8Readable extends ReadableTestBase {
  doRead(size: int): void {
    this.push(new Uint8Array([0x0A, 0x0D]));
    this.push(null);
  }
}

class GbkEncodedReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("测试工程师");
    this.push(null);
  }
}

class Utf8UpperReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("hello");
    this.push(null);
  }
}

class MixedTypeReadable extends ReadableTestBase {
  private index: int = 0;

  doRead(size: int): void {
    if (this.index === 0) {
      this.push("text");
      this.index++;
    } else if (this.index === 1) {
      this.push(new Uint8Array([1, 2, 3]));
      this.index++;
    } else if (this.index === 2) {
      this.push("more");
      this.index++;
    } else {
      this.push(null);
    }
  }
}

class BroadcastReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("broadcast");
    this.push(null);
  }
}

class ReconnectReadable extends ReadableTestBase {
  doRead(size: int): void {
    this.push("reconnected");
    this.push(null);
  }
}

export default function StreamReadablePipeTest(): void {
  describe('StreamReadablePipeTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach((): void => {
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_0100
     * @tc.name testStreamReadablePipe001
     * @tc.desc Verify basic pipe data flow: readable stream pushes data and ends with push(null), pipe to Writable for automatic transfer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new SingleChunkReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array))
          .assertEqual("test");
        expect(r.readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_0200
     * @tc.name testStreamReadablePipe002
     * @tc.desc Verify pipe returns destination Writable object supporting chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new SingleChunkReadable();
      let w = new PipeWritableBase();
      let result = r.pipe(w);
      expect(result).assertEqual(w);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_0300
     * @tc.name testStreamReadablePipe003
     * @tc.desc Verify after readable stream ends (push null), pipe automatically calls destination end triggers finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new SingleChunkReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array))
          .assertEqual("test");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_0400
     * @tc.name testStreamReadablePipe004
     * @tc.desc Verify multiple data chunks are transmitted through pipe in push order without loss or disorder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new MultiChunkReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(3);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array))
          .assertEqual("chunk1");
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[1] as Uint8Array))
          .assertEqual("chunk2");
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[2] as Uint8Array))
          .assertEqual("chunk3");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_0500
     * @tc.name testStreamReadablePipe005
     * @tc.desc Verify after pipe, unpipe disconnects and subsequent push data no longer flows to destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new PipeWritableBase();
      r.pipe(w);
      r.unpipe(w);
      r.push("after_unpipe");
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_0600
     * @tc.name testStreamReadablePipe006
     * @tc.desc Verify after pause, pipe forces switch to flowing mode (pause overridden by pipe)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new SingleChunkReadable();
      let w = new PipeWritableBase();
      r.pause();
      expect(r.isPaused()).assertTrue();
      r.pipe(w);
      expect(r.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_0700
     * @tc.name testStreamReadablePipe007
     * @tc.desc Verify pipe after readable stream has ended with push(null) (no data source)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new EmptyReadable();
      let w = new PipeWritableBase();
      r.pipe(w);
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_0800
     * @tc.name testStreamReadablePipe008
     * @tc.desc Verify pipe to destination writable stream that has already called end(), data output omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new PipeWritableBase();
      w.end();
      r.pipe(w);
      r.push("data");
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_0900
     * @tc.name testStreamReadablePipe009
     * @tc.desc Verify Transform stream as pipe destination (Transform extends Writable through multiple levels)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new SingleChunkReadable();
      let t = new PipeTransformBase();
      try {
        r.pipe(t as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_1000
     * @tc.name testStreamReadablePipe010
     * @tc.desc Verify pipe passes empty options object {} (reserved field, should not error)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new SingleChunkReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            resolve(undefined as void);
          });
          let result: Object = r.pipe(w, {} as Object);
          expect(result).assertEqual(w);
        });
        expect(w.writeCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_1100
     * @tc.name testStreamReadablePipe011
     * @tc.desc Verify pipe transmits mixed type data (String + Uint8Array interleaved) in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new MixedTypeReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(3);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array))
          .assertEqual("text");
        expect((w.receivedChunks[1] as Uint8Array).length).assertEqual(3);
        expect((w.receivedChunks[1] as Uint8Array)[0]).assertEqual(1);
        expect((w.receivedChunks[1] as Uint8Array)[1]).assertEqual(2);
        expect((w.receivedChunks[1] as Uint8Array)[2]).assertEqual(3);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[2] as Uint8Array))
          .assertEqual("more");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_1200
     * @tc.name testStreamReadablePipe012
     * @tc.desc Verify destination is a freshly constructed empty Writable (no write/end/end history)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new SingleChunkReadable();
        let w = new PipeWritableBase();
        let wcRes: int = 0;
        let chunkRes: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            wcRes = w.writeCount;
            chunkRes = util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array);
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(wcRes).assertEqual(1);
        expect(chunkRes).assertEqual("test");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_1300
     * @tc.name testStreamReadablePipe013
     * @tc.desc Verify destination is a Writable with partial data already written (buffer has historical data)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new SingleChunkReadable();
        let w = new PipeWritableBase();
        w.write("preexisting");
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(2);
        expect(w.receivedChunks[0]).assertEqual("preexisting");
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[1] as Uint8Array))
          .assertEqual("test");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_1400
     * @tc.name testStreamReadablePipe014
     * @tc.desc Verify destination is a corked Writable (writableCorked > 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new SingleChunkReadable();
      let w = new PipeWritableBase();
      w.cork();
      w.write("x");
      r.pipe(w);
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_1500
     * @tc.name testStreamReadablePipe015
     * @tc.desc Verify destination is a Writable restored to normal after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new SingleChunkReadable();
        let w = new PipeWritableBase();
        w.cork();
        w.uncork();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on('finish', (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array))
          .assertEqual("test");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_1600
     * @tc.name testStreamReadablePipe016
     * @tc.desc Verify unpipe() without a destination disconnects the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new PipeWritableBase();
      r.pipe(w);
      r.unpipe();
      r.push("after_unpipe");
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_1700
     * @tc.name testStreamReadablePipe017
     * @tc.desc Verify a Duplex pipe destination is rejected with ClassCastError and receives no data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new SingleChunkReadable();
      let d = new PipeDuplexBase();
      try {
        r.pipe(d as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(d.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_1800
     * @tc.name testStreamReadablePipe018
     * @tc.desc Verify piping an already-ended empty readable emits no data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new EmptyReadable();
      let w = new PipeWritableBase();
      r.push(null);
      r.pipe(w);
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_1900
     * @tc.name testStreamReadablePipe019
     * @tc.desc Verify pipe transmits 1-byte data (minimum valid data)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new SingleByteReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array)).assertEqual("a");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_2000
     * @tc.name testStreamReadablePipe020
     * @tc.desc Verify pipe transmits 16383 bytes in one chunk below the high water mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new HighWaterReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect((w.receivedChunks[0] as Uint8Array).length).assertEqual(16383);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_2100
     * @tc.name testStreamReadablePipe021
     * @tc.desc Verify pipe transmits 16384 bytes (equal to highWaterMark=16384)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ExactHighWaterReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect((w.receivedChunks[0] as Uint8Array).length).assertEqual(16384);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_2200
     * @tc.name testStreamReadablePipe022
     * @tc.desc Verify pipe transmits 16385 bytes (exceeds highWaterMark, triggers backpressure)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new AboveHighWaterReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect((w.receivedChunks[0] as Uint8Array).length).assertEqual(16385);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_2300
     * @tc.name testStreamReadablePipe023
     * @tc.desc Verify pipe transmits 65536 bytes (large data chunk, heavy backpressure)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new LargeDataReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect((w.receivedChunks[0] as Uint8Array).length).assertEqual(65536);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_2400
     * @tc.name testStreamReadablePipe024
     * @tc.desc Verify pipe transmits 100KB data (extreme large data volume backpressure)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new HundredKBReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect((w.receivedChunks[0] as Uint8Array).length).assertEqual(102400);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_2500
     * @tc.name testStreamReadablePipe025
     * @tc.desc Verify options=null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new SingleChunkReadable();
      let w = new PipeWritableBase();
      let errorCaught: boolean = false;
      try {
        r.pipe(w, null as Object);
      } catch (e) {
        errorCaught = true;
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_2600
     * @tc.name testStreamReadablePipe026
     * @tc.desc Verify pipe with options={} empty object, then unpipe and re-pipe same destination, data still reaches destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new SingleChunkReadable();
        let w = new PipeWritableBase();
        let returned: Object | undefined = undefined;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          returned = r.pipe(w, {} as Object);
        });
        expect(returned).assertEqual(w);
        expect(w.writeCount).assertEqual(1);
        let r2 = new SingleChunkReadable();
        let w2 = new PipeWritableBase();
        let second: Object = r2.pipe(w2, {} as Object);
        expect(second).assertEqual(w2);
        expect(r2.unpipe(w2)).assertEqual(r2);
        let third: Object = r2.pipe(w2, {} as Object);
        expect(third).assertEqual(w2);
        await new Promise<void>((resolve: (value: void) => void): void => {
          setTimeout((): void => resolve(undefined as void), 1000);
        });
        expect(w2.writeCount).assertEqual(1);
        expect(w2.writableEnded).assertTrue();
        expect(r2.readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_2700
     * @tc.name testStreamReadablePipe027
     * @tc.desc Verify piping resumes a paused source after downstream drain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new AboveHighWaterReadable();
        let w = new PipeWritableBase();
        let countAtWrite: int = 0;
        let pausedAtWrite: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.writeObserver = (): void => {
            countAtWrite = w.writeCount;
            pausedAtWrite = r.isPaused();
            resolve(undefined as void);
          };
          r.pipe(w);
        });
        expect(countAtWrite).assertEqual(1);
        expect(pausedAtWrite).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_2800
     * @tc.name testStreamReadablePipe028
     * @tc.desc Verify readable stream buffer already has unconsumed data before pipe (pushed in pause mode)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let w = new PipeWritableBase();
        r.pause();
        r.push("buf1");
        r.push("buf2");
        r.push(null);
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(2);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array))
          .assertEqual("buf1");
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[1] as Uint8Array))
          .assertEqual("buf2");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_2900
     * @tc.name testStreamReadablePipe029
     * @tc.desc Verify readable source triggers error event during pipe (doRead exception)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ErrorThrowReadable();
        let w = new PipeWritableBase();
        let errorName: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("error", (err: Object): void => {
            errorName = (err as Error).name;
            resolve(undefined as void);
          });
          r.pipe(w);
          r.resume();
          try {
            r.read();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            resolve(undefined as void);
          }
        });
        expect(errorName).assertEqual('Error');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_3000
     * @tc.name testStreamReadablePipe030
     * @tc.desc Verify unpipe stops data after an earlier chunk was delivered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let w = new PipeWritableBase();
        let firstChunk: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.writeObserver = (): void => {
            firstChunk = util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array);
            r.unpipe(w);
            r.push("after_unpipe");
            r.push(null);
            resolve(undefined as void);
          };
          r.pipe(w);
          r.push("before_unpipe");
        });
        expect(w.writeCount).assertEqual(1);
        expect(firstChunk).assertEqual("before_unpipe");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_3100
     * @tc.name testStreamReadablePipe031
     * @tc.desc Verify repeated unpipe keeps a destination disconnected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new PipeWritableBase();
      r.pipe(w);
      r.unpipe(w);
      r.unpipe(w);
      r.push("after_unpipe");
      expect(w.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_3200
     * @tc.name testStreamReadablePipe032
     * @tc.desc Verify same readable source pipes to two different Writable destinations (broadcast/multicast mode)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new BroadcastReadable();
        let w1 = new PipeWritableBase();
        let w2 = new PipeWritableBase();
        r.pause();
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("end", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w1);
          r.pipe(w2);
          r.resume();
        });
        expect(w1.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w1.receivedChunks[0] as Uint8Array))
          .assertEqual("broadcast");
        expect(w2.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w2.receivedChunks[0] as Uint8Array))
          .assertEqual("broadcast");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_3300
     * @tc.name testStreamReadablePipe033
     * @tc.desc Verify same readable source pipes to same Writable twice (duplicate pipe)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new SingleChunkReadable();
      let w = new PipeWritableBase();
      let firstResult = r.pipe(w);
      try {
        let secondResult = r.pipe(w);
        expect(firstResult).assertEqual(w);
        expect(secondResult).assertEqual(w);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_3400
     * @tc.name testStreamReadablePipe034
     * @tc.desc Verify pipe, unpipe, and re-pipe to the same destination (full disconnect-reconnect cycle)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let w = new PipeWritableBase();
        r.pipe(w);
        r.unpipe(w);
        let reconnectedW = new PipeWritableBase();
        let reconnectedChunk: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          reconnectedW.writeObserver = (): void => {
            reconnectedChunk =
              util.TextDecoder.create("utf-8").decodeToString(reconnectedW.receivedChunks[0] as Uint8Array);
            r.push(null);
            resolve(undefined as void);
          };
          r.pipe(reconnectedW);
          r.resume();
          r.push("reconnected");
        });
        expect(reconnectedW.writeCount).assertEqual(1);
        expect(reconnectedChunk).assertEqual("reconnected");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_3500
     * @tc.name testStreamReadablePipe035
     * @tc.desc Verify manual end of writable destination after pipe (destination actively ends)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new PipeWritableBase();
      r.pipe(w);
      w.end();
      try {
        r.push("after_end");
        expect(w.writableEnded).assertTrue();
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_3600
     * @tc.name testStreamReadablePipe036
     * @tc.desc Verify readable source error event is delivered during pipe connection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ErrorThrowReadable();
        let w = new PipeWritableBase();
        r.on("data", (chunk: Object): void => {
        });
        let errorName: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("error", (err: Object): void => {
            errorName = (err as Error).name;
            resolve(undefined as void);
          });
          r.pipe(w);
          try {
            r.read();
          } catch (e) {
            expect(e.name).assertEqual('Error');
            resolve(undefined);
          }
        });
        expect(errorName).assertEqual('Error');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_3700
     * @tc.name testStreamReadablePipe037
     * @tc.desc Verify pipe remains valid after 10 consecutive fast pipe and unpipe switches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReconnectReadable();
        let w = new PipeWritableBase();
        for (let i: int = 0; i < 10; i++) {
          r.pipe(w);
          r.unpipe(w);
        }
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array))
          .assertEqual("reconnected");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_3800
     * @tc.name testStreamReadablePipe038
     * @tc.desc Verify pipe transmits an emoji Unicode character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new EmojiReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array)).assertEqual("😀");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_3900
     * @tc.name testStreamReadablePipe039
     * @tc.desc Verify pipe transmits emoji and CJK mixed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new MixedEmojiReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array))
          .assertEqual("😀测试");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_4000
     * @tc.name testStreamReadablePipe040
     * @tc.desc Verify pipe transmits zero-width space (U+200B)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ZeroWidthReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array))
          .assertEqual("​");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_4100
     * @tc.name testStreamReadablePipe041
     * @tc.desc Verify pipe transmits lone surrogate code point (U+DC04)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new SurrogateReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array)).assertEqual("�");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_4200
     * @tc.name testStreamReadablePipe042
     * @tc.desc Verify pipe transmits Unicode replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReplacementReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array)).assertEqual("�");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_4300
     * @tc.name testStreamReadablePipe043
     * @tc.desc Verify pipe transmits XSS script string (data only, not executed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new XssReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array))
          .assertEqual("<script>alert(1)</script>");

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_4400
     * @tc.name testStreamReadablePipe044
     * @tc.desc Verify pipe transmits a Japanese character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new JapaneseReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array))
          .assertEqual("テスト");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_4500
     * @tc.name testStreamReadablePipe045
     * @tc.desc Verify pipe transmits a Cyrillic character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new RussianReadable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect(util.TextDecoder.create("utf-8").decodeToString(w.receivedChunks[0] as Uint8Array))
          .assertEqual("тест");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_4600
     * @tc.name testStreamReadablePipe046
     * @tc.desc Verify pipe transmits all-zero byte Uint8Array (0x00*5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new AllZeroUint8Readable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect((w.receivedChunks[0] as Uint8Array)[0]).assertEqual(0x00);
        expect((w.receivedChunks[0] as Uint8Array).length).assertEqual(5);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_4700
     * @tc.name testStreamReadablePipe047
     * @tc.desc Verify pipe transmits all-max byte Uint8Array (0xFF*5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new AllMaxUint8Readable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect((w.receivedChunks[0] as Uint8Array)[0]).assertEqual(0xFF);
        expect((w.receivedChunks[0] as Uint8Array).length).assertEqual(5);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_4800
     * @tc.name testStreamReadablePipe048
     * @tc.desc Verify pipe transmits boundary byte mixed Uint8Array (0x00,0xFF,0x7F,0x80)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new MixedUint8Readable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect((w.receivedChunks[0] as Uint8Array)[0]).assertEqual(0x00);
        expect((w.receivedChunks[0] as Uint8Array)[1]).assertEqual(0xFF);
        expect((w.receivedChunks[0] as Uint8Array)[2]).assertEqual(0x7F);
        expect((w.receivedChunks[0] as Uint8Array)[3]).assertEqual(0x80);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_4900
     * @tc.name testStreamReadablePipe049
     * @tc.desc Verify pipe transmits CR+LF control character Uint8Array (0x0A, 0x0D)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new CrLfUint8Readable();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(w.writeCount).assertEqual(1);
        expect((w.receivedChunks[0] as Uint8Array)[0]).assertEqual(0x0A);
        expect((w.receivedChunks[0] as Uint8Array)[1]).assertEqual(0x0D);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_5000
     * @tc.name testStreamReadablePipe050
     * @tc.desc Verify setEncoding("gbk") decodes data while the source is piped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let w = new PipeWritableBase();
        let dataStr: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("data", (chunk: Object): void => {
            dataStr = chunk.toString();
            resolve(undefined as void);
          });
          r.pipe(w);
          r.setEncoding("gbk");
          r.push(new Uint8Array([0xB2, 0xE2, 0xCA, 0xD4, 0xB9, 0xA4, 0xB3, 0xCC, 0xCA, 0xA6]));
          r.push(null);
          r.resume();
        });
        expect(dataStr).assertEqual("测试工程师");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_5100
     * @tc.name testStreamReadablePipe051
     * @tc.desc Verify setEncoding("utf8") decodes data while the source is piped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let w = new PipeWritableBase();
        let dataStr: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("data", (chunk: Object): void => {
            dataStr = chunk.toString();
            resolve(undefined as void);
          });
          r.pipe(w);
          r.setEncoding("utf8");
          r.push("hello");
          r.push(null);
          r.resume();
        });
        expect(dataStr).assertEqual("hello");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_5200
     * @tc.name testStreamReadablePipe052
     * @tc.desc Verify pipe passes a non-Writable plain Object as destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      try {
        r.pipe({} as Object as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_5300
     * @tc.name testStreamReadablePipe053
     * @tc.desc Verify pipe passes string type as destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      try {
        r.pipe("not_a_writable" as Object as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_5400
     * @tc.name testStreamReadablePipe054
     * @tc.desc Verify pipe passes number type as destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      try {
        r.pipe(123 as Object as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_5500
     * @tc.name testStreamReadablePipe055
     * @tc.desc Verify pipe passes boolean type as destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      try {
        r.pipe(true as Object as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_5600
     * @tc.name testStreamReadablePipe056
     * @tc.desc Verify pipe(null): destination is null, cannot establish connection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      try {
        r.pipe(null as Object as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_5700
     * @tc.name testStreamReadablePipe057
     * @tc.desc Verify pipe(undefined): destination is undefined, cannot establish connection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      try {
        r.pipe(undefined as Object as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_5800
     * @tc.name testStreamReadablePipe058
     * @tc.desc Verify pipe reports missing doRead through the readable error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new NoDoReadReadable();
        let w = new PipeWritableBase();
        let errName: string = '';
        let errCode: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          r.on("error", (err: Object): void => {
            errName = (err as BusinessError).name;
            errCode = (err as BusinessError).code;
            resolve(undefined as void);
          });
          r.pipe(w);
        });
        expect(errName).assertEqual("BusinessError");
        expect(errCode).assertEqual(10200038);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_5900
     * @tc.name testStreamReadablePipe059
     * @tc.desc Verify pipe reports missing doWrite through the writable error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let w = new NoDoWriteWritable();
        let errName: string = '';
        let errCode: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("error", (err: Object): void => {
            errName = (err as BusinessError).name;
            errCode = (err as BusinessError).code;
            resolve(undefined as void);
          });
          r.pipe(w);
          r.push("data");
          r.push(null);
        });
        expect(errName).assertEqual("BusinessError");
        expect(errCode).assertEqual(10200035);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PIPE_6000
     * @tc.name testStreamReadablePipe060
     * @tc.desc Verify data is ignored when the piped writable has already ended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadablePipe060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let r = new ReadableTestBase();
        let w = new PipeWritableBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          w.on("finish", (): void => {
            resolve(undefined as void);
          });
          w.end();
          r.pipe(w);
          r.push("data");
          r.push(null);
        });
        expect(w.writeCount).assertEqual(0);
        expect(w.writableEnded).assertTrue();
        done();
      });
  });
}
