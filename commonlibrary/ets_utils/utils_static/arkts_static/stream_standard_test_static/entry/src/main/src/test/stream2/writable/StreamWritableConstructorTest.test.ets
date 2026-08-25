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

function isInstanceOfStreamWritable(value: Object): boolean {
  return value instanceof stream.Writable;
}

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

class WritableInitFlag extends stream.Writable {
  public static initCalled: boolean = false;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    WritableInitFlag.initCalled = true;
    callback.unsafeCall();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class WritableInitThrow extends stream.Writable {
  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    throw new Error("init error");
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class WritableInitNoCallback extends stream.Writable {
  public static initStarted: boolean = false;

  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    WritableInitNoCallback.initStarted = true;
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class WritableInitError extends stream.Writable {
  constructor() {
    super();
  }

  doInitialize(callback: Function): void {
    callback.unsafeCall(new Error("init error"));
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamWritableConstructorTest(): void {
  describe('StreamWritableConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_0100
     * @tc.name testStreamWritableConstructor001
     * @tc.desc Verify subclass construction preserves Uint8Array boundary bytes when written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let chunk = new Uint8Array([0, 255]);
        let result: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
          result = ws.write(chunk, 'utf8', (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
              return;
            }
            resolve(undefined as void);
          });
        });
        expect(result).assertTrue();
        expect((ws.dataChunk as Uint8Array)[0]).assertEqual(0);
        expect((ws.dataChunk as Uint8Array)[1]).assertEqual(255);
        expect(ws.writable).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_0200
     * @tc.name testStreamWritableConstructor002
     * @tc.desc Verify the default values of 7 properties are correct after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.writable).assertTrue();
      expect(ws.writableObjectMode).assertFalse();
      expect(ws.writableHighWatermark).assertEqual(16384);
      expect(ws.writableLength).assertEqual(0);
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writableEnded).assertFalse();
      expect(ws.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_0300
     * @tc.name testStreamWritableConstructor003
     * @tc.desc Verify the super() call chain in subclass construction is complete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.writableHighWatermark).assertEqual(16384);
      expect(ws.writableCorked).assertEqual(0);
      let result = ws.write('test');
      expect(result).assertTrue();
      expect(ws.dataChunk).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_0400
     * @tc.name testStreamWritableConstructor004
     * @tc.desc Verify no error when doWrite is not implemented during construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableNoDoWrite();
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_0500
     * @tc.name testStreamWritableConstructor005
     * @tc.desc Verify writableFinished remains false through write, cork, uncork and synchronous end operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.writableFinished).assertFalse();
      ws.write('chunk-one');
      expect(ws.writableFinished).assertFalse();
      ws.cork();
      ws.write('chunk-two');
      ws.write('chunk-three');
      expect(ws.writableFinished).assertFalse();
      ws.uncork();
      expect(ws.writableFinished).assertFalse();
      ws.end();
      expect(ws.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_0600
     * @tc.name testStreamWritableConstructor006
     * @tc.desc Verify writableEnded transitions from false to true synchronously after end() while writableFinished stays false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.writableEnded).assertFalse();
      ws.write('before-end');
      expect(ws.writableEnded).assertFalse();
      ws.end();
      expect(ws.writableEnded).assertTrue();
      expect(ws.writable).assertFalse();
      expect(ws.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_0700
     * @tc.name testStreamWritableConstructor007
     * @tc.desc Verify combined property state snapshots across construction, write, cork and uncork phases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.writable).assertTrue();
      expect(ws.writableEnded).assertFalse();
      expect(ws.writableFinished).assertFalse();
      expect(ws.writableCorked).assertEqual(0);
      ws.write('state-snapshot');
      expect(ws.writable).assertTrue();
      expect(ws.writableEnded).assertFalse();
      expect(ws.writableFinished).assertFalse();
      ws.cork();
      ws.write('buffered-data');
      expect(ws.writableCorked).assertEqual(1);
      expect(ws.writableEnded).assertFalse();
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_0800
     * @tc.name testStreamWritableConstructor008
     * @tc.desc Verify a constructed writable forwards payload and encoding to doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let result: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
          result = ws.write('constructor-payload', 'utf8', (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
              return;
            }
            resolve(undefined as void);
          });
        });
        expect(result).assertTrue();
        expect(ws.dataChunk).assertEqual('constructor-payload');
        expect(ws.dataEncoding).assertEqual('utf8');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_0900
     * @tc.name testStreamWritableConstructor009
     * @tc.desc Verify construction when subclass implements both doWrite and doWritev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableWithDoWritev();
      let result = ws.write("test");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_1000
     * @tc.name testStreamWritableConstructor010
     * @tc.desc Verify doInitialize runs during construction and the writable remains usable afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      WritableInitFlag.initCalled = false;
      let ws = new WritableInitFlag();
      expect(WritableInitFlag.initCalled).assertTrue();
      expect(ws.write('initialized')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_1100
     * @tc.name testStreamWritableConstructor011
     * @tc.desc Verify doWrite and doWritev subclasses dispatch writes differently while sharing Writable base type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let withDoWrite = new WritableTestBase();
      let withDoWritev = new WritableWithDoWritev();
      expect(withDoWrite.writable).assertTrue();
      expect(withDoWritev.writable).assertTrue();
      withDoWrite.write('polymorphism-a');
      expect(withDoWrite.dataChunk).assertEqual('polymorphism-a');
      withDoWritev.cork();
      withDoWritev.write('batch-first');
      withDoWritev.write('batch-second');
      withDoWritev.uncork();
      expect(withDoWritev.chunks).assertEqual('batch-first');
      expect(withDoWrite.writable).assertTrue();
      expect(withDoWritev.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_1200
     * @tc.name testStreamWritableConstructor012
     * @tc.desc Verify writing to a subclass without doWrite reports 10200035 and clears writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let withoutDoWrite = new WritableNoDoWrite();
      expect(withoutDoWrite.writable).assertTrue();
      try {
        withoutDoWrite.write('polymorphism-b');
        expect().assertFail();
      } catch (e) {
        expect(e.code).assertEqual(10200035);
      }
      expect(withoutDoWrite.writable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_1300
     * @tc.name testStreamWritableConstructor013
     * @tc.desc Verify every constructed subclass reports writableObjectMode false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let withDoWrite = new WritableTestBase();
      let withoutDoWrite = new WritableNoDoWrite();
      let withDoWritev = new WritableWithDoWritev();
      expect(withDoWrite.writableObjectMode).assertFalse();
      expect(withoutDoWrite.writableObjectMode).assertFalse();
      expect(withDoWritev.writableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_1400
     * @tc.name testStreamWritableConstructor014
     * @tc.desc Verify 100 independently constructed instances maintain per-instance write data isolation with no cross-instance contamination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instances: Array<WritableTestBase> = [];
      for (let i = 0; i < 100; i++) {
        let ws = new WritableTestBase();
        ws.write('payload-' + i.toString());
        instances.push(ws);
      }
      expect(instances.length).assertEqual(100);
      for (let i = 0; i < 100; i++) {
        expect(instances[i].dataChunk).assertEqual('payload-' + i.toString());
      }
      for (let i = 0; i < 100; i++) {
        expect(instances[i].writable).assertTrue();
        expect(instances[i].writableEnded).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_1500
     * @tc.name testStreamWritableConstructor015
     * @tc.desc Verify end immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let writableAtFinish: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("finish", (): void => {
            writableAtFinish = ws.writable;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(writableAtFinish).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_1600
     * @tc.name testStreamWritableConstructor016
     * @tc.desc Verify end after construction then construct a new instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws1 = new WritableTestBase();
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws1.on('finish', (): void => {
            finishedAtFinish = ws1.writableFinished;
            resolve(undefined as void);
          });
        });
        ws1.end();
        await finishPromise;
        expect(finishedAtFinish).assertTrue();
        let ws2 = new WritableTestBase();
        let result = ws2.write("test");
        expect(result).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_1700
     * @tc.name testStreamWritableConstructor017
     * @tc.desc Verify a locally constructed writable inside a closure completes full write-cork-uncork-end-finish lifecycle and returns collected data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let createAndUse = (): WritableTestBase => {
          let ws = new WritableTestBase();
          ws.write('closure-payload');
          return ws;
        };
        let ws = createAndUse();
        expect(ws.writable).assertTrue();
        expect(ws.dataChunk).assertEqual('closure-payload');
        let finished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finished = true;
            resolve(undefined as void);
          });
          ws.end('closure-final');
        });
        expect(finished).assertTrue();
        expect(ws.writableFinished).assertTrue();
        expect(ws.dataChunk).assertEqual('closure-final');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_1800
     * @tc.name testStreamWritableConstructor018
     * @tc.desc Verify writableCorked counter state machine increments on cork, decrements on uncork, and clamps at 0 on underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.writableCorked).assertEqual(0);
      ws.cork();
      ws.cork();
      ws.cork();
      expect(ws.writableCorked).assertEqual(3);
      ws.uncork();
      ws.uncork();
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      ws.uncork();
      expect(ws.writableCorked).assertEqual(0);
      ws.cork();
      expect(ws.writable).assertTrue();
      ws.uncork();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_1900
     * @tc.name testStreamWritableConstructor019
     * @tc.desc Verify writableLength tracks buffered bytes under cork, resets to 0 on uncork, and stays 0 after async doWrite consumption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        expect(ws.writableLength).assertEqual(0);
        ws.cork();
        ws.write('length-data-1');
        ws.write('length-data-2');
        ws.write('length-data-3');
        expect(ws.writableLength).assertEqual(39);
        ws.uncork();
        expect(ws.writableLength).assertEqual(0);
        await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
          ws.write('async-length-data', 'utf8', (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
              return;
            }
            resolve(undefined as void);
          });
        });
        expect(ws.writableLength).assertEqual(0);
        expect(ws.dataChunk).assertEqual('async-length-data');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_2000
     * @tc.name testStreamWritableConstructor020
     * @tc.desc Verify writing data immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let result = ws.write("hello");
      expect(result).assertTrue();
      expect(ws.dataChunk).assertEqual("hello");
      expect(ws.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_2100
     * @tc.name testStreamWritableConstructor021
     * @tc.desc Verify a newly constructed writable enters the ended state after end() without data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        expect(ws.writableEnded).assertFalse();
        let endedAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        let writableAtFinish: boolean = true;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            endedAtFinish = ws.writableEnded;
            finishedAtFinish = ws.writableFinished;
            writableAtFinish = ws.writable;
            resolve(undefined as void);
          });
        });
        ws.end();
        expect(ws.writableEnded).assertTrue();
        await finishPromise;
        expect(endedAtFinish).assertTrue();
        expect(finishedAtFinish).assertTrue();
        expect(writableAtFinish).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_2200
     * @tc.name testStreamWritableConstructor022
     * @tc.desc Verify corking into buffered mode immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.cork()).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_2300
     * @tc.name testStreamWritableConstructor023
     * @tc.desc Verify registering event listeners with on immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let drainCalled: boolean = false;
      ws.on('drain', (): void => {
        drainCalled = true;
      });
      expect(drainCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_2400
     * @tc.name testStreamWritableConstructor024
     * @tc.desc Verify setDefaultEncoding immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      ws.setDefaultEncoding('utf-8');
      let result = ws.write("test");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_2500
     * @tc.name testStreamWritableConstructor025
     * @tc.desc Verify instanceof inheritance hierarchy: subclass is Writable and Object, but not Readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      let isWritable: boolean = isInstanceOfStreamWritable(ws);
      expect(isWritable).assertTrue();
      let isObject: boolean = ws instanceof Object;
      expect(isObject).assertTrue();
      let isReadable: boolean = ws instanceof stream.Readable;
      expect(isReadable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_2600
     * @tc.name testStreamWritableConstructor026
     * @tc.desc Verify writableHighWatermark is always 16384
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableTestBase();
      expect(ws.writableHighWatermark).assertEqual(16384);
      ws.write('highwatermark-test');
      expect(ws.writableHighWatermark).assertEqual(16384);
      ws.cork();
      ws.write('buffered');
      expect(ws.writableHighWatermark).assertEqual(16384);
      ws.uncork();
      expect(ws.writableHighWatermark).assertEqual(16384);
      ws.setDefaultEncoding('gbk');
      expect(ws.writableHighWatermark).assertEqual(16384);
      ws.end();
      expect(ws.writableHighWatermark).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_2700
     * @tc.name testStreamWritableConstructor027
     * @tc.desc Verify stream instances stored in collections maintain reference identity, typeof classification and constructor.name consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws1 = new WritableTestBase();
      let ws2 = new WritableTestBase();
      let map = new Map<WritableTestBase, string>();
      map.set(ws1, 'first');
      map.set(ws2, 'second');
      expect(map.get(ws1)).assertEqual('first');
      expect(map.get(ws2)).assertEqual('second');
      expect(map.size).assertEqual(2);
      let arr: WritableTestBase[] = [ws1, ws2];
      expect(arr.indexOf(ws1)).assertEqual(0);
      expect(arr.indexOf(ws2)).assertEqual(1);
      expect(ws1 === ws2).assertFalse();
      ws1.write('map-instance-data');
      expect(ws1.dataChunk).assertEqual('map-instance-data');
      expect(ws2.dataChunk).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_2800
     * @tc.name testStreamWritableConstructor028
     * @tc.desc Verify a constructed subclass batches payloads through its write-vector hook
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableWithDoWritev();
      ws.cork();
      expect(ws.write('constructor-first')).assertTrue();
      expect(ws.write('constructor-second')).assertTrue();
      expect(ws.writableCorked).assertEqual(1);
      ws.uncork();
      expect(ws.chunks).assertEqual('constructor-first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_2900
     * @tc.name testStreamWritableConstructor029
     * @tc.desc Verify doInitialize in subclass throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let ws = new WritableInitThrow();
        ws.write("test");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_3000
     * @tc.name testStreamWritableConstructor030
     * @tc.desc Verify subclass doInitialize is invoked during construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      WritableInitNoCallback.initStarted = false;
      let ws = new WritableInitNoCallback();
      expect(WritableInitNoCallback.initStarted).assertTrue();
      expect(ws.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_3100
     * @tc.name testStreamWritableConstructor031
     * @tc.desc Verify construction remains writable after doInitialize reports an Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new WritableInitError();
      expect(ws.writable).assertTrue();
      expect(ws.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_CONSTRUCTOR_3200
     * @tc.name testStreamWritableConstructor032
     * @tc.desc Verify a constructed writable accepts final data and completes the finish lifecycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws = new WritableTestBase();
        let dataChunkAtFinish: string = '';
        let endedAtFinish: boolean = false;
        let finishedAtFinish: boolean = false;
        let finishPromise = new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            dataChunkAtFinish = ws.dataChunk as string;
            endedAtFinish = ws.writableEnded;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
        });
        ws.end('constructor-end');
        await finishPromise;
        expect(dataChunkAtFinish).assertEqual('constructor-end');
        expect(endedAtFinish).assertTrue();
        expect(finishedAtFinish).assertTrue();
        done();
      });

  });
}
