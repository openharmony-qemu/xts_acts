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
import {
  ScenarioAsyncTransform,
  ScenarioCollectWritable,
  ScenarioReadable,
  ScenarioDuplex
} from '../../StreamComposeTestBase';
import { stream } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

class InvalidOrderDelayedWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    setTimeout((): void => {
      callback.unsafeCall();
    }, 20);
  }
}

class InvalidOrderWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class InvalidOrderTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class InvalidOrderDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class ProtocolWritable extends stream.Writable {
  public records: string[] = [];

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.records.push(chunk.toString());
    callback.unsafeCall();
  }
}

class ProtocolDoubleCallbackWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class ProtocolErrorWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error('write rejected'));
  }
}

class ProtocolTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }
}

class ProtocolDoubleCallbackTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    callback.unsafeCall();
    callback.unsafeCall();
  }
}

class ProtocolErrorTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error('transform rejected'));
  }
}

class ProtocolDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class CommitFrameTransform extends stream.Transform {
  public pending: string = '';
  public frames: string[] = [];
  public transformCount: int = 0;
  public flushCount: int = 0;
  private failFrame: string = '';

  constructor(failFrame: string = '') {
    super();
    this.failFrame = failFrame;
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.pending += chunk.toString();
    this.transformCount++;
    let separator: int = this.pending.indexOf('|');
    while (separator >= 0) {
      let frame: string = this.pending.substring(0, separator);
      this.pending = this.pending.substring(separator + 1);
      if (frame === this.failFrame) {
        callback.unsafeCall(new Error('commit frame rejected: ' + frame));
        return;
      }
      this.frames.push(frame);
      this.push('VALID:' + frame);
      separator = this.pending.indexOf('|');
    }
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    this.flushCount++;
    if (this.pending.length > 0) {
      callback.unsafeCall(new Error('incomplete commit frame: ' + this.pending));
      return;
    }
    this.push('COMMIT');
    callback.unsafeCall();
  }
}

function connectCommitBarrierFlow(source: ScenarioReadable, transform: CommitFrameTransform,
  duplex: ScenarioDuplex, sink: ScenarioCollectWritable): void {
  source.on('data', (chunk: Object): void => {
    transform.write(chunk.toString(), 'utf8');
  });
  source.on('end', (): void => {
    transform.end();
  });
  transform.on('data', (chunk: Object): void => {
    duplex.write(chunk.toString(), 'utf8');
  });
  transform.on('end', (): void => {
    duplex.end();
  });
  duplex.on('data', (chunk: Object): void => {
    sink.write(chunk.toString(), 'utf8');
  });
  duplex.on('end', (): void => {
    sink.end();
  });
  source.resume();
}

