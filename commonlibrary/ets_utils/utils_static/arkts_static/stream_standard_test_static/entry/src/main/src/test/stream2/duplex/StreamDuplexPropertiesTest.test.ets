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

class DuplexInitOverride extends stream.Duplex {
  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    super.doInitialize(callback);
  }

  doRead(size: int): void {
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

class DuplexWriteError extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error("write error"));
  }
}

export default function StreamDuplexPropertiesTest(): void {
  describe('StreamDuplexPropertiesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_0100
     * @tc.name testStreamDuplexProperties001
     * @tc.desc Verify writableObjectMode initial value is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      expect(d.writableObjectMode).assertFalse();
      d.write('objectmode-write');
      expect(d.writableObjectMode).assertFalse();
      d.cork();
      d.write('objectmode-corked');
      expect(d.writableObjectMode).assertFalse();
      d.uncork();
      d.end();
      expect(d.writableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_0200
     * @tc.name testStreamDuplexProperties002
     * @tc.desc Verify writable transitions from true to false after end(), remaining true during write, cork and uncork operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      expect(d.writable).assertTrue();
      d.write('writable-data');
      expect(d.writable).assertTrue();
      d.cork();
      d.write('writable-corked');
      expect(d.writable).assertTrue();
      d.uncork();
      d.end();
      expect(d.writable).assertFalse();
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_0300
     * @tc.name testStreamDuplexProperties003
     * @tc.desc Verify writableHighWatermark remains 16384 through write, cork, uncork, push and end operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      expect(d.writableHighWatermark).assertEqual(16384);
      d.write('hwm-data');
      expect(d.writableHighWatermark).assertEqual(16384);
      d.cork();
      d.write('hwm-corked');
      expect(d.writableHighWatermark).assertEqual(16384);
      d.uncork();
      d.push('hwm-push');
      expect(d.writableHighWatermark).assertEqual(16384);
      d.end();
      expect(d.writableHighWatermark).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_0400
     * @tc.name testStreamDuplexProperties004
     * @tc.desc Verify writableLength tracks buffered bytes under cork, accumulates on multiple writes, and resets to 0 on uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      expect(d.writableLength).assertEqual(0);
      d.cork();
      d.write('length-data');
      expect(d.writableLength).assertEqual(11);
      d.write('more-data');
      expect(d.writableLength).assertEqual(20);
      d.uncork();
      expect(d.writableLength).assertEqual(20);
      d.end();
      expect(d.writableLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_0500
     * @tc.name testStreamDuplexProperties005
     * @tc.desc Verify writableCorked counter increments on cork, decrements on uncork, and clamps at 0 on underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      expect(d.writableCorked).assertEqual(0);
      d.cork();
      expect(d.writableCorked).assertEqual(1);
      d.cork();
      expect(d.writableCorked).assertEqual(2);
      d.uncork();
      expect(d.writableCorked).assertEqual(1);
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_0600
     * @tc.name testStreamDuplexProperties006
     * @tc.desc Verify writableEnded transitions from false to true after end(), remaining false during write, cork and uncork operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      expect(d.writableEnded).assertFalse();
      d.write('ended-data');
      expect(d.writableEnded).assertFalse();
      d.cork();
      d.write('ended-corked');
      expect(d.writableEnded).assertFalse();
      d.uncork();
      d.end();
      expect(d.writableEnded).assertTrue();
      expect(d.writable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_0700
     * @tc.name testStreamDuplexProperties007
     * @tc.desc Verify writableFinished becomes true inside the finish callback after write+end, with writableEnded already true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new DuplexTestBase();
        expect(d.writableFinished).assertFalse();
        d.write('finished-data');
        expect(d.writableFinished).assertFalse();
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on('finish', (): void => {
            finishedAtFinish = d.writableFinished;
            resolve(undefined as void);
          });
          d.end();
        });
        expect(finishedAtFinish).assertTrue();
        expect(d.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_0800
     * @tc.name testStreamDuplexProperties008
     * @tc.desc Verify all properties are read-only and cannot be assigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      expect(d.writable).assertTrue();
      expect(d.writableObjectMode).assertFalse();
      expect(d.writableHighWatermark).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_0900
     * @tc.name testStreamDuplexProperties009
     * @tc.desc Verify writableEnded must be true before writableFinished is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.write("x");
      expect(d.writableEnded).assertFalse();
      expect(d.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_1000
     * @tc.name testStreamDuplexProperties010
     * @tc.desc Verify writableObjectMode remains false after buffered write and uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write("data");
      expect(d.writableObjectMode).assertFalse();
      d.uncork();
      expect(d.writableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_1100
     * @tc.name testStreamDuplexProperties011
     * @tc.desc Verify writableHighWatermark and writableCorked stay at defaults after write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.write("data");
      expect(d.writableHighWatermark).assertEqual(16384);
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_1200
     * @tc.name testStreamDuplexProperties012
     * @tc.desc Verify property initial values are consistent across different subclass instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new DuplexTestBase();
      let b = new DuplexWritevImpl();
      expect(a.writable).assertTrue();
      expect(b.writable).assertTrue();
      expect(a.writableObjectMode).assertFalse();
      expect(b.writableObjectMode).assertFalse();
      expect(a.writableHighWatermark).assertEqual(16384);
      expect(b.writableHighWatermark).assertEqual(16384);
      expect(a.writableLength).assertEqual(0);
      expect(b.writableLength).assertEqual(0);
      expect(a.writableCorked).assertEqual(0);
      expect(b.writableCorked).assertEqual(0);
      expect(a.writableEnded).assertFalse();
      expect(b.writableEnded).assertFalse();
      expect(a.writableFinished).assertFalse();
      expect(b.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_1300
     * @tc.name testStreamDuplexProperties013
     * @tc.desc Verify subclass with both doWrite+doWritev has consistent property behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWritevImpl();
      d.cork();
      d.write("x");
      expect(d.writableCorked).assertEqual(1);
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
      let r = d.write("y");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_1400
     * @tc.name testStreamDuplexProperties014
     * @tc.desc Verify subclass overriding doInitialize initializes properties correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexInitOverride();
      expect(d.writable).assertTrue();
      expect(d.writableLength).assertEqual(0);
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_1500
     * @tc.name testStreamDuplexProperties015
     * @tc.desc Verify properties are still readable on subclass without doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexNoWrite();
      expect(d.writable).assertTrue();
      expect(d.writableLength).assertEqual(0);
      expect(d.writableCorked).assertEqual(0);
      expect(d.writableEnded).assertFalse();
      expect(d.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_1600
     * @tc.name testStreamDuplexProperties016
     * @tc.desc Verify writableLength and writableCorked both reset to zero after cork then uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.uncork();
      expect(d.writableLength).assertEqual(0);
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_1700
     * @tc.name testStreamDuplexProperties017
     * @tc.desc Verify writableLength=1 (minimum non-zero value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write("a");
      expect(d.writableLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_1800
     * @tc.name testStreamDuplexProperties018
     * @tc.desc Verify writableLength=16383 (1 byte below waterline)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      let buf = new Uint8Array(16383);
      d.cork();
      let r = d.write(buf);
      expect(r).assertTrue();
      expect(d.writableLength).assertEqual(16383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_1900
     * @tc.name testStreamDuplexProperties019
     * @tc.desc Verify writableLength=16384 (equal to waterline)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      let buf = new Uint8Array(16384);
      d.cork();
      let r = d.write(buf);
      expect(d.writableLength).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_2000
     * @tc.name testStreamDuplexProperties020
     * @tc.desc Verify writableLength=16385 (1 byte above waterline)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      let buf = new Uint8Array(16385);
      d.cork();
      let r = d.write(buf);
      expect(r).assertFalse();
      expect(d.writableLength).assertEqual(16385);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_2100
     * @tc.name testStreamDuplexProperties021
     * @tc.desc Verify writableLength=102400 (100KB far above waterline)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      let buf = new Uint8Array(102400);
      d.cork();
      let r = d.write(buf);
      expect(r).assertFalse();
      expect(d.writableLength).assertEqual(102400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_2200
     * @tc.name testStreamDuplexProperties022
     * @tc.desc Verify writableCorked returns to zero after flushing a buffered write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write(new Uint8Array([0x61, 0x62]));
      expect(d.writableLength).assertEqual(2);
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_2300
     * @tc.name testStreamDuplexProperties023
     * @tc.desc Verify writableCorked=100 (large cork stack)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      for (let i: int = 0; i < 100; i++) {
        d.cork();
      }
      expect(d.writableCorked).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_2400
     * @tc.name testStreamDuplexProperties024
     * @tc.desc Verify writableCorked cannot go negative (excessive uncork)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.uncork();
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_2500
     * @tc.name testStreamDuplexProperties025
     * @tc.desc Verify writableHighWatermark remains fixed after a binary write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.write(new Uint8Array([120]));
      expect(d.writableHighWatermark).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_2600
     * @tc.name testStreamDuplexProperties026
     * @tc.desc Verify writableHighWatermark remains fixed through a cork cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write("x");
      d.uncork();
      expect(d.writableHighWatermark).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_2700
     * @tc.name testStreamDuplexProperties027
     * @tc.desc Verify writableHighWatermark stays default and writableEnded becomes true after end(chunk)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.end(new Uint8Array([0x78]));
      expect(d.writableHighWatermark).assertEqual(16384);
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_2800
     * @tc.name testStreamDuplexProperties028
     * @tc.desc Verify writableCorked=1 after one cork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      expect(d.writableCorked).assertEqual(1);
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_2900
     * @tc.name testStreamDuplexProperties029
     * @tc.desc Verify cork 3 times uncork 2 times then writableCorked=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.cork();
      d.cork();
      d.uncork();
      d.uncork();
      expect(d.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_3000
     * @tc.name testStreamDuplexProperties030
     * @tc.desc Verify writableEnded=true after end(chunk)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.end("data", "utf8");
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_3100
     * @tc.name testStreamDuplexProperties031
     * @tc.desc Verify writableFinished=true after write+end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let d = new DuplexTestBase();
      let finishedAtFinish: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        d.on('finish', (): void => {
          finishedAtFinish = d.writableFinished;
          resolve(undefined as void);
        });
        d.write("x");
        d.end();
      });
      expect(finishedAtFinish).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_3200
     * @tc.name testStreamDuplexProperties032
     * @tc.desc Verify end() without data directly finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let d = new DuplexTestBase();
      let finishedAtFinish: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        d.on('finish', (): void => {
          finishedAtFinish = d.writableFinished;
          resolve(undefined as void);
        });
        d.end();
      });
      expect(finishedAtFinish).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_3300
     * @tc.name testStreamDuplexProperties033
     * @tc.desc Verify corked state end forces writableCorked to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.cork();
      d.end();
      expect(d.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_3400
     * @tc.name testStreamDuplexProperties034
     * @tc.desc Verify writable becomes false after end with a string chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.end("last");
      expect(d.writable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_3500
     * @tc.name testStreamDuplexProperties035
     * @tc.desc Verify writable becomes false after error event triggers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexWriteError();
      let errorMessage: string = '';
      d.on("error", (e: Error): void => {
        errorMessage = e.message;
      });
      d.write("x");
      expect(d.writable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_3600
     * @tc.name testStreamDuplexProperties036
     * @tc.desc Verify writableLength remains unchanged after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.write("test");
      let before = d.writableLength;
      expect(d.writableLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_3700
     * @tc.name testStreamDuplexProperties037
     * @tc.desc Verify readable push operation does not affect writableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.push("readableData");
      expect(d.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_3800
     * @tc.name testStreamDuplexProperties038
     * @tc.desc Verify readable push(null) end does not affect writable state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.push(null);
      expect(d.writable).assertTrue();
      expect(d.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_3900
     * @tc.name testStreamDuplexProperties039
     * @tc.desc Verify after write side end, cannot write but readable push still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.end();
      expect(d.writableEnded).assertTrue();
      expect(d.writable).assertFalse();
      let p = d.push("readableData");
      expect(p).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_4000
     * @tc.name testStreamDuplexProperties040
     * @tc.desc Verify write with an emoji character yields correct writableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write("😀");
      expect(d.writableLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_4100
     * @tc.name testStreamDuplexProperties041
     * @tc.desc Verify write with a zero-width space yields correct writableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write("​");
      expect(d.writableLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_4200
     * @tc.name testStreamDuplexProperties042
     * @tc.desc Verify write with lone surrogate pair (\udc04) property state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write("\uDC04");
      expect(d.writableLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_4300
     * @tc.name testStreamDuplexProperties043
     * @tc.desc Verify write with invalid UTF-8 single byte (\xe4) property state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write(new Uint8Array([0xE4]));
      expect(d.writableLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_4400
     * @tc.name testStreamDuplexProperties044
     * @tc.desc Verify write Chinese with gbk encoding yields correct writableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write("测试", "gbk");
      expect(d.writableLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_4500
     * @tc.name testStreamDuplexProperties045
     * @tc.desc Verify write with gb18030 encoding yields correct writableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write("测试", "gb18030");
      expect(d.writableLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_4600
     * @tc.name testStreamDuplexProperties046
     * @tc.desc Verify write empty Uint8Array in corked state does not change writableCorked and keeps writableLength at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write(new Uint8Array(0));
      expect(d.writableCorked).assertEqual(1);
      expect(d.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_4700
     * @tc.name testStreamDuplexProperties047
     * @tc.desc Verify write all-0xFF byte Uint8Array yields correct writableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write(new Uint8Array([0xFF, 0xFF, 0xFF]));
      expect(d.writableLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_4800
     * @tc.name testStreamDuplexProperties048
     * @tc.desc Verify writing UTF-8 CJK data yields a 3-byte sequence with correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.cork();
      d.write(new Uint8Array([0xE4, 0xB8, 0xAD]));
      expect(d.writableLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_4900
     * @tc.name testStreamDuplexProperties049
     * @tc.desc Verify property state unchanged after write empty string throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      try {
        d.write("");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_5000
     * @tc.name testStreamDuplexProperties050
     * @tc.desc Verify property state unchanged after write(null) throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      try {
        d.write(null as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_5100
     * @tc.name testStreamDuplexProperties051
     * @tc.desc Verify property state unchanged after write(undefined) throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      try {
        d.write(undefined as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_5200
     * @tc.name testStreamDuplexProperties052
     * @tc.desc Verify property unchanged after write(number 123) type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      try {
        d.write(123 as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_5300
     * @tc.name testStreamDuplexProperties053
     * @tc.desc Verify property unchanged after write(boolean true) type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      try {
        d.write(true as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(d.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_5400
     * @tc.name testStreamDuplexProperties054
     * @tc.desc Verify writableLength unchanged after end then write throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.end();
      let before = d.writableLength;
      let result = d.write("x");
      expect(result).assertFalse();
      expect(d.writableLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_5500
     * @tc.name testStreamDuplexProperties055
     * @tc.desc Verify writableEnded stays true after end() then end() again throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.end();
      try {
        d.end("again");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
      expect(d.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_5600
     * @tc.name testStreamDuplexProperties056
     * @tc.desc Verify write after end throws error code 10200036
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let d = new DuplexTestBase();
      let errName: string = '';
      let errCode: number = -1;
      await new Promise<void>((resolve: (value: void) => void): void => {
        d.on('error', (err: BusinessError): void => {
          errName = err.name;
          errCode = err.code;
          resolve(undefined as void);
        });
        d.end();
        let result = d.write('afterEnd');
        expect(result).assertFalse();
      });
      expect(errName).assertEqual('BusinessError');
      expect(errCode).assertEqual(10200036);

      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_5700
     * @tc.name testStreamDuplexProperties057
     * @tc.desc Verify end(chunk) after end() throws error code 10200036
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.end();
      try {
        d.end("again");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(10200036);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_5800
     * @tc.name testStreamDuplexProperties058
     * @tc.desc Verify write without doWrite remains accepted by Duplex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexNoWrite();
      let result = d.write('x');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PROPERTIES_5900
     * @tc.name testStreamDuplexProperties059
     * @tc.desc Verify readable pause does not close the writable side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexProperties059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new DuplexTestBase();
      d.pause();
      expect(d.isPaused()).assertTrue();
      expect(d.writable).assertTrue();
      expect(d.writableEnded).assertFalse();
      expect(d.writableFinished).assertFalse();
    });
  });
}
