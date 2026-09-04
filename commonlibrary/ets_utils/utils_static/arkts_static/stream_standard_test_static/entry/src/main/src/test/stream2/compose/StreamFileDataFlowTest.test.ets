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
  connectTransformToWritable,
  feedTransform,
  FlowByteWritable,
  FlowChunkReadable,
  FlowCollectWritable,
  FlowLineTransform,
  FlowTrailerTransform
} from '../../StreamComposeTestBase';
import {
  ThirdBatchCheckpointWritable,
  ThirdBatchEchoTransform,
  ThirdBatchTextReadable,
  connectCheckpointFlow
} from '../../StreamComposeTestBase';
import { stream } from '@kit.ArkTS';

class FileRotationWritable extends stream.Writable {
  public pending: string = '';
  public files: string[] = [''];
  public lineCount: int = 0;
  public writeCount: int = 0;
  public maxFileSize: int;

  constructor(maxFileSize: int) {
    super();
    this.maxFileSize = maxFileSize;
  }

  private appendLine(line: string): void {
    let currentIndex: int = this.files.length - 1;
    let current: string = this.files[currentIndex];
    if (current.length > 0 && current.length + line.length > this.maxFileSize) {
      this.files.push(line);
    } else {
      this.files[currentIndex] = current + line;
    }
    this.lineCount++;
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.pending += chunk.toString();
    this.writeCount++;
    let newline: int = this.pending.indexOf('\n');
    while (newline >= 0) {
      let line: string = this.pending.substring(0, newline + 1);
      this.pending = this.pending.substring(newline + 1);
      this.appendLine(line);
      newline = this.pending.indexOf('\n');
    }
    callback.unsafeCall();
  }
}

