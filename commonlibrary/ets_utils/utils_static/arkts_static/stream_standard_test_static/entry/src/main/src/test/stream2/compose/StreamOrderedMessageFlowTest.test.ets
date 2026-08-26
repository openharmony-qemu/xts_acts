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

import { stream } from '@kit.ArkTS';
import { ThirdBatchEchoTransform, ThirdBatchTextReadable } from '../../StreamComposeTestBase';
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

class OrderedMessageWritable extends stream.Writable {
  public pending: string = '';
  public expectedSequence: int = 0;
  public acceptedCount: int = 0;
  public duplicateCount: int = 0;
  public outOfOrderCount: int = 0;
  public malformedCount: int = 0;
  public acceptedPayloads: string[] = [];
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.pending += chunk.toString();
    this.writeCount++;
    let terminator: int = this.pending.indexOf(';');
    while (terminator >= 0) {
      let message: string = this.pending.substring(0, terminator);
      this.pending = this.pending.substring(terminator + 1);
      let separator: int = message.indexOf(':');
      if (separator < 0) {
        this.malformedCount++;
      } else {
        let sequenceText: string = message.substring(0, separator);
        let sequence: number = Number(sequenceText);
        let payload: string = message.substring(separator + 1);
        if (!Number.isInteger(sequence) || sequence < 0) {
          this.malformedCount++;
        } else if (sequence < this.expectedSequence) {
          this.duplicateCount++;
        } else if (sequence > this.expectedSequence) {
          this.outOfOrderCount++;
        } else {
          this.acceptedPayloads.push(payload);
          this.acceptedCount++;
          this.expectedSequence++;
        }
      }
      terminator = this.pending.indexOf(';');
    }
    callback.unsafeCall();
  }
}