export default function StreamProtocolLifecycleFlowTest(): void {
  describe('StreamProtocolLifecycleFlowTest', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_0100
     * @tc.name testStreamProtocolLifecycleFlow001
     * @tc.desc Verify two asynchronous Transform stages preserve source order despite different delays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedSinkText: string = '';
        let capturedSinkWriteCount: int = 0;
        let capturedFirstData: int = 0;
        let capturedFirstTransformCount: int = 0;
        let capturedSecondData: int = 0;
        let capturedFirstValues: string[] = [];
        let capturedFirstSecondRecords: string[] = [];
        let capturedSecondValues: string[] = [];
        let capturedSecondSinkRecords: string[] = [];
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            let source = new ScenarioReadable(['a', 'b']);
            let first = new ScenarioAsyncTransform('A:', 5);
            let second = new ScenarioAsyncTransform('B:', 1);
            let sink = new ScenarioCollectWritable();
            let firstData: int = 0;
            let secondData: int = 0;
            first.on('data', (chunk: Object): void => {
              let value: string = chunk.toString();
              firstData++;
              capturedFirstValues.push(value);
              second.write(value, 'utf8', (err?: Error): void => {
                if (err !== undefined) {
                  reject(err);
                  return;
                }
                capturedFirstSecondRecords.push(second.inputRecords[second.inputRecords.length - 1] as string);
              });
            });
            second.on('data', (chunk: Object): void => {
              let value: string = chunk.toString();
              secondData++;
              capturedSecondValues.push(value);
              sink.write(value, 'utf8', (err?: Error): void => {
                if (err !== undefined) {
                  reject(err);
                  return;
                }
                capturedSecondSinkRecords.push(sink.records[sink.writeCount - 1] as string);
              });
            });
            source.on('data', (chunk: Object): void => {
              first.write(chunk.toString(), 'utf8');
            });
            source.on('end', (): void => {
              first.end();
            });
            first.on('end', (): void => {
              second.end();
            });
            second.on('end', (): void => {
              sink.end();
            });
            sink.on('finish', (): void => {
              capturedSinkText = sink.text;
              capturedSinkWriteCount = sink.writeCount;
              capturedFirstData = firstData;
              capturedFirstTransformCount = first.transformCount;
              capturedSecondData = secondData;
              resolve(undefined as void);
            });
            source.resume();
          });
          expect(capturedSinkText).assertEqual('B:A:aB:A:b');
          expect(capturedFirstData).assertEqual(2);
          expect(capturedFirstTransformCount).assertEqual(2);
          expect(capturedSecondData).assertEqual(2);
          expect(capturedSinkWriteCount).assertEqual(2);
          for (let i: int = 0; i < capturedFirstValues.length; i++) {
            expect(capturedFirstValues[i]).assertEqual('A:' + ['a', 'b'][i]);
          }
          for (let i: int = 0; i < capturedSecondValues.length; i++) {
            expect(capturedSecondValues[i]).assertEqual('B:A:' + ['a', 'b'][i]);
          }
          for (let i: int = 0; i < capturedFirstSecondRecords.length; i++) {
            expect(capturedFirstSecondRecords[i]).assertEqual(capturedFirstValues[i]);
          }
          for (let i: int = 0; i < capturedSecondSinkRecords.length; i++) {
            expect(capturedSecondSinkRecords[i]).assertEqual(capturedSecondValues[i]);
          }
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_0200
     * @tc.name testStreamProtocolLifecycleFlow002
     * @tc.desc Verify an empty asynchronous pipeline still executes both flush stages in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedSinkText: string = '';
        let capturedFirstTransformCount: int = 0;
        let capturedFirstFlushCount: int = 0;
        let capturedSecondFlushCount: int = 0;
        let capturedFirstUnexpected: string[] = [];
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ScenarioReadable([]);
          let first = new ScenarioAsyncTransform('A:', 2);
          let second = new ScenarioAsyncTransform('B:', 2);
          let sink = new ScenarioCollectWritable();
          first.on('data', (chunk: Object): void => {
            capturedFirstUnexpected.push(chunk.toString());
          });
          first.on('end', (): void => {
            second.end();
          });
          second.on('end', (): void => {
            sink.end();
          });
          sink.on('finish', (): void => {
            capturedSinkText = sink.text;
            capturedFirstTransformCount = first.transformCount;
            capturedFirstFlushCount = first.flushCount;
            capturedSecondFlushCount = second.flushCount;
            resolve(undefined as void);
          });
          source.on('end', (): void => {
            first.end();
          });
          source.resume();
        });
        expect(capturedSinkText).assertEqual('');
        expect(capturedFirstTransformCount).assertEqual(0);
        expect(capturedFirstFlushCount).assertEqual(0);
        expect(capturedSecondFlushCount).assertEqual(0);
        for (let i: int = 0; i < capturedFirstUnexpected.length; i++) {
          expect(capturedFirstUnexpected[i]).assertEqual('unexpected');
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_0300
     * @tc.name testStreamProtocolLifecycleFlow003
     * @tc.desc Verify a terminal asynchronous flush is observed by the downstream data callback before finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedSinkText: string = '';
        let capturedSeenTrailer: boolean = false;
        let capturedSinkWriteCount: int = 0;
        let capturedFlushCountAtTrailer: int = 0;
        let capturedTransformValues: string[] = [];
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ScenarioReadable(['payload']);
          let transform = new ScenarioAsyncTransform('P:', 3, '<TRAILER>');
          let sink = new ScenarioCollectWritable();
          let seenTrailer: boolean = false;
          transform.on('data', (chunk: Object): void => {
            let value: string = chunk.toString();
            if (value === '<TRAILER>') {
              seenTrailer = true;
              capturedFlushCountAtTrailer = transform.flushCount;
            } else {
              capturedTransformValues.push(value);
            }
            sink.write(value, 'utf8');
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('end', (): void => {
            sink.end();
          });
          sink.on('finish', (): void => {
            capturedSinkText = sink.text;
            capturedSeenTrailer = seenTrailer;
            capturedSinkWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          source.resume();
        });
        expect(capturedSinkText).assertEqual('P:payload<TRAILER>');
        expect(capturedSeenTrailer).assertTrue();
        expect(capturedSinkWriteCount).assertEqual(2);
        expect(capturedFlushCountAtTrailer).assertEqual(1);
        for (let i: int = 0; i < capturedTransformValues.length; i++) {
          expect(capturedTransformValues[i]).assertEqual('P:payload');
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_0400
     * @tc.name testStreamProtocolLifecycleFlow004
     * @tc.desc Verify a false write result recovers through drain and preserves the following record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedSinkText: string = '';
        let capturedWriteCount: int = 0;
        let capturedCallbackCount: int = 0;
        let capturedWritableFinished: boolean = false;
        let capturedWriteRecord0: string = '';
        let capturedDrainRecord0: string = '';
        let capturedTailRecord: string = '';
        let capturedTailAccepted: boolean = false;
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            let sink = new ScenarioCollectWritable();
            let large: string = 'L'.repeat(20000);
            sink.on('drain', (): void => {
              capturedDrainRecord0 = sink.records[0];
              let accepted: boolean = sink.write('tail', 'utf8', (err?: Error): void => {
                if (err !== undefined) {
                  reject(err);
                  return;
                }
                capturedTailRecord = sink.records[1];
              });
              capturedTailAccepted = accepted;
              sink.end();
            });
            sink.on('finish', (): void => {
              capturedSinkText = sink.text;
              capturedWriteCount = sink.writeCount;
              capturedCallbackCount = sink.callbackCount;
              capturedWritableFinished = sink.writableFinished;
              resolve(undefined as void);
            });
            let result: boolean = sink.write(large, 'utf8', (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              capturedWriteRecord0 = sink.records[0];
            });
            expect(result).assertFalse();
          });
          expect(capturedWriteRecord0).assertEqual('L'.repeat(20000));
          expect(capturedDrainRecord0).assertEqual('L'.repeat(20000));
          expect(capturedTailAccepted).assertTrue();
          expect(capturedTailRecord).assertEqual('tail');
          expect(capturedSinkText).assertEqual('L'.repeat(20000) + 'tail');
          expect(capturedWriteCount).assertEqual(2);
          expect(capturedCallbackCount).assertEqual(2);
          expect(capturedWritableFinished).assertTrue();
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_0500
     * @tc.name testStreamProtocolLifecycleFlow005
     * @tc.desc Verify multiple pressure cycles pause and resume the source in the same record order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedSinkText: string = '';
        let capturedDataCount: int = 0;
        let capturedDrainCount: int = 0;
        let capturedSinkWriteCount: int = 0;
        let capturedSourceValues: string[] = [];
        let capturedSinkRecords: string[] = [];
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            let largeA: string = 'A'.repeat(20000);
            let largeB: string = 'B'.repeat(20000);
            let source = new ScenarioReadable([largeA, 'middle', largeB, 'last']);
            let sink = new ScenarioCollectWritable();
            let dataCount: int = 0;
            let drainCount: int = 0;
            source.on('data', (chunk: Object): void => {
              let value: string = chunk.toString();
              dataCount++;
              capturedSourceValues.push(value);
              let accepted: boolean = sink.write(value, 'utf8', (err?: Error): void => {
                if (err !== undefined) {
                  reject(err);
                  return;
                }
                capturedSinkRecords.push(sink.records[dataCount - 1] as string);
              });
              if (!accepted) {
                source.pause();
              }
            });
            sink.on('drain', (): void => {
              drainCount++;
              source.resume();
            });
            source.on('end', (): void => {
              sink.end();
            });
            sink.on('finish', (): void => {
              capturedSinkText = sink.text;
              capturedDataCount = dataCount;
              capturedDrainCount = drainCount;
              capturedSinkWriteCount = sink.writeCount;
              resolve(undefined as void);
            });
            source.resume();
          });
          expect(capturedSinkText).assertEqual('A'.repeat(20000) + 'middle' + 'B'.repeat(20000) + 'last');
          expect(capturedDataCount).assertEqual(4);
          expect(capturedDrainCount).assertEqual(2);
          expect(capturedSinkWriteCount).assertEqual(4);
          for (let i: int = 0; i < capturedSourceValues.length; i++) {
            let expectedValue: string = i === 0 ? 'A'.repeat(20000) :
              (i === 1 ? 'middle' : (i === 2 ? 'B'.repeat(20000) : 'last'));
            expect(capturedSourceValues[i]).assertEqual(expectedValue);
          }
          for (let i: int = 0; i < capturedSinkRecords.length; i++) {
            expect(capturedSinkRecords[i]).assertEqual(capturedSourceValues[i]);
          }
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_0600
     * @tc.name testStreamProtocolLifecycleFlow006
     * @tc.desc Verify corked Writable records are released in order before finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedSinkText: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableCorked: int = 0;
        let capturedRecord0: string = '';
        let capturedRecord1: string = '';
        let capturedRecord2: string = '';
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            let sink = new ScenarioCollectWritable();
            sink.cork();
            sink.write('T:one', 'utf8', (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              capturedRecord0 = sink.records[0];
            });
            sink.write('T:two', 'utf8', (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              capturedRecord1 = sink.records[1];
            });
            sink.write('T:three', 'utf8', (err?: Error): void => {
              if (err !== undefined) {
                reject(err);
                return;
              }
              capturedRecord2 = sink.records[2];
            });
            sink.on('finish', (): void => {
              capturedSinkText = sink.text;
              capturedWriteCount = sink.writeCount;
              capturedWritableCorked = sink.writableCorked;
              resolve(undefined as void);
            });
            setTimeout((): void => {
              sink.uncork();
              sink.end();
            }, 0);
          });
          expect(capturedSinkText).assertEqual('T:oneT:twoT:three');
          expect(capturedWriteCount).assertEqual(3);
          expect(capturedWritableCorked).assertEqual(0);
          expect(capturedRecord0).assertEqual('T:one');
          expect(capturedRecord1).assertEqual('T:two');
          expect(capturedRecord2).assertEqual('T:three');
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_0700
     * @tc.name testStreamProtocolLifecycleFlow007
     * @tc.desc Verify an empty source closes a pressure-aware sink normally without a phantom recovery record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedSinkText: string = '';
        let capturedRecordsLength: int = 0;
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        let capturedSourceUnexpected: string[] = [];
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ScenarioReadable([]);
          let sink = new ScenarioCollectWritable(2);
          source.on('data', (chunk: Object): void => {
            capturedSourceUnexpected.push(chunk.toString());
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          sink.on('finish', (): void => {
            capturedSinkText = sink.text;
            capturedRecordsLength = sink.records.length;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          source.resume();
        });
        expect(capturedSinkText).assertEqual('');
        expect(capturedRecordsLength).assertEqual(0);
        expect(capturedWriteCount).assertEqual(0);
        expect(capturedWritableFinished).assertTrue();
        for (let i: int = 0; i < capturedSourceUnexpected.length; i++) {
          expect(capturedSourceUnexpected[i]).assertEqual('unexpected');
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_0800
     * @tc.name testStreamProtocolLifecycleFlow008
     * @tc.desc Verify a write issued after end is rejected with error 10200036 for delayed and immediate end paths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedErrorName: string = "";
        let capturedErrorCode: int = 0;
        let capturedWritableEnded: boolean = false;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let writable = new InvalidOrderDelayedWritable();
          writable.on("error", (error: Error): void => {
            capturedErrorName = error.name;
            capturedErrorCode = (error as BusinessError).code;
            capturedWritableEnded = writable.writableEnded;
            capturedWritableFinished = writable.writableFinished;
            resolve(undefined as void);
          });
          writable.write("accepted", "utf8");
          writable.end();
          writable.write("late", "utf8");
        });
        expect(capturedErrorName).assertEqual("BusinessError");
        expect(capturedErrorCode).assertEqual(10200036);
        expect(capturedWritableEnded).assertTrue();
        expect(capturedWritableFinished).assertFalse();
        let endChunkName: string = "";
        let endChunkCode: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let writable = new ProtocolWritable();
          writable.on("error", (error: Error): void => {
            endChunkName = error.name;
            endChunkCode = (error as BusinessError).code;
            resolve(undefined as void);
          });
          writable.end("accepted", "utf8");
          writable.write("late", "utf8");
        });
        expect(endChunkName).assertEqual("BusinessError");
        expect(endChunkCode).assertEqual(10200036);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_0900
     * @tc.name testStreamProtocolLifecycleFlow009
     * @tc.desc Verify a Writable doWrite callback invoked twice reports error 10200037
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedErrorName: string = '';
        let capturedErrorCode: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let writable = new ProtocolDoubleCallbackWritable();
          writable.on('error', (error: Error): void => {
            capturedErrorName = error.name;
            capturedErrorCode = (error as BusinessError).code;
            resolve(undefined as void);
          });
          writable.write('duplicated', 'utf8');
        });
        expect(capturedErrorName).assertEqual('BusinessError');
        expect(capturedErrorCode).assertEqual(10200037);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_1000
     * @tc.name testStreamProtocolLifecycleFlow010
     * @tc.desc Verify a Writable doWrite error reaches the error callback with its original error type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedErrorName: string = '';
        let capturedErrorMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let writable = new ProtocolErrorWritable();
          writable.on('error', (error: Error): void => {
            capturedErrorName = error.name;
            capturedErrorMessage = error.message;
            resolve(undefined as void);
          });
          writable.write('rejected', 'utf8');
        });
        expect(capturedErrorName).assertEqual('Error');
        expect(capturedErrorMessage).assertEqual('write rejected');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_1100
     * @tc.name testStreamProtocolLifecycleFlow011
     * @tc.desc Verify fragmented commit frames are rebuilt by Transform, acknowledged by Duplex, and committed by Writable in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedSinkText: string = '';
        let capturedFrames: string = '';
        let capturedPending: string = '';
        let capturedTransformCount: int = 0;
        let capturedFlushCount: int = 0;
        let capturedDuplexRecords: string = '';
        let capturedDuplexWriteCount: int = 0;
        let capturedSinkWriteCount: int = 0;
        let capturedLastSinkRecord: string = '';
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ScenarioReadable(['TX|AL', 'PHA|B', 'ETA|']);
          let transform = new CommitFrameTransform();
          let duplex = new ScenarioDuplex('ACK:');
          let sink = new ScenarioCollectWritable();
          sink.on('finish', (): void => {
            capturedSinkText = sink.text;
            capturedFrames = transform.frames.join('|');
            capturedPending = transform.pending;
            capturedTransformCount = transform.transformCount;
            capturedFlushCount = transform.flushCount;
            capturedDuplexRecords = duplex.records.join('|');
            capturedDuplexWriteCount = duplex.writeCount;
            capturedSinkWriteCount = sink.writeCount;
            capturedLastSinkRecord = sink.records[sink.records.length - 1];
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          connectCommitBarrierFlow(source, transform, duplex, sink);
        });
        expect(capturedSinkText).assertEqual('ACK:VALID:TXACK:VALID:ALPHAACK:VALID:BETAACK:COMMIT');
        expect(capturedFrames).assertEqual('TX|ALPHA|BETA');
        expect(capturedPending).assertEqual('');
        expect(capturedTransformCount).assertEqual(3);
        expect(capturedFlushCount).assertEqual(1);
        expect(capturedDuplexRecords).assertEqual('VALID:TX|VALID:ALPHA|VALID:BETA|COMMIT');
        expect(capturedDuplexWriteCount).assertEqual(4);
        expect(capturedSinkWriteCount).assertEqual(4);
        expect(capturedLastSinkRecord).assertEqual('ACK:COMMIT');
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_1200
     * @tc.name testStreamProtocolLifecycleFlow012
     * @tc.desc Verify backpressure at the ACK sink pauses a fragmented four-stage commit flow and drain resumes it without loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedSinkText: string = '';
        let capturedTransformFramesLength: int = 0;
        let capturedPending: string = '';
        let capturedDrainCount: int = 0;
        let capturedDataCount: int = 0;
        let capturedSinkWriteCount: int = 0;
        let capturedLastSinkRecord: string = '';
        let capturedWritableFinished: boolean = false;
        let capturedFlushOrderValid: boolean = true;
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            let largeA: string = 'A'.repeat(20000);
            let largeB: string = 'B'.repeat(20000);
            let source = new ScenarioReadable(['TX|A:' + largeA, '|B:' + largeB, '|']);
            let transform = new CommitFrameTransform();
            let duplex = new ScenarioDuplex('ACK:');
            let sink = new ScenarioCollectWritable(5);
            let drainCount: int = 0;
            let dataCount: int = 0;
            let pending: string[] = [];
            let blocked: boolean = false;
            let ended: boolean = false;
            let flushQueue: Function = (): void => {
              while (!blocked && pending.length > 0) {
                let value: string = pending.shift() as string;
                let currentValue: string = value;
                let accepted: boolean = sink.write(value, 'utf8', (err?: Error): void => {
                  if (err !== undefined) {
                    reject(err);
                    return;
                  }
                  if (sink.records[sink.records.length - 1] !== currentValue) {
                    capturedFlushOrderValid = false;
                  }
                });
                if (!accepted) {
                  blocked = true;
                }
              }
              if (ended && !blocked && pending.length === 0) {
                sink.end();
              }
            };
            source.on('data', (chunk: Object): void => {
              transform.write(chunk.toString(), 'utf8');
            });
            source.on('end', (): void => {
              transform.end();
            });
            transform.on('data', (chunk: Object): void => {
              duplex.write(chunk.toString(), 'utf8');
            });
            transform.on('end', (): void => {
              duplex.end();
            });
            duplex.on('data', (chunk: Object): void => {
              let value: string = chunk.toString();
              dataCount++;
              pending.push(value);
              flushQueue.unsafeCall();
            });
            duplex.on('end', (): void => {
              ended = true;
              flushQueue.unsafeCall();
            });
            sink.on('drain', (): void => {
              drainCount++;
              blocked = false;
              flushQueue.unsafeCall();
            });
            sink.on('finish', (): void => {
              capturedSinkText = sink.text;
              capturedTransformFramesLength = transform.frames.length;
              capturedPending = transform.pending;
              capturedDrainCount = drainCount;
              capturedDataCount = dataCount;
              capturedSinkWriteCount = sink.writeCount;
              capturedLastSinkRecord = sink.records[sink.records.length - 1];
              capturedWritableFinished = sink.writableFinished;
              resolve(undefined as void);
            });
            source.resume();
          });
          expect(capturedSinkText).assertEqual('ACK:VALID:TXACK:VALID:A:' + 'A'.repeat(20000) +
            'ACK:VALID:B:' + 'B'.repeat(20000) + 'ACK:COMMIT');
          expect(capturedTransformFramesLength).assertEqual(3);
          expect(capturedPending).assertEqual('');
          expect(capturedDrainCount).assertEqual(2);
          expect(capturedDataCount).assertEqual(4);
          expect(capturedSinkWriteCount).assertEqual(4);
          expect(capturedLastSinkRecord).assertEqual('ACK:COMMIT');
          expect(capturedWritableFinished).assertTrue();
          expect(capturedFlushOrderValid).assertTrue();
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_1300
     * @tc.name testStreamProtocolLifecycleFlow013
     * @tc.desc Verify a fresh four-stage pipeline retries after a rejected frame without inheriting the failed pipeline state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedFirstErrorName: string = '';
        let capturedFirstErrorMessage: string = '';
        let capturedFirstError: boolean = false;
        let capturedRetryFrames: string = '';
        let capturedBadIndex: int = 0;
        let capturedRetrySinkText: string = '';
        let capturedRetryDuplexWriteCount: int = 0;
        let capturedRetrySinkWriteCount: int = 0;
        let capturedRetryWritableFinished: boolean = false;
        let capturedRetryRecordsValid: boolean = true;
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            let firstSource = new ScenarioReadable(['BAD|']);
            let firstTransform = new CommitFrameTransform('BAD');
            let firstError: boolean = false;
            firstSource.on('data', (chunk: Object): void => {
              firstTransform.write(chunk.toString(), 'utf8');
            });
            firstSource.on('end', (): void => {
            });
            firstTransform.on('error', (error: Error): void => {
              capturedFirstErrorName = error.name;
              capturedFirstErrorMessage = error.message;
              firstError = true;
              let retrySource = new ScenarioReadable(['RE', 'TRY:1|RETRY:2|']);
              let retryTransform = new CommitFrameTransform();
              let retryDuplex = new ScenarioDuplex('ACK:');
              let retrySink = new ScenarioCollectWritable();
              retryTransform.on('data', (chunk: Object): void => {
                retryDuplex.write(chunk.toString(), 'utf8');
              });
              retryTransform.on('end', (): void => {
                retryDuplex.end();
              });
              retryDuplex.on('data', (chunk: Object): void => {
                let value: string = chunk.toString();
                let currentValue: string = value;
                retrySink.write(value, 'utf8', (err?: Error): void => {
                  if (err !== undefined) {
                    reject(err);
                    return;
                  }
                  if (retrySink.records[retrySink.records.length - 1] !== currentValue) {
                    capturedRetryRecordsValid = false;
                  }
                });
              });
              retryDuplex.on('finish', (): void => {
                retryDuplex.push(null);
              });
              retryDuplex.on('end', (): void => {
                retrySink.end();
              });
              retrySink.on('finish', (): void => {
                capturedFirstError = firstError;
                capturedRetryFrames = retryTransform.frames.join('|');
                capturedBadIndex = retryTransform.frames.indexOf('BAD');
                capturedRetrySinkText = retrySink.text;
                capturedRetryDuplexWriteCount = retryDuplex.writeCount;
                capturedRetrySinkWriteCount = retrySink.writeCount;
                capturedRetryWritableFinished = retrySink.writableFinished;
                resolve(undefined as void);
              });
              retrySource.on('data', (chunk: Object): void => {
                retryTransform.write(chunk.toString(), 'utf8');
              });
              retrySource.on('end', (): void => {
                retryTransform.end();
              });
              retrySource.resume();
            });
            firstSource.resume();
          });
          expect(capturedFirstErrorName).assertEqual('Error');
          expect(capturedFirstErrorMessage).assertEqual('commit frame rejected: BAD');
          expect(capturedFirstError).assertTrue();
          expect(capturedRetryFrames).assertEqual('RETRY:1|RETRY:2');
          expect(capturedBadIndex).assertEqual(-1);
          expect(capturedRetrySinkText).assertEqual('ACK:VALID:RETRY:1ACK:VALID:RETRY:2ACK:COMMIT');
          expect(capturedRetryDuplexWriteCount).assertEqual(3);
          expect(capturedRetrySinkWriteCount).assertEqual(3);
          expect(capturedRetryWritableFinished).assertTrue();
          expect(capturedRetryRecordsValid).assertTrue();
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_1400
     * @tc.name testStreamProtocolLifecycleFlow014
     * @tc.desc Verify two complete commit frames in one source chunk pass through Transform, Duplex, and Writable in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedSinkText: string = '';
        let capturedFrames: string = '';
        let capturedLastRecord: string = '';
        let capturedTransformCount: int = 0;
        let capturedFlushCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ScenarioReadable(['TX|OK|']);
          let transform = new CommitFrameTransform();
          let duplex = new ScenarioDuplex('ACK:');
          let sink = new ScenarioCollectWritable();
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            duplex.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            duplex.end();
          });
          duplex.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          duplex.on('end', (): void => {
            sink.end();
          });
          sink.on('finish', (): void => {
            capturedSinkText = sink.text;
            capturedFrames = transform.frames.join('|');
            capturedLastRecord = sink.records[sink.records.length - 1];
            capturedTransformCount = transform.transformCount;
            capturedFlushCount = transform.flushCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          source.resume();
        });
        expect(capturedFrames).assertEqual('TX|OK');
        expect(capturedSinkText).assertEqual('ACK:VALID:TXACK:VALID:OKACK:COMMIT');
        expect(capturedLastRecord).assertEqual('ACK:COMMIT');
        expect(capturedTransformCount).assertEqual(1);
        expect(capturedFlushCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_1500
     * @tc.name testStreamProtocolLifecycleFlow015
     * @tc.desc Verify an empty source completes a protocol flush and ends Duplex only after the terminal commit write callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedSinkText: string = '';
        let capturedFrames: string = '';
        let capturedPending: string = '';
        let capturedFlushCount: int = 0;
        let capturedDuplexWriteCount: int = 0;
        let capturedDuplexWriteCallback: boolean = false;
        let capturedDuplexEndedAfterCallback: boolean = false;
        let capturedWritableFinished: boolean = false;
        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
            let source = new ScenarioReadable([]);
            let transform = new CommitFrameTransform();
            let duplex = new ScenarioDuplex('ACK:');
            let sink = new ScenarioCollectWritable();
            source.on('data', (chunk: Object): void => {
              transform.write(chunk.toString(), 'utf8');
            });
            source.on('end', (): void => {
              transform.end();
            });
            transform.on('data', (chunk: Object): void => {
              duplex.write(chunk.toString(), 'utf8', (err?: Error): void => {
                if (err !== undefined) {
                  reject(err);
                  return;
                }
                capturedDuplexWriteCallback = true;
                setTimeout((): void => {
                  capturedDuplexEndedAfterCallback = capturedDuplexWriteCallback;
                  duplex.end();
                }, 0);
              });
            });
            duplex.on('data', (chunk: Object): void => {
              sink.write(chunk.toString(), 'utf8');
            });
            duplex.on('finish', (): void => {
              duplex.push(null);
            });
            duplex.on('end', (): void => {
              sink.end();
            });
            sink.on('finish', (): void => {
              capturedSinkText = sink.text;
              capturedFrames = transform.frames.join('|');
              capturedPending = transform.pending;
              capturedFlushCount = transform.flushCount;
              capturedDuplexWriteCount = duplex.writeCount;
              capturedWritableFinished = sink.writableFinished;
              resolve(undefined as void);
            });
            source.resume();
          });
          expect(capturedFrames).assertEqual('');
          expect(capturedPending).assertEqual('');
          expect(capturedFlushCount).assertEqual(1);
          expect(capturedSinkText).assertEqual('ACK:COMMIT');
          expect(capturedDuplexWriteCount).assertEqual(1);
          expect(capturedDuplexWriteCallback).assertTrue();
          expect(capturedDuplexEndedAfterCallback).assertTrue();
          expect(capturedWritableFinished).assertTrue();
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PROTOCOL_LIFECYCLE_FLOW_1600
     * @tc.name testStreamProtocolLifecycleFlow016
     * @tc.desc Verify an asynchronous Transform and Duplex chain preserves output order through sink completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamProtocolLifecycleFlow016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedSinkText: string = '';
        let capturedTransformValues: string[] = [];
        let capturedTransformEnded: boolean = false;
        let capturedSourceEnded: boolean = false;
        let capturedTransformWritableEnded: boolean = false;
        let capturedDuplexEnded: boolean = false;
        let capturedSinkFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ScenarioReadable(['one', 'two', 'three']);
          let transform = new ScenarioAsyncTransform('profile:', 2);
          let duplex = new ScenarioDuplex('frame:');
          let sink = new ScenarioCollectWritable(1);
          transform.on('data', (chunk: Object): void => {
            let value: string = chunk.toString();
            capturedTransformValues.push(value);
            duplex.write(value, 'utf8');
          });
          transform.on('end', (): void => {
            capturedTransformEnded = true;
            duplex.end();
          });
          duplex.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          duplex.on('end', (): void => {
            capturedDuplexEnded = true;
            sink.end();
          });
          sink.on('finish', (): void => {
            capturedSinkText = sink.text;
            capturedSourceEnded = source.readableEnded;
            capturedTransformWritableEnded = transform.writableEnded;
            capturedSinkFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          source.resume();
        });
        expect(capturedTransformValues.length).assertEqual(3);
        expect(capturedTransformValues[0]).assertEqual('profile:one');
        expect(capturedTransformValues[1]).assertEqual('profile:two');
        expect(capturedTransformValues[2]).assertEqual('profile:three');
        expect(capturedTransformEnded).assertTrue();
        expect(capturedSourceEnded).assertTrue();
        expect(capturedTransformWritableEnded).assertTrue();
        expect(capturedDuplexEnded).assertTrue();
        expect(capturedSinkText).assertEqual('frame:profile:oneframe:profile:twoframe:profile:three');
        expect(capturedSinkFinished).assertTrue();

        done();
      });
  });
}
