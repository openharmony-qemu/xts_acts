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
import { stream } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { WritableTestBase, WritableErrorCb, WritableDoubleCb, SinglePushReadable } from '../../StreamTestBase';

class CountWritable extends stream.Writable {
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
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

class BackpressureWritable extends stream.Writable {
  public firstReturn: boolean = false;
  public callCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.callCount++;
    callback.unsafeCall();
  }
}

class SequenceReadable extends stream.Readable {
  private chunks: string[] = [];
  private index: int = 0;

  constructor(chunks: string[]) {
    super();
    this.chunks = chunks;
  }

  doRead(size: int): void {
    if (this.index < this.chunks.length) {
      this.push(this.chunks[this.index]);
      this.index++;
    } else {
      this.push(null);
    }
  }
}

export default function StreamWritableEventSequenceTest(): void {
  describe('StreamWritableEventSequenceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_0100
     * @tc.name testStreamWritableEventSequence001
     * @tc.desc Verify finish fires exactly once for a piped source and for multiple writes followed by end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let source: SinglePushReadable = new SinglePushReadable();
        let ws: WritableTestBase = new WritableTestBase();
        let finishCount: int = 0;
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on("finish", (): void => {
            finishCount++;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined);
          });
          source.pipe(ws);
        });
        expect(finishCount).assertEqual(1);
        expect(finishedAtFinish).assertTrue();
        let multiFinish: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let target: WritableTestBase = new WritableTestBase();
          target.on("finish", (): void => {
            multiFinish++;
            resolve(undefined);
          });
          target.write("a", "utf8");
          target.write("b", "utf8");
          target.write("c", "utf8");
          target.end();
        });
        expect(multiFinish).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_0200
     * @tc.name testStreamWritableEventSequence002
     * @tc.desc Verify end() without write still triggers finish event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: WritableTestBase = new WritableTestBase();
        let finishCount: int = 0;
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishCount++;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end();
        });
        expect(finishCount).assertEqual(1);
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_0300
     * @tc.name testStreamWritableEventSequence003
     * @tc.desc Verify end(chunk) delivers final chunk then triggers finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: WritableTestBase = new WritableTestBase();
        let finishCount: int = 0;
        let chunkAtFinish: string | Uint8Array = '';
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishCount++;
            chunkAtFinish = ws.dataChunk;
            finishedAtFinish = ws.writableFinished;
            resolve(undefined as void);
          });
          ws.end('final', 'utf8');
        });
        expect(finishCount).assertEqual(1);
        expect(chunkAtFinish).assertEqual('final');
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_0400
     * @tc.name testStreamWritableEventSequence004
     * @tc.desc Verify end(chunk, encoding, callback) full signature delivers chunk then callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: WritableTestBase = new WritableTestBase();
        let cbFired: boolean = false;

        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => resolve(undefined as void));
          ws.end('final', 'utf8', (): void => {
            cbFired = true;
          });
        });

        expect(cbFired).assertTrue();
        expect(ws.dataChunk).assertEqual('final');
        expect(ws.dataEncoding).assertEqual('utf8');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_0500
     * @tc.name testStreamWritableEventSequence005
     * @tc.desc Verify cork buffers writes until uncork delivers every chunk in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws: CollectWritable = new CollectWritable();
      ws.cork();
      ws.write('a', 'utf8');
      ws.write('b', 'utf8');
      ws.write('c', 'utf8');
      ws.uncork();
      expect(ws.writeCount).assertEqual(3);
      expect(ws.received.length).assertEqual(3);
      expect(ws.received.join('')).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_0600
     * @tc.name testStreamWritableEventSequence006
     * @tc.desc Verify multiple cork/uncork cycles replay all buffered writes independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws: CountWritable = new CountWritable();
      ws.cork();
      ws.write('a', 'utf8');
      ws.uncork();
      expect(ws.writeCount).assertEqual(1);
      ws.cork();
      ws.write('b', 'utf8');
      ws.write('c', 'utf8');
      ws.uncork();
      expect(ws.writeCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_0700
     * @tc.name testStreamWritableEventSequence007
     * @tc.desc Verify error in doWrite triggers the error event asynchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: WritableErrorCb = new WritableErrorCb();
        let errName: string = '';
        let errMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: Error): void => {
            errName = err.name;
            errMessage = err.message;
            resolve(undefined);
          });
          ws.write('x', 'utf8');
        });
        expect(errName).assertEqual('Error');
        expect(errMessage).assertEqual('write error');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_0800
     * @tc.name testStreamWritableEventSequence008
     * @tc.desc Verify double callback invocation emits BusinessError 10200037
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: WritableDoubleCb = new WritableDoubleCb();
        let errName: string = '';
        let errCode: number = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: Error): void => {
            errName = err.name;
            errCode = (err as BusinessError).code;
            resolve(undefined);
          });
          ws.write('x', 'utf8');
        });
        expect(errName).assertEqual('BusinessError');
        expect(errCode).assertEqual(10200037);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_0900
     * @tc.name testStreamWritableEventSequence009
     * @tc.desc Verify write after end returns false and emits BusinessError 10200036
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: WritableTestBase = new WritableTestBase();
        ws.end();
        let errName: string = '';
        let errCode: number = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('error', (err: Error): void => {
            errName = err.name;
            errCode = (err as BusinessError).code;
            resolve(undefined);
          });
          let result: boolean = ws.write('after', 'utf8');
          expect(result).assertFalse();
        });
        expect(errName).assertEqual('BusinessError');
        expect(errCode).assertEqual(10200036);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_1000
     * @tc.name testStreamWritableEventSequence010
     * @tc.desc Verify end after end throws BusinessError 10200036
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws: WritableTestBase = new WritableTestBase();
      ws.end();
      try {
        ws.end();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
        expect(e.code).assertEqual(10200036);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_1100
     * @tc.name testStreamWritableEventSequence011
     * @tc.desc Verify finish fires before close in normal end sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: WritableTestBase = new WritableTestBase();
        let order: string[] = [];
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            order.push('finish');
          });
          ws.on('close', (): void => {
            order.push('close');
            resolve(undefined);
          });
          ws.end();
        });
        expect(order.length).assertEqual(2);
        expect(order[0]).assertEqual('finish');
        expect(order[1]).assertEqual('close');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_1200
     * @tc.name testStreamWritableEventSequence012
     * @tc.desc Verify cork buffers write until uncork even across encoding switches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws: WritableTestBase = new WritableTestBase();
      ws.cork();
      ws.setDefaultEncoding('gbk');
      ws.write('中文');
      ws.uncork();
      expect(ws.dataEncoding).assertEqual('gbk');
      expect(ws.writeCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_1300
     * @tc.name testStreamWritableEventSequence013
     * @tc.desc Verify end with Uint8Array chunk delivers bytes then finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: WritableTestBase = new WritableTestBase();
        let finishFired: boolean = false;
        let arr: Uint8Array = new Uint8Array([4, 5, 6]);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishFired = true;
            resolve(undefined as void);
          });
          ws.end(arr, 'utf8');
        });
        expect(finishFired).assertTrue();
        expect(ws.dataChunk).assertEqual(arr);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_1400
     * @tc.name testStreamWritableEventSequence014
     * @tc.desc Verify write empty Uint8Array invokes doWrite with a zero-length chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws: WritableTestBase = new WritableTestBase();
      let before: int = ws.writeCount;
      ws.write(new Uint8Array([]), 'utf8');
      expect(ws.writeCount).assertEqual(before + 1);
      expect((ws.dataChunk as Uint8Array).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_1500
     * @tc.name testStreamWritableEventSequence015
     * @tc.desc Verify end callback and finish event both complete before close
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: WritableTestBase = new WritableTestBase();
        let order: string[] = [];

        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            order.push('finish');
          });
          ws.on('close', (): void => {
            resolve(undefined);
          });
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
          ws.end('', 'utf8', (): void => {
            order.push('callback');
          });
        });

        expect(order.includes('callback')).assertTrue();
        expect(order.includes('finish')).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_1600
     * @tc.name testStreamWritableEventSequence016
     * @tc.desc Verify nested cork flushed on end delivers all writes before finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: WritableTestBase = new WritableTestBase();
        let writeCountAtFinish: int = 0;
        let finishedAtFinish: boolean = false;
        let corkedAtFinish: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            writeCountAtFinish = ws.writeCount;
            finishedAtFinish = ws.writableFinished;
            corkedAtFinish = ws.writableCorked;
            resolve(undefined);
          });
          ws.cork();
          ws.cork();
          ws.write('a', 'utf8');
          ws.write('b', 'utf8');
          ws.end();
        });
        expect(writeCountAtFinish).assertEqual(2);
        expect(finishedAtFinish).assertTrue();
        expect(corkedAtFinish).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_1700
     * @tc.name testStreamWritableEventSequence017
     * @tc.desc Verify nested cork defers writes until the outer uncork and preserves delivery order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: CollectWritable = new CollectWritable();
        let finishObserved: boolean = false;
        let corkedAfterNested: int = 0;
        let writesBeforeFirstUncork: int = 0;
        let corkedAfterFirstUncork: int = 0;
        let writesAfterFirstUncork: int = 0;
        let corkedAfterSecondUncork: int = 0;
        let writesAfterSecondUncork: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishObserved = true;
            resolve(undefined as void);
          });
          ws.cork();
          ws.write('outer', 'utf8');
          ws.cork();
          ws.write('inner', 'utf8');
          corkedAfterNested = ws.writableCorked;
          writesBeforeFirstUncork = ws.writeCount;
          ws.uncork();
          corkedAfterFirstUncork = ws.writableCorked;
          writesAfterFirstUncork = ws.writeCount;
          ws.uncork();
          corkedAfterSecondUncork = ws.writableCorked;
          writesAfterSecondUncork = ws.writeCount;
          ws.end();
        });
        expect(corkedAfterNested).assertEqual(2);
        expect(writesBeforeFirstUncork).assertEqual(0);
        expect(corkedAfterFirstUncork).assertEqual(1);
        expect(writesAfterFirstUncork).assertEqual(0);
        expect(corkedAfterSecondUncork).assertEqual(0);
        expect(writesAfterSecondUncork).assertEqual(2);
        expect(ws.received[0]).assertEqual('outer');
        expect(ws.received[1]).assertEqual('inner');
        expect(finishObserved).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_1800
     * @tc.name testStreamWritableEventSequence018
     * @tc.desc Verify writableFinished false initially true after finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: WritableTestBase = new WritableTestBase();
        expect(ws.writableFinished).assertFalse();
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishedAtFinish = ws.writableFinished;
            resolve(undefined);
          });
          ws.end();
        });
        expect(finishedAtFinish).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_1900
     * @tc.name testStreamWritableEventSequence019
     * @tc.desc Verify write sequence a, b, and c delivers chunks in order to doWrite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: CollectWritable = new CollectWritable();
        let callbackOrder: string[] = [];
        let acceptedA: boolean = false;
        let acceptedB: boolean = false;
        let acceptedC: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          acceptedA = ws.write('a', 'utf8', (): void => {

            callbackOrder.push('a');
          });
          acceptedB = ws.write('b', 'utf8', (): void => {

            callbackOrder.push('b');
          });
          acceptedC = ws.write('c', 'utf8', (): void => {

            callbackOrder.push('c');
            resolve(undefined as void);
          });
        });
        expect(acceptedA).assertTrue();
        expect(acceptedB).assertTrue();
        expect(acceptedC).assertTrue();
        expect(ws.writeCount).assertEqual(3);
        expect(ws.received.length).assertEqual(3);
        expect(ws.received[0]).assertEqual('a');
        expect(ws.received[1]).assertEqual('b');
        expect(ws.received[2]).assertEqual('c');
        expect(ws.received.join('')).assertEqual('abc');
        expect(callbackOrder.join('')).assertEqual('abc');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_2000
     * @tc.name testStreamWritableEventSequence020
     * @tc.desc Verify backpressure write to drain to subsequent write to end triggers finish once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: WritableTestBase = new WritableTestBase();
        let drainCount: int = 0;
        let finishCount: int = 0;
        let backpressured: boolean = ws.write(new Uint8Array(20000), 'utf8');
        expect(backpressured).assertFalse();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('drain', (): void => {
            drainCount++;
            resolve(undefined);
          });
        });
        expect(drainCount).assertEqual(1);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishCount++;
            resolve(undefined);
          });
          ws.write('tail', 'utf8');
          ws.end();
        });
        expect(finishCount).assertEqual(1);
        expect(ws.writeCount).assertEqual(2);
        expect(ws.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_EVENT_SEQUENCE_2100
     * @tc.name testStreamWritableEventSequence021
     * @tc.desc Verify cork buffers mixed type and encoding writes then uncork and end deliver in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableEventSequence021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ws: CollectWritable = new CollectWritable();
        let arr: Uint8Array = new Uint8Array([1, 2, 3]);
        let finishCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            finishCount++;
            resolve(undefined);
          });
          ws.cork();
          ws.write('a', 'utf8');
          ws.write('中', 'gbk');
          ws.write(arr, 'utf8');
          ws.uncork();
          ws.end();
        });
        expect(ws.writeCount).assertEqual(3);
        expect(ws.received[0] as string).assertEqual('a');
        expect(ws.received[1] as string).assertEqual('中');
        expect(ws.received[2] as Uint8Array).assertEqual(arr);
        expect(finishCount).assertEqual(1);
        expect(ws.writableCorked).assertEqual(0);

        done();
      });
  });
}
