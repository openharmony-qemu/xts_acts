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

class RecordAggregateWritable extends stream.Writable {
  public pending: string = '';
  public recordCount: int = 0;
  public sum: int = 0;
  public identifiers: string = '';
  public values: int[] = [];
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.pending += chunk.toString();
    this.writeCount++;
    let end: int = this.pending.indexOf(';');
    while (end >= 0) {
      let record: string = this.pending.substring(0, end);
      let separator: int = record.lastIndexOf(':');
      let identifier: string = record.substring(0, separator);
      let value: int = Number.parseInt(record.substring(separator + 1)).toInt();
      if (this.identifiers.length > 0) {
        this.identifiers += '|';
      }
      this.identifiers += identifier;
      this.sum += value;
      this.values.push(value);
      this.recordCount++;
      this.pending = this.pending.substring(end + 1);
      end = this.pending.indexOf(';');
    }
    callback.unsafeCall();
  }
}

export default function StreamRecordAggregateFlowTest(): void {
  describe('StreamRecordAggregateFlowTest', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_RECORD_AGGREGATE_FLOW_0100
     * @tc.name testStreamRecordAggregateFlow001
     * @tc.desc Verify one complete a:1 record is emitted immediately with empty pending state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamRecordAggregateFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedRecordCount: int = 0;
        let capturedSum: int = 0;
        let capturedIdentifiers: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["a:1;"];
          let sink = new RecordAggregateWritable();
          sink.on('finish', (): void => {
            capturedRecordCount = sink.recordCount;
            capturedSum = sink.sum;
            capturedIdentifiers = sink.identifiers;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.end(chunks[0], 'utf8');
        });
        expect(capturedRecordCount).assertEqual(1);
        expect(capturedSum).assertEqual(1);
        expect(capturedIdentifiers).assertEqual("a");
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_RECORD_AGGREGATE_FLOW_0200
     * @tc.name testStreamRecordAggregateFlow002
     * @tc.desc Verify record header, value, and delimiter split into single-character writes are reassembled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamRecordAggregateFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedRecordCount: int = 0;
        let capturedSum: int = 0;
        let capturedIdentifiers: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["a", ":", "1", ";", "b", ":", "2", ";"];
          let sink = new RecordAggregateWritable();
          sink.on('finish', (): void => {
            capturedRecordCount = sink.recordCount;
            capturedSum = sink.sum;
            capturedIdentifiers = sink.identifiers;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          for (let index: int = 0; index < chunks.length; index++) {
            sink.write(chunks[index], 'utf8');
          }
          sink.end();
        });
        expect(capturedRecordCount).assertEqual(2);
        expect(capturedSum).assertEqual(3);
        expect(capturedIdentifiers).assertEqual("a|b");
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(8);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_RECORD_AGGREGATE_FLOW_0300
     * @tc.name testStreamRecordAggregateFlow003
     * @tc.desc Verify negative values are parsed beside a positive record without order loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamRecordAggregateFlow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedRecordCount: int = 0;
        let capturedSum: int = 0;
        let capturedIdentifiers: string = '';
        let capturedValues: int[] = [];
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["loss:-5;", "gain:8;"];
          let sink = new RecordAggregateWritable();
          sink.on('finish', (): void => {
            capturedRecordCount = sink.recordCount;
            capturedSum = sink.sum;
            capturedIdentifiers = sink.identifiers;
            capturedValues = sink.values;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.cork();
          sink.write(chunks[0], 'utf8');
          sink.write(chunks[1], 'utf8');
          sink.uncork();
          sink.end();
        });
        expect(capturedRecordCount).assertEqual(2);
        expect(capturedSum).assertEqual(3);
        expect(capturedValues[0]).assertEqual(-5);
        expect(capturedValues[1]).assertEqual(8);
        expect(capturedIdentifiers).assertEqual("loss|gain");
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_RECORD_AGGREGATE_FLOW_0400
     * @tc.name testStreamRecordAggregateFlow004
     * @tc.desc Verify zero-valued records contribute zero while both identifiers remain in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamRecordAggregateFlow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedRecordCount: int = 0;
        let capturedSum: int = 0;
        let capturedIdentifiers: string = '';
        let capturedValues: int[] = [];
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["a:", "0;", "b:0;"];
          let sink = new RecordAggregateWritable();
          sink.on('finish', (): void => {
            capturedRecordCount = sink.recordCount;
            capturedSum = sink.sum;
            capturedIdentifiers = sink.identifiers;
            capturedValues = sink.values;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let recordSource = new ThirdBatchTextReadable(chunks);
          let transform = new ThirdBatchEchoTransform();
          recordSource.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          recordSource.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            sink.end();
          });
          transform.resume();
          recordSource.resume();
        });
        expect(capturedRecordCount).assertEqual(2);
        expect(capturedSum).assertEqual(0);
        expect(capturedValues[0]).assertEqual(0);
        expect(capturedValues[1]).assertEqual(0);
        expect(capturedIdentifiers).assertEqual("a|b");
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_RECORD_AGGREGATE_FLOW_0500
     * @tc.name testStreamRecordAggregateFlow005
     * @tc.desc Verify a Readable-driven source delivers two multibyte records to the aggregate sink
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamRecordAggregateFlow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedRecordCount: int = 0;
        let capturedSum: int = 0;
        let capturedIdentifiers: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["中文:2;", "数据:3;"];
          let sink = new RecordAggregateWritable();
          sink.on('finish', (): void => {
            capturedRecordCount = sink.recordCount;
            capturedSum = sink.sum;
            capturedIdentifiers = sink.identifiers;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let recordSource = new ThirdBatchTextReadable(chunks);
          recordSource.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          recordSource.on('end', (): void => {
            sink.end();
          });
          recordSource.resume();
        });
        expect(capturedRecordCount).assertEqual(2);
        expect(capturedSum).assertEqual(5);
        expect(capturedIdentifiers).assertEqual("中文|数据");
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_RECORD_AGGREGATE_FLOW_0600
     * @tc.name testStreamRecordAggregateFlow006
     * @tc.desc Verify emoji identifiers survive chunk boundaries and retain record order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamRecordAggregateFlow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedRecordCount: int = 0;
        let capturedSum: int = 0;
        let capturedIdentifiers: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["😀:1;", "✅:2;"];
          let sink = new RecordAggregateWritable();
          sink.on('finish', (): void => {
            capturedRecordCount = sink.recordCount;
            capturedSum = sink.sum;
            capturedIdentifiers = sink.identifiers;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let recordSource = new ThirdBatchTextReadable(chunks);
          recordSource.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          recordSource.on('end', (): void => {
            sink.end();
          });
          recordSource.resume();
        });
        expect(capturedRecordCount).assertEqual(2);
        expect(capturedSum).assertEqual(3);
        expect(capturedIdentifiers).assertEqual("😀|✅");
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_RECORD_AGGREGATE_FLOW_0700
     * @tc.name testStreamRecordAggregateFlow007
     * @tc.desc Verify repeated identifier records remain separate rather than being coalesced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamRecordAggregateFlow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedRecordCount: int = 0;
        let capturedSum: int = 0;
        let capturedIdentifiers: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["a:1;", "a:2;", "a:3;"];
          let sink = new RecordAggregateWritable();
          sink.on('finish', (): void => {
            capturedRecordCount = sink.recordCount;
            capturedSum = sink.sum;
            capturedIdentifiers = sink.identifiers;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.write(chunks[0], 'utf8');
          sink.write(chunks[1], 'utf8');
          sink.write(chunks[2], 'utf8');
          sink.end();
        });
        expect(capturedRecordCount).assertEqual(3);
        expect(capturedSum).assertEqual(6);
        expect(capturedIdentifiers).assertEqual("a|a|a");
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_RECORD_AGGREGATE_FLOW_0800
     * @tc.name testStreamRecordAggregateFlow008
     * @tc.desc Verify signed 32-bit minimum and maximum values aggregate without overflow or reordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamRecordAggregateFlow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedRecordCount: int = 0;
        let capturedSum: int = 0;
        let capturedIdentifiers: string = '';
        let capturedValues: int[] = [];
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["min:-2147483648;", "max:2147483647;one:1;"];
          let sink = new RecordAggregateWritable();
          sink.on('finish', (): void => {
            capturedRecordCount = sink.recordCount;
            capturedSum = sink.sum;
            capturedIdentifiers = sink.identifiers;
            capturedValues = sink.values;
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.cork();
          sink.write(chunks[0], 'utf8');
          sink.uncork();
          sink.end(chunks[1], 'utf8');
        });
        expect(capturedRecordCount).assertEqual(3);
        expect(capturedSum).assertEqual(0);
        expect(capturedValues[0]).assertEqual(-2147483648);
        expect(capturedValues[1]).assertEqual(2147483647);
        expect(capturedValues[2]).assertEqual(1);
        expect(capturedIdentifiers).assertEqual("min|max|one");
        expect(capturedPending).assertEqual('');
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();

        done();
      });
  });
}
