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

class UncorkBase extends stream.Writable {
  public writeCalled: boolean = false;
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCalled = true;
    this.writeCount++;
    callback.unsafeCall();
  }
}

class UncorkDoWriteVBase extends stream.Writable {
  public writevCalled: boolean = false;
  public chunksCount: number = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writevCalled = false;
    callback.unsafeCall();
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    this.writevCalled = true;
    this.chunksCount = chunks.length;
    callback.unsafeCall();
  }
}

class DuplexUncork extends stream.Duplex {
  public writeCalled: boolean = false;

  constructor() {
    super();
  }

  doRead(): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCalled = true;
    callback.unsafeCall();
  }
}

export default function StreamWritableUncorkTest(): void {
  describe('StreamWritableUncorkTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_0100
     * @tc.name testStreamWritableUncork001
     * @tc.desc Verify single cork then uncork flushes a buffered binary write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      ws.cork();
      ws.write(new Uint8Array([0x64, 0x61, 0x74, 0x61]));
      let r = ws.uncork();
      expect(r).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writeCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_0200
     * @tc.name testStreamWritableUncork002
     * @tc.desc Verify cork nested x2 then uncork x2 pairs to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      ws.cork();
      ws.cork();
      let r1 = ws.uncork();
      expect(r1).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
      let r2 = ws.uncork();
      expect(r2).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_0300
     * @tc.name testStreamWritableUncork003
     * @tc.desc Verify write data in corked state then uncork triggers batch flush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkDoWriteVBase();
      ws.cork();
      ws.write("a");
      ws.write("b");
      let r = ws.uncork();
      expect(r).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writevCalled).assertTrue();
      expect(ws.chunksCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_0400
     * @tc.name testStreamWritableUncork004
     * @tc.desc Verify cork increments 3 times then uncork decrements one by one to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_0500
     * @tc.name testStreamWritableUncork005
     * @tc.desc Verify cork x3 then uncork x2 not yet zero does not flush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      ws.cork();
      ws.cork();
      ws.cork();
      ws.write("x");
      ws.write("y");
      ws.uncork();
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.writeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_0600
     * @tc.name testStreamWritableUncork006
     * @tc.desc Verify corked state prevents drain before uncork returns to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      ws.cork();
      ws.cork();
      let bigData: string = 'x'.repeat(20001);
      ws.write(bigData);
      let drainFired: boolean = false;
      ws.on('drain', (): void => {
        drainFired = true;
      });
      let r = ws.uncork();
      expect(r).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
      expect(drainFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_0700
     * @tc.name testStreamWritableUncork007
     * @tc.desc Verify uncork does not change writable property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      ws.cork();
      let r = ws.uncork();
      expect(r).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_0800
     * @tc.name testStreamWritableUncork008
     * @tc.desc Verify uncork on Duplex subclass inherits Writable behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexUncork();
      ws.cork();
      ws.write("x");
      let r = ws.uncork();
      expect(r).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_0900
     * @tc.name testStreamWritableUncork009
     * @tc.desc Verify single uncork with buffered data leaves one nested cork level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      ws.cork();
      ws.cork();
      ws.write("data");
      let r = ws.uncork();
      expect(r).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.writeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_1000
     * @tc.name testStreamWritableUncork010
     * @tc.desc Verify 5 and 100 nested cork calls are fully released by the same number of uncork calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counts: int[] = [5, 100];
      for (let n = 0; n < counts.length; n++) {
        let ws = new UncorkBase();
        for (let i: number = 0; i < counts[n]; i++) {
          ws.cork();
        }
        expect(ws.writableCorked).assertEqual(counts[n]);
        for (let i: number = 0; i < counts[n]; i++) {
          let r = ws.uncork();
          expect(r).assertTrue();
        }
        expect(ws.writableCorked).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_1100
     * @tc.name testStreamWritableUncork011
     * @tc.desc Verify uncork flushes buffered data that exceeds the default high water mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      ws.cork();
      let data: string = 'a'.repeat(16001);
      ws.write(data);
      ws.write(data);
      let r = ws.uncork();
      expect(r).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_1200
     * @tc.name testStreamWritableUncork012
     * @tc.desc Verify cork+write large data (10KB)+uncork fully flushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      ws.cork();
      ws.write(new Uint8Array(10240));
      let r = ws.uncork();
      expect(r).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_1300
     * @tc.name testStreamWritableUncork013
     * @tc.desc Verify uncork to zero triggers drain event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new UncorkBase();
        ws.cork();
        let bigData: string = 'x'.repeat(20001);
        ws.write(bigData);
        let drainFired: boolean = false;
        let capturedLength: int = -1;
        let drainPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('drain', (): void => {
            drainFired = true;
            capturedLength = ws.writableLength;
            resolve(undefined as void);
          });
        });
        let r = ws.uncork();
        expect(r).assertTrue();
        expect(ws.writableCorked).assertEqual(0);
        await drainPromise;
        expect(capturedLength).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_1400
     * @tc.name testStreamWritableUncork014
     * @tc.desc Verify cork+write Chinese data+gbk encoding+uncork flushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      ws.cork();
      ws.write("测试工程师", "gbk");
      let r = ws.uncork();
      expect(r).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_1500
     * @tc.name testStreamWritableUncork015
     * @tc.desc Verify uncork releases buffered emoji, XSS and embedded-null writes and resets writableCorked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['😀测试🔥', '<script>alert(1)</script>', 'data\x00null'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new UncorkBase();
        ws.cork();
        ws.write(chunks[i]);
        let r = ws.uncork();
        expect(r).assertTrue();
        expect(ws.writableCorked).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_1600
     * @tc.name testStreamWritableUncork016
     * @tc.desc Verify cork without write then uncork resets writableCorked to zero without invoking doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      ws.cork();
      let r = ws.uncork();
      expect(r).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_1700
     * @tc.name testStreamWritableUncork017
     * @tc.desc Verify one uncork releases one empty nested cork level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      ws.cork();
      ws.cork();
      let r = ws.uncork();
      expect(r).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_1800
     * @tc.name testStreamWritableUncork018
     * @tc.desc Verify uncork flushes a buffered Uint8Array write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      ws.cork();
      ws.write(new Uint8Array([0x78, 0x79]));
      let r = ws.uncork();
      expect(r).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writeCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_1900
     * @tc.name testStreamWritableUncork019
     * @tc.desc Verify uncork without prior cork is accepted and leaves the count at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      let r0 = ws.uncork();
      expect(r0).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
      ws.write("direct");
      expect(ws.writeCalled).assertTrue();
      ws.cork();
      ws.write("buffered");
      expect(ws.writableCorked).assertEqual(1);
      let r1 = ws.uncork();
      expect(r1).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_2000
     * @tc.name testStreamWritableUncork020
     * @tc.desc Verify uncork after end is accepted and leaves the count at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      ws.cork();
      ws.end();
      let result = ws.uncork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_UNCORK_2100
     * @tc.name testStreamWritableUncork021
     * @tc.desc Verify repeated uncork at zero remains accepted and leaves the count at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableUncork021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new UncorkBase();
      let first = ws.uncork();
      let second = ws.uncork();
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

  });
}
