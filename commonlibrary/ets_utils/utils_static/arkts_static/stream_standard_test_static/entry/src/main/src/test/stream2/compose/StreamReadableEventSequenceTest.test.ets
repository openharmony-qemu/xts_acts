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
import { buffer } from '@kit.ArkTS';
import {
  ReadableTestBase, ErrorThrowReadable, SinglePushReadable, EmptyReadable
} from '../../StreamTestBase';

class MultiPushReadable extends ReadableTestBase {
  private emitted: boolean = false;

  constructor() {
    super();
  }

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push('chunk1');
      this.push('chunk2');
      this.push('chunk3');
      this.push(null);
    }
  }
}

class ContinuousReadable extends ReadableTestBase {
  private emitted: boolean = false;

  constructor() {
    super();
  }

  doRead(size: int): void {
    if (!this.emitted) {
      this.emitted = true;
      this.push('initial');
    }
  }
}

class DataCollector {
  public chunks: string[] = [];
  public count: int = 0;

  reset(): void {
    this.chunks = [];
    this.count = 0;
  }
}

export default function StreamReadableEventSequenceTest(): void {
  describe('StreamReadableEventSequenceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_0100
     * @tc.name testStreamReadableEventSequence001
     * @tc.desc Verify setEncoding before push makes flowing data deliver the hello string to its listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let received: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.setEncoding('utf8');
          rs.on('data', (chunk: Object): void => {
            received = chunk.toString();
            resolve(undefined as void);
          });
          rs.push('hello');
        });
        expect(received).assertEqual('hello');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_0200
     * @tc.name testStreamReadableEventSequence002
     * @tc.desc Verify push(chunk) then push(null) delivers chunk then end event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let order: string[] = [];
        let dataVal: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('data', (chunk: Object): void => {
            dataVal = chunk.toString();
            order.push('data');
          });
          rs.on('end', (): void => {
            order.push('end');
            resolve(undefined);
          });
          rs.push('hello');
          rs.push(null);
        });
        expect(dataVal).assertEqual('hello');
        expect(order.length).assertEqual(2);
        expect(order[0]).assertEqual('data');
        expect(order[1]).assertEqual('end');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_0300
     * @tc.name testStreamReadableEventSequence003
     * @tc.desc Verify pause buffers multiple pushes resume delivers all in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let collector: DataCollector = new DataCollector();
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('data', (chunk: Object): void => {
            collector.chunks.push(chunk.toString());
            collector.count++;
          });
          rs.on('end', (): void => {
            resolve(undefined);
          });
          rs.pause();
          rs.push('a');
          rs.push('b');
          rs.push('c');
          rs.push(null);
          expect(rs.readableLength).assertEqual(3);
          rs.resume();
        });
        expect(collector.count).assertEqual(3);
        expect(collector.chunks[0]).assertEqual('a');
        expect(collector.chunks[1]).assertEqual('b');
        expect(collector.chunks[2]).assertEqual('c');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_0400
     * @tc.name testStreamReadableEventSequence004
     * @tc.desc Verify pause with push(null) then resume emits data before end and sets readableEnded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let order: string[] = [];
        let endedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on("data", (chunk: Object): void => {
            order.push("data");
          });
          rs.on("end", (): void => {
            order.push("end");
            endedAtEnd = rs.readableEnded;
            resolve(undefined as void);
          });
          rs.pause();
          rs.push("hello");
          rs.push(null);
          expect(rs.readableEnded).assertFalse();
          rs.resume();
        });
        expect(order[0]).assertEqual("data");
        expect(order[1]).assertEqual("end");
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_0500
     * @tc.name testStreamReadableEventSequence005
     * @tc.desc Verify an empty read followed by multiple pushes preserves chunk order and drains the buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let emptyRead: Object | null = rs.read();
      let firstPushResult: boolean = rs.push('late');
      let secondPushResult: boolean = rs.push('tail');
      let bufferedLength: int = rs.readableLength;
      let firstData: Object | null = rs.read(4);
      let secondData: Object | null = rs.read();
      expect(emptyRead).assertEqual(null);
      expect(firstPushResult).assertTrue();
      expect(secondPushResult).assertTrue();
      expect(bufferedLength).assertEqual(8);
      expect(firstData?.toString()).assertEqual('late');
      expect(secondData?.toString()).assertEqual('tail');
      expect(rs.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_0600
     * @tc.name testStreamReadableEventSequence006
     * @tc.desc Verify two sized reads split one buffered chunk without losing data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      rs.push('hello');
      let prefix: Object | null = rs.read(2);
      let suffix: Object | null = rs.read(3);
      expect(prefix?.toString()).assertEqual('he');
      expect(suffix?.toString()).assertEqual('llo');
      expect(rs.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_0700
     * @tc.name testStreamReadableEventSequence007
     * @tc.desc Verify a zero length probe preserves a multi-chunk buffer before sized reads consume it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      rs.push('head');
      rs.push('tail');
      let lengthBeforeProbe: int = rs.readableLength;
      let probe: Object | null = rs.read(0);
      let lengthAfterProbe: int = rs.readableLength;
      let head: Object | null = rs.read(4);
      let tail: Object | null = rs.read();
      expect(lengthBeforeProbe).assertEqual(8);
      expect(probe).assertEqual(null);
      expect(lengthAfterProbe).assertEqual(8);
      expect(head?.toString()).assertEqual('head');
      expect(tail?.toString()).assertEqual('tail');
      expect(rs.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_0800
     * @tc.name testStreamReadableEventSequence008
     * @tc.desc Verify sized reads preserve order across string and byte chunks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let firstPushResult: boolean = rs.push('hello');
      let secondPushResult: boolean = rs.push(new Uint8Array([119, 111, 114, 108, 100]));
      let combinedLength: int = rs.readableLength;
      let firstData: Object | null = rs.read(5);
      let remainingData: Object | null = rs.read();
      expect(firstPushResult).assertTrue();
      expect(secondPushResult).assertTrue();
      expect(combinedLength).assertEqual(10);
      expect(firstData?.toString()).assertEqual('hello');
      expect(remainingData?.toString()).assertEqual('world');
      expect(rs.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_0900
     * @tc.name testStreamReadableEventSequence009
     * @tc.desc Verify an end-marked byte buffer is returned by an oversized read and then becomes empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let pushResult: boolean = rs.push(new Uint8Array([97, 98, 99, 100, 101]));
      rs.push(null);
      let data: Object | null = rs.read(100);
      let afterData: Object | null = rs.read();
      expect(pushResult).assertTrue();
      expect(data?.toString()).assertEqual('abcde');
      expect(afterData).assertEqual(null);
      expect(rs.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_1000
     * @tc.name testStreamReadableEventSequence010
     * @tc.desc Verify an empty byte push does not affect later mixed chunks or their read lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      rs.push(new Uint8Array(0));
      rs.push('ab');
      rs.push(new Uint8Array([99]));
      let bufferedLength: int = rs.readableLength;
      let prefix: Object | null = rs.read(2);
      let suffix: Object | null = rs.read();
      expect(bufferedLength).assertEqual(3);
      expect(prefix?.toString()).assertEqual('ab');
      expect(suffix?.toString()).assertEqual('c');
      expect(rs.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_1100
     * @tc.name testStreamReadableEventSequence011
     * @tc.desc Verify an oversized byte push reports backpressure and can be fully drained by a sized read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push(new Uint8Array(20000));
      let bufferedLength: int = rs.readableLength;
      let drained: Object | null = rs.read(20000);
      let residual: Object | null = rs.read();
      expect(result).assertFalse();
      expect(bufferedLength).assertEqual(20000);
      expect(drained?.toString().length).assertEqual(20000);
      expect(residual).assertEqual(null);
      expect(rs.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_1200
     * @tc.name testStreamReadableEventSequence012
     * @tc.desc Verify a low water buffer remains readable after an end marker and drains in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      let result: boolean = rs.push('hello');
      let bufferedLength: int = rs.readableLength;
      rs.push(null);
      let data: Object | null = rs.read();
      let afterData: Object | null = rs.read();
      expect(result).assertTrue();
      expect(bufferedLength).assertEqual(5);
      expect(data?.toString()).assertEqual('hello');
      expect(afterData).assertEqual(null);
      expect(rs.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_1300
     * @tc.name testStreamReadableEventSequence013
     * @tc.desc Verify error in doRead triggers the error event asynchronously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ErrorThrowReadable = new ErrorThrowReadable();
        let errName: string = '';
        let errMessage: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('error', (err: Error): void => {
            errName = err.name;
            errMessage = err.message;
            resolve(undefined);
          });
          rs.resume();
        });
        expect(errName).assertEqual('Error');
        expect(errMessage).assertEqual('source error');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_1400
     * @tc.name testStreamReadableEventSequence014
     * @tc.desc Verify a single-chunk readable delivers data before end while an empty readable ends without data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let received: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs: SinglePushReadable = new SinglePushReadable();
          rs.on("data", (chunk: Object): void => {
            received = chunk.toString();
          });
          rs.on("end", (): void => {
            resolve(undefined as void);
          });
          rs.resume();
        });
        expect(received).assertEqual("test");
        let dataFired: boolean = false;
        let endFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let empty: EmptyReadable = new EmptyReadable();
          empty.on("data", (chunk: Object): void => {
            dataFired = true;
          });
          empty.on("end", (): void => {
            endFired = true;
            resolve(undefined as void);
          });
          empty.resume();
        });
        expect(endFired).assertTrue();
        expect(dataFired).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_1500
     * @tc.name testStreamReadableEventSequence015
     * @tc.desc Verify an empty push is ignored while a later data chunk still flows before end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let received: string[] = [];
        let endCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('data', (chunk: Object): void => {
            received.push(chunk.toString());
          });
          rs.on('end', (): void => {
            endCount++;
            resolve(undefined as void);
          });
          rs.resume();
          rs.push('');
          rs.push('after-empty');
          rs.push(null);
        });
        expect(received.length).assertEqual(1);
        expect(received[0]).assertEqual('after-empty');
        expect(endCount).assertEqual(1);
        expect(rs.readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_1600
     * @tc.name testStreamReadableEventSequence016
     * @tc.desc Verify readable end suppresses later data and fires exactly one end event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let dataCount: int = 0;
        let endCount: int = 0;
        let endedAtEnd: boolean = false;
        let pushResult: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('data', (chunk: Object): void => {
            dataCount++;
          });
          rs.on('end', (): void => {
            endCount++;
            endedAtEnd = rs.readableEnded;
            pushResult = rs.push('after');
            resolve(undefined as void);
          });
          rs.pause();
          rs.push(null);
          expect(rs.readableEnded).assertFalse();
          rs.resume();
        });
        expect(pushResult).assertFalse();
        expect(dataCount).assertEqual(0);
        expect(endCount).assertEqual(1);
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_1700
     * @tc.name testStreamReadableEventSequence017
     * @tc.desc Verify UTF8 decoding joins two byte chunks before a complete readable read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.setEncoding('utf8');
      rs.pause();
      let firstResult: boolean = rs.push(new Uint8Array([65, 66]));
      let secondResult: boolean = rs.push(new Uint8Array([67]));
      let data: Object | null = rs.read();
      expect(firstResult).assertTrue();
      expect(secondResult).assertTrue();
      expect(rs.readableEncoding).assertEqual('utf-8');
      expect(data?.toString()).assertEqual('ABC');
      expect(rs.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_1800
     * @tc.name testStreamReadableEventSequence018
     * @tc.desc Verify GBK encoding is applied to multiple explicitly encoded pushes as one readable value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.setEncoding('gbk');
      rs.pause();
      let firstResult: boolean = rs.push('中文', 'gbk');
      let secondResult: boolean = rs.push('测试', 'gbk');
      let data: Object | null = rs.read();
      expect(firstResult).assertTrue();
      expect(secondResult).assertTrue();
      expect(rs.readableEncoding).assertEqual('gbk');
      expect(data?.toString()).assertEqual('中文测试');
      expect(rs.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_1900
     * @tc.name testStreamReadableEventSequence019
     * @tc.desc Verify push emoji chunk delivered to data listener correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let received: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('data', (chunk: Object): void => {
            received = chunk.toString();
            resolve(undefined as void);
          });
          rs.push('😀');
        });
        expect(received).assertEqual('😀');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_2000
     * @tc.name testStreamReadableEventSequence020
     * @tc.desc Verify repeated pause preserves paused state while buffered data remains readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: ReadableTestBase = new ReadableTestBase();
      rs.pause();
      rs.pause();
      rs.pause();
      rs.push('paused-');
      rs.push('data');
      let prefix: Object | null = rs.read(7);
      let suffix: Object | null = rs.read(4);
      expect(rs.isPaused()).assertTrue();
      expect(prefix?.toString()).assertEqual('paused-');
      expect(suffix?.toString()).assertEqual('data');
      expect(rs.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_2100
     * @tc.name testStreamReadableEventSequence021
     * @tc.desc Verify repeated resume enables flowing delivery and completes the stream once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        let received: string = '';
        let endCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('data', (chunk: Object): void => {
            received += chunk.toString();
          });
          rs.on('end', (): void => {
            endCount++;
            resolve(undefined as void);
          });
          rs.pause();
          rs.resume();
          rs.resume();
          rs.resume();
          rs.push('resumed-data');
          rs.push(null);
        });
        expect(rs.isPaused()).assertFalse();
        expect(received).assertEqual('resumed-data');
        expect(endCount).assertEqual(1);
        expect(rs.readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_2200
     * @tc.name testStreamReadableEventSequence022
     * @tc.desc Verify a non-flowing sequence: the readable event fires without a data consumer, an explicit read() pulls the buffered chunk, then resume() switches to flowing mode and push(null) emits end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ReadableTestBase = new ReadableTestBase();
        rs.pause();
        let readableFired: boolean = false;
        let pulled: string = '';
        let endFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('readable', (): void => {
            readableFired = true;
            let chunk = rs.read();
            if (chunk !== null) {
              pulled = chunk.toString();
            }
          });
          rs.on('end', (): void => {
            endFired = true;
            resolve(undefined);
          });
          rs.push('buffered');
          rs.resume();
          rs.push(null);
        });
        expect(readableFired).assertTrue();
        expect(pulled).assertEqual('buffered');
        expect(endFired).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_EVENT_SEQUENCE_2300
     * @tc.name testStreamReadableEventSequence023
     * @tc.desc Verify a non-terminating doRead sequence: a Readable whose doRead pushes a single chunk but never calls push(null) delivers the data event but does not emit end on its own
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableEventSequence023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs: ContinuousReadable = new ContinuousReadable();
        let received: string = '';
        let endFired: boolean = false;
        let endedAtData: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('data', (chunk: Object): void => {
            received += chunk.toString();
            setTimeout((): void => {
              endedAtData = rs.readableEnded;
              resolve(undefined);
            }, 50);
          });
          rs.on('end', (): void => {
            endFired = true;
          });
          rs.resume();
        });
        expect(received).assertEqual('initial');
        expect(endedAtData).assertFalse();
        expect(endFired).assertFalse();

        done();
      });
  });
}
