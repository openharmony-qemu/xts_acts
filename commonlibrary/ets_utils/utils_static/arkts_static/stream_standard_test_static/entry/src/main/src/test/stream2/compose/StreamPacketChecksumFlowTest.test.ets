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

function calculateChecksum(payload: string): int {
  let sum: int = 0;
  for (let index: int = 0; index < payload.length; index++) {
    sum = (sum + payload.charCodeAt(index)) % 256;
  }
  return sum;
}

function createChecksumPacket(payload: string): string {
  return payload + '@' + calculateChecksum(payload).toString() + ';';
}

function createInvalidChecksumPacket(payload: string): string {
  return payload + '@' + ((calculateChecksum(payload) + 1) % 256).toString() + ';';
}

class PacketChecksumWritable extends stream.Writable {
  public pending: string = '';
  public acceptedCount: int = 0;
  public rejectedCount: int = 0;
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
      let packet: string = this.pending.substring(0, terminator);
      this.pending = this.pending.substring(terminator + 1);
      let checksumSeparator: int = packet.lastIndexOf('@');
      if (checksumSeparator < 0) {
        this.rejectedCount++;
      } else {
        let payload: string = packet.substring(0, checksumSeparator);
        let checksumText: string = packet.substring(checksumSeparator + 1);
        let checksum: number = Number(checksumText);
        if (Number.isInteger(checksum) && checksum >= 0 && checksum <= 255 &&
          checksum === calculateChecksum(payload)) {
          this.acceptedPayloads.push(payload);
          this.acceptedCount++;
        } else {
          this.rejectedCount++;
        }
      }
      terminator = this.pending.indexOf(';');
    }
    callback.unsafeCall();
  }
}

