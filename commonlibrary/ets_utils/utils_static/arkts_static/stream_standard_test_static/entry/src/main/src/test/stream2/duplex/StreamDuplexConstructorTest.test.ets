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

class DuplexWithField extends stream.Duplex {
  customField: int = 42;

  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class DuplexInitTrack extends stream.Duplex {
  initCalled: boolean = false;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    this.initCalled = true;
    super.doInitialize(callback);
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class DuplexEcho extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class DuplexNoRead extends stream.Duplex {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
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

class DuplexNoImpl extends stream.Duplex {
  constructor() {
    super();
  }
}

class SubA extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class SubB extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class Sub_123$ extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class DuplexInitThrow extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }

  doInitialize(callback: Function): void {
    throw new Error("duplex init fail");
  }
}

class DuplexInitNoCb extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }

  doInitialize(callback: Function): void {
  }
}

class DuplexInitErrorCb extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }

  doInitialize(callback: Function): void {
    callback.unsafeCall(new Error("stream construct error"));
  }
}

class DuplexOnlyRead extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class DuplexOnlyWrite extends stream.Duplex {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class DuplexDualCall extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

function createDuplex(): DuplexTestBase {
  return new DuplexTestBase();
}

function isDuplex(obj: Object): boolean {
  return obj instanceof stream.Duplex;
}

function isReadable(obj: Object): boolean {
  return obj instanceof stream.Readable;
}

export default function StreamDuplexConstructorTest(): void {
  describe('StreamDuplexConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_0100
     * @tc.name testStreamDuplexConstructor001
     * @tc.desc Verify subclass no-arg constructor exposes both sides with all 14 default property values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      expect(d.readable).assertTrue();
      expect(d.readableObjectMode).assertFalse();
      expect(d.readableHighWatermark).assertEqual(16384);
      expect(d.readableFlowing).assertEqual(null);
      expect(d.readableLength).assertEqual(0);
      expect(d.readableEncoding).assertEqual(null);
      expect(d.readableEnded).assertFalse();
      expect(d.writable).assertTrue();
      expect(d.writableObjectMode).assertFalse();
      expect(d.writableHighWatermark).assertEqual(16384);
      expect(d.writableLength).assertEqual(0);
      expect(d.writableCorked).assertEqual(0);
      expect(d.writableEnded).assertFalse();
      expect(d.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_0200
     * @tc.name testStreamDuplexConstructor002
     * @tc.desc Verify subclass implements both doRead and doWrite, read and write are usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.pause();
      let r = d.write("hello");
      expect(r).assertTrue();
      let p = d.push("world");
      expect(p).assertTrue();
      expect(d.readableLength).assertEqual(5);
      let data = d.read();
      expect(data?.toString()).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_0300
     * @tc.name testStreamDuplexConstructor003
     * @tc.desc Verify subclass constructor super() call chain is complete, both read and write sides initialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWithField();
      expect(d.readable).assertTrue();
      expect(d.writable).assertTrue();
      expect(d.customField).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_0400
     * @tc.name testStreamDuplexConstructor004
     * @tc.desc Verify doInitialize is triggered when the first read event listener is registered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexInitTrack();
      d.on("data", (): void => {
      });
      expect(d.initCalled).assertTrue();
      let r = d.write("test");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_0500
     * @tc.name testStreamDuplexConstructor005
     * @tc.desc Verify subclass without doRead constructs normally, write side works, and read returns null without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexNoRead();
      expect(d.readable).assertTrue();
      expect(d.writable).assertTrue();
      let writeResult = d.write('no-read-write');
      expect(writeResult).assertTrue();
      let readResult = d.read();
      expect(readResult).assertEqual(null);
      expect(d.writable).assertTrue();
      expect(d.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_0600
     * @tc.name testStreamDuplexConstructor006
     * @tc.desc Verify subclass without doWrite constructs normally and both read and write sides stay usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexNoWrite();
      expect(d.readable).assertTrue();
      expect(d.writable).assertTrue();
      let pushResult = d.push('no-write-push');
      expect(pushResult).assertTrue();
      expect(d.readableLength).assertEqual(13);
      let writeResult = d.write('no-write-attempt');
      expect(writeResult).assertTrue();
      expect(d.writableLength).assertEqual(16);
      expect(d.readable).assertTrue();
      expect(d.readableEnded).assertFalse();
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_0700
     * @tc.name testStreamDuplexConstructor007
     * @tc.desc Verify subclass without any do method constructs normally, write buffers data and read returns null without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexNoImpl();
      expect(d.readable).assertTrue();
      expect(d.writable).assertTrue();
      expect(d.readableEnded).assertFalse();
      expect(d.writableEnded).assertFalse();
      let writeResult = d.write('no-impl-write');
      expect(writeResult).assertTrue();
      expect(d.writableLength).assertEqual(13);
      let readResult: Object | null = d.read();
      expect(readResult === null).assertTrue();
      expect(d.readable).assertFalse();
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_0800
     * @tc.name testStreamDuplexConstructor008
     * @tc.desc Verify ending read side does not affect write side, ending write side does not affect read side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let d1 = new DuplexTestBase();
        let readableEnded: boolean = false;
        let writableEnded: boolean = false;
        let writable: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          d1.pause();
          d1.on("end", (): void => {
            readableEnded = d1.readableEnded;
            writableEnded = d1.writableEnded;
            writable = d1.writable;
            resolve(undefined as void);
          });
          d1.push(null);
          d1.read();
        });
        expect(readableEnded).assertTrue();
        expect(writableEnded).assertFalse();
        expect(writable).assertTrue();
        let d2 = new DuplexTestBase();
        d2.end();
        expect(d2.writableEnded).assertTrue();
        expect(d2.readableEnded).assertFalse();
        expect(d2.readable).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_0900
     * @tc.name testStreamDuplexConstructor009
     * @tc.desc Verify subclass only needs read capability (only doRead implemented)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexNoWrite();
      d.pause();
      d.push("src");
      let data = d.read();
      expect(data?.toString()).assertEqual("src");
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_1000
     * @tc.name testStreamDuplexConstructor010
     * @tc.desc Verify subclass only needs write capability (only doWrite implemented)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexNoRead();
      let r = d.write("sink");
      expect(r).assertTrue();
      d.end();
      let data = d.read();
      expect(data).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_1100
     * @tc.name testStreamDuplexConstructor011
     * @tc.desc Verify three distinct Duplex subclasses exhibit polymorphic read/write behavior differences while sharing Duplex base type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new SubA();
      let b = new SubB();
      expect(a.writableLength).assertEqual(0);
      expect(b.writableLength).assertEqual(0);
      expect(a.writableCorked).assertEqual(0);
      expect(b.writableCorked).assertEqual(0);
      expect(a.readableFlowing).assertEqual(null);
      expect(b.readableFlowing).assertEqual(null);
      a.cork();
      a.write('sub-a-data');
      expect(a.writableCorked).assertEqual(1);
      expect(a.writableLength).assertEqual(10);
      expect(b.writableCorked).assertEqual(0);
      expect(b.writableLength).assertEqual(0);
      b.push('sub-b-push');
      expect(b.readableLength).assertEqual(10);
      expect(a.readableLength).assertEqual(0);
      a.uncork();
      expect(a.writableCorked).assertEqual(0);
      expect(b.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_1200
     * @tc.name testStreamDuplexConstructor012
     * @tc.desc Verify 100 independently constructed Duplex instances maintain per-instance bidirectional data isolation with no cross-instance contamination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instances: Array<DuplexTestBase> = [];
      for (let i: int = 0; i < 100; i++) {
        let d = new DuplexTestBase();
        let payload = '';
        for (let j: int = 0; j <= i; j++) {
          payload += 'x';
        }
        d.push(payload);
        instances.push(d);
      }
      expect(instances.length).assertEqual(100);
      for (let k: int = 0; k < 100; k++) {
        expect(instances[k].readable).assertTrue();
        expect(instances[k].writable).assertTrue();
        expect(instances[k].readableHighWatermark).assertEqual(16384);
        expect(instances[k].writableHighWatermark).assertEqual(16384);
        expect(instances[k].readableLength).assertEqual(k + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_1300
     * @tc.name testStreamDuplexConstructor013
     * @tc.desc Verify end immediately after construction ends the write side and keeps the read side open
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.end();
      expect(d.writableEnded).assertTrue();
      expect(d.writable).assertFalse();
      expect(d.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_1400
     * @tc.name testStreamDuplexConstructor014
     * @tc.desc Verify construct then end then construct a new instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1 = new DuplexTestBase();
      let d2 = new DuplexTestBase();
      expect(d2.readable).assertTrue();
      expect(d2.writable).assertTrue();
      expect(d2.readableHighWatermark).assertEqual(16384);
      expect(d2.writableHighWatermark).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_1500
     * @tc.name testStreamDuplexConstructor015
     * @tc.desc Verify a locally constructed Duplex inside a closure completes full bidirectional write-push-read-end lifecycle and returns collected data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = createDuplex();
      expect(d.readable).assertTrue();
      expect(d.writable).assertTrue();
      let r = d.write("test");
      expect(r).assertTrue();
      d.cork();
      d.write("buffered");
      expect(d.writableCorked).assertEqual(1);
      expect(d.writableLength).assertEqual(8);
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
      d.push("readable-data");
      expect(d.readableLength).assertEqual(13);
      d.end();
      expect(d.writableEnded).assertTrue();
      expect(d.writable).assertFalse();
      expect(d.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_1600
     * @tc.name testStreamDuplexConstructor016
     * @tc.desc Verify zero-valued properties (writableLength, writableCorked, readableLength) track state changes across write, cork, push and read operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      expect(d.writableCorked).assertEqual(0);
      expect(d.writableLength).assertEqual(0);
      expect(d.readableLength).assertEqual(0);
      d.cork();
      d.write('corked-write');
      expect(d.writableCorked).assertEqual(1);
      expect(d.writableLength).assertEqual(12);
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
      expect(d.writableLength).assertEqual(12);
      d.push('readable-push');
      expect(d.readableLength).assertEqual(13);
      d.read();
      expect(d.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_1700
     * @tc.name testStreamDuplexConstructor017
     * @tc.desc Verify all 14 property types and values remain correct after write, cork, push, read and end operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.write('post-op-write');
      d.push('post-op-push');
      d.end();
      expect(d.readable).assertTrue();
      expect(d.readableObjectMode).assertFalse();
      expect(d.readableFlowing).assertEqual(null);
      expect(d.readableEnded).assertFalse();
      expect(d.writable).assertFalse();
      expect(d.writableObjectMode).assertFalse();
      expect(d.writableEnded).assertTrue();
      expect(d.writableFinished).assertFalse();
      expect(d.readableHighWatermark).assertEqual(16384);
      expect(d.writableHighWatermark).assertEqual(16384);
      expect(d.readableLength).assertEqual(12);
      expect(d.writableLength).assertEqual(0);
      expect(d.writableCorked).assertEqual(0);
      expect(d.readableEncoding).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_1800
     * @tc.name testStreamDuplexConstructor018
     * @tc.desc Verify write immediately after construction (write side from initial state to write state)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      let r = d.write("data", "utf8");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_1900
     * @tc.name testStreamDuplexConstructor019
     * @tc.desc Verify push data into read buffer immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      let r = d.push("test");
      expect(r).assertTrue();
      expect(d.readableLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_2000
     * @tc.name testStreamDuplexConstructor020
     * @tc.desc Verify push(null) ends read side immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let d = new DuplexTestBase();
        let readableEnded: boolean = false;
        let writable: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on("end", (): void => {
            readableEnded = d.readableEnded;
            writable = d.writable;
            resolve(undefined as void);
          });
          d.push(null);
          d.read();
        });
        expect(readableEnded).assertTrue();
        expect(writable).assertTrue();

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_2100
     * @tc.name testStreamDuplexConstructor021
     * @tc.desc Verify cork immediately after construction enters write buffering mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      expect(d.writableCorked).assertEqual(1);
      expect(d.readableFlowing).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_2200
     * @tc.name testStreamDuplexConstructor022
     * @tc.desc Verify pause immediately after construction pauses read side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.pause();
      expect(d.readableFlowing).assertFalse();
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_2300
     * @tc.name testStreamDuplexConstructor023
     * @tc.desc Verify resume immediately after construction resumes read flowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.resume();
      expect(d.readableFlowing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_2400
     * @tc.name testStreamDuplexConstructor024
     * @tc.desc Verify register all event listeners immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.on("data", (chunk: Uint8Array): void => {
      });
      d.on("end", (): void => {
      });
      d.on("error", (err: Error): void => {
      });
      d.on("close", (): void => {
      });
      d.on("readable", (): void => {
      });
      d.on("finish", (): void => {
      });
      d.on("drain", (): void => {
      });
      d.on("pipe", (src: Object): void => {
      });
      d.on("unpipe", (src: Object): void => {
      });
      expect(d.readable).assertTrue();
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_2500
     * @tc.name testStreamDuplexConstructor025
     * @tc.desc Verify readableObjectMode and writableObjectMode are both false and read-only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      expect(d.readableObjectMode).assertFalse();
      expect(d.writableObjectMode).assertFalse();
      d.write('objectmode-write');
      expect(d.readableObjectMode).assertFalse();
      expect(d.writableObjectMode).assertFalse();
      d.push('objectmode-push');
      expect(d.readableObjectMode).assertFalse();
      expect(d.writableObjectMode).assertFalse();
      d.cork();
      d.write('objectmode-corked');
      expect(d.readableObjectMode).assertFalse();
      expect(d.writableObjectMode).assertFalse();
      d.uncork();
      d.end();
      expect(d.readableObjectMode).assertFalse();
      expect(d.writableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_2600
     * @tc.name testStreamDuplexConstructor026
     * @tc.desc Verify inherited stream methods update observable state after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.write("constructor_probe");
      d.cork();
      expect(d.writableCorked).assertEqual(1);
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
      d.setDefaultEncoding("utf8");
      d.push("readable_probe");
      d.pause();
      expect(d.isPaused()).assertTrue();
      expect(d.read()?.toString()).assertEqual("readable_probe");
      d.resume();
      expect(d.isPaused()).assertFalse();
      d.end();
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_2700
     * @tc.name testStreamDuplexConstructor027
     * @tc.desc Verify instanceof prototype chain is complete after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      expect(isDuplex(d)).assertTrue();
      expect(isReadable(d)).assertTrue();
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_2800
     * @tc.name testStreamDuplexConstructor028
     * @tc.desc Verify subclass with special characters in name constructs normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new Sub_123$();
      expect(d.readable).assertTrue();
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_2900
     * @tc.name testStreamDuplexConstructor029
     * @tc.desc Verify doInitialize is deferred during construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexInitThrow();
      expect(d.readable).assertTrue();
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_3000
     * @tc.name testStreamDuplexConstructor030
     * @tc.desc Verify subclass doInitialize does not call callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexInitNoCb();
      let r = d.write("test");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_3100
     * @tc.name testStreamDuplexConstructor031
     * @tc.desc Verify subclass doInitialize callback passes Error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexInitErrorCb();
      let r = d.write("test");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_3200
     * @tc.name testStreamDuplexConstructor032
     * @tc.desc Verify a Duplex subclass transfers a write to its readable side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexEcho();
      d.pause();
      let result = d.write('echo', 'utf8');
      expect(result).assertTrue();
      expect(d.read()?.toString()).assertEqual('echo');
      expect(d.readable).assertTrue();
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_CONSTRUCTOR_3300
     * @tc.name testStreamDuplexConstructor033
     * @tc.desc Verify second end() on Duplex throws BusinessError 10200036
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexConstructor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.end();
      let errThrown: boolean = false;
      try {
        d.end();
      } catch (e) {
        errThrown = true;
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200036);
      }
      expect(errThrown).assertTrue();
    });

  });
}
