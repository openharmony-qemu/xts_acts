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
  connectReadableToWritable,
  connectTransformToTransform,
  connectTransformToWritable,
  feedTransform,
  FlowByteWritable,
  FlowChecksumTransform,
  FlowChunkReadable,
  FlowCollectWritable,
  FlowDuplicateTransform,
  FlowPrefixTransform,
  FlowSequenceTransform,
  FlowTrailerTransform,
  FlowUppercaseTransform
} from '../../StreamComposeTestBase';
import {
  ScenarioAsyncTransform,
  ScenarioCollectWritable,
  ScenarioDuplex,
  ScenarioReadable
} from '../../StreamComposeTestBase';

export default function StreamGeneralDataFlowTest(): void {
  describe('StreamGeneralDataFlowTest', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_0100
     * @tc.name testStreamGeneralDataFlow001
     * @tc.desc Verify ScenarioReadable pipe delivery preserves three ordinary messages without loss or reordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ScenarioReadable(['m1', 'm2', 'm3']);
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          source.pipe(sink);
        });
        expect(capturedText).assertEqual('m1m2m3');
        expect(capturedWriteCount).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_0200
     * @tc.name testStreamGeneralDataFlow002
     * @tc.desc Verify multilingual ordinary data remains intact through a passthrough stream flow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new FlowChunkReadable(['中文', '日本語', 'Русский', '😀']);
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          sink.cork();
          source.writeTo(sink);
        });
        expect(capturedText).assertEqual('中文日本語Русский😀');
        expect(capturedWriteCount).assertEqual(4);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_0300
     * @tc.name testStreamGeneralDataFlow003
     * @tc.desc Verify binary packet chunks preserve zero and maximum byte values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        await new Promise<void>((resolve: (value: void) => void): void => {
          let packet1 = new Uint8Array([0, 127]);
          let packet2 = new Uint8Array([128, 255]);
          let source = new FlowChunkReadable([packet1, packet2]);
          let sink = new FlowByteWritable();
          sink.on('finish', (): void => {
            capturedBytes = new Uint8Array(sink.bytes.length);
            for (let i: int = 0; i < sink.bytes.length; i++) {
              capturedBytes[i] = sink.bytes[i];
            }
            resolve(undefined as void);
          });
          connectReadableToWritable(source, sink);
        });
        expect(capturedBytes.length).assertEqual(4);
        expect(capturedBytes[0]).assertEqual(0);
        expect(capturedBytes[3]).assertEqual(255);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_0400
     * @tc.name testStreamGeneralDataFlow004
     * @tc.desc Verify one hundred ordinary messages complete with exact count and sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedWriteCount: int = 0;
        let capturedFirst: string = '';
        let capturedLast: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: (string | Uint8Array)[] = [];
          for (let index: int = 0; index < 100; index++) {
            chunks.push(index.toString() + ';');
          }
          let sequence = new FlowSequenceTransform();
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedWriteCount = sink.writeCount;
            capturedFirst = sink.chunks[0];
            capturedLast = sink.chunks[99];
            resolve(undefined as void);
          });
          connectTransformToWritable(sequence, sink);
          feedTransform(sequence, chunks);
        });
        expect(capturedWriteCount).assertEqual(100);
        expect(capturedFirst).assertEqual('1:0;;');
        expect(capturedLast).assertEqual('100:99;;');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_0500
     * @tc.name testStreamGeneralDataFlow005
     * @tc.desc Verify two Transform stages process ordinary data before final consumption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let upper = new FlowUppercaseTransform();
          let duplicate = new FlowDuplicateTransform();
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          connectTransformToTransform(upper, duplicate);
          connectTransformToWritable(duplicate, sink);
          feedTransform(upper, ['a', 'b']);
        });
        expect(capturedText).assertEqual('AABB');
        expect(capturedWriteCount).assertEqual(4);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_0600
     * @tc.name testStreamGeneralDataFlow006
     * @tc.desc Verify a single large ordinary data chunk reaches the consumer without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let data: string = 'z'.repeat(20000);
        let capturedTextLength: int = 0;
        let capturedText: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new FlowChunkReadable([data]);
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedTextLength = sink.text.length;
            capturedText = sink.text;
            resolve(undefined as void);
          });
          connectReadableToWritable(source, sink);
        });
        expect(capturedTextLength).assertEqual(20000);
        expect(capturedText).assertEqual(data);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_0700
     * @tc.name testStreamGeneralDataFlow007
     * @tc.desc Verify an ordinary data source ending without messages still completes the destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedWriteCount: int = 0;
        let capturedText: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new FlowChunkReadable([]);
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedWriteCount = sink.writeCount;
            capturedText = sink.text;
            resolve(undefined as void);
          });
          connectReadableToWritable(source, sink);
        });
        expect(capturedWriteCount).assertEqual(0);
        expect(capturedText).assertEqual('');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_0800
     * @tc.name testStreamGeneralDataFlow008
     * @tc.desc Verify Transform stage order prefix then uppercase changes the complete downstream result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let prefix = new FlowPrefixTransform('pre-');
          let upper = new FlowUppercaseTransform();
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            resolve(undefined as void);
          });
          connectTransformToTransform(prefix, upper);
          connectTransformToWritable(upper, sink);
          feedTransform(prefix, ['alpha']);
        });
        expect(capturedText).assertEqual('PRE-ALPHA');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_0900
     * @tc.name testStreamGeneralDataFlow009
     * @tc.desc Verify Transform stage order uppercase then lowercase prefix preserves prefix case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let upper = new FlowUppercaseTransform();
          let prefix = new FlowPrefixTransform('pre-');
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            resolve(undefined as void);
          });
          connectTransformToTransform(upper, prefix);
          connectTransformToWritable(prefix, sink);
          feedTransform(upper, ['alpha']);
        });
        expect(capturedText).assertEqual('pre-ALPHA');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_1000
     * @tc.name testStreamGeneralDataFlow010
     * @tc.desc Verify duplicate then uppercase transform order produces doubled uppercased output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let duplicate = new FlowDuplicateTransform();
          let upper = new FlowUppercaseTransform();
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          connectTransformToTransform(duplicate, upper);
          connectTransformToWritable(upper, sink);
          feedTransform(duplicate, ['event']);
        });
        expect(capturedText).assertEqual('EVENTEVENT');
        expect(capturedWriteCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_1100
     * @tc.name testStreamGeneralDataFlow011
     * @tc.desc Verify doFlush output is appended only after every ordinary pipeline chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedChunk1: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let trailer = new FlowTrailerTransform('<EOF>');
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedChunk1 = sink.chunks[1];
            resolve(undefined as void);
          });
          connectTransformToWritable(trailer, sink);
          feedTransform(trailer, ['body']);
        });
        expect(capturedText).assertEqual('body<EOF>');
        expect(capturedChunk1).assertEqual('<EOF>');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_1200
     * @tc.name testStreamGeneralDataFlow012
     * @tc.desc Verify two Transform flush stages complete in upstream to downstream order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let first = new FlowTrailerTransform('F1');
          let second = new FlowTrailerTransform('F2');
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          connectTransformToTransform(first, second);
          connectTransformToWritable(second, sink);
          feedTransform(first, ['D']);
        });
        expect(capturedText).assertEqual('DF1F2');
        expect(capturedWriteCount).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_1300
     * @tc.name testStreamGeneralDataFlow013
     * @tc.desc Verify checksum finalization observes data from all chunks before emitting the summary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let checksum = new FlowChecksumTransform();
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            resolve(undefined as void);
          });
          connectTransformToWritable(checksum, sink);
          feedTransform(checksum, ['A', 'B']);
        });
        expect(capturedText).assertEqual('AB#131');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_1400
     * @tc.name testStreamGeneralDataFlow014
     * @tc.desc Verify two complete Readable Transform Duplex Writable pipelines keep duplex-side records separate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAText: string = '';
        let capturedBText: string = '';
        let capturedAWriteCount: int = 0;
        let capturedBWriteCount: int = 0;
        let capturedADuplexWriteValid: boolean = true;
        let capturedBDuplexWriteValid: boolean = true;
        let capturedDAAValues: string[] = [];
        let capturedDBBValues: string[] = [];
        await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
          let sourceA = new ScenarioReadable(['one', 'two']);
          let transformA = new ScenarioAsyncTransform('TA:', 2);
          let duplexA = new ScenarioDuplex('DA:');
          let sinkA = new ScenarioCollectWritable();
          let sourceB = new ScenarioReadable(['red', 'blue']);
          let transformB = new ScenarioAsyncTransform('TB:', 4);
          let duplexB = new ScenarioDuplex('DB:');
          let sinkB = new ScenarioCollectWritable();
          let finished: int = 0;
          transformA.on('data', (chunk: Object): void => {
            duplexA.write(chunk.toString(), 'utf8', (err?: Error): void => {
              if (err !== undefined) { reject(err); return; }
              capturedADuplexWriteValid =
                duplexA.records[duplexA.writeCount - 1] === chunk.toString() && capturedADuplexWriteValid;
            });
          });
          transformB.on('data', (chunk: Object): void => {
            duplexB.write(chunk.toString(), 'utf8', (err?: Error): void => {
              if (err !== undefined) { reject(err); return; }
              capturedBDuplexWriteValid =
                duplexB.records[duplexB.writeCount - 1] === chunk.toString() && capturedBDuplexWriteValid;
            });
          });
          duplexA.on('data', (chunk: Object): void => {
            capturedDAAValues.push(chunk.toString());
            sinkA.write(chunk.toString(), 'utf8');
          });
          duplexB.on('data', (chunk: Object): void => {
            capturedDBBValues.push(chunk.toString());
            sinkB.write(chunk.toString(), 'utf8');
          });
          sourceA.on('data', (chunk: Object): void => {
            transformA.write(chunk.toString(), 'utf8');
          });
          sourceB.on('data', (chunk: Object): void => {
            transformB.write(chunk.toString(), 'utf8');
          });
          sourceA.on('end', (): void => {
            transformA.end();
          });
          sourceB.on('end', (): void => {
            transformB.end();
          });
          transformA.on('end', (): void => {
            duplexA.end();
          });
          transformB.on('end', (): void => {
            duplexB.end();
          });
          duplexA.on('finish', (): void => {
            duplexA.push(null);
          });
          duplexB.on('finish', (): void => {
            duplexB.push(null);
          });
          duplexA.on('end', (): void => {
            sinkA.end();
          });
          duplexB.on('end', (): void => {
            sinkB.end();
          });
          sinkA.on('finish', (): void => {
            capturedAText = sinkA.text;
            capturedAWriteCount = duplexA.writeCount;
            finished++;
            if (finished === 2) {
              resolve(undefined as void);
            }
          });
          sinkB.on('finish', (): void => {
            capturedBText = sinkB.text;
            capturedBWriteCount = duplexB.writeCount;
            finished++;
            if (finished === 2) {
              resolve(undefined as void);
            }
          });
          sourceA.resume();
          sourceB.resume();
        });
        expect(capturedDAAValues[0].startsWith('DA:')).assertTrue();
        expect(capturedDAAValues[1].startsWith('DA:')).assertTrue();
        expect(capturedDBBValues[0].startsWith('DB:')).assertTrue();
        expect(capturedDBBValues[1].startsWith('DB:')).assertTrue();
        expect(capturedADuplexWriteValid).assertTrue();
        expect(capturedBDuplexWriteValid).assertTrue();
        expect(capturedAText).assertEqual('DA:TA:oneDA:TA:two');
        expect(capturedAWriteCount).assertEqual(2);
        expect(capturedBText).assertEqual('DB:TB:redDB:TB:blue');
        expect(capturedBWriteCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_1500
     * @tc.name testStreamGeneralDataFlow015
     * @tc.desc Verify interleaved writes to two asynchronous Transform instances do not share counters or output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedLeftText: string = '';
        let capturedRightText: string = '';
        let capturedFirstTransformCount: int = 0;
        let capturedSecondTransformCount: int = 0;
        let capturedFirstOrderValid: boolean = true;
        let capturedSecondOrderValid: boolean = true;
        let capturedLValues: string[] = [];
        let capturedRValues: string[] = [];
        await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
          let first = new ScenarioAsyncTransform('L:', 3);
          let second = new ScenarioAsyncTransform('R:', 3);
          let left = new ScenarioCollectWritable();
          let right = new ScenarioCollectWritable();
          first.on('data', (chunk: Object): void => {
            capturedLValues.push(chunk.toString());
            left.write(chunk.toString(), 'utf8');
          });
          second.on('data', (chunk: Object): void => {
            capturedRValues.push(chunk.toString());
            right.write(chunk.toString(), 'utf8');
          });
          left.on('finish', (): void => {
            capturedLeftText = left.text;
            capturedFirstTransformCount = first.transformCount;
            if (right.writableFinished) {
              resolve(undefined as void);
            }
          });
          right.on('finish', (): void => {
            capturedRightText = right.text;
            capturedSecondTransformCount = second.transformCount;
            if (left.writableFinished) {
              resolve(undefined as void);
            }
          });
          first.on('end', (): void => {
            left.end();
          });
          second.on('end', (): void => {
            right.end();
          });
          first.write('l1', 'utf8', (err?: Error): void => {
            if (err !== undefined) { reject(err); return; }
            capturedFirstOrderValid = first.callOrder[0] === 'start:l1' && capturedFirstOrderValid;
          });
          second.write('r1', 'utf8', (err?: Error): void => {
            if (err !== undefined) { reject(err); return; }
            capturedSecondOrderValid = second.callOrder[0] === 'start:r1' && capturedSecondOrderValid;
          });
          first.write('l2', 'utf8');
          second.write('r2', 'utf8');
          first.end();
          second.end();
        });
        expect(capturedLValues[0].startsWith('L:')).assertTrue();
        expect(capturedLValues[1].startsWith('L:')).assertTrue();
        expect(capturedRValues[0].startsWith('R:')).assertTrue();
        expect(capturedRValues[1].startsWith('R:')).assertTrue();
        expect(capturedLeftText).assertEqual('L:l1L:l2');
        expect(capturedFirstTransformCount).assertEqual(2);
        expect(capturedRightText).assertEqual('R:r1R:r2');
        expect(capturedSecondTransformCount).assertEqual(2);
        expect(capturedFirstOrderValid).assertTrue();
        expect(capturedSecondOrderValid).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_1600
     * @tc.name testStreamGeneralDataFlow016
     * @tc.desc Verify a flush marker in one pipeline cannot appear in the output of a pipeline without flush data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAText: string = '';
        let capturedBText: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sourceA = new ScenarioReadable(['data-a']);
          let transformA = new ScenarioAsyncTransform('A:', 2, '<A-FLUSH>');
          let sinkA = new ScenarioCollectWritable();
          let sourceB = new ScenarioReadable(['data-b']);
          let transformB = new ScenarioAsyncTransform('B:', 2);
          let sinkB = new ScenarioCollectWritable();
          let finished: int = 0;
          transformA.on('data', (chunk: Object): void => {
            sinkA.write(chunk.toString(), 'utf8');
          });
          transformB.on('data', (chunk: Object): void => {
            sinkB.write(chunk.toString(), 'utf8');
          });
          sourceA.on('data', (chunk: Object): void => {
            transformA.write(chunk.toString(), 'utf8');
          });
          sourceB.on('data', (chunk: Object): void => {
            transformB.write(chunk.toString(), 'utf8');
          });
          sourceA.on('end', (): void => {
            transformA.end();
          });
          sourceB.on('end', (): void => {
            transformB.end();
          });
          transformA.on('end', (): void => {
            sinkA.end();
          });
          transformB.on('end', (): void => {
            sinkB.end();
          });
          sinkA.on('finish', (): void => {
            capturedAText = sinkA.text;
            finished++;
            if (finished === 2) {
              resolve(undefined as void);
            }
          });
          sinkB.on('finish', (): void => {
            capturedBText = sinkB.text;
            finished++;
            if (finished === 2) {
              resolve(undefined as void);
            }
          });
          sourceA.resume();
          sourceB.resume();
        });
        expect(capturedAText).assertEqual('A:data-a<A-FLUSH>');
        expect(capturedBText).assertEqual('B:data-b');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_1700
     * @tc.name testStreamGeneralDataFlow017
     * @tc.desc Verify starting a second pipeline after the first finish does not inherit the first pipeline state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAText: string = '';
        let capturedAFilter: string = '';
        let capturedATransformCount: int = 0;
        let capturedBText: string = '';
        let capturedBFilter: string = '';
        let capturedBTransformCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sourceA = new ScenarioReadable(['first']);
          let transformA = new ScenarioAsyncTransform('A:', 1);
          let sinkA = new ScenarioCollectWritable();
          let sourceB = new ScenarioReadable(['second']);
          let transformB = new ScenarioAsyncTransform('B:', 1);
          let sinkB = new ScenarioCollectWritable();
          transformA.on('data', (chunk: Object): void => {
            capturedAFilter = chunk.toString();
            sinkA.write(chunk.toString(), 'utf8');
          });
          sourceA.on('data', (chunk: Object): void => {
            transformA.write(chunk.toString(), 'utf8');
          });
          sourceA.on('end', (): void => {
            transformA.end();
          });
          transformA.on('end', (): void => {
            sinkA.end();
          });
          sinkA.on('finish', (): void => {
            capturedAText = sinkA.text;
            capturedATransformCount = transformA.transformCount;
            transformB.on('data', (chunk: Object): void => {
              capturedBFilter = chunk.toString();
              sinkB.write(chunk.toString(), 'utf8');
            });
            sourceB.on('data', (chunk: Object): void => {
              transformB.write(chunk.toString(), 'utf8');
            });
            sourceB.on('end', (): void => {
              transformB.end();
            });
            transformB.on('end', (): void => {
              sinkB.end();
            });
            sinkB.on('finish', (): void => {
              capturedBText = sinkB.text;
              capturedBTransformCount = transformB.transformCount;
              resolve(undefined as void);
            });
            sourceB.resume();
          });
          sourceA.resume();
        });
        expect(capturedAFilter).assertEqual('A:first');
        expect(capturedAText).assertEqual('A:first');
        expect(capturedATransformCount).assertEqual(1);
        expect(capturedBFilter).assertEqual('B:second');
        expect(capturedBText).assertEqual('B:second');
        expect(capturedBTransformCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_GENERAL_DATA_FLOW_1800
     * @tc.name testStreamGeneralDataFlow018
     * @tc.desc Verify concurrent pipelines with different sink delays complete with independent callback counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamGeneralDataFlow018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAText: string = '';
        let capturedACallbackCount: int = 0;
        let capturedBText: string = '';
        let capturedBCallbackCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sourceA = new ScenarioReadable(['a', 'b', 'c']);
          let sourceB = new ScenarioReadable(['x', 'y', 'z', 'w']);
          let transformA = new ScenarioAsyncTransform('A:', 1);
          let transformB = new ScenarioAsyncTransform('B:', 1);
          let sinkA = new ScenarioCollectWritable(8);
          let sinkB = new ScenarioCollectWritable(1);
          let finished: int = 0;
          sourceA.on('data', (chunk: Object): void => {
            transformA.write(chunk.toString(), 'utf8');
          });
          sourceB.on('data', (chunk: Object): void => {
            transformB.write(chunk.toString(), 'utf8');
          });
          transformA.on('data', (chunk: Object): void => {
            sinkA.write(chunk.toString(), 'utf8');
          });
          transformB.on('data', (chunk: Object): void => {
            sinkB.write(chunk.toString(), 'utf8');
          });
          sourceA.on('end', (): void => {
            transformA.end();
          });
          sourceB.on('end', (): void => {
            transformB.end();
          });
          transformA.on('end', (): void => {
            sinkA.end();
          });
          transformB.on('end', (): void => {
            sinkB.end();
          });
          sinkA.on('finish', (): void => {
            capturedAText = sinkA.text;
            capturedACallbackCount = sinkA.callbackCount;
            finished++;
            if (finished === 2) {
              resolve(undefined as void);
            }
          });
          sinkB.on('finish', (): void => {
            capturedBText = sinkB.text;
            capturedBCallbackCount = sinkB.callbackCount;
            finished++;
            if (finished === 2) {
              resolve(undefined as void);
            }
          });
          sourceA.resume();
          sourceB.resume();
        });
        expect(capturedAText).assertEqual('A:aA:bA:c');
        expect(capturedACallbackCount).assertEqual(3);
        expect(capturedBText).assertEqual('B:xB:yB:zB:w');
        expect(capturedBCallbackCount).assertEqual(4);

        done();
      });
  });
}