export default function StreamPacketChecksumFlowTest(): void {
  describe('StreamPacketChecksumFlowTest', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_0100
     * @tc.name testStreamPacketChecksumFlow001
     * @tc.desc Verify packets with valid checksums are accepted for plain and punctuated payloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let packets: string[] = ["abc@38;", "A1!#@182;"];
        let payloads: string[] = ["abc", "A1!#"];
        let usePipe: boolean[] = [true, false];
        for (let i = 0; i < packets.length; i++) {
          let capturedAcceptedCount: int = 0;
          let capturedAcceptedPayloads: string = "";
          let capturedPending: string = "";
          let capturedWriteCount: int = 0;
          let capturedWritableFinished: boolean = false;
          await new Promise<void>((resolve: (value: void) => void): void => {
            let sink = new PacketChecksumWritable();
            sink.on("finish", (): void => {
              capturedAcceptedCount = sink.acceptedCount;
              capturedAcceptedPayloads = sink.acceptedPayloads.join("|");
              capturedPending = sink.pending;
              capturedWriteCount = sink.writeCount;
              capturedWritableFinished = sink.writableFinished;
              resolve(undefined as void);
            });
            if (usePipe[i]) {
              let source = new ThirdBatchTextReadable([packets[i]]);
              source.on("data", (chunk: Object): void => {
                sink.write(chunk.toString(), "utf8");
              });
              source.on("end", (): void => {
                sink.end();
              });
              source.resume();
            } else {
              sink.end(packets[i], "utf8");
            }
          });
          expect(capturedAcceptedCount).assertEqual(1);
          expect(capturedAcceptedPayloads).assertEqual(payloads[i]);
          expect(capturedPending).assertEqual("");
          expect(capturedWriteCount).assertEqual(1);
          expect(capturedWritableFinished).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_0200
     * @tc.name testStreamPacketChecksumFlow002
     * @tc.desc Verify checksum 39 rejects abc without retaining packet data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.write('abc', 'utf8');
          sink.end('@39;', 'utf8');
        });
        expect(capturedRejectedCount).assertEqual(1);
        expect(capturedAcceptedPayloads).assertEqual("");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_0300
     * @tc.name testStreamPacketChecksumFlow003
     * @tc.desc Verify three valid packets delivered across two writes preserve acceptance order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["a@97;", "b@98;c@99;"];
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
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
        expect(capturedAcceptedCount).assertEqual(3);
        expect(capturedAcceptedPayloads).assertEqual("a|b|c");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_0400
     * @tc.name testStreamPacketChecksumFlow004
     * @tc.desc Verify a packet terminator split between writes is buffered until the semicolon arrives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["abc@38", ";"];
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let source = new ThirdBatchTextReadable(chunks);
          let transform = new ThirdBatchEchoTransform();
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
        expect(capturedAcceptedCount).assertEqual(1);
        expect(capturedAcceptedPayloads).assertEqual("abc");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_0500
     * @tc.name testStreamPacketChecksumFlow005
     * @tc.desc Verify at characters inside payload are treated as data before checksum validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["a@b@3;"];
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let packetSource = new ThirdBatchTextReadable([chunks[0]]);
          packetSource.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          packetSource.on('end', (): void => {
            sink.end();
          });
          packetSource.resume();
        });
        expect(capturedAcceptedCount).assertEqual(1);
        expect(capturedAcceptedPayloads).assertEqual("a@b");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_0600
     * @tc.name testStreamPacketChecksumFlow006
     * @tc.desc Verify event-driven source chunks reconstruct a multibyte packet before checksum classification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chinesePacket: string = createChecksumPacket('中文');
          let chunks: string[] = [chinesePacket.substring(0, 2), chinesePacket.substring(2)];
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let packetSource = new ThirdBatchTextReadable(chunks);
          packetSource.on('data', (chunk: Object): void => {
            sink.write(chunk.toString(), 'utf8');
          });
          packetSource.on('end', (): void => {
            sink.end();
          });
          packetSource.resume();
        });
        expect(capturedAcceptedCount).assertEqual(1);
        expect(capturedAcceptedPayloads).assertEqual("中文");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_0700
     * @tc.name testStreamPacketChecksumFlow007
     * @tc.desc Verify a four-byte emoji packet remains one accepted payload across three fragments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let emojiPacket: string = createChecksumPacket('😀');
          let chunks: string[] = [emojiPacket.substring(0, 1), emojiPacket.substring(1, 3), emojiPacket.substring(3)];
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.write(chunks[0], 'utf8');
          sink.write(chunks[1], 'utf8');
          sink.end(chunks[2], 'utf8');
        });
        expect(capturedAcceptedCount).assertEqual(1);
        expect(capturedAcceptedPayloads).assertEqual("😀");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_0800
     * @tc.name testStreamPacketChecksumFlow008
     * @tc.desc Verify an empty payload with checksum zero is accepted without a payload record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.cork();
          sink.write('@0;', 'utf8');
          sink.uncork();
          sink.end();
        });
        expect(capturedAcceptedCount).assertEqual(1);
        expect(capturedAcceptedPayloads).assertEqual("");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_0900
     * @tc.name testStreamPacketChecksumFlow009
     * @tc.desc Verify a multibyte code unit at checksum modulo zero is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["Ā@0;"];
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          let source = new ThirdBatchTextReadable(chunks);
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
        expect(capturedAcceptedCount).assertEqual(1);
        expect(capturedAcceptedPayloads).assertEqual("Ā");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_1000
     * @tc.name testStreamPacketChecksumFlow010
     * @tc.desc Verify the modulo 255 checksum boundary accepts the extended character payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["ÿ@255;"];
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.cork();
          sink.write(chunks[0], 'utf8');
          sink.uncork();
          sink.end();
        });
        expect(capturedAcceptedCount).assertEqual(1);
        expect(capturedAcceptedPayloads).assertEqual("ÿ");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_1100
     * @tc.name testStreamPacketChecksumFlow011
     * @tc.desc Verify three identical valid packets are accepted independently and retain order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.end('x@120;x@120;x@120;', 'utf8');
        });
        expect(capturedAcceptedCount).assertEqual(3);
        expect(capturedAcceptedPayloads).assertEqual("x|x|x");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(1);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_1200
     * @tc.name testStreamPacketChecksumFlow012
     * @tc.desc Verify mixed valid and invalid packets across four partitions preserve accepted and rejected counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let packetData: string = '';
          for (let index: int = 0; index < 20; index++) {
            let payload: string = 'q' + index.toString();
            packetData += index % 2 === 0 ? createChecksumPacket(payload) : createInvalidChecksumPacket(payload);
          }
          let quarter: int = (packetData.length / 4).toInt();
          let chunks: string[] = [packetData.substring(0, quarter), packetData.substring(quarter, quarter * 2),
            packetData.substring(quarter * 2, quarter * 3), packetData.substring(quarter * 3)];
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
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
        expect(capturedAcceptedCount).assertEqual(10);
        expect(capturedRejectedCount).assertEqual(10);
        expect(capturedAcceptedPayloads).assertEqual("q0|q2|q4|q6|q8|q10|q12|q14|q16|q18");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(4);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_1300
     * @tc.name testStreamPacketChecksumFlow013
     * @tc.desc Verify one hundred valid packets across fixed partitions preserve every accepted payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        let capturedExpectedJoined: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          let packetData: string = '';
          let expectedPayloads: string[] = [];
          for (let index: int = 0; index < 100; index++) {
            let payload: string = 'r' + index.toString();
            expectedPayloads.push(payload);
            packetData += createChecksumPacket(payload);
          }
          let unit: int = (packetData.length / 5).toInt();
          let chunks: string[] = [packetData.substring(0, unit), packetData.substring(unit, unit * 2),
            packetData.substring(unit * 2, unit * 3), packetData.substring(unit * 3, unit * 4),
            packetData.substring(unit * 4)];
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedExpectedJoined = expectedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          for (let index: int = 0; index < chunks.length - 1; index++) {
            sink.write(chunks[index], 'utf8');
          }
          sink.end(chunks[chunks.length - 1], 'utf8');
        });
        expect(capturedAcceptedCount).assertEqual(100);
        expect(capturedAcceptedPayloads).assertEqual(capturedExpectedJoined);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(5);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_1400
     * @tc.name testStreamPacketChecksumFlow014
     * @tc.desc Verify a large packet split into fixed-size writes is reassembled before checksum validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
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
          let packetData: string = createChecksumPacket(payload);
          let chunks: string[] = [packetData.substring(0, 200), packetData.substring(200, 400),
            packetData.substring(400, 600), packetData.substring(600, 800), packetData.substring(800, 1000),
            packetData.substring(1000)];
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
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
        expect(capturedAcceptedPayloads).assertEqual(capturedPayload);
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(6);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_1500
     * @tc.name testStreamPacketChecksumFlow015
     * @tc.desc Verify a packet missing the checksum delimiter is rejected without an accepted payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let chunks: string[] = ["payload", ";"];
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
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
        expect(capturedRejectedCount).assertEqual(1);
        expect(capturedAcceptedPayloads).assertEqual("");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(2);
        expect(capturedWritableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_PACKET_CHECKSUM_FLOW_1600
     * @tc.name testStreamPacketChecksumFlow016
     * @tc.desc Verify nonnumeric, over-range, and negative checksum fields are all rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamPacketChecksumFlow016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let capturedAcceptedCount: int = 0;
        let capturedRejectedCount: int = 0;
        let capturedAcceptedPayloads: string = '';
        let capturedPending: string = '';
        let capturedWriteCount: int = 0;
        let capturedWritableFinished: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let sink = new PacketChecksumWritable();
          sink.on('finish', (): void => {
            capturedAcceptedCount = sink.acceptedCount;
            capturedRejectedCount = sink.rejectedCount;
            capturedAcceptedPayloads = sink.acceptedPayloads.join('|');
            capturedPending = sink.pending;
            capturedWriteCount = sink.writeCount;
            capturedWritableFinished = sink.writableFinished;
            resolve(undefined as void);
          });
          sink.cork();
          sink.write('a@x;', 'utf8');
          sink.write('b@256;', 'utf8');
          sink.uncork();
          sink.end('c@-1;', 'utf8');
        });
        expect(capturedRejectedCount).assertEqual(3);
        expect(capturedAcceptedPayloads).assertEqual("");
        expect(capturedPending).assertEqual("");
        expect(capturedWriteCount).assertEqual(3);
        expect(capturedWritableFinished).assertTrue();

        done();
      });
  });
}