export default function StreamFileDataFlowTest(): void {
  describe('StreamFileDataFlowTest', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_0100
     * @tc.name testStreamFileDataFlow001
     * @tc.desc Verify simulated text file chunks reconstruct the original file without boundary loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new FlowChunkReadable(['Open', 'Harmony', ' Stream']);
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          source.writeTo(sink);
        });
        expect(capturedText).assertEqual('OpenHarmony Stream');
        expect(capturedWriteCount).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_0200
     * @tc.name testStreamFileDataFlow002
     * @tc.desc Verify line separators split across file chunks are reassembled into complete lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let lines = new FlowLineTransform();
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          let source = new ThirdBatchTextReadable(['line1\nli', 'ne2\nline', '3\n']);
          source.on('data', (chunk: Object): void => {
            lines.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            lines.end();
          });
          source.resume();
          lines.pipe(sink);
        });
        expect(capturedText).assertEqual('line1|line2|line3|');
        expect(capturedWriteCount).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_0300
     * @tc.name testStreamFileDataFlow003
     * @tc.desc Verify CRLF file records split across chunks are normalized without carriage return leakage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let lines = new FlowLineTransform();
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            resolve(undefined as void);
          });
          connectTransformToWritable(lines, sink);
          setTimeout((): void => {
            lines.write('row1\r', 'utf8');
            lines.write('\nrow2\r\n', 'utf8');
            lines.write('row3\r', 'utf8');
            lines.end('\n', 'utf8');
          }, 0);
        });
        expect(capturedText).assertEqual('row1|row2|row3|');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_0400
     * @tc.name testStreamFileDataFlow004
     * @tc.desc Verify a file without trailing newline emits its final record during stream flush
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let lines = new FlowLineTransform();
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          connectTransformToWritable(lines, sink);
          setTimeout((): void => {
            lines.write('first\nsec', 'utf8');
            lines.end('ond', 'utf8');
          }, 0);
        });
        expect(capturedText).assertEqual('first|second|');
        expect(capturedWriteCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_0500
     * @tc.name testStreamFileDataFlow005
     * @tc.desc Verify simulated binary file blocks preserve every byte in source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        await new Promise<void>((resolve: (value: void) => void): void => {
          let first = new Uint8Array([0, 1, 2, 3]);
          let second = new Uint8Array([254, 255]);
          let source = new FlowChunkReadable([first, second]);
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
        expect(capturedBytes.length).assertEqual(6);
        expect(capturedBytes[0]).assertEqual(0);
        expect(capturedBytes[4]).assertEqual(254);
        expect(capturedBytes[5]).assertEqual(255);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_0600
     * @tc.name testStreamFileDataFlow006
     * @tc.desc Verify a large simulated file divided into fixed blocks completes without loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let chunks: (string | Uint8Array)[] = [];
        let expected: string = '';
        for (let index: int = 0; index < 16; index++) {
          let block: string = index.toString() + ':' + 'x'.repeat(1024) + ';';
          chunks.push(block);
          expected += block;
        }
        let capturedTextLength: int = 0;
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new FlowChunkReadable(chunks);
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedTextLength = sink.text.length;
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          connectReadableToWritable(source, sink);
        });
        expect(capturedTextLength).assertEqual(expected.length);
        expect(capturedText).assertEqual(expected);
        expect(capturedWriteCount).assertEqual(16);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_0700
     * @tc.name testStreamFileDataFlow007
     * @tc.desc Verify file records containing Chinese and emoji survive arbitrary chunk boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let lines = new FlowLineTransform();
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            resolve(undefined as void);
          });
          connectTransformToWritable(lines, sink);
          feedTransform(lines, ['第一', '行\n😀', '第二行\n']);
        });
        expect(capturedText).assertEqual('第一行|😀第二行|');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_0800
     * @tc.name testStreamFileDataFlow008
     * @tc.desc Verify a simulated file stream appends an explicit end marker after all file blocks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedChunk2: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let trailer = new FlowTrailerTransform('<FILE-END>');
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedChunk2 = sink.chunks[2];
            resolve(undefined as void);
          });
          connectTransformToWritable(trailer, sink);
          feedTransform(trailer, ['part1', 'part2']);
        });
        expect(capturedText).assertEqual('part1part2<FILE-END>');
        expect(capturedChunk2).assertEqual('<FILE-END>');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_0900
     * @tc.name testStreamFileDataFlow009
     * @tc.desc Verify a checkpoint is recorded after every complete file record and final text is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedCheckpoints: string = '';
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ThirdBatchTextReadable(['head\n', 'body\n', 'tail\n']);
          let sink = new ThirdBatchCheckpointWritable(1);
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedCheckpoints = sink.checkpoints.join(',');
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          connectCheckpointFlow(source, sink);
        });
        expect(capturedText).assertEqual('head\nbody\ntail\n');
        expect(capturedCheckpoints).assertEqual('5,10,15');
        expect(capturedWriteCount).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_1000
     * @tc.name testStreamFileDataFlow010
     * @tc.desc Verify data-event forwarding records only every second file block checkpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedCheckpoints: string = '';
        let capturedRecordsLength: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ThirdBatchTextReadable(['a\n', 'bb\n', 'ccc\n', 'dddd\n']);
          let sink = new ThirdBatchCheckpointWritable(2);
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedCheckpoints = sink.checkpoints.join(',');
            capturedRecordsLength = sink.records.length;
            resolve(undefined as void);
          });
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedText).assertEqual('a\nbb\nccc\ndddd\n');
        expect(capturedCheckpoints).assertEqual('5,14');
        expect(capturedRecordsLength).assertEqual(4);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_1100
     * @tc.name testStreamFileDataFlow011
     * @tc.desc Verify an empty simulated file closes with offset zero and no checkpoint record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedCheckpointsLength: int = 0;
        let capturedWritableFinished: boolean = false;
        let capturedDataEmitted: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ThirdBatchTextReadable([]);
          let sink = new ThirdBatchCheckpointWritable(1);
          source.on('data', (): void => {
            capturedDataEmitted = true;
          });
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedCheckpointsLength = sink.checkpoints.length;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          connectCheckpointFlow(source, sink);
        });
        expect(capturedDataEmitted).assertFalse();
        expect(capturedText).assertEqual('');
        expect(capturedWriteCount).assertEqual(0);
        expect(capturedCheckpointsLength).assertEqual(0);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_1200
     * @tc.name testStreamFileDataFlow012
     * @tc.desc Verify exact capacity blocks create exact checkpoint offsets without an extra rotation block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedCheckpoints: string = '';
        let capturedRecord0: string = '';
        let capturedRecord1: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ThirdBatchTextReadable(['1234', '5678']);
          let sink = new ThirdBatchCheckpointWritable(1);
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedCheckpoints = sink.checkpoints.join(',');
            capturedRecord0 = sink.records[0];
            capturedRecord1 = sink.records[1];
            resolve(undefined as void);
          });
          connectCheckpointFlow(source, sink);
        });
        expect(capturedText).assertEqual('12345678');
        expect(capturedCheckpoints).assertEqual('4,8');
        expect(capturedRecord0).assertEqual('1234');
        expect(capturedRecord1).assertEqual('5678');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_1300
     * @tc.name testStreamFileDataFlow013
     * @tc.desc Verify a record split across writes keeps write order and checkpoint positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedCheckpoints: string = '';
        let capturedRecord0: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ThirdBatchTextReadable(['part', 'ial\n', 'next\n']);
          let sink = new ThirdBatchCheckpointWritable(1);
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedCheckpoints = sink.checkpoints.join(',');
            capturedRecord0 = sink.records[0];
            resolve(undefined as void);
          });
          connectCheckpointFlow(source, sink);
        });
        expect(capturedText).assertEqual('partial\nnext\n');
        expect(capturedCheckpoints).assertEqual('4,8,13');
        expect(capturedRecord0).assertEqual('part');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_1400
     * @tc.name testStreamFileDataFlow014
     * @tc.desc Verify a resumed file flow appends only records after the saved checkpoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedCombinedText: string = '';
        let capturedFirstCheckpoint1: int = 0;
        let capturedResumedCheckpoints: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let first = new ThirdBatchTextReadable(['prefix\n', 'saved\n']);
          let firstSink = new ThirdBatchCheckpointWritable(1);
          firstSink.on('finish', (): void => {
            let resumed = new ThirdBatchTextReadable(['tail\n', 'done\n']);
            let resumedSink = new ThirdBatchCheckpointWritable(1);
            resumedSink.on('finish', (): void => {
              capturedCombinedText = firstSink.text + resumedSink.text;
              capturedFirstCheckpoint1 = firstSink.checkpoints[1];
              capturedResumedCheckpoints = resumedSink.checkpoints.join(',');
              resolve(undefined as void);
            });
            connectCheckpointFlow(resumed, resumedSink);
          });
          connectCheckpointFlow(first, firstSink);
        });
        expect(capturedCombinedText).assertEqual('prefix\nsaved\ntail\ndone\n');
        expect(capturedFirstCheckpoint1).assertEqual(13);
        expect(capturedResumedCheckpoints).assertEqual('5,10');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_1500
     * @tc.name testStreamFileDataFlow015
     * @tc.desc Verify corked file writes release in order before the final checkpoint and finish event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedCheckpoints: string = '';
        let capturedCorked: int = 0;
        let capturedRecord0Valid: boolean = true;
        let capturedRecord1Valid: boolean = true;
        await new Promise<void>((resolve: (value: void) => void, reject: (err: Error) => void): void => {
          let sink = new ThirdBatchCheckpointWritable(1);
          sink.cork();
          sink.write('one\n', 'utf8', (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
              return;
            }
            capturedRecord0Valid = sink.records[0] === 'one\n' && capturedRecord0Valid;
          });
          sink.write('two\n', 'utf8', (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
              return;
            }
            capturedRecord1Valid = sink.records[1] === 'two\n' && capturedRecord1Valid;
          });
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedCheckpoints = sink.checkpoints.join(',');
            capturedCorked = sink.writableCorked;
            resolve(undefined as void);
          });
          setTimeout((): void => {
            sink.uncork();
            sink.end();
          }, 0);
        });
        expect(capturedRecord0Valid).assertTrue();
        expect(capturedRecord1Valid).assertTrue();
        expect(capturedText).assertEqual('one\ntwo\n');
        expect(capturedCheckpoints).assertEqual('4,8');
        expect(capturedCorked).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_1600
     * @tc.name testStreamFileDataFlow016
     * @tc.desc Verify multilingual file blocks preserve exact content and checkpoint length across completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedCheckpoints: string = '';
        let capturedRecordsLength: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ThirdBatchTextReadable(['中文\n', '😀\n', 'end\n']);
          let sink = new ThirdBatchCheckpointWritable(1);
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedCheckpoints = sink.checkpoints.join(',');
            capturedRecordsLength = sink.records.length;
            resolve(undefined as void);
          });
          connectCheckpointFlow(source, sink);
        });
        expect(capturedText).assertEqual('中文\n😀\nend\n');
        expect(capturedCheckpoints).assertEqual('3,6,10');
        expect(capturedRecordsLength).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_1700
     * @tc.name testStreamFileDataFlow017
     * @tc.desc Verify next line rotates after exact capacity after the complete simulated file stream finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedFilesJoined: string = '';
        let capturedFilesLength: int = 0;
        let capturedPending: string = '';
        let capturedLineCount: int = 0;
        let capturedWriteCount: int = 0;
        let capturedMaxFileSize: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FileRotationWritable(4);
          let source = new ThirdBatchTextReadable(['abc\n', 'd\n']);
          sink.on('finish', (): void => {
            capturedFilesJoined = sink.files.join('|');
            capturedFilesLength = sink.files.length;
            capturedPending = sink.pending;
            capturedLineCount = sink.lineCount;
            capturedWriteCount = sink.writeCount;
            capturedMaxFileSize = sink.maxFileSize;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedFilesJoined).assertEqual("abc\n|d\n");
        expect(capturedFilesLength).assertEqual(2);
        expect(capturedPending).assertEqual("");
        expect(capturedLineCount).assertEqual(2);
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedMaxFileSize).assertEqual(4);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_1800
     * @tc.name testStreamFileDataFlow018
     * @tc.desc Verify multiple lines remain in one file below capacity after the complete simulated file stream finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedFilesJoined: string = '';
        let capturedFilesLength: int = 0;
        let capturedPending: string = '';
        let capturedLineCount: int = 0;
        let capturedWriteCount: int = 0;
        let capturedMaxFileSize: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FileRotationWritable(10);
          sink.on('finish', (): void => {
            capturedFilesJoined = sink.files.join('|');
            capturedFilesLength = sink.files.length;
            capturedPending = sink.pending;
            capturedLineCount = sink.lineCount;
            capturedWriteCount = sink.writeCount;
            capturedMaxFileSize = sink.maxFileSize;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.cork();
          sink.write('a\n', 'utf8');
          sink.write('b\n', 'utf8');
          sink.uncork();
          sink.end();
        });
        expect(capturedFilesJoined).assertEqual("a\nb\n");
        expect(capturedFilesLength).assertEqual(1);
        expect(capturedPending).assertEqual("");
        expect(capturedLineCount).assertEqual(2);
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedMaxFileSize).assertEqual(10);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_1900
     * @tc.name testStreamFileDataFlow019
     * @tc.desc Verify every line character delivered separately after the complete simulated file stream finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedFilesJoined: string = '';
        let capturedFilesLength: int = 0;
        let capturedPending: string = '';
        let capturedLineCount: int = 0;
        let capturedWriteCount: int = 0;
        let capturedMaxFileSize: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FileRotationWritable(10);
          let source = new ThirdBatchTextReadable(["a", "b", "c", "\n"]);
          sink.on('finish', (): void => {
            capturedFilesJoined = sink.files.join('|');
            capturedFilesLength = sink.files.length;
            capturedPending = sink.pending;
            capturedLineCount = sink.lineCount;
            capturedWriteCount = sink.writeCount;
            capturedMaxFileSize = sink.maxFileSize;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.end();
          });
          source.resume();
        });
        expect(capturedFilesJoined).assertEqual("abc\n");
        expect(capturedFilesLength).assertEqual(1);
        expect(capturedPending).assertEqual("");
        expect(capturedLineCount).assertEqual(1);
        expect(capturedWriteCount).assertEqual(4);
        expect(capturedMaxFileSize).assertEqual(10);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_2000
     * @tc.name testStreamFileDataFlow020
     * @tc.desc Verify consecutive blank lines remain ordered after the complete simulated file stream finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedFilesJoined: string = '';
        let capturedFilesLength: int = 0;
        let capturedPending: string = '';
        let capturedLineCount: int = 0;
        let capturedWriteCount: int = 0;
        let capturedMaxFileSize: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["\n\n"];
          let sink = new FileRotationWritable(4);
          sink.on('finish', (): void => {
            capturedFilesJoined = sink.files.join('|');
            capturedFilesLength = sink.files.length;
            capturedPending = sink.pending;
            capturedLineCount = sink.lineCount;
            capturedWriteCount = sink.writeCount;
            capturedMaxFileSize = sink.maxFileSize;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.end(chunks[0], 'utf8');
        });
        expect(capturedFilesJoined).assertEqual("\n\n");
        expect(capturedFilesLength).assertEqual(1);
        expect(capturedPending).assertEqual("");
        expect(capturedLineCount).assertEqual(2);
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedMaxFileSize).assertEqual(4);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_2100
     * @tc.name testStreamFileDataFlow021
     * @tc.desc Verify oversized line occupies one file without truncation after the complete simulated file stream finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedFilesJoined: string = '';
        let capturedFilesLength: int = 0;
        let capturedPending: string = '';
        let capturedLineCount: int = 0;
        let capturedWriteCount: int = 0;
        let capturedMaxFileSize: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FileRotationWritable(4);
          sink.setDefaultEncoding('utf8');
          sink.on('finish', (): void => {
            capturedFilesJoined = sink.files.join('|');
            capturedFilesLength = sink.files.length;
            capturedPending = sink.pending;
            capturedLineCount = sink.lineCount;
            capturedWriteCount = sink.writeCount;
            capturedMaxFileSize = sink.maxFileSize;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.end("abcdef\n", 'utf8');
        });
        expect(capturedFilesJoined).assertEqual("abcdef\n");
        expect(capturedFilesLength).assertEqual(1);
        expect(capturedPending).assertEqual("");
        expect(capturedLineCount).assertEqual(1);
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedMaxFileSize).assertEqual(4);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_2200
     * @tc.name testStreamFileDataFlow022
     * @tc.desc Verify blank line rotates after an exactly full file after the complete simulated file stream finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedFilesJoined: string = '';
        let capturedFilesLength: int = 0;
        let capturedPending: string = '';
        let capturedLineCount: int = 0;
        let capturedWriteCount: int = 0;
        let capturedMaxFileSize: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["abc\n\n"];
          let sink = new FileRotationWritable(4);
          sink.on('finish', (): void => {
            capturedFilesJoined = sink.files.join('|');
            capturedFilesLength = sink.files.length;
            capturedPending = sink.pending;
            capturedLineCount = sink.lineCount;
            capturedWriteCount = sink.writeCount;
            capturedMaxFileSize = sink.maxFileSize;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.cork();
          sink.write(chunks[0], 'utf8');
          sink.uncork();
          sink.end();
        });
        expect(capturedFilesJoined).assertEqual("abc\n|\n");
        expect(capturedFilesLength).assertEqual(2);
        expect(capturedPending).assertEqual("");
        expect(capturedLineCount).assertEqual(2);
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedMaxFileSize).assertEqual(4);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_2300
     * @tc.name testStreamFileDataFlow023
     * @tc.desc Verify a piped text source rotates Chinese lines by UTF-16 length before completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedFilesJoined: string = '';
        let capturedFilesLength: int = 0;
        let capturedPending: string = '';
        let capturedLineCount: int = 0;
        let capturedWriteCount: int = 0;
        let capturedMaxFileSize: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["中文\na\n"];
          let sink = new FileRotationWritable(4);
          sink.on('finish', (): void => {
            capturedFilesJoined = sink.files.join('|');
            capturedFilesLength = sink.files.length;
            capturedPending = sink.pending;
            capturedLineCount = sink.lineCount;
            capturedWriteCount = sink.writeCount;
            capturedMaxFileSize = sink.maxFileSize;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let fileSource = new ThirdBatchTextReadable(chunks);
          fileSource.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          fileSource.on('end', (): void => {
            sink.end();
          });
          fileSource.resume();
        });
        expect(capturedFilesJoined).assertEqual("中文\n|a\n");
        expect(capturedFilesLength).assertEqual(2);
        expect(capturedPending).assertEqual("");
        expect(capturedLineCount).assertEqual(2);
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedMaxFileSize).assertEqual(4);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_2400
     * @tc.name testStreamFileDataFlow024
     * @tc.desc Verify emoji line rotates before following line after the complete simulated file stream finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedFilesJoined: string = '';
        let capturedFilesLength: int = 0;
        let capturedPending: string = '';
        let capturedLineCount: int = 0;
        let capturedWriteCount: int = 0;
        let capturedMaxFileSize: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FileRotationWritable(4);
          let source = new ThirdBatchTextReadable(["😀\na\n"]);
          sink.on('finish', (): void => {
            capturedFilesJoined = sink.files.join('|');
            capturedFilesLength = sink.files.length;
            capturedPending = sink.pending;
            capturedLineCount = sink.lineCount;
            capturedWriteCount = sink.writeCount;
            capturedMaxFileSize = sink.maxFileSize;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          source.on('readable', (): void => {
            let chunk: Object | null = source.read();
            while (chunk !== null) {
              sink.write(chunk.toString(), 'utf8');
              chunk = source.read();
            }
          });
          source.on('end', (): void => {
            sink.end();
          });
        });
        expect(capturedFilesJoined).assertEqual("😀\n|a\n");
        expect(capturedFilesLength).assertEqual(2);
        expect(capturedPending).assertEqual("");
        expect(capturedLineCount).assertEqual(2);
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedMaxFileSize).assertEqual(4);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_2500
     * @tc.name testStreamFileDataFlow025
     * @tc.desc Verify CRLF input preserves carriage return in file after the complete simulated file stream finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedFilesJoined: string = '';
        let capturedFilesLength: int = 0;
        let capturedPending: string = '';
        let capturedLineCount: int = 0;
        let capturedWriteCount: int = 0;
        let capturedMaxFileSize: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FileRotationWritable(5);
          let chunks: string[] = ["a\r", "\n"];
          sink.on('finish', (): void => {
            capturedFilesJoined = sink.files.join('|');
            capturedFilesLength = sink.files.length;
            capturedPending = sink.pending;
            capturedLineCount = sink.lineCount;
            capturedWriteCount = sink.writeCount;
            capturedMaxFileSize = sink.maxFileSize;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          for (let index: int = 0; index < chunks.length - 1; index++) {
            sink.write(chunks[index], 'utf8');
          }
          sink.end(chunks[chunks.length - 1], 'utf8');
        });
        expect(capturedFilesJoined).assertEqual("a\r\n");
        expect(capturedFilesLength).assertEqual(1);
        expect(capturedPending).assertEqual("");
        expect(capturedLineCount).assertEqual(1);
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedMaxFileSize).assertEqual(5);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_2600
     * @tc.name testStreamFileDataFlow026
     * @tc.desc Verify complete line persists while final partial line remains pending after the complete simulated file stream finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedFilesJoined: string = '';
        let capturedFilesLength: int = 0;
        let capturedPending: string = '';
        let capturedLineCount: int = 0;
        let capturedWriteCount: int = 0;
        let capturedMaxFileSize: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["a\nb"];
          let sink = new FileRotationWritable(10);
          sink.setDefaultEncoding('utf8');
          sink.on('finish', (): void => {
            capturedFilesJoined = sink.files.join('|');
            capturedFilesLength = sink.files.length;
            capturedPending = sink.pending;
            capturedLineCount = sink.lineCount;
            capturedWriteCount = sink.writeCount;
            capturedMaxFileSize = sink.maxFileSize;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.write(chunks[0], 'utf8');
          sink.end();
        });
        expect(capturedFilesJoined).assertEqual("a\n");
        expect(capturedFilesLength).assertEqual(1);
        expect(capturedPending).assertEqual("b");
        expect(capturedLineCount).assertEqual(1);
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedMaxFileSize).assertEqual(10);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_2700
     * @tc.name testStreamFileDataFlow027
     * @tc.desc Verify hundred lines remain exact in a large simulated file after the complete simulated file stream finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let data: string = '';
        for (let index: int = 0; index < 100; index++) {
          data += 'line-' + index.toString() + '\n';
        }
        let unit: int = (data.length / 5).toInt();
        let chunks: string[] = [data.substring(0, unit), data.substring(unit, unit * 2),
          data.substring(unit * 2, unit * 3), data.substring(unit * 3, unit * 4), data.substring(unit * 4)];
        let capturedFilesJoined: string = '';
        let capturedFilesLength: int = 0;
        let capturedPending: string = '';
        let capturedLineCount: int = 0;
        let capturedWriteCount: int = 0;
        let capturedMaxFileSize: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FileRotationWritable(10000);
          sink.on('finish', (): void => {
            capturedFilesJoined = sink.files.join('|');
            capturedFilesLength = sink.files.length;
            capturedPending = sink.pending;
            capturedLineCount = sink.lineCount;
            capturedWriteCount = sink.writeCount;
            capturedMaxFileSize = sink.maxFileSize;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          for (let index: int = 0; index < chunks.length - 1; index++) {
            sink.write(chunks[index], 'utf8');
          }
          sink.end(chunks[chunks.length - 1], 'utf8');
        });
        expect(capturedFilesJoined).assertEqual(data);
        expect(capturedFilesLength).assertEqual(1);
        expect(capturedPending).assertEqual("");
        expect(capturedLineCount).assertEqual(100);
        expect(capturedWriteCount).assertEqual(5);
        expect(capturedMaxFileSize).assertEqual(10000);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_2800
     * @tc.name testStreamFileDataFlow028
     * @tc.desc Verify capacity one stores each oversized line separately after the complete simulated file stream finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedFilesJoined: string = '';
        let capturedFilesLength: int = 0;
        let capturedPending: string = '';
        let capturedLineCount: int = 0;
        let capturedWriteCount: int = 0;
        let capturedMaxFileSize: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["a\nb\n"];
          let sink = new FileRotationWritable(1);
          sink.on('finish', (): void => {
            capturedFilesJoined = sink.files.join('|');
            capturedFilesLength = sink.files.length;
            capturedPending = sink.pending;
            capturedLineCount = sink.lineCount;
            capturedWriteCount = sink.writeCount;
            capturedMaxFileSize = sink.maxFileSize;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.cork();
          sink.write(chunks[0], 'utf8');
          sink.uncork();
          sink.end(undefined, 'utf8');
        });
        expect(capturedFilesJoined).assertEqual("a\n|b\n");
        expect(capturedFilesLength).assertEqual(2);
        expect(capturedPending).assertEqual("");
        expect(capturedLineCount).assertEqual(2);
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedMaxFileSize).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_2900
     * @tc.name testStreamFileDataFlow029
     * @tc.desc Verify large line split across six writes remains intact after the complete simulated file stream finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let line: string = '';
        for (let index: int = 0; index < 1024; index++) {
          line += String.fromCharCode(65 + index % 26);
        }
        let data: string = line + '\n';
        let chunks: string[] = [data.substring(0, 200), data.substring(200, 400), data.substring(400, 600),
          data.substring(600, 800), data.substring(800, 1000), data.substring(1000)];
        let capturedFilesJoined: string = '';
        let capturedFilesLength: int = 0;
        let capturedPending: string = '';
        let capturedLineCount: int = 0;
        let capturedWriteCount: int = 0;
        let capturedMaxFileSize: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FileRotationWritable(2000);
          sink.setDefaultEncoding('utf8');
          sink.on('finish', (): void => {
            capturedFilesJoined = sink.files.join('|');
            capturedFilesLength = sink.files.length;
            capturedPending = sink.pending;
            capturedLineCount = sink.lineCount;
            capturedWriteCount = sink.writeCount;
            capturedMaxFileSize = sink.maxFileSize;
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
        expect(capturedFilesJoined).assertEqual(data);
        expect(capturedFilesLength).assertEqual(1);
        expect(capturedPending).assertEqual("");
        expect(capturedLineCount).assertEqual(1);
        expect(capturedWriteCount).assertEqual(6);
        expect(capturedMaxFileSize).assertEqual(2000);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_3000
     * @tc.name testStreamFileDataFlow030
     * @tc.desc Verify end(data) creates one file block, one sink chunk, and checksum 1671 before finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedChunksLength: int = 0;
        let capturedFirst: string = '';
        let capturedLast: string = '';
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedChunksLength = sink.chunks.length;
            capturedFirst = sink.chunks[0];
            capturedLast = sink.chunks[sink.chunks.length - 1];
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.end('single-file-block', 'utf8');
        });
        let checksum: int = 0;
        for (let index: int = 0; index < capturedText.length; index++) {
          checksum += capturedText.charCodeAt(index);
        }
        expect(capturedText).assertEqual("single-file-block");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedChunksLength).assertEqual(1);
        expect(capturedFirst).assertEqual("single-file-block");
        expect(capturedLast).assertEqual("single-file-block");
        expect(checksum).assertEqual(1671);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_3100
     * @tc.name testStreamFileDataFlow031
     * @tc.desc Verify a Readable source preserves first-half and second-half as two ordered file chunks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedChunksLength: int = 0;
        let capturedFirst: string = '';
        let capturedLast: string = '';
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new FlowChunkReadable(['first-half', 'second-half']);
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedChunksLength = sink.chunks.length;
            capturedFirst = sink.chunks[0];
            capturedLast = sink.chunks[sink.chunks.length - 1];
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          connectReadableToWritable(source, sink);
        });
        let checksum: int = 0;
        for (let index: int = 0; index < capturedText.length; index++) {
          checksum += capturedText.charCodeAt(index);
        }
        expect(capturedText).assertEqual("first-halfsecond-half");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedChunksLength).assertEqual(2);
        expect(capturedFirst).assertEqual("first-half");
        expect(capturedLast).assertEqual("second-half");
        expect(checksum).assertEqual(2100);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_3200
     * @tc.name testStreamFileDataFlow032
     * @tc.desc Verify an identity Transform preserves two UTF-8 metadata records and chunk boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedChunksLength: int = 0;
        let capturedFirst: string = '';
        let capturedLast: string = '';
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: string[] = ["title=中文;", "status=完成;"];
          let source = new ThirdBatchTextReadable(blocks);
          let transform = new ThirdBatchEchoTransform();
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedChunksLength = sink.chunks.length;
            capturedFirst = sink.chunks[0];
            capturedLast = sink.chunks[sink.chunks.length - 1];
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          source.on('data', (chunk: Object): void => {
            transform.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            transform.end();
          });
          transform.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          transform.on('end', (): void => {
            sink.end();
          });
          transform.resume();
          source.resume();
        });
        let checksum: int = 0;
        for (let index: int = 0; index < capturedText.length; index++) {
          checksum += capturedText.charCodeAt(index);
        }
        expect(capturedText).assertEqual("title=中文;status=完成;");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedChunksLength).assertEqual(2);
        expect(capturedFirst).assertEqual("title=中文;");
        expect(capturedLast).assertEqual("status=完成;");
        expect(checksum).assertEqual(96006);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_3300
     * @tc.name testStreamFileDataFlow033
     * @tc.desc Verify cork and uncork retain emoji metadata records as separate chunks before writable finish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedChunksLength: int = 0;
        let capturedFirst: string = '';
        let capturedLast: string = '';
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: string[] = ["start=🚀;", "result=✅;"];
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedChunksLength = sink.chunks.length;
            capturedFirst = sink.chunks[0];
            capturedLast = sink.chunks[sink.chunks.length - 1];
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.cork();
          sink.write(blocks[0], 'utf8');
          sink.uncork();
          sink.end(blocks[1], 'utf8');
        });
        let checksum: int = 0;
        for (let index: int = 0; index < capturedText.length; index++) {
          checksum += capturedText.charCodeAt(index);
        }
        expect(capturedText).assertEqual("start=🚀;result=✅;");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedChunksLength).assertEqual(2);
        expect(capturedFirst).assertEqual("start=🚀;");
        expect(capturedLast).assertEqual("result=✅;");
        expect(checksum).assertEqual(123775);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_3400
     * @tc.name testStreamFileDataFlow034
     * @tc.desc Verify a HEAD prefix, large body, and TAIL suffix arrive as three chunks with checksum 541492
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedChunksLength: int = 0;
        let capturedFirst: string = '';
        let capturedLast: string = '';
        let capturedWritableFinished: boolean = false;
        let capturedExpected: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: string[] = ["HEAD|",
            "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
            "|TAIL"];
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedChunksLength = sink.chunks.length;
            capturedFirst = sink.chunks[0];
            capturedLast = sink.chunks[sink.chunks.length - 1];
            capturedWritableFinished = sink.writableFinished;
            capturedExpected = blocks.join('');
            resolve(undefined as void);
          });
          sink.write(blocks[0], 'utf8');
          sink.write(blocks[1], 'utf8');
          sink.end(blocks[2], 'utf8');
        });
        let checksum: int = 0;
        for (let index: int = 0; index < capturedText.length; index++) {
          checksum += capturedText.charCodeAt(index);
        }
        expect(capturedText).assertEqual(capturedExpected);
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedChunksLength).assertEqual(3);
        expect(capturedFirst).assertEqual("HEAD|");
        expect(capturedLast).assertEqual("|TAIL");
        expect(checksum).assertEqual(541492);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_3500
     * @tc.name testStreamFileDataFlow035
     * @tc.desc Verify an event-driven source with corked delivery preserves twenty numbered file blocks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedChunksLength: int = 0;
        let capturedFirst: string = '';
        let capturedLast: string = '';
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: string[] =
            ["B0;", "B1;", "B2;", "B3;", "B4;", "B5;", "B6;", "B7;", "B8;", "B9;", "B10;", "B11;", "B12;", "B13;",
              "B14;", "B15;", "B16;", "B17;", "B18;", "B19;"];
          let source = new ThirdBatchTextReadable(blocks);
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedChunksLength = sink.chunks.length;
            capturedFirst = sink.chunks[0];
            capturedLast = sink.chunks[sink.chunks.length - 1];
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.cork();
          source.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          source.on('end', (): void => {
            sink.uncork();
            sink.end();
          });
          source.resume();
        });
        let checksum: int = 0;
        for (let index: int = 0; index < capturedText.length; index++) {
          checksum += capturedText.charCodeAt(index);
        }
        expect(capturedText).assertEqual("B0;B1;B2;B3;B4;B5;B6;B7;B8;B9;B10;B11;B12;B13;B14;B15;B16;B17;B18;B19;");
        expect(capturedWriteCount).assertEqual(20);
        expect(capturedChunksLength).assertEqual(20);
        expect(capturedFirst).assertEqual("B0;");
        expect(capturedLast).assertEqual("B19;");
        expect(checksum).assertEqual(4040);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_FILE_DATA_FLOW_3600
     * @tc.name testStreamFileDataFlow036
     * @tc.desc Verify corked short, medium, and long alternating blocks keep three chunk positions and their joined text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamFileDataFlow036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedWriteCount: int = 0;
        let capturedChunksLength: int = 0;
        let capturedFirst: string = '';
        let capturedLast: string = '';
        let capturedWritableFinished: boolean = false;
        let capturedExpected: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: string[] = ["S",
            "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM",
            "S",
            "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL",
            "E"];
          let sink = new FlowCollectWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedWriteCount = sink.writeCount;
            capturedChunksLength = sink.chunks.length;
            capturedFirst = sink.chunks[0];
            capturedLast = sink.chunks[sink.chunks.length - 1];
            capturedWritableFinished = sink.writableFinished;
            capturedExpected = blocks.join('');
            resolve(undefined as void);
          });
          sink.cork();
          for (let index: int = 0; index < blocks.length - 1; index++) {
            sink.write(blocks[index], 'utf8');
          }
          sink.uncork();
          sink.end(blocks[blocks.length - 1], 'utf8');
        });
        let checksum: int = 0;
        for (let index: int = 0; index < capturedText.length; index++) {
          checksum += capturedText.charCodeAt(index);
        }
        expect(capturedText).assertEqual(capturedExpected);
        expect(capturedWriteCount).assertEqual(5);
        expect(capturedChunksLength).assertEqual(5);
        expect(capturedFirst).assertEqual("S");
        expect(capturedLast).assertEqual("E");
        expect(checksum).assertEqual(97771);
        expect(capturedWritableFinished).assertTrue();

        done();
      });
  });
}
