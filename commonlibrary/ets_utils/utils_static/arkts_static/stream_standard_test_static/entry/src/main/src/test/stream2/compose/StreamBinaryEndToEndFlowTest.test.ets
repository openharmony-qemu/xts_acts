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
  FlowByteWritable,
  ThirdBatchByteReadable,
  FlowCollectWritable,
  FlowFailingWritable
} from '../../StreamComposeTestBase';

export default function StreamBinaryEndToEndFlowTest(): void {
  describe('StreamBinaryEndToEndFlowTest', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BINARY_END_TO_END_FLOW_0100
     * @tc.name testStreamBinaryEndToEndFlow001
     * @tc.desc Verify one zero byte reaches doWrite unchanged and its checksum is finalized by end(data)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBinaryEndToEndFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        let capturedWriteCount: int = 0;
        let capturedChecksum: int = 0;

        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new FlowByteWritable();
          sink.on('finish', (): void => resolve(undefined as void));
          sink.end(new Uint8Array([0]), 'utf8', (): void => {
            let bytes = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            capturedBytes = bytes;
            capturedWriteCount = sink.writeCount;
            let checksum: int = 0;
            for (let index: int = 0; index < sink.bytes.length; index++) {
              checksum += sink.bytes[index];
            }
            capturedChecksum = checksum;
          });
        });
        expect(capturedBytes.length).assertEqual(1);
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedBytes[0]).assertEqual(0);
        expect(capturedBytes[capturedBytes.length - 1]).assertEqual(0);
        expect(capturedChecksum).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BINARY_END_TO_END_FLOW_0200
     * @tc.name testStreamBinaryEndToEndFlow002
     * @tc.desc Verify corked boundary bytes 0, 127, 128, and 255 flush as one block before an empty end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBinaryEndToEndFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        let capturedWriteCount: int = 0;
        let capturedChecksum: int = 0;

        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: Uint8Array[] = [new Uint8Array([0, 127, 128, 255])];
          let sink = new FlowByteWritable();
          sink.on('finish', (): void => resolve(undefined as void));
          sink.cork();
          sink.write(blocks[0], 'utf8');
          sink.uncork();
          sink.end(undefined, 'utf8', (): void => {
            let bytes = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            capturedBytes = bytes;
            capturedWriteCount = sink.writeCount;
            let checksum: int = 0;
            for (let index: int = 0; index < sink.bytes.length; index++) {
              checksum += sink.bytes[index];
            }
            capturedChecksum = checksum;
          });
        });

        expect(capturedBytes.length).assertEqual(4);
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedBytes[0]).assertEqual(0);
        expect(capturedBytes[1]).assertEqual(127);
        expect(capturedBytes[2]).assertEqual(128);
        expect(capturedBytes[capturedBytes.length - 1]).assertEqual(255);
        expect(capturedChecksum).assertEqual(510);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BINARY_END_TO_END_FLOW_0300
     * @tc.name testStreamBinaryEndToEndFlow003
     * @tc.desc Verify default encoding configuration preserves four one-byte binary writes in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBinaryEndToEndFlow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        let capturedWriteCount: int = 0;
        let capturedChecksum: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: Uint8Array[] =
            [new Uint8Array([1]), new Uint8Array([2]), new Uint8Array([3]), new Uint8Array([4])];
          let sink = new FlowByteWritable();
          sink.setDefaultEncoding('utf8');
          sink.on('finish', (): void => {
            let bytes = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            capturedBytes = bytes;
            capturedWriteCount = sink.writeCount;
            let checksum: int = 0;
            for (let index: int = 0; index < sink.bytes.length; index++) {
              checksum += sink.bytes[index];
            }
            capturedChecksum = checksum;
            resolve(undefined as void);
          });
          sink.write(blocks[0], 'utf8');
          sink.write(blocks[1], 'utf8');
          sink.write(blocks[2], 'utf8');
          sink.end(blocks[3], 'utf8');
        });
        expect(capturedBytes.length).assertEqual(4);
        expect(capturedWriteCount).assertEqual(4);
        expect(capturedBytes[0]).assertEqual(1);
        expect(capturedBytes[1]).assertEqual(2);
        expect(capturedBytes[2]).assertEqual(3);
        expect(capturedBytes[capturedBytes.length - 1]).assertEqual(4);
        expect(capturedChecksum).assertEqual(10);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BINARY_END_TO_END_FLOW_0400
     * @tc.name testStreamBinaryEndToEndFlow004
     * @tc.desc Verify a piped byte source preserves variable block boundaries and checksum through writable completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBinaryEndToEndFlow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        let capturedWriteCount: int = 0;
        let capturedChecksum: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: Uint8Array[] = [new Uint8Array([1, 2]), new Uint8Array([3, 4, 5]), new Uint8Array([6])];
          let sink = new FlowByteWritable();
          let binarySource = new ThirdBatchByteReadable(blocks);
          sink.on('finish', (): void => {
            let bytes = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            capturedBytes = bytes;
            capturedWriteCount = sink.writeCount;
            let checksum: int = 0;
            for (let index: int = 0; index < sink.bytes.length; index++) {
              checksum += sink.bytes[index];
            }
            capturedChecksum = checksum;
            resolve(undefined as void);
          });
          binarySource.pipe(sink);
        });
        expect(capturedBytes.length).assertEqual(6);
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedBytes[0]).assertEqual(1);
        expect(capturedBytes[1]).assertEqual(2);
        expect(capturedBytes[2]).assertEqual(3);
        expect(capturedBytes[3]).assertEqual(4);
        expect(capturedBytes[4]).assertEqual(5);
        expect(capturedBytes[capturedBytes.length - 1]).assertEqual(6);
        expect(capturedChecksum).assertEqual(21);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BINARY_END_TO_END_FLOW_0500
     * @tc.name testStreamBinaryEndToEndFlow005
     * @tc.desc Verify pipe-driven binary blocks preserve alternating zero and maximum byte values across block splits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBinaryEndToEndFlow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let blockSets: Uint8Array[][] = [
          [new Uint8Array([255, 0]), new Uint8Array([0, 255])],
          [new Uint8Array([0, 255, 0, 255])]];
        let expectedWriteCounts: int[] = [2, 1];
        let firstBytes: int[] = [255, 0];
        let lastBytes: int[] = [255, 255];
        for (let i = 0; i < blockSets.length; i++) {
          let capturedBytes: Uint8Array = new Uint8Array(0);
          let capturedWriteCount: int = 0;
          let capturedChecksum: int = 0;
          await new Promise<void>((resolve: (value: void) => void): void => {
            let sink = new FlowByteWritable();
            sink.on("finish", (): void => {
              let bytes = new Uint8Array(sink.bytes.length);
              for (let index: int = 0; index < sink.bytes.length; index++) {
                bytes[index] = sink.bytes[index];
              }
              capturedBytes = bytes;
              capturedWriteCount = sink.writeCount;
              let checksum: int = 0;
              for (let index: int = 0; index < sink.bytes.length; index++) {
                checksum += sink.bytes[index];
              }
              capturedChecksum = checksum;
              resolve(undefined as void);
            });
            let source = new ThirdBatchByteReadable(blockSets[i]);
            source.pipe(sink);
          });
          expect(capturedBytes.length).assertEqual(4);
          expect(capturedWriteCount).assertEqual(expectedWriteCounts[i]);
          expect(capturedBytes[0]).assertEqual(firstBytes[i]);
          expect(capturedBytes[capturedBytes.length - 1]).assertEqual(lastBytes[i]);
          expect(capturedChecksum).assertEqual(510);
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BINARY_END_TO_END_FLOW_0600
     * @tc.name testStreamBinaryEndToEndFlow006
     * @tc.desc Verify duplicated CRLF byte pairs remain intact across write and end(data)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBinaryEndToEndFlow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        let capturedWriteCount: int = 0;
        let capturedChecksum: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: Uint8Array[] = [new Uint8Array([10, 13]), new Uint8Array([10, 13])];
          let sink = new FlowByteWritable();
          sink.on('finish', (): void => {
            let bytes = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            capturedBytes = bytes;
            capturedWriteCount = sink.writeCount;
            let checksum: int = 0;
            for (let index: int = 0; index < sink.bytes.length; index++) {
              checksum += sink.bytes[index];
            }
            capturedChecksum = checksum;
            resolve(undefined as void);
          });
          sink.write(blocks[0], 'utf8');
          sink.end(blocks[1], 'utf8');
        });
        expect(capturedBytes.length).assertEqual(4);
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedBytes[0]).assertEqual(10);
        expect(capturedBytes[1]).assertEqual(13);
        expect(capturedBytes[2]).assertEqual(10);
        expect(capturedBytes[capturedBytes.length - 1]).assertEqual(13);
        expect(capturedChecksum).assertEqual(46);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BINARY_END_TO_END_FLOW_0700
     * @tc.name testStreamBinaryEndToEndFlow007
     * @tc.desc Verify a piped byte source preserves a UTF-8 BOM before an ASCII payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBinaryEndToEndFlow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        let capturedWriteCount: int = 0;
        let capturedChecksum: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: Uint8Array[] = [new Uint8Array([239, 187, 191]), new Uint8Array([65, 66, 67])];
          let sink = new FlowByteWritable();
          sink.on('finish', (): void => {
            let bytes = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            capturedBytes = bytes;
            capturedWriteCount = sink.writeCount;
            let checksum: int = 0;
            for (let index: int = 0; index < sink.bytes.length; index++) {
              checksum += sink.bytes[index];
            }
            capturedChecksum = checksum;
            resolve(undefined as void);
          });
          let source = new ThirdBatchByteReadable(blocks);
          source.pipe(sink);
        });
        expect(capturedBytes.length).assertEqual(6);
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedBytes[0]).assertEqual(239);
        expect(capturedBytes[1]).assertEqual(187);
        expect(capturedBytes[2]).assertEqual(191);
        expect(capturedBytes[3]).assertEqual(65);
        expect(capturedBytes[4]).assertEqual(66);
        expect(capturedBytes[capturedBytes.length - 1]).assertEqual(67);
        expect(capturedChecksum).assertEqual(815);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BINARY_END_TO_END_FLOW_0800
     * @tc.name testStreamBinaryEndToEndFlow008
     * @tc.desc Verify a PNG signature split over two writes remains contiguous before an empty end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBinaryEndToEndFlow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        let capturedWriteCount: int = 0;
        let capturedChecksum: int = 0;

        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: Uint8Array[] = [new Uint8Array([137, 80, 78, 71]), new Uint8Array([13, 10, 26, 10])];
          let sink = new FlowByteWritable();
          sink.on('finish', (): void => resolve(undefined as void));
          sink.write(blocks[0], 'utf8');
          sink.write(blocks[1], 'utf8');
          sink.end(undefined, 'utf8', (): void => {
            let bytes = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            capturedBytes = bytes;
            capturedWriteCount = sink.writeCount;
            let checksum: int = 0;
            for (let index: int = 0; index < sink.bytes.length; index++) {
              checksum += sink.bytes[index];
            }
            capturedChecksum = checksum;
          });
        });
        expect(capturedBytes.length).assertEqual(8);
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedBytes[0]).assertEqual(137);
        expect(capturedBytes[1]).assertEqual(80);
        expect(capturedBytes[2]).assertEqual(78);
        expect(capturedBytes[3]).assertEqual(71);
        expect(capturedBytes[4]).assertEqual(13);
        expect(capturedBytes[5]).assertEqual(10);
        expect(capturedBytes[6]).assertEqual(26);
        expect(capturedBytes[capturedBytes.length - 1]).assertEqual(10);
        expect(capturedChecksum).assertEqual(425);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BINARY_END_TO_END_FLOW_0900
     * @tc.name testStreamBinaryEndToEndFlow009
     * @tc.desc Verify a ZIP signature and header block flush together through corked writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBinaryEndToEndFlow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        let capturedWriteCount: int = 0;
        let capturedChecksum: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: Uint8Array[] = [new Uint8Array([80, 75, 3, 4]), new Uint8Array([20, 0, 0, 0])];
          let sink = new FlowByteWritable();
          sink.on('finish', (): void => resolve(undefined as void));
          sink.cork();
          sink.write(blocks[0], 'utf8');
          sink.write(blocks[1], 'utf8');
          sink.uncork();
          sink.end(undefined, 'utf8', (): void => {
            let bytes = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            capturedBytes = bytes;
            capturedWriteCount = sink.writeCount;
            let checksum: int = 0;
            for (let index: int = 0; index < sink.bytes.length; index++) {
              checksum += sink.bytes[index];
            }
            capturedChecksum = checksum;
          });
        });
        expect(capturedBytes.length).assertEqual(8);
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedBytes[0]).assertEqual(80);
        expect(capturedBytes[1]).assertEqual(75);
        expect(capturedBytes[2]).assertEqual(3);
        expect(capturedBytes[3]).assertEqual(4);
        expect(capturedBytes[4]).assertEqual(20);
        expect(capturedBytes[5]).assertEqual(0);
        expect(capturedBytes[6]).assertEqual(0);
        expect(capturedBytes[capturedBytes.length - 1]).assertEqual(0);
        expect(capturedChecksum).assertEqual(182);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BINARY_END_TO_END_FLOW_1000
     * @tc.name testStreamBinaryEndToEndFlow010
     * @tc.desc Verify setDefaultEncoding does not alter a Uint8Array supplied through end(data)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBinaryEndToEndFlow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedBytes: Uint8Array = new Uint8Array(0);
        let capturedWriteCount: int = 0;
        let capturedChecksum: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let blocks: Uint8Array[] = [new Uint8Array([255, 2])];
          let sink = new FlowByteWritable();
          sink.on('finish', (): void => resolve(undefined as void));
          sink.setDefaultEncoding('utf8');
          sink.end(blocks[0], 'utf8', (): void => {
            let bytes = new Uint8Array(sink.bytes.length);
            for (let index: int = 0; index < sink.bytes.length; index++) {
              bytes[index] = sink.bytes[index];
            }
            capturedBytes = bytes;
            capturedWriteCount = sink.writeCount;
            let checksum: int = 0;
            for (let index: int = 0; index < sink.bytes.length; index++) {
              checksum += sink.bytes[index];
            }
            capturedChecksum = checksum;
          });
        });
        expect(capturedBytes.length).assertEqual(2);
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedBytes[0]).assertEqual(255);
        expect(capturedBytes[1]).assertEqual(2);
        expect(capturedChecksum).assertEqual(257);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_BINARY_END_TO_END_FLOW_1100
     * @tc.name testStreamBinaryEndToEndFlow011
     * @tc.desc Verify a faulted stream does not disturb a sibling stream that still drains and finishes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamBinaryEndToEndFlow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let faultedErrorMessage: string = '';
        let healthyErrorCount: int = 0;
        let healthyDrainCount: int = 0;
        let healthyText: string = '';
        let healthyWriteReturn: boolean = true;
        let healthyFinished: boolean = false;

        let healthy = new FlowCollectWritable();
        let faulted = new FlowFailingWritable(1, 'faulted-sibling');

        try {
          await new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void): void => {
            let faultedSettled: boolean = false;
            let healthySettled: boolean = false;

            healthy.on('error', (error: Error): void => {
              healthyErrorCount++;
              reject(error);
            });
            healthy.on('drain', (): void => {
              healthyDrainCount++;
              healthy.end('tail', 'utf8');
            });
            healthy.on('finish', (): void => {
              healthySettled = true;
              healthyText = healthy.text;
              healthyFinished = healthy.writableFinished;
              if (faultedSettled) {
                resolve(undefined as void);
              }
            });

            faulted.on('error', (error: Error): void => {
              faultedSettled = true;
              faultedErrorMessage = error.message;
              if (healthySettled) {
                resolve(undefined as void);
              }
            });

            healthyWriteReturn = healthy.write(new Uint8Array(20000), 'utf8');
            faulted.write('trigger', 'utf8');
          });

          expect(faultedErrorMessage).assertEqual('faulted-sibling');
          expect(healthyErrorCount).assertEqual(0);
          expect(healthyDrainCount).assertEqual(1);
          expect(healthyWriteReturn).assertFalse();
          expect(healthyFinished).assertTrue();
          expect(healthyText.length).assertEqual(20004);
        } catch (e) {
          expect(false).assertFail();
        }
        done();
      });
  });
}
