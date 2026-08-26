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

class DuplexNoWriteCounts extends stream.Duplex {
  public writeCount: int = 0;
  public writevCount: int = 0;

  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
    callback.unsafeCall();
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    this.writevCount++;
    callback.unsafeCall();
  }
}

class DuplexDoWriteOnly extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class DuplexBothWriteAndWritev extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamDuplexUncorkTest(): void {
  describe('StreamDuplexUncorkTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_0100
     * @tc.name testStreamDuplexUncork001
     * @tc.desc Verify cork nested x2 then uncork x2 paired reset to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.cork();
      expect(ws.writableCorked).assertEqual(2);
      let r1 = ws.uncork();
      expect(r1).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
      let r2 = ws.uncork();
      expect(r2).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_0200
     * @tc.name testStreamDuplexUncork002
     * @tc.desc Verify multiple chunks written under cork then uncork triggers doWritev batch flush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.write("a");
      ws.write("b");
      ws.write("c");
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_0300
     * @tc.name testStreamDuplexUncork003
     * @tc.desc Verify cork increment 3 times then uncork gradually decrements to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.cork();
      ws.cork();
      expect(ws.writableCorked).assertEqual(3);
      let r1 = ws.uncork();
      expect(r1).assertTrue();
      expect(ws.writableCorked).assertEqual(2);
      let r2 = ws.uncork();
      expect(r2).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
      let r3 = ws.uncork();
      expect(r3).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_0400
     * @tc.name testStreamDuplexUncork004
     * @tc.desc Verify nested cork then partial uncork only decrements writableCorked without full reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let corkCounts: number[] = [3, 2];
      let uncorkCounts: number[] = [2, 1];
      for (let i = 0; i < corkCounts.length; i++) {
        let ws = new DuplexTestBase();
        for (let c = 0; c < corkCounts[i]; c++) {
          ws.cork();
        }
        expect(ws.writableCorked).assertEqual(corkCounts[i]);
        for (let u = 0; u < uncorkCounts[i]; u++) {
          let result = ws.uncork();
          expect(result).assertTrue();
        }
        expect(ws.writableCorked).assertEqual(corkCounts[i] - uncorkCounts[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_0500
     * @tc.name testStreamDuplexUncork005
     * @tc.desc Verify cork state prevents drain event before uncork fully resets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.cork();
      ws.write("data");
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_0600
     * @tc.name testStreamDuplexUncork006
     * @tc.desc Verify single cork then uncork returns true, resets writableCorked to zero, flushes data and preserves writable stream properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.write("x");
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writableEnded).assertFalse();
      expect(ws.writable).assertTrue();
      expect(ws.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_0700
     * @tc.name testStreamDuplexUncork007
     * @tc.desc Verify Duplex with only doWrite, uncork triggers doWrite (not doWritev)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexDoWriteOnly();
      ws.cork();
      ws.write("x");
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_0800
     * @tc.name testStreamDuplexUncork008
     * @tc.desc Verify Duplex with both doWrite and doWritev, uncork prefers doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexBothWriteAndWritev();
      ws.cork();
      ws.write("a");
      ws.write("b");
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_0900
     * @tc.name testStreamDuplexUncork009
     * @tc.desc Verify uncorking the writable side does not discard readable data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.write("x");
      ws.pause();
      ws.push("read");
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.read()?.toString()).assertEqual("read");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_1000
     * @tc.name testStreamDuplexUncork010
     * @tc.desc Verify corked=1 without prior write, uncork resets to zero and returns true, no write callback triggered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_1100
     * @tc.name testStreamDuplexUncork011
     * @tc.desc Verify 5 and 100 nested cork calls are fully released by the same number of uncork calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counts: int[] = [5, 100];
      for (let n = 0; n < counts.length; n++) {
        let ws = new DuplexTestBase();
        for (let i = 0; i < counts[n]; i++) {
          ws.cork();
        }
        expect(ws.writableCorked).assertEqual(counts[n]);
        for (let i = 0; i < counts[n]; i++) {
          let r = ws.uncork();
          expect(r).assertTrue();
        }
        expect(ws.writableCorked).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_1200
     * @tc.name testStreamDuplexUncork012
     * @tc.desc Verify consecutive uncork calls are successful no-ops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      for (let i = 0; i < 5; i++) {
        let r = ws.uncork();
        expect(r).assertTrue();
      }
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_1300
     * @tc.name testStreamDuplexUncork013
     * @tc.desc Verify uncork flushes buffered binary data that exceeds the default high water mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.write(new Uint8Array(16000));
      ws.write(new Uint8Array(16000));
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_1400
     * @tc.name testStreamDuplexUncork014
     * @tc.desc Verify uncork after end is a successful no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.end();
      let result = ws.uncork();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_1500
     * @tc.name testStreamDuplexUncork015
     * @tc.desc Verify uncork after end (auto-resets corked) is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.end();
      let result = ws.uncork();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_1600
     * @tc.name testStreamDuplexUncork016
     * @tc.desc Verify cork + write large data (10KB) + uncork fully flushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.write(new Uint8Array(10240));
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_1700
     * @tc.name testStreamDuplexUncork017
     * @tc.desc Verify cork + multiple writes (string+Uint8Array) + uncork triggers doWritev merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexBothWriteAndWritev();
      ws.cork();
      ws.write("a", "utf8");
      ws.write(new Uint8Array([0, 1, 2]));
      ws.write("c", "utf8");
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_1800
     * @tc.name testStreamDuplexUncork018
     * @tc.desc Verify uncork resets to zero triggers drain event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      let drainCalled = false;
      ws.on("drain", (): void => {
        drainCalled = true;
      });
      ws.write(new Uint8Array(16384));
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_1900
     * @tc.name testStreamDuplexUncork019
     * @tc.desc Verify cork nested x2 then end() force resets, uncork is successful
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.cork();
      expect(ws.writableCorked).assertEqual(2);
      ws.end();
      let result = ws.uncork();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_2000
     * @tc.name testStreamDuplexUncork020
     * @tc.desc Verify cork/uncork and read side doRead proceed simultaneously without interference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.write("write_data");
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      ws.push("read_data");
      expect(ws.read()?.toString()).assertEqual("read_data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_2100
     * @tc.name testStreamDuplexUncork021
     * @tc.desc Verify cork + write Chinese data with gbk encoding + uncork flushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.write("测试工程师", "gbk");
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_2200
     * @tc.name testStreamDuplexUncork022
     * @tc.desc Verify uncork releases buffered emoji, XSS and embedded-null writes and resets writableCorked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['😀测试🔥', '<script>alert(1)</script>', 'data\x00null'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new DuplexTestBase();
        ws.cork();
        ws.write(chunks[i]);
        let result = ws.uncork();
        expect(result).assertTrue();
        expect(ws.writableCorked).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_2300
     * @tc.name testStreamDuplexUncork023
     * @tc.desc Verify cork + multiple writes with different encodings + uncork preserves encoding per chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexBothWriteAndWritev();
      ws.cork();
      ws.write("hello", "utf8");
      ws.write("测试", "gbk");
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_2400
     * @tc.name testStreamDuplexUncork024
     * @tc.desc Verify cork without write then uncork only resets counter (does not trigger doWrite/doWritev)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexNoWriteCounts();
      ws.cork();
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writeCount).assertEqual(0);
      expect(ws.writevCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_2500
     * @tc.name testStreamDuplexUncork025
     * @tc.desc Verify uncorking an empty cork preserves writable state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writable).assertTrue();
      expect(ws.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_2600
     * @tc.name testStreamDuplexUncork026
     * @tc.desc Verify a write after uncork starts with no corked state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      let result = ws.uncork();
      let writeResult = ws.write("after");
      expect(result).assertTrue();
      expect(writeResult).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_2700
     * @tc.name testStreamDuplexUncork027
     * @tc.desc Verify a second uncork after a complete flush is a successful no-op and leaves writable state stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.write("x");
      ws.uncork();
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writableEnded).assertFalse();
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_2800
     * @tc.name testStreamDuplexUncork028
     * @tc.desc Verify uncork remains successful after a second cork cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.write("x");
      ws.uncork();
      ws.cork();
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_2900
     * @tc.name testStreamDuplexUncork029
     * @tc.desc Verify uncork remains successful after repeated cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      ws.write("x");
      ws.uncork();
      ws.cork();
      ws.cork();
      ws.uncork();
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNCORK_3000
     * @tc.name testStreamDuplexUncork030
     * @tc.desc Verify uncork flushes a Uint8Array batch and clears the cork count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUncork030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexBothWriteAndWritev();
      ws.cork();
      ws.write(new Uint8Array([65, 66]), 'utf8');
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });
  });
}
