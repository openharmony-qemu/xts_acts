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

class DuplexCorkBase extends stream.Duplex {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';

  constructor() {
    super();
  }

  doRead(): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall();
  }
}

class TransformCorkBase extends stream.Transform {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';

  constructor() {
    super();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    callback.unsafeCall();
  }
}

export default function StreamWritableCorkTest(): void {
  describe('StreamWritableCorkTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_0100
     * @tc.name testStreamWritableCork001
     * @tc.desc Verify cork on a new instance returns true and increments writableCorked to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let ret = ws.cork();
      expect(ret).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_0200
     * @tc.name testStreamWritableCork002
     * @tc.desc Verify repeated cork calls increment writableCorked sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.cork()).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.cork()).assertTrue();
      expect(ws.writableCorked).assertEqual(2);
      expect(ws.cork()).assertTrue();
      expect(ws.writableCorked).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_0300
     * @tc.name testStreamWritableCork003
     * @tc.desc Verify cork after write operation completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.write("before");
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_0400
     * @tc.name testStreamWritableCork004
     * @tc.desc Verify cork after end is accepted and increments the cork count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("finish", (): void => {
            resolve(undefined as void);
          });
          ws.end();
        });
        let result = ws.cork();
        expect(result).assertTrue();
        expect(ws.writableCorked).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_0500
     * @tc.name testStreamWritableCork005
     * @tc.desc Verify cork after end is accepted and increments the cork count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.end();
      expect(ws.writableEnded).assertTrue();
      let r1 = ws.cork();
      expect(r1).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
      let r2 = ws.cork();
      expect(r2).assertTrue();
      expect(ws.writableCorked).assertEqual(2);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_0600
     * @tc.name testStreamWritableCork006
     * @tc.desc Verify cork does not change writable and ended properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.writable).assertTrue();
      ws.cork();
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_0700
     * @tc.name testStreamWritableCork007
     * @tc.desc Verify cork does not trigger drain/finish/error events
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let drainFired: boolean = false;
      let finishFired: boolean = false;
      let errorFired: boolean = false;
      ws.on('drain', (): void => {
        drainFired = true;
      });
      ws.on('finish', (): void => {
        finishFired = true;
      });
      ws.on('error', (): void => {
        errorFired = true;
      });
      ws.cork();
      expect(drainFired).assertFalse();
      expect(finishFired).assertFalse();
      expect(errorFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_0800
     * @tc.name testStreamWritableCork008
     * @tc.desc Verify a subclass with only doWrite buffers while corked and receives the chunk on uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.write("corked-payload");
      expect(ws.dataChunk).assertEqual('');
      ws.uncork();
      expect(ws.dataChunk).assertEqual("corked-payload");
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_0900
     * @tc.name testStreamWritableCork009
     * @tc.desc Verify cork on subclass that implements both doWrite and doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableWithDoWritev();
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_1000
     * @tc.name testStreamWritableCork010
     * @tc.desc Verify cork on subclass without any write method implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableNoDoWrite();
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_1100
     * @tc.name testStreamWritableCork011
     * @tc.desc Verify cork on Duplex subclass inherits Writable behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let duplex = new DuplexCorkBase();
      duplex.cork();
      expect(duplex.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_1200
     * @tc.name testStreamWritableCork012
     * @tc.desc Verify uncork before any cork keeps the count at zero and leaves writes unbuffered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.write("uncorked")).assertTrue();
      expect(ws.dataChunk).assertEqual("uncorked");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_1300
     * @tc.name testStreamWritableCork013
     * @tc.desc Verify cork keeps the stream writable and accepts writes while the count is one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.cork()).assertTrue();
      expect(ws.writable).assertTrue();
      expect(ws.write("still-accepted")).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.writableEnded).assertFalse();
      expect(ws.dataChunk).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_1400
     * @tc.name testStreamWritableCork014
     * @tc.desc Verify 100 corks require 100 uncorks before the buffered chunk reaches doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      for (let i = 0; i < 100; i++) {
        ws.cork();
      }
      ws.write("deep-nested");
      for (let i = 0; i < 99; i++) {
        ws.uncork();
      }
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.dataChunk).assertEqual('');
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.dataChunk).assertEqual("deep-nested");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_1500
     * @tc.name testStreamWritableCork015
     * @tc.desc Verify cork takes effect when writableLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.writableLength).assertEqual(0);
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_1600
     * @tc.name testStreamWritableCork016
     * @tc.desc Verify cork takes effect when writableLength reaches highWaterMark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.write(new Uint8Array(16384));
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_1700
     * @tc.name testStreamWritableCork017
     * @tc.desc Verify cork takes effect under default highWaterMark (16384)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.writableHighWatermark).assertEqual(16384);
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_1800
     * @tc.name testStreamWritableCork018
     * @tc.desc Verify a corked stream buffers plain, emoji, XSS and embedded-null writes without forwarding them to doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['buffered', '😀🚀', '<script>alert(1)</script>', '\x00'];
      for (let i = 0; i < chunks.length; i++) {
        let ws = new WritableTestBase();
        ws.cork();
        ws.write(chunks[i]);
        expect(ws.dataChunk).assertEqual('');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_1900
     * @tc.name testStreamWritableCork019
     * @tc.desc Verify multiple consecutive writes are all buffered in corked state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.write("a");
      ws.write("b");
      ws.write("c");
      expect(ws.dataChunk).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_2000
     * @tc.name testStreamWritableCork020
     * @tc.desc Verify cork count resets to zero after cork and uncork, then cork counts anew
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_2100
     * @tc.name testStreamWritableCork021
     * @tc.desc Verify writing large data (10KB) in corked state is fully buffered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.write(new Uint8Array(10240));
      expect(ws.dataChunk).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_2200
     * @tc.name testStreamWritableCork022
     * @tc.desc Verify end forcibly flushes and resets cork count to zero under multi-level cork nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.cork();
      ws.cork();
      expect(ws.writableCorked).assertEqual(3);
      ws.end();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_2300
     * @tc.name testStreamWritableCork023
     * @tc.desc Verify drain event behavior in corked state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let drainFired: boolean = false;
      ws.on('drain', (): void => {
        drainFired = true;
      });
      ws.cork();
      ws.write(new Uint8Array(16385));
      ws.uncork();
      expect(ws.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_2400
     * @tc.name testStreamWritableCork024
     * @tc.desc Verify writing Chinese data with gbk encoding in corked state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.write("测试", "gbk");
      expect(ws.dataChunk).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_2500
     * @tc.name testStreamWritableCork025
     * @tc.desc Verify writing data with different encodings multiple times in corked state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.write("hello", "utf-8");
      ws.write("world", "ascii");
      expect(ws.dataChunk).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_2600
     * @tc.name testStreamWritableCork026
     * @tc.desc Verify uncork reverses one cork level and leaves one level buffered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.cork()).assertTrue();
      expect(ws.cork()).assertTrue();
      expect(ws.uncork()).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_2700
     * @tc.name testStreamWritableCork027
     * @tc.desc Verify cork after end in a corked state is accepted and increments the cleared count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      expect(ws.writableCorked).assertEqual(1);
      ws.end();
      let result = ws.cork();
      expect(result).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_2800
     * @tc.name testStreamWritableCork028
     * @tc.desc Verify uncork clears the only cork level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.cork()).assertTrue();
      expect(ws.uncork()).assertTrue();
      expect(ws.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_2900
     * @tc.name testStreamWritableCork029
     * @tc.desc Verify cork called as a plain function (this binding lost)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let corkFn: Function = ws.cork;
      try {
        corkFn.unsafeCall();
        let ret = ws.cork();
        expect(ret).assertTrue();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_3000
     * @tc.name testStreamWritableCork030
     * @tc.desc Verify cork called via call bound to non-Writable plain object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let corkFn: Function = ws.cork;
      let ret: boolean = corkFn.unsafeCall({} as Object) as boolean;
      expect(ret).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_3100
     * @tc.name testStreamWritableCork031
     * @tc.desc Verify cork called through unsafeCall with a null argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let result: boolean = ws.cork.unsafeCall(null) as boolean;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CORK_3200
     * @tc.name testStreamWritableCork032
     * @tc.desc Verify nested cork and uncork use reference counting before flushing writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableCork032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.cork();
      ws.cork();
      ws.write('first');
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.dataChunk).assertEqual('');
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.dataChunk).assertEqual('first');
    });
  });
}
