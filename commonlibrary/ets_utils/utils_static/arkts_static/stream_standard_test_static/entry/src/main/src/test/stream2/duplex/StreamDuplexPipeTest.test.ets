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
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class CollectWritable extends stream.Writable {
  public received: Object[] = [];
  public receivedText: string = '';
  public writeCount: int = 0;
  public writeObserved: Function = (): void => {
  };

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.received.push(chunk);
    if (typeof chunk == "string") {
      this.receivedText += chunk as string;
    } else {
      this.receivedText += util.TextDecoder.create(encoding).decodeToString(chunk as Uint8Array);
    }
    this.writeCount++;
    this.writeObserved.unsafeCall();
    callback.unsafeCall();
  }
}

export default function StreamDuplexPipeTest(): void {
  describe('StreamDuplexPipeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_0100
     * @tc.name testStreamDuplexPipe001
     * @tc.desc Verify pipe returns the destination Writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      let result: Object = ds.pipe(ws);
      expect(result).assertEqual(ws);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_0200
     * @tc.name testStreamDuplexPipe002
     * @tc.desc Verify pipe flows data from Duplex to Writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedCount: int = 0;
      let capturedData: Object = "" as Object;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws: CollectWritable = new CollectWritable();
        ws.writeObserved = (): void => {
          capturedCount = ws.writeCount;
          capturedData = ws.received[0];
          resolve(undefined as void);
        };
        ds.pipe(ws);
        ds.push("test");
        ds.push(null);
      });
      expect(capturedCount).assertEqual(1);
      let decoded: string = util.TextDecoder.create('utf-8').decodeToString(capturedData as Uint8Array);
      expect(decoded).assertEqual("test");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_0300
     * @tc.name testStreamDuplexPipe003
     * @tc.desc Verify pipe triggers downstream write on push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws: CollectWritable = new CollectWritable();
        ds.on("end", (): void => {
          capturedCount = ws.writeCount;
          resolve(undefined as void);
        });
        ds.pipe(ws);
        ds.push("a");
        ds.push("b");
        ds.push("c");
        ds.push(null);
      });
      expect(capturedCount).assertEqual(3);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_0400
     * @tc.name testStreamDuplexPipe004
     * @tc.desc Verify pipe then resume flows data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws: CollectWritable = new CollectWritable();
        ds.on("end", (): void => {
          capturedCount = ws.writeCount;
          resolve(undefined as void);
        });
        ds.pipe(ws);
        ds.pause();
        ds.push("paused");
        ds.resume();
        ds.push(null);
      });
      expect(capturedCount).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_0500
     * @tc.name testStreamDuplexPipe005
     * @tc.desc Verify pipe then pause pauses data flow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.pause();
      ds.push("test");
      expect(ws.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_0600
     * @tc.name testStreamDuplexPipe006
     * @tc.desc Verify pipe to null throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      try {
        ds.pipe(null as Object as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_0700
     * @tc.name testStreamDuplexPipe007
     * @tc.desc Verify pipe to undefined throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      try {
        ds.pipe(undefined as Object as stream.Writable);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_0800
     * @tc.name testStreamDuplexPipe008
     * @tc.desc Verify pipe multiple times to same Writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      let first: Object = ds.pipe(ws);
      let second: Object = ds.pipe(ws);
      expect(first).assertEqual(ws);
      expect(second).assertEqual(ws);
      ds.unpipe(ws);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_0900
     * @tc.name testStreamDuplexPipe009
     * @tc.desc Verify pipe to multiple Writables (multi-branch)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured1: int = 0;
      let captured2: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws1: CollectWritable = new CollectWritable();
        let ws2: CollectWritable = new CollectWritable();
        ds.on("end", (): void => {
          captured1 = ws1.writeCount;
          captured2 = ws2.writeCount;
          resolve(undefined as void);
        });
        ds.pipe(ws1);
        ds.pipe(ws2);
        ds.push("test");
        ds.push(null);
      });
      expect(captured1).assertEqual(1);
      expect(captured2).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_1000
     * @tc.name testStreamDuplexPipe010
     * @tc.desc Verify a piped destination stops receiving only after the pipe is removed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let textWhilePiped: string = "";
      let countWhilePiped: int = 0;
      let countAfterUnpipe: int = -1;
      let textAfterUnpipe: string = "";
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws: CollectWritable = new CollectWritable();
        ws.writeObserved = (): void => {
          textWhilePiped = ws.receivedText;
          countWhilePiped = ws.writeCount;
          ds.unpipe(ws);
          ds.push("dropped");
          countAfterUnpipe = ws.writeCount;
          textAfterUnpipe = ws.receivedText;
          resolve(undefined as void);
        };
        ds.pipe(ws);
        ds.push("piped");
      });
      expect(textWhilePiped).assertEqual("piped");
      expect(countAfterUnpipe).assertEqual(countWhilePiped);
      expect(textAfterUnpipe).assertEqual("piped");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_1100
     * @tc.name testStreamDuplexPipe011
     * @tc.desc Verify pipe options parameter reserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      let result: Object = ds.pipe(ws, {} as Object);
      expect(result).assertEqual(ws);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_1200
     * @tc.name testStreamDuplexPipe012
     * @tc.desc Verify pipe leaves readable, isPaused, readableFlowing and all readable* properties in flowing-mode defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      expect(ds.readableLength).assertEqual(0);
      expect(ds.isPaused()).assertFalse();
      expect(ds.readableFlowing).assertTrue();
      expect(ds.readable).assertTrue();
      expect(ds.readableHighWatermark).assertEqual(16384);
      expect(ds.readableObjectMode).assertFalse();
      expect(ds.readableEncoding).assertEqual(null);
      expect(ds.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_1300
     * @tc.name testStreamDuplexPipe013
     * @tc.desc Verify pipe does not affect writable* properties, writable stays true and writableLength stays zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      expect(ds.writable).assertTrue();
      expect(ds.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_1400
     * @tc.name testStreamDuplexPipe014
     * @tc.desc Verify pipe stream still can read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.pause();
      ds.push("test");
      let data = ds.read();
      expect(data?.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_1500
     * @tc.name testStreamDuplexPipe015
     * @tc.desc Verify pipe stream still can push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      let r: boolean = ds.push("test");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_1600
     * @tc.name testStreamDuplexPipe016
     * @tc.desc Verify pipe stream still can write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      let r: boolean = ds.write("test");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_1700
     * @tc.name testStreamDuplexPipe017
     * @tc.desc Verify pipe stream still can end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.end();
      expect(ds.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_1800
     * @tc.name testStreamDuplexPipe018
     * @tc.desc Verify pipe stream still can cork/uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.cork();
      expect(ds.writableCorked).assertEqual(1);
      ds.uncork();
      expect(ds.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_1900
     * @tc.name testStreamDuplexPipe019
     * @tc.desc Verify pipe stream still can setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      let r: boolean = ds.setEncoding("utf8");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_2000
     * @tc.name testStreamDuplexPipe020
     * @tc.desc Verify pipe stream still can setDefaultEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      let r: boolean = ds.setDefaultEncoding("utf8");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_2100
     * @tc.name testStreamDuplexPipe021
     * @tc.desc Verify pipe CollectWritable received correct data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedText: string = "";
      let capturedCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws: CollectWritable = new CollectWritable();
        ws.writeObserved = (): void => {
          if (ws.receivedText == "helloworld") {
            capturedText = ws.receivedText;
            capturedCount = ws.writeCount;
            resolve(undefined as void);
          }
        };
        ds.pipe(ws);
        ds.push("hello");
        ds.push("world");
        ds.push(null);
      });
      expect(capturedText).assertEqual("helloworld");
      expect(capturedCount).assertEqual(2);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_2200
     * @tc.name testStreamDuplexPipe022
     * @tc.desc Verify pipe multiple push triggers multiple downstream write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws: CollectWritable = new CollectWritable();
        ds.on("end", (): void => {
          capturedCount = ws.writeCount;
          resolve(undefined as void);
        });
        ds.pipe(ws);
        for (let i: int = 0; i < 10; i++) {
          ds.push("x");
        }
        ds.push(null);
      });
      expect(capturedCount).assertEqual(10);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_2300
     * @tc.name testStreamDuplexPipe023
     * @tc.desc Verify pipe with large chunk (>highWaterMark)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws: CollectWritable = new CollectWritable();
        ds.on("end", (): void => {
          capturedCount = ws.writeCount;
          resolve(undefined as void);
        });
        ds.pipe(ws);
        ds.push(new Uint8Array(1024));
        ds.push(null);
      });
      expect(capturedCount).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_2400
     * @tc.name testStreamDuplexPipe024
     * @tc.desc Verify pipe stream readableLength is 0 in flowing mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedLength: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws: CollectWritable = new CollectWritable();
        ds.on("end", (): void => {
          capturedLength = ds.readableLength;
          resolve(undefined as void);
        });
        ds.pipe(ws);
        ds.push("test");
        ds.push(null);
      });
      expect(capturedLength).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_2500
     * @tc.name testStreamDuplexPipe025
     * @tc.desc Verify pipe with Uint8Array chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws: CollectWritable = new CollectWritable();
        ds.on("end", (): void => {
          capturedCount = ws.writeCount;
          resolve(undefined as void);
        });
        ds.pipe(ws);
        ds.push(new Uint8Array([1, 2, 3]));
        ds.push(null);
      });
      expect(capturedCount).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_2600
     * @tc.name testStreamDuplexPipe026
     * @tc.desc Verify pipe with emoji chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws: CollectWritable = new CollectWritable();
        ds.on("end", (): void => {
          capturedCount = ws.writeCount;
          resolve(undefined as void);
        });
        ds.pipe(ws);
        ds.push("😀");
        ds.push(null);
      });
      expect(capturedCount).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_2700
     * @tc.name testStreamDuplexPipe027
     * @tc.desc Verify pipe with empty string does not trigger downstream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.push("");
      expect(ws.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PIPE_2800
     * @tc.name testStreamDuplexPipe028
     * @tc.desc Verify pipe then unpipe then re-pipe works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPipe028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws: CollectWritable = new CollectWritable();
        ws.writeObserved = (): void => {
          capturedCount = ws.writeCount;
          resolve(undefined as void);
        };
        ds.pipe(ws);
        ds.unpipe(ws);
        ds.pipe(ws);
        ds.push("test");
        ds.push(null);
      });
      expect(capturedCount).assertEqual(1);
      done();
    });
  });
}
