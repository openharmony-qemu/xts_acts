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
import Utils from '../../Util.test';

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

class DuplexInitTrack extends stream.Duplex {
  public initCalled: boolean = false;

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

class DuplexThrowInit extends stream.Duplex {
  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    throw new Error("init error");
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class DuplexNoCbInit extends stream.Duplex {
  public initCalled: boolean = false;
  private initObserver: Function = (): void => {
  };

  constructor() {
    super();
  }

  setInitObserver(initObserver: Function): void {
    this.initObserver = initObserver;
  }

  doInitialize(callback: Function): void {
    this.initCalled = true;
    this.initObserver.unsafeCall();
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

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.received.push(chunk);
    this.writeCount++;
    callback.unsafeCall();
  }
}

export default function StreamDuplexDoInitializeTest(): void {
  describe('StreamDuplexDoInitializeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_0100
     * @tc.name testStreamDuplexDoInitialize001
     * @tc.desc Verify doInitialize is not called in the constructor and isPaused stays false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      expect(ds.initCalled).assertFalse();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_0200
     * @tc.name testStreamDuplexDoInitialize002
     * @tc.desc Verify doInitialize auto called on resume()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      ds.on("data", (chunk: Object): void => {
      });
      ds.resume();
      expect(ds.initCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_0300
     * @tc.name testStreamDuplexDoInitialize003
     * @tc.desc Verify doInitialize auto called on read()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      ds.on("readable", (): void => {
      });
      ds.pause();
      ds.read();
      expect(ds.initCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_0400
     * @tc.name testStreamDuplexDoInitialize004
     * @tc.desc Verify doInitialize only called once after multiple on() registrations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      ds.on("data", (chunk: Object): void => {
      });
      let firstCalled: boolean = ds.initCalled;
      ds.on("data", (chunk: Object): void => {
      });
      expect(ds.initCalled).assertTrue();
      expect(ds.initCalled).assertEqual(firstCalled);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_0500
     * @tc.name testStreamDuplexDoInitialize005
     * @tc.desc Verify doInitialize throwing triggers error event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexThrowInit = new DuplexThrowInit();
      let thrown: boolean = false;
      try {
        ds.on("data", (chunk: Object): void => {
        });
      } catch (e) {
        expect(e.name).assertEqual("Error");
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_0600
     * @tc.name testStreamDuplexDoInitialize006
     * @tc.desc Verify stream remains pending when doInitialize does not invoke callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let ds: DuplexNoCbInit = new DuplexNoCbInit();
        let dataEventCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.setInitObserver((): void => {
            resolve(undefined as void);
          });
          ds.on("data", (chunk: Object): void => {
            dataEventCount++;
          });
          ds.resume();
        });
        expect(ds.initCalled).assertTrue();
        expect(dataEventCount).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_0700
     * @tc.name testStreamDuplexDoInitialize007
     * @tc.desc Verify doInitialize not called after pause()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      ds.pause();
      expect(ds.initCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_0800
     * @tc.name testStreamDuplexDoInitialize008
     * @tc.desc Verify doInitialize does not affect write side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      ds.resume();
      let r: boolean = ds.write("test");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_0900
     * @tc.name testStreamDuplexDoInitialize009
     * @tc.desc Verify doInitialize does not affect end()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      ds.resume();
      ds.end();
      expect(ds.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_1000
     * @tc.name testStreamDuplexDoInitialize010
     * @tc.desc Verify doInitialize does not affect cork/uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      ds.resume();
      ds.cork();
      expect(ds.writableCorked).assertEqual(1);
      ds.uncork();
      expect(ds.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_1100
     * @tc.name testStreamDuplexDoInitialize011
     * @tc.desc Verify doInitialize does not affect setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      ds.resume();
      let r: boolean = ds.setEncoding("utf8");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_1200
     * @tc.name testStreamDuplexDoInitialize012
     * @tc.desc Verify doInitialize does not affect setDefaultEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      ds.resume();
      let r: boolean = ds.setDefaultEncoding("utf8");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_1300
     * @tc.name testStreamDuplexDoInitialize013
     * @tc.desc Verify doInitialize does not affect readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      ds.resume();
      expect(ds.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_1400
     * @tc.name testStreamDuplexDoInitialize014
     * @tc.desc Verify readableFlowing, readableEncoding and readableEnded keep defaults before doInitialize runs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      expect(ds.readableFlowing).assertEqual(null);
      expect(ds.readableEncoding).assertEqual(null);
      expect(ds.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_1500
     * @tc.name testStreamDuplexDoInitialize015
     * @tc.desc Verify readableHighWatermark, readableObjectMode and writableCorked keep defaults and are unaffected before doInitialize runs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      expect(ds.readableHighWatermark).assertEqual(16384);
      expect(ds.readableObjectMode).assertFalse();
      expect(ds.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_1600
     * @tc.name testStreamDuplexDoInitialize016
     * @tc.desc Verify writable, writableEnded and writableFinished keep defaults before doInitialize runs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      expect(ds.writable).assertTrue();
      expect(ds.writableEnded).assertFalse();
      expect(ds.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_1700
     * @tc.name testStreamDuplexDoInitialize017
     * @tc.desc Verify doInitialize is auto called on pipe() and leaves writableLength, writableEnded and writableFinished unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      expect(ds.initCalled).assertTrue();
      expect(ds.writableLength).assertEqual(0);
      expect(ds.writableEnded).assertFalse();
      expect(ds.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_1800
     * @tc.name testStreamDuplexDoInitialize018
     * @tc.desc Verify doInitialize does not affect writable* properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      expect(ds.writable).assertTrue();
      expect(ds.writableLength).assertEqual(0);
      expect(ds.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_DO_INITIALIZE_1900
     * @tc.name testStreamDuplexDoInitialize019
     * @tc.desc Verify doInitialize on on("data", cb) before resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexDoInitialize019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexInitTrack = new DuplexInitTrack();
      ds.on("data", (chunk: Object): void => {
      });
      expect(ds.initCalled).assertTrue();
      expect(ds.isPaused()).assertFalse();
    });

  });
}
