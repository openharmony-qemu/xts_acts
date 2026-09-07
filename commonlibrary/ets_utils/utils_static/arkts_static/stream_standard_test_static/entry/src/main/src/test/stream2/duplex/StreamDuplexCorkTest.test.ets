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

class DuplexWritevImpl extends stream.Duplex {
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

class DuplexNoWrite extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class DuplexCorkTrack extends stream.Duplex {
  doWriteCalled: boolean = false;

  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doWriteCalled = true;
    callback.unsafeCall();
  }
}

class CorkTransform extends stream.Transform {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }

  doTransform(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class TargetWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamDuplexCorkTest(): void {
  describe('StreamDuplexCorkTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_0100
     * @tc.name testStreamDuplexCork001
     * @tc.desc Verify single cork returns true and corked increments to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      let r = d.cork();
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_0200
     * @tc.name testStreamDuplexCork002
     * @tc.desc Verify cork on a new instance increments writableCorked and keeps both sides usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      expect(d.writableCorked).assertEqual(1);
      expect(d.writable).assertTrue();
      expect(d.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_0300
     * @tc.name testStreamDuplexCork003
     * @tc.desc Verify consecutive cork calls increment the nesting count progressively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      expect(d.writableCorked).assertEqual(1);
      d.cork();
      expect(d.writableCorked).assertEqual(2);
      d.cork();
      expect(d.writableCorked).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_0400
     * @tc.name testStreamDuplexCork004
     * @tc.desc Verify cork after write operation completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.write("data");
      d.cork();
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_0500
     * @tc.name testStreamDuplexCork005
     * @tc.desc Verify cork after end is accepted and increments the cork count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.end();
      let result = d.cork();
      expect(result).assertTrue();
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_0600
     * @tc.name testStreamDuplexCork006
     * @tc.desc Verify cork after writable.end is accepted and increments the cork count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexCorkTrack();
      d.end("last");
      let result = d.cork();
      expect(result).assertTrue();
      expect(d.doWriteCalled).assertTrue();
      expect(d.writableEnded).assertTrue();
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_0700
     * @tc.name testStreamDuplexCork007
     * @tc.desc Verify cork does not change readable side state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      expect(d.readable).assertTrue();
      expect(d.readableEnded).assertFalse();
      expect(d.readableLength).assertEqual(0);
      expect(d.readableFlowing).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_0800
     * @tc.name testStreamDuplexCork008
     * @tc.desc Verify cork does not trigger readable side events
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      let dataFired: boolean = false;
      let readableFired: boolean = false;
      let endFired: boolean = false;
      d.on("data", (chunk: Uint8Array): void => {
        dataFired = true;
      });
      d.on("readable", (): void => {
        readableFired = true;
      });
      d.on("end", (): void => {
        endFired = true;
      });
      d.cork();
      expect(dataFired).assertFalse();
      expect(readableFired).assertFalse();
      expect(endFired).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_0900
     * @tc.name testStreamDuplexCork009
     * @tc.desc Verify cork on Duplex subclass with only doWrite and doRead implemented
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      expect(d.writableCorked).assertEqual(1);
      let r = d.write("x");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_1000
     * @tc.name testStreamDuplexCork010
     * @tc.desc Verify cork on Duplex subclass with both doWrite and doWritev implemented
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevImpl();
      d.cork();
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_1100
     * @tc.name testStreamDuplexCork011
     * @tc.desc Verify cork on Duplex subclass without any write method implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexNoWrite();
      d.cork();
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_1200
     * @tc.name testStreamDuplexCork012
     * @tc.desc Verify cork on Transform subclass inherits Duplex behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new CorkTransform();
      d.cork();
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_1300
     * @tc.name testStreamDuplexCork013
     * @tc.desc Verify an unpaired uncork before any cork keeps the count at zero and write still flushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexCorkTrack();
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
      expect(d.write("direct")).assertTrue();
      expect(d.doWriteCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_1400
     * @tc.name testStreamDuplexCork014
     * @tc.desc Verify corked is 5 after corking 5 times consecutively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      for (let i: int = 1; i <= 5; i++) {
        let r = d.cork();
        expect(r).assertTrue();
        expect(d.writableCorked).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_1500
     * @tc.name testStreamDuplexCork015
     * @tc.desc Verify 100 corks need 100 matching uncorks and keep doWrite unreached until the last one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexCorkTrack();
      for (let i: int = 0; i < 100; i++) {
        d.cork();
      }
      d.write("batched");
      for (let i: int = 0; i < 99; i++) {
        d.uncork();
      }
      expect(d.writableCorked).assertEqual(1);
      expect(d.doWriteCalled).assertFalse();
      expect(d.writableLength).assertEqual(7);
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
      expect(d.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_1600
     * @tc.name testStreamDuplexCork016
     * @tc.desc Verify cork takes effect when writableLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      expect(d.writableLength).assertEqual(0);
      d.cork();
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_1700
     * @tc.name testStreamDuplexCork017
     * @tc.desc Verify cork still takes effect when writableLength reaches highWaterMark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      let buf = new Uint8Array(16385);
      d.write(buf);
      d.cork();
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_1800
     * @tc.name testStreamDuplexCork018
     * @tc.desc Verify cork takes effect under default highWaterMark (16384)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      expect(d.writableCorked).assertEqual(1);
      d.write(new Uint8Array(16384));
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_1900
     * @tc.name testStreamDuplexCork019
     * @tc.desc Verify cork count behavior near integer upper bound (INT_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      for (let i: int = 0; i < 1000; i++) {
        d.cork();
      }
      expect(d.writableCorked).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_2000
     * @tc.name testStreamDuplexCork020
     * @tc.desc Verify write does not trigger doWrite in corked state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexCorkTrack();
      d.cork();
      d.write("data");
      expect(d.doWriteCalled).assertFalse();
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_2100
     * @tc.name testStreamDuplexCork021
     * @tc.desc Verify multiple writes are all buffered and readable side is independent in corked state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write("a");
      d.write("b");
      d.write("c");
      expect(d.writableCorked).assertEqual(1);
      d.push("x");
      let data = d.read();
      expect(data?.toString()).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_2200
     * @tc.name testStreamDuplexCork022
     * @tc.desc Verify cork count restarts after cork to uncork resets to zero and the cork cycle can be repeated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
      d.cork();
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_2300
     * @tc.name testStreamDuplexCork023
     * @tc.desc Verify large data (10KB) write is fully buffered in corked state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write(new Uint8Array(10240));
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_2400
     * @tc.name testStreamDuplexCork024
     * @tc.desc Verify end force-flushes and resets corked after multi-level cork nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.cork();
      d.end("data");
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_2500
     * @tc.name testStreamDuplexCork025
     * @tc.desc Verify push readable data simultaneously in corked state, read/write channels are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write("data");
      expect(d.writableCorked).assertEqual(1);
      d.push("readData");
      let data = d.read();
      expect(data?.toString()).assertEqual("readData");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_2600
     * @tc.name testStreamDuplexCork026
     * @tc.desc Verify pipe write side in corked state, data flow is unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      let target = new TargetWritable();
      d.cork();
      d.write("a");
      d.write("b");
      d.pipe(target);
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_2700
     * @tc.name testStreamDuplexCork027
     * @tc.desc Verify read side in paused mode under corked state, write side cork is independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.pause();
      d.cork();
      d.write("x");
      expect(d.writableCorked).assertEqual(1);
      expect(d.readableFlowing).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_2800
     * @tc.name testStreamDuplexCork028
     * @tc.desc Verify read side in flowing mode under corked state, write side cork is independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      expect(d.readableFlowing).assertEqual(null);
      d.cork();
      d.write("y");
      d.push("z");
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_2900
     * @tc.name testStreamDuplexCork029
     * @tc.desc Verify nested cork increments writableCorked twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      let r1 = d.cork();
      expect(r1).assertTrue();
      expect(d.writableCorked).assertEqual(1);
      let r2 = d.cork();
      expect(r2).assertTrue();
      expect(d.writableCorked).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_3000
     * @tc.name testStreamDuplexCork030
     * @tc.desc Verify write Chinese data with gbk encoding after cork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write("测试工程师", "gbk");
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_3100
     * @tc.name testStreamDuplexCork031
     * @tc.desc Verify writableCorked stays 1 after writing emoji, XSS, embedded-null, zero-width, surrogate and formatted-text chunks on a corked duplex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chunks: string[] = ['😀测试🔥', '<script>alert(1)</script>', 'data\x00null',
        '​', '\uDC04', '2026-03-05', '13800138000'];
      for (let i = 0; i < chunks.length; i++) {
        let d = new DuplexTestBase();
        d.cork();
        d.write(chunks[i]);
        expect(d.writableCorked).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_3200
     * @tc.name testStreamDuplexCork032
     * @tc.desc Verify multiple writes with different encodings after cork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write("hello", "utf8");
      d.write("テスト", "gbk");
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_3300
     * @tc.name testStreamDuplexCork033
     * @tc.desc Verify uncorking without write after cork only resets counter without flushing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexCorkTrack();
      d.cork();
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
      expect(d.doWriteCalled).assertFalse();
      expect(d.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_3400
     * @tc.name testStreamDuplexCork034
     * @tc.desc Verify a corked write contributes to writableLength until uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write("x");
      expect(d.writableLength).assertEqual(1);
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_3500
     * @tc.name testStreamDuplexCork035
     * @tc.desc Verify cork called as a plain function (this binding lost)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      try {
        d.cork.unsafeCall();
        expect(d.writableCorked).assertEqual(1);
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_3600
     * @tc.name testStreamDuplexCork036
     * @tc.desc Verify cork bound to a non-Duplex plain object via call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      try {
        let result = d.cork();
        expect(result).assertTrue();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_3700
     * @tc.name testStreamDuplexCork037
     * @tc.desc Verify cork bound to null context via call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      try {
        d.cork.unsafeCall(null);
        expect(d.writableCorked).assertEqual(1);
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CORK_3800
     * @tc.name testStreamDuplexCork038
     * @tc.desc Verify nested cork calls require matching uncork calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexCork038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.cork();
      expect(d.writableCorked).assertEqual(2);
      d.uncork();
      expect(d.writableCorked).assertEqual(1);
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
    });
  });
}
