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

import { stream, util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
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
import { FlowByteWritable } from '../../StreamComposeTestBase';
import {
  ThirdBatchByteReadable,
  ThirdBatchEchoTransform,
  ThirdBatchTextReadable,
  ThirdBatchTextWritable,
  connectEncodingFlow
} from '../../StreamComposeTestBase';

class UsageDelayedWritable extends stream.Writable {
  public chunks: string[] = [];
  public lengths: int[] = [];

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    if (typeof chunk === 'string') {
      let value: string = chunk as string;
      this.chunks.push(value);
      this.lengths.push(value.length);
    } else {
      let value: Uint8Array = chunk as Uint8Array;
      this.chunks.push('binary');
      this.lengths.push(value.length);
    }
    setTimeout((): void => {
      callback.unsafeCall();
    }, 20);
  }
}

class ProbeCollectWritable extends stream.Writable {
  public text: string = '';
  public writeCount: int = 0;

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.writeCount++;
    if (typeof chunk === 'string') {
      this.text += chunk;
    } else {
      this.text += 'bin';
    }
    callback.unsafeCall();
  }
}

export default function StreamEncodingFlowTest(): void {
  describe('StreamEncodingFlowTest', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ENCODING_FLOW_0100
     * @tc.name testStreamEncodingFlow001
     * @tc.desc Verify a byte Readable reproduces ASCII ABC and retains two sink writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamEncodingFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: Uint8Array[] = [new Uint8Array([65, 66]), new Uint8Array([67])];
          let sink = new FlowByteWritable();
          sink.setDefaultEncoding("utf-8");
          sink.on('finish', (): void => {
            let bytes = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            capturedBytes = bytes;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          sink.write(blocks[0], 'utf-8');
          sink.end(blocks[1], 'utf-8');
        });
        let decoded: string = util.TextDecoder.create("utf-8").decodeToString(capturedBytes);
        expect(decoded).assertEqual("ABC");
        expect(capturedBytes.length).assertEqual(3);
        expect(capturedBytes[0]).assertEqual(65);
        expect(capturedBytes[capturedBytes.length - 1]).assertEqual(67);
        expect(capturedWriteCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ENCODING_FLOW_0200
     * @tc.name testStreamEncodingFlow002
     * @tc.desc Verify piped byte blocks preserve order and decode correctly for utf-8 and gbk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamEncodingFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let encodings: string[] = ["utf-8", "gbk"];
        let blockSets: Uint8Array[][] = [
          [new Uint8Array([228, 184, 173]), new Uint8Array([230, 150, 135])],
          [new Uint8Array([214]), new Uint8Array([208, 206]), new Uint8Array([196])]];
        let expectedLens: int[] = [6, 4];
        let firstBytes: int[] = [228, 214];
        let lastBytes: int[] = [135, 196];
        for (let i = 0; i < encodings.length; i++) {
          let capturedBytes: Uint8Array = new Uint8Array(0);
          await new Promise<void>((resolve: (value: void) => void): void => {
            let sink = new FlowByteWritable();
            sink.setDefaultEncoding(encodings[i]);
            sink.on("finish", (): void => {
              let bytes: Uint8Array = new Uint8Array(sink.bytes.length);
              for (let index: int = 0; index < sink.bytes.length; index++) {
                bytes[index] = sink.bytes[index];
              }
              capturedBytes = bytes;
              resolve(undefined as void);
            });
            let source = new ThirdBatchByteReadable(blockSets[i]);
            source.pipe(sink);
          });
          expect(util.TextDecoder.create(encodings[i]).decodeToString(capturedBytes)).assertEqual("中文");
          expect(capturedBytes.length).assertEqual(expectedLens[i]);
          expect(capturedBytes[0]).assertEqual(firstBytes[i]);
          expect(capturedBytes[capturedBytes.length - 1]).assertEqual(lastBytes[i]);
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ENCODING_FLOW_0300
     * @tc.name testStreamEncodingFlow003
     * @tc.desc Verify write/end string input uses GBK and produces [214,208,206,196]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamEncodingFlow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: number[] = [];
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowByteWritable();
          sink.setDefaultEncoding("gbk");
          sink.on('finish', (): void => {
            capturedBytes = sink.bytes;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          for (let index: int = 0; index < ["中", "文"].length - 1; index++) {
            sink.write(["中", "文"][index], "gbk");
          }
          sink.end(["中", "文"][["中", "文"].length - 1], "gbk");
        });
        expect(capturedBytes.length).assertEqual(4);
        expect(capturedBytes[0]).assertEqual(214);
        expect(capturedBytes[1]).assertEqual(208);
        expect(capturedBytes[2]).assertEqual(206);
        expect(capturedBytes[3]).assertEqual(196);
        expect(capturedWriteCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ENCODING_FLOW_0400
     * @tc.name testStreamEncodingFlow004
     * @tc.desc Verify GBK bytes split across a cork boundary decode to the two-character string China
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamEncodingFlow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: Uint8Array[] = [new Uint8Array([214]), new Uint8Array([208, 185]), new Uint8Array([250])];
          let sink = new FlowByteWritable();
          sink.setDefaultEncoding("gbk");
          sink.on('finish', (): void => {
            let bytes = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            capturedBytes = bytes;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          sink.write(blocks[0], "gbk");
          sink.cork();
          sink.write(blocks[1], "gbk");
          sink.uncork();
          sink.end(blocks[2], "gbk");
        });
        let decoded: string = util.TextDecoder.create("gbk").decodeToString(capturedBytes);
        expect(decoded).assertEqual("中国");
        expect(capturedBytes.length).assertEqual(4);
        expect(capturedBytes[0]).assertEqual(214);
        expect(capturedBytes[capturedBytes.length - 1]).assertEqual(250);
        expect(capturedWriteCount).assertEqual(3);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ENCODING_FLOW_0500
     * @tc.name testStreamEncodingFlow005
     * @tc.desc Verify readable pull mode converts two CJK records to UTF-8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamEncodingFlow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: number[] = [];
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowByteWritable();
          sink.setDefaultEncoding("utf-8");
          sink.on('finish', (): void => {
            capturedBytes = sink.bytes;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          sink.write('中', 'utf-8');
          sink.end('文', 'utf-8');
        });
        expect(capturedBytes.length).assertEqual(6);
        expect(capturedBytes[0]).assertEqual(228);
        expect(capturedBytes[1]).assertEqual(184);
        expect(capturedBytes[2]).assertEqual(173);
        expect(capturedBytes[3]).assertEqual(230);
        expect(capturedBytes[4]).assertEqual(150);
        expect(capturedBytes[5]).assertEqual(135);
        expect(capturedWriteCount).assertEqual(2);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ENCODING_FLOW_0600
     * @tc.name testStreamEncodingFlow006
     * @tc.desc Verify a four-byte UTF-8 emoji survives both data-event forwarding and byte-split pipe reassembly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamEncodingFlow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: number[] = [];
        let capturedWriteCount: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowByteWritable();
          sink.setDefaultEncoding("utf-8");
          sink.on("finish", (): void => {
            capturedBytes = sink.bytes;
            capturedWriteCount = sink.writeCount;
            resolve(undefined as void);
          });
          let source = new ThirdBatchTextReadable(["😀"]);
          source.on("data", (chunk: Object): void => {
            sink.write(chunk.toString(), "utf-8");
          });
          source.on("end", (): void => {
            sink.end(undefined, "utf-8");
          });
          source.resume();
        });
        expect(capturedBytes.length).assertEqual(4);
        expect(capturedBytes[0]).assertEqual(240);
        expect(capturedBytes[1]).assertEqual(159);
        expect(capturedBytes[2]).assertEqual(152);
        expect(capturedBytes[3]).assertEqual(128);
        expect(capturedWriteCount).assertEqual(1);
        let splitBytes: Uint8Array = new Uint8Array(0);
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: Uint8Array[] = [
            new Uint8Array([240]), new Uint8Array([159]), new Uint8Array([152, 128])];
          let sink = new FlowByteWritable();
          sink.setDefaultEncoding("utf-8");
          sink.on("finish", (): void => {
            let bytes: Uint8Array = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            splitBytes = bytes;
            resolve(undefined as void);
          });
          let source = new ThirdBatchByteReadable(blocks);
          source.pipe(sink);
        });
        expect(util.TextDecoder.create("utf-8").decodeToString(splitBytes)).assertEqual("😀");
        expect(splitBytes.length).assertEqual(4);
        expect(splitBytes[0]).assertEqual(240);
        expect(splitBytes[3]).assertEqual(128);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ENCODING_FLOW_0700
     * @tc.name testStreamEncodingFlow007
     * @tc.desc Verify utf8 Chinese bytes remain valid when each character is delivered in a separate block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamEncodingFlow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: Uint8Array[] = [
            new Uint8Array([228]), new Uint8Array([184, 173]), new Uint8Array([230, 150, 135])];
          let sink = new FlowByteWritable();
          sink.setDefaultEncoding("utf-8");
          sink.on('finish', (): void => {
            let bytes: Uint8Array = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            capturedBytes = bytes;
            resolve(undefined as void);
          });
          sink.cork();
          sink.write(blocks[0], "utf-8");
          sink.write(blocks[1], "utf-8");
          sink.uncork();
          sink.end(blocks[2], "utf-8");
        });
        expect(util.TextDecoder.create("utf-8").decodeToString(capturedBytes)).assertEqual("中文");
        expect(capturedBytes.length).assertEqual(6);
        expect(capturedBytes[0]).assertEqual(228);
        expect(capturedBytes[5]).assertEqual(135);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ENCODING_FLOW_0800
     * @tc.name testStreamEncodingFlow008
     * @tc.desc Verify direct writes followed by end preserve a mixed UTF-8 byte sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamEncodingFlow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: Uint8Array[] = [
            new Uint8Array([228, 184]), new Uint8Array([173, 65, 240, 159]), new Uint8Array([152, 128])];
          let sink = new FlowByteWritable();
          sink.setDefaultEncoding("utf-8");
          sink.on('finish', (): void => {
            let bytes: Uint8Array = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            capturedBytes = bytes;
            resolve(undefined as void);
          });
          sink.write(blocks[0], "utf-8");
          sink.write(blocks[1], "utf-8");
          sink.write(blocks[2], "utf-8");
          sink.end();
        });
        expect(util.TextDecoder.create("utf-8").decodeToString(capturedBytes)).assertEqual("中A😀");
        expect(capturedBytes.length).assertEqual(8);
        expect(capturedBytes[3]).assertEqual(65);
        expect(capturedBytes[7]).assertEqual(128);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ENCODING_FLOW_0900
     * @tc.name testStreamEncodingFlow009
     * @tc.desc Verify an empty encoded byte stream finishes without synthetic text or transform records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamEncodingFlow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedText: string = '';
        let capturedRecords: int = 0;
        let capturedInput: int = 0;
        let capturedEnded: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let source = new ThirdBatchByteReadable([]);
          let transform = new ThirdBatchEchoTransform();
          let sink = new ThirdBatchTextWritable();
          sink.on('finish', (): void => {
            capturedText = sink.text;
            capturedRecords = sink.records.length;
            capturedInput = transform.input.length;
            capturedEnded = source.readableEnded;
            resolve(undefined as void);
          });
          connectEncodingFlow(source, transform, sink, 'utf8');
        });
        expect(capturedText).assertEqual('');
        expect(capturedRecords).assertEqual(0);
        expect(capturedInput).assertEqual(0);
        expect(capturedEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ENCODING_FLOW_1000
     * @tc.name testStreamEncodingFlow010
     * @tc.desc Verify a queued producer waits for drain before submitting remaining jobs and ending the sink
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamEncodingFlow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let sink = new UsageDelayedWritable();
        let firstAccepted: boolean = true;
        let drainCount: int = 0;
        let drainFirstAccepted: boolean = true;
        let drainChunksLen: int = 0;
        let drainFirstLen: int = 0;
        let finishChunksLen: int = 0;
        let finishChunks0: string = '';
        let finishChunks1: string = '';
        let finishChunks2: string = '';
        let finishWritableLength: number = 0;
        let finishWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          sink.on('drain', (): void => {
            drainCount++;
            drainFirstAccepted = firstAccepted;
            drainChunksLen = sink.chunks.length;
            drainFirstLen = sink.lengths[0];
            sink.write('job-2', 'utf8');
            sink.end('job-3', 'utf8');
          });
          sink.on('finish', (): void => {
            finishChunksLen = sink.chunks.length;
            finishChunks0 = sink.chunks[0];
            finishChunks1 = sink.chunks[1];
            finishChunks2 = sink.chunks[2];
            finishWritableLength = sink.writableLength;
            finishWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          firstAccepted = sink.write(new Uint8Array(20000), 'utf8');
        });
        expect(drainFirstAccepted).assertFalse();
        expect(drainChunksLen).assertEqual(1);
        expect(drainFirstLen).assertEqual(20000);
        expect(drainCount).assertEqual(1);
        expect(finishChunksLen).assertEqual(3);
        expect(finishChunks0).assertEqual('binary');
        expect(finishChunks1).assertEqual('job-2');
        expect(finishChunks2).assertEqual('job-3');
        expect(finishWritableLength).assertEqual(0);
        expect(finishWritableFinished).assertTrue();

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_ENCODING_FLOW_1100
     * @tc.name testStreamEncodingFlow011
     * @tc.desc Verify a write after end emits 10200036 and leaves a sibling stream drain and finish flow intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamEncodingFlow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let healthy = new ProbeCollectWritable();
        let faulted = new ProbeCollectWritable();
        let faultedErrorCount: int = 0;
        let faultedErrorName: string = '';
        let faultedErrorCode: number = 0;
        let healthyDrainCount: int = 0;
        let healthyFinishCount: int = 0;
        let healthyErrorCount: int = 0;
        let healthyBackpressured: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          faulted.on('error', (error: Error): void => {
            faultedErrorCount++;
            faultedErrorName = error.name;
            faultedErrorCode = (error as BusinessError).code;
            resolve(undefined as void);
          });
          faulted.end();
          faulted.write('late', 'utf8');
        });
        expect(faultedErrorName).assertEqual('BusinessError');
        expect(faultedErrorCode).assertEqual(10200036);
        expect(faultedErrorCount).assertEqual(1);
        expect(faulted.writableEnded).assertTrue();
        await new Promise<void>((resolve: (value: void) => void): void => {
          healthy.on('error', (): void => {
            healthyErrorCount++;
          });
          healthy.on('drain', (): void => {
            healthyDrainCount++;
            healthy.end('tail', 'utf8');
          });
          healthy.on('finish', (): void => {
            healthyFinishCount++;
            resolve(undefined as void);
          });
          healthyBackpressured = healthy.write(new Uint8Array(20000), 'utf8');
        });
        expect(healthyBackpressured).assertFalse();
        expect(healthyDrainCount).assertEqual(1);
        expect(healthyFinishCount).assertEqual(1);
        expect(healthyErrorCount).assertEqual(0);
        expect(healthy.writeCount).assertEqual(2);
        expect(healthy.text).assertEqual('bintail');
        expect(healthy.writableFinished).assertTrue();

        done();
      });
  });
}