export default function StreamOrderedMessageFlowTest(): void {
  describe('StreamOrderedMessageFlowTest', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_0100
     * @tc.name testStreamOrderedMessageFlow001
     * @tc.desc Verify end with one sequence-zero record accepts first and advances expectedSequence to one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["0:first;"];
          let sink = new OrderedMessageWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.end(chunks[0], 'utf8');
        });
        expect(capturedAcceptedCount).assertEqual(1);
        expect(capturedExpectedSequence).assertEqual(1);
        expect(capturedAcceptedPayloads).assertEqual("first");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_0200
     * @tc.name testStreamOrderedMessageFlow002
     * @tc.desc Verify separate write, write, and end calls accept contiguous records 0 through 2 in payload order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new OrderedMessageWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.write('0:a;', 'utf8');
          sink.write('1:b;', 'utf8');
          sink.end('2:c;', 'utf8');
        });
        expect(capturedAcceptedCount).assertEqual(3);
        expect(capturedExpectedSequence).assertEqual(3);
        expect(capturedAcceptedPayloads).assertEqual("a|b|c");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_0300
     * @tc.name testStreamOrderedMessageFlow003
     * @tc.desc Verify a one-character Readable source reconstructs two framed records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["0", ":", "a", ";", "1", ":", "b", ";"];
          let sink = new OrderedMessageWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let source = new ThirdBatchTextReadable(chunks);
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedAcceptedCount).assertEqual(2);
        expect(capturedExpectedSequence).assertEqual(2);
        expect(capturedAcceptedPayloads).assertEqual("a|b");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(8);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_0400
     * @tc.name testStreamOrderedMessageFlow004
     * @tc.desc Verify a piped sequence-two record is counted as out of order while expectedSequence remains zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["2:future;"];
          let sink = new OrderedMessageWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let source = new ThirdBatchTextReadable(chunks);
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedAcceptedCount).assertEqual(0);
        expect(capturedOutOfOrderCount).assertEqual(1);
        expect(capturedExpectedSequence).assertEqual(0);
        expect(capturedAcceptedPayloads).assertEqual("");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_0500
     * @tc.name testStreamOrderedMessageFlow005
     * @tc.desc Verify an out-of-order sequence is recorded as a gap and repaired once the missing sequence arrives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let pipedAccepted: int = 0;
        let pipedOutOfOrder: int = 0;
        let pipedExpected: int = 0;
        let pipedPayloads: string = "";
        let pipedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ThirdBatchTextReadable(["0:a;", "2:c;", "1:b;"]);
          let transform = new ThirdBatchEchoTransform();
          let sink = new OrderedMessageWritable();
          sink.on("finish", (): void => {
            pipedAccepted = sink.acceptedCount;
            pipedOutOfOrder = sink.outOfOrderCount;
            pipedExpected = sink.expectedSequence;
            pipedPayloads = sink.acceptedPayloads.join("|");
            pipedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          source.on("data", (chunk: Object): void => {
            transform.write(chunk.toString(), "utf8");
          });
          source.on("end", (): void => {
            transform.end();
          });
          transform.on("data", (chunk: Object): void => {
            sink.write(chunk.toString(), "utf8");
          });
          transform.on("end", (): void => {
            sink.end();
          });
          transform.resume();
          source.resume();
        });
        expect(pipedAccepted).assertEqual(2);
        expect(pipedOutOfOrder).assertEqual(1);
        expect(pipedExpected).assertEqual(2);
        expect(pipedPayloads).assertEqual("a|b");
        expect(pipedWriteCount).assertEqual(3);
        let directAccepted: int = 0;
        let directOutOfOrder: int = 0;
        let directExpected: int = 0;
        let directPayloads: string = "";
        let directWriteCount: int = 0;
        let directFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new OrderedMessageWritable();
          sink.on("finish", (): void => {
            directAccepted = sink.acceptedCount;
            directOutOfOrder = sink.outOfOrderCount;
            directExpected = sink.expectedSequence;
            directPayloads = sink.acceptedPayloads.join("|");
            directWriteCount = sink.writeCount;
            directFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.setDefaultEncoding("utf8");
          sink.write("0:a;2:c;", "utf8");
          sink.write("1:b;", "utf8");
          sink.end("2:c;", "utf8");
        });
        expect(directAccepted).assertEqual(3);
        expect(directOutOfOrder).assertEqual(1);
        expect(directExpected).assertEqual(3);
        expect(directPayloads).assertEqual("a|b|c");
        expect(directWriteCount).assertEqual(3);
        expect(directFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_0600
     * @tc.name testStreamOrderedMessageFlow006
     * @tc.desc Verify a readable source carrying two repeats after progress produces two duplicates and two accepted records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["0:a;1:b;0:x;1:y;"];
          let sink = new OrderedMessageWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let messageSource = new ThirdBatchTextReadable([chunks[0]]);
          messageSource.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          messageSource.on('end', (): void => {
            sink.end();
          });
          messageSource.resume();
        });
        expect(capturedAcceptedCount).assertEqual(2);
        expect(capturedDuplicateCount).assertEqual(2);
        expect(capturedExpectedSequence).assertEqual(2);
        expect(capturedAcceptedPayloads).assertEqual("a|b");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_0700
     * @tc.name testStreamOrderedMessageFlow007
     * @tc.desc Verify one combined batch separates accepted, duplicate, and future-sequence records into 3, 1, and 2 counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["0:a;2:c;0:x;1:b;3:d;2:c;"];
          let sink = new OrderedMessageWritable();
          sink.setDefaultEncoding('utf8');
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.end(chunks[0], 'utf8');
        });
        expect(capturedAcceptedCount).assertEqual(3);
        expect(capturedDuplicateCount).assertEqual(1);
        expect(capturedOutOfOrderCount).assertEqual(2);
        expect(capturedExpectedSequence).assertEqual(3);
        expect(capturedAcceptedPayloads).assertEqual("a|b|c");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_0800
     * @tc.name testStreamOrderedMessageFlow008
     * @tc.desc Verify the split negative token -1 is reassembled across two writes and rejected as malformed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["-1", ":data;"];
          let sink = new OrderedMessageWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let source = new ThirdBatchTextReadable(chunks);
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedAcceptedCount).assertEqual(0);
        expect(capturedMalformedCount).assertEqual(1);
        expect(capturedExpectedSequence).assertEqual(0);
        expect(capturedAcceptedPayloads).assertEqual("");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_0900
     * @tc.name testStreamOrderedMessageFlow009
     * @tc.desc Verify end(data) accepts a zero-length payload for sequence zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new OrderedMessageWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.end('0:;', 'utf8');
        });
        expect(capturedAcceptedCount).assertEqual(1);
        expect(capturedExpectedSequence).assertEqual(1);
        expect(capturedAcceptedPayloads).assertEqual("");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_1000
     * @tc.name testStreamOrderedMessageFlow010
     * @tc.desc Verify additional colons remain inside the payload while the 0:a:b:c frame is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new OrderedMessageWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let source = new ThirdBatchTextReadable(['0:a:', 'b:c;']);
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedAcceptedCount).assertEqual(1);
        expect(capturedExpectedSequence).assertEqual(1);
        expect(capturedAcceptedPayloads).assertEqual("a:b:c");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_1100
     * @tc.name testStreamOrderedMessageFlow011
     * @tc.desc Verify data and end events from a readable source deliver two CJK records to the ordered sink
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new OrderedMessageWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let messageSource = new ThirdBatchTextReadable(['0:中文;', '1:数据;']);
          messageSource.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          messageSource.on('end', (): void => {
            sink.end();
          });
          messageSource.resume();
        });
        expect(capturedAcceptedCount).assertEqual(2);
        expect(capturedExpectedSequence).assertEqual(2);
        expect(capturedAcceptedPayloads).assertEqual("中文|数据");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_1200
     * @tc.name testStreamOrderedMessageFlow012
     * @tc.desc Verify a piped source preserves emoji payloads in sequence order across two framed chunks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["0:😀;1:", "🚀;"];
          let sink = new OrderedMessageWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let source = new ThirdBatchTextReadable(chunks);
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedAcceptedCount).assertEqual(2);
        expect(capturedExpectedSequence).assertEqual(2);
        expect(capturedAcceptedPayloads).assertEqual("😀|🚀");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_1300
     * @tc.name testStreamOrderedMessageFlow013
     * @tc.desc Verify one hundred generated records remain ordered when the stream is divided into five writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        let capturedExpectedJoined: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let data: string = '';
          let expectedPayloads: string[] = [];
          for (let index: int = 0; index < 100; index++) {
            let payload: string = 'v' + index.toString();
            expectedPayloads.push(payload);
            data += index.toString() + ':' + payload + ';';
          }
          let unit: int = (data.length / 5).toInt();
          let chunks: string[] = [data.substring(0, unit), data.substring(unit, unit * 2),
            data.substring(unit * 2, unit * 3), data.substring(unit * 3, unit * 4), data.substring(unit * 4)];
          let sink = new OrderedMessageWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedExpectedJoined = expectedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let source = new ThirdBatchTextReadable(chunks);
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedAcceptedCount).assertEqual(100);
        expect(capturedExpectedSequence).assertEqual(100);
        expect(capturedAcceptedPayloads).assertEqual(capturedExpectedJoined);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(5);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_1400
     * @tc.name testStreamOrderedMessageFlow014
     * @tc.desc Verify one 1024-character payload survives six fixed-size writes as a single accepted record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        let capturedPayload: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let payload: string = '';
          for (let index: int = 0; index < 1024; index++) {
            payload += String.fromCharCode(65 + index % 26);
          }
          let data: string = '0:' + payload + ';';
          let chunks: string[] = [data.substring(0, 200), data.substring(200, 400), data.substring(400, 600),
            data.substring(600, 800), data.substring(800, 1000), data.substring(1000)];
          let sink = new OrderedMessageWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPayload = payload;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let source = new ThirdBatchTextReadable(chunks);
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedAcceptedCount).assertEqual(1);
        expect(capturedExpectedSequence).assertEqual(1);
        expect(capturedAcceptedPayloads).assertEqual(capturedPayload);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(6);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ORDERED_MESSAGE_FLOW_1500
     * @tc.name testStreamOrderedMessageFlow015
     * @tc.desc Verify bad, nonnumeric, negative, and decimal sequence forms produce four malformed records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamOrderedMessageFlow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedDuplicateCount: int = 0;
        let capturedOutOfOrderCount: int = 0;
        let capturedMalformedCount: int = 0;
        let capturedExpectedSequence: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["bad;x:data;-1:data;0.5:data;payload;"];
          let sink = new OrderedMessageWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedDuplicateCount = sink.duplicateCount;
            capturedOutOfOrderCount = sink.outOfOrderCount;
            capturedMalformedCount = sink.malformedCount;
            capturedExpectedSequence = sink.expectedSequence;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let source = new ThirdBatchTextReadable(chunks);
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedAcceptedCount).assertEqual(0);
        expect(capturedMalformedCount).assertEqual(5);
        expect(capturedExpectedSequence).assertEqual(0);
        expect(capturedAcceptedPayloads).assertEqual("");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();

        done();
      });
  });
}
