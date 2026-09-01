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
  public writeCount: int = 0;
  public writeObserved: Function = (): void => {
  };

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.received.push(chunk);
    this.writeCount++;
    this.writeObserved.unsafeCall();
    callback.unsafeCall();
  }
}

export default function StreamDuplexUnpipeTest(): void {
  describe('StreamDuplexUnpipeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_0100
     * @tc.name testStreamDuplexUnpipe001
     * @tc.desc Verify unpipe unconnected Writable has no side effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      try {
        expect(ds.unpipe(ws)).assertEqual(ds);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_0200
     * @tc.name testStreamDuplexUnpipe002
     * @tc.desc Verify unpipe rejects a null destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let errorName: string = '';
      try {
        ds.unpipe(null as Object as stream.Writable);
      } catch (e) {
        errorName = e.name;
      }
      expect(errorName).assertEqual('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_0300
     * @tc.name testStreamDuplexUnpipe003
     * @tc.desc Verify unpipe undefined has no side effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let result: Object = ds.unpipe();
      expect(result).assertEqual(ds);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_0400
     * @tc.name testStreamDuplexUnpipe004
     * @tc.desc Verify unpipe returns the Duplex instance itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      let result: Object = ds.unpipe(ws);
      expect(result).assertEqual(ds);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_0500
     * @tc.name testStreamDuplexUnpipe005
     * @tc.desc Verify unpipe then push does not trigger downstream write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.unpipe(ws);
      ds.push("test");
      expect(ws.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_0600
     * @tc.name testStreamDuplexUnpipe006
     * @tc.desc Verify unpipe stream still can read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.unpipe(ws);
      ds.pause();
      ds.push("test");
      let data = ds.read();
      expect(data?.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_0700
     * @tc.name testStreamDuplexUnpipe007
     * @tc.desc Verify unpipe stream still can push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.unpipe(ws);
      let r: boolean = ds.push("test");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_0800
     * @tc.name testStreamDuplexUnpipe008
     * @tc.desc Verify unpipe stream still can write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.unpipe(ws);
      let r: boolean = ds.write("test");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_0900
     * @tc.name testStreamDuplexUnpipe009
     * @tc.desc Verify unpipe stream still can setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.unpipe(ws);
      let r: boolean = ds.setEncoding("utf8");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_1000
     * @tc.name testStreamDuplexUnpipe010
     * @tc.desc Verify unpipe stream still can setDefaultEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.unpipe(ws);
      let r: boolean = ds.setDefaultEncoding("utf8");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_1100
     * @tc.name testStreamDuplexUnpipe011
     * @tc.desc Verify unpipe stream still can end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.unpipe(ws);
      ds.end();
      expect(ds.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_1200
     * @tc.name testStreamDuplexUnpipe012
     * @tc.desc Verify unpipe stream still can cork/uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.unpipe(ws);
      ds.cork();
      expect(ds.writableCorked).assertEqual(1);
      ds.uncork();
      expect(ds.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_1300
     * @tc.name testStreamDuplexUnpipe013
     * @tc.desc Verify unpipe all via no-arg unpipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws1: CollectWritable = new CollectWritable();
      let ws2: CollectWritable = new CollectWritable();
      let ws3: CollectWritable = new CollectWritable();
      ds.pipe(ws1);
      ds.pipe(ws2);
      ds.pipe(ws3);
      ds.unpipe();
      ds.push("test");
      expect(ws1.writeCount).assertEqual(0);
      expect(ws2.writeCount).assertEqual(0);
      expect(ws3.writeCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_1400
     * @tc.name testStreamDuplexUnpipe014
     * @tc.desc Verify unpipe leaves readable, writable and all readable* properties unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.unpipe(ws);
      expect(ds.readable).assertTrue();
      expect(ds.writable).assertTrue();
      expect(ds.readableLength).assertEqual(0);
      expect(ds.readableFlowing).assertFalse();
      expect(ds.readableHighWatermark).assertEqual(16384);
      expect(ds.readableObjectMode).assertFalse();
      expect(ds.readableEncoding).assertEqual(null);
      expect(ds.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_1500
     * @tc.name testStreamDuplexUnpipe015
     * @tc.desc Verify unpipe stream isPaused unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.unpipe(ws);
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_1600
     * @tc.name testStreamDuplexUnpipe016
     * @tc.desc Verify unpipe then re-pipe to new Writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ws1WriteCount: int = 0;
      let ws2WriteCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws1: CollectWritable = new CollectWritable();
        let ws2: CollectWritable = new CollectWritable();
        ws2.writeObserved = (): void => {
          ws1WriteCount = ws1.writeCount;
          ws2WriteCount = ws2.writeCount;
          resolve(undefined as void);
        };
        ds.pipe(ws1);
        ds.unpipe(ws1);
        ds.pipe(ws2);
        ds.push("test");
        ds.push(null);
      });
      expect(ws1WriteCount).assertEqual(0);
      expect(ws2WriteCount).assertEqual(1);

      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_1700
     * @tc.name testStreamDuplexUnpipe017
     * @tc.desc Verify unpipe stream still can doRead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.unpipe(ws);
      ds.pause();
      expect(ds.read()).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_1800
     * @tc.name testStreamDuplexUnpipe018
     * @tc.desc Verify unpipe after end still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.end();
      try {
        expect(ds.unpipe(ws)).assertEqual(ds);
      } catch (e) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_UNPIPE_1900
     * @tc.name testStreamDuplexUnpipe019
     * @tc.desc Verify unpipe after stream ended (push null) still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexUnpipe019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.push(null);
      try {
        expect(ds.unpipe(ws)).assertEqual(ds);
      } catch (e) {
        expect().assertFail();
      }
    });
  });
}
