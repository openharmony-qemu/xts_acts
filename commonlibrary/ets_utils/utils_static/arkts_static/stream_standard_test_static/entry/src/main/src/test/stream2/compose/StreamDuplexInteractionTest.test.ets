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
import { buffer, stream } from '@kit.ArkTS';
import { CollectWritable } from '../../StreamTestBase';
import { ScenarioDuplex } from '../../StreamComposeTestBase';

class DuplexManualRead extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class DuplexTrackWrite extends stream.Duplex {
  public dataChunk: string | Uint8Array = '';
  public dataEncoding: string = '';
  public writeCount: int = 0;
  public writevCount: int = 0;
  public dataChunks: (string | Uint8Array)[] = [];
  public dataEncodings: string[] = [];

  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.dataChunk = chunk;
    this.dataEncoding = encoding;
    this.writeCount++;
    this.dataChunks.push(chunk);
    this.dataEncodings.push(encoding);
    callback.unsafeCall();
  }

  doWritev(chunks: string[] | Uint8Array[], callback: Function): void {
    let values: Object[] = chunks as Object[];
    this.writevCount++;
    for (let index: int = 0; index < values.length; index++) {
      this.dataChunks.push(values[index] as string | Uint8Array);
    }
    callback.unsafeCall();
  }
}

class DuplexErrorWrite extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall(new Error('duplex write error'));
  }
}

class DuplexPipeWritable extends stream.Writable {
  public received: Object[] = [];
  public writeCount: int = 0;
  public writeObserved: Function = (): void => {
  };

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.received.push(chunk);
    this.writeCount++;
    this.writeObserved.unsafeCall();
    callback.unsafeCall();
  }
}

export default function StreamDuplexInteractionTest(): void {
  describe('StreamDuplexInteractionTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_0100
     * @tc.name testStreamDuplexInteractionFlow001
     * @tc.desc Verify Duplex write and read can operate independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexManualRead = new DuplexManualRead();
      ds.pause();
      ds.push('read-side');
      ds.write('write-side', 'utf8');
      let data: Object | null = ds.read();
      expect(data?.toString()).assertEqual('read-side');
      expect(ds.writableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_0200
     * @tc.name testStreamDuplexInteractionFlow002
     * @tc.desc Verify pausing a Duplex keeps isPaused true while write returns true and doWrite records one chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTrackWrite = new DuplexTrackWrite();
      ds.pause();
      expect(ds.isPaused()).assertTrue();
      let result: boolean = ds.write('hello', 'utf8');
      expect(result).assertTrue();
      expect(ds.writeCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_0300
     * @tc.name testStreamDuplexInteractionFlow003
     * @tc.desc Verify end without data marks writableEnded while readable remains open and readableEnded stays false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexManualRead = new DuplexManualRead();
      ds.end();
      expect(ds.writableEnded).assertTrue();
      expect(ds.readableEnded).assertFalse();
      expect(ds.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_0400
     * @tc.name testStreamDuplexInteractionFlow004
     * @tc.desc Verify push(null) with resume emits end while the writable side stays active and finish never fires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ds: DuplexManualRead = new DuplexManualRead();
        let endedAtEnd: boolean = false;
        let writableEndedAtEnd: boolean = false;
        let writableAtEnd: boolean = false;
        let finishFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.on("finish", (): void => {
            finishFired = true;
          });
          ds.on("end", (): void => {
            endedAtEnd = ds.readableEnded;
            writableEndedAtEnd = ds.writableEnded;
            writableAtEnd = ds.writable;
            resolve(undefined);
          });
          ds.push(null);
          ds.resume();
        });
        expect(endedAtEnd).assertTrue();
        expect(writableEndedAtEnd).assertFalse();
        expect(writableAtEnd).assertTrue();
        expect(finishFired).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_0500
     * @tc.name testStreamDuplexInteractionFlow005
     * @tc.desc Verify Duplex readable readable side after writable end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexManualRead = new DuplexManualRead();
      ds.end();
      ds.pause();
      ds.push('after-write-end');
      let data: Object | null = ds.read();
      expect(data?.toString()).assertEqual('after-write-end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_0600
     * @tc.name testStreamDuplexInteractionFlow006
     * @tc.desc Verify Duplex write after readable end still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ds: DuplexTrackWrite = new DuplexTrackWrite();
        let readableEndedAtEnd: boolean = false;
        let writeResult: boolean = false;
        let writeCountAtEnd: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.on('end', (): void => {
            readableEndedAtEnd = ds.readableEnded;
            let result: boolean = ds.write('after-read-end', 'utf8');
            writeResult = result;
            writeCountAtEnd = ds.writeCount;
            resolve(undefined);
          });
          ds.push(null);
          ds.resume();
        });
        expect(readableEndedAtEnd).assertTrue();
        expect(writeResult).assertTrue();
        expect(writeCountAtEnd).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_0700
     * @tc.name testStreamDuplexInteractionFlow007
     * @tc.desc Verify Duplex readable Encoding gbk decodes pushed bytes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexManualRead = new DuplexManualRead();
      ds.setEncoding('gbk');
      ds.pause();
      ds.push('中文', 'gbk');
      let data: Object | null = ds.read();
      expect(data?.toString()).assertEqual('中文');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_0800
     * @tc.name testStreamDuplexInteractionFlow008
     * @tc.desc Verify Duplex keeps independent read and write encodings across one bidirectional flow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTrackWrite = new DuplexTrackWrite();
      ds.setDefaultEncoding('gbk');
      ds.setEncoding('utf8');
      ds.pause();
      let writeResult: boolean = ds.write('write-side');
      ds.push('read-side');
      let readData: Object | null = ds.read();
      expect(writeResult).assertTrue();
      expect(ds.writeCount).assertEqual(1);
      expect(ds.dataEncoding).assertEqual('gbk');
      expect(ds.dataChunk).assertEqual('write-side');
      expect(ds.readableEncoding).assertEqual('utf-8');
      expect(readData?.toString()).assertEqual('read-side');
      expect(ds.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_0900
     * @tc.name testStreamDuplexInteractionFlow009
     * @tc.desc Verify an explicit write encoding is local and end restores the writable default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ds: DuplexTrackWrite = new DuplexTrackWrite();
        ds.setDefaultEncoding('gbk');
        ds.write('default');
        ds.write('override', 'utf8');
        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.on('finish', (): void => {
            resolve(undefined as void);
          });
          ds.end('closing');
        });
        expect(ds.writeCount).assertEqual(3);
        expect(ds.dataEncodings[0]).assertEqual('gbk');
        expect(ds.dataEncodings[1]).assertEqual('utf8');
        expect(ds.dataEncodings[2]).assertEqual('gbk');
        expect(ds.dataChunks[0]).assertEqual('default');
        expect(ds.dataChunks[1]).assertEqual('override');
        expect(ds.dataChunks[2]).assertEqual('closing');
        expect(ds.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_1000
     * @tc.name testStreamDuplexInteractionFlow010
     * @tc.desc Verify Duplex pipe writable side still writable after pipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTrackWrite = new DuplexTrackWrite();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      let result: boolean = ds.write('writable-side', 'utf8');
      expect(result).assertTrue();
      expect(ds.writeCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_1100
     * @tc.name testStreamDuplexInteractionFlow011
     * @tc.desc Verify Duplex pipe pause readable side stops downstream delivery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexManualRead = new DuplexManualRead();
      let ws: DuplexPipeWritable = new DuplexPipeWritable();
      ds.pipe(ws);
      ds.pause();
      ds.push('paused');
      expect(ws.writeCount).assertEqual(0);
      expect(ds.readableLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_1200
     * @tc.name testStreamDuplexInteractionFlow012
     * @tc.desc Verify the writable error callback still observes a usable readable side before readable completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ds: DuplexErrorWrite = new DuplexErrorWrite();
        let readableAtError: boolean = false;
        let readableEndedAtError: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.on('error', (err: Object): void => {
            readableAtError = ds.readable;
            readableEndedAtError = ds.readableEnded;
            resolve(undefined);
          });
          ds.write('x', 'utf8');
        });
        expect(readableAtError).assertTrue();
        expect(readableEndedAtError).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_1300
     * @tc.name testStreamDuplexInteractionFlow013
     * @tc.desc Verify the finish callback after writable end reports writableFinished without ending the readable side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ds: DuplexManualRead = new DuplexManualRead();
        let writableFinishedAtFinish: boolean = false;
        let readableEndedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.on('finish', (): void => {
            writableFinishedAtFinish = ds.writableFinished;
            readableEndedAtFinish = ds.readableEnded;
            resolve(undefined);
          });
          ds.end();
        });
        expect(writableFinishedAtFinish).assertTrue();
        expect(readableEndedAtFinish).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_1400
     * @tc.name testStreamDuplexInteractionFlow014
     * @tc.desc Verify Duplex bidirectional: multiple writes and pushes interleave correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTrackWrite = new DuplexTrackWrite();
      ds.pause();
      ds.write('w1', 'utf8');
      ds.push('r1');
      ds.write('w2', 'utf8');
      ds.push('r2');
      expect(ds.writeCount).assertEqual(2);
      expect(ds.readableLength).assertEqual(4);
      expect(ds.read(2)?.toString()).assertEqual('r1');
      expect(ds.read(2)?.toString()).assertEqual('r2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_1500
     * @tc.name testStreamDuplexInteractionFlow015
     * @tc.desc Verify Duplex pipe downstream writable end does not affect upstream readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexManualRead = new DuplexManualRead();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ws.end();
      expect(ds.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_1600
     * @tc.name testStreamDuplexInteractionFlow016
     * @tc.desc Verify Duplex unpipe downstream keeps upstream readable state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexManualRead = new DuplexManualRead();
      let ws: CollectWritable = new CollectWritable();
      ds.pipe(ws);
      ds.unpipe(ws);
      ds.push('after-unpipe');
      expect(ws.writeCount).assertEqual(0);
      expect(ds.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_1700
     * @tc.name testStreamDuplexInteractionFlow017
     * @tc.desc Verify piped Duplex read delivery is independent from a byte write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ds: DuplexTrackWrite = new DuplexTrackWrite();
        let ws: CollectWritable = new CollectWritable();
        let arr: Uint8Array = new Uint8Array([1, 2, 3]);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ws.on('finish', (): void => {
            resolve(undefined as void);
          });
          ds.pipe(ws);
          ds.pause();
          let writeResult: boolean = ds.write(arr, 'utf8');
          let pushResult: boolean = ds.push('read-side');
          expect(writeResult).assertTrue();
          expect(pushResult).assertTrue();
          expect(ds.writeCount).assertEqual(1);
          expect(ws.writeCount).assertEqual(0);
          ds.resume();
          ds.push(null);
        });
        expect(ds.dataChunks[0]).assertEqual(arr);
        expect(ds.dataEncodings[0]).assertEqual('utf8');
        expect(ws.writeCount).assertEqual(1);
        let receivedBytes: Uint8Array = ws.received[0] as Uint8Array;
        expect(receivedBytes.length).assertEqual(9);
        expect(receivedBytes[0]).assertEqual(114);
        expect(receivedBytes[1]).assertEqual(101);
        expect(receivedBytes[2]).assertEqual(97);
        expect(receivedBytes[3]).assertEqual(100);
        expect(receivedBytes[4]).assertEqual(45);
        expect(receivedBytes[5]).assertEqual(115);
        expect(receivedBytes[6]).assertEqual(105);
        expect(receivedBytes[7]).assertEqual(100);
        expect(receivedBytes[8]).assertEqual(101);
        expect(ds.readableEnded).assertTrue();
        expect(ws.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_1800
     * @tc.name testStreamDuplexInteractionFlow018
     * @tc.desc Verify Duplex push Uint8Array chunk readable side delivers bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexManualRead = new DuplexManualRead();
      ds.pause();
      ds.push(new Uint8Array([4, 5, 6]));
      let data: Object | null = ds.read();
      let bytes: buffer.Buffer = data as buffer.Buffer;
      expect(bytes.length).assertEqual(3);
      expect(bytes[0]).assertEqual(4);
      expect(bytes[1]).assertEqual(5);
      expect(bytes[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_1900
     * @tc.name testStreamDuplexInteractionFlow019
     * @tc.desc Verify Duplex push empty string does not add readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexManualRead = new DuplexManualRead();
      ds.pause();
      let before: int = ds.readableLength;
      ds.push('');
      expect(ds.readableLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_2000
     * @tc.name testStreamDuplexInteractionFlow020
     * @tc.desc Verify Duplex end(chunk, callback) completes both callback and finish event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ds: DuplexManualRead = new DuplexManualRead();
        let cbFired: boolean = false;
        let finishFired: boolean = false;
        let writableFinishedAtEnd: boolean = false;

        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.on('finish', (): void => {
            finishFired = true;
            if (cbFired) {
              writableFinishedAtEnd = ds.writableFinished;
              resolve(undefined);
            }
          });
          ds.end('final', 'utf8', (): void => {
            cbFired = true;
            writableFinishedAtEnd = ds.writableFinished;
            resolve(undefined);
          });
        });

        expect(writableFinishedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_2100
     * @tc.name testStreamDuplexInteractionFlow021
     * @tc.desc Verify mixed readable chunks can be consumed in parts before readable completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ds: DuplexManualRead = new DuplexManualRead();
        let firstPush: boolean = false;
        let secondPush: boolean = false;
        let firstRead: Object | null = null;
        let secondRead: Object | null = null;
        let endCount: int = 0;
        ds.pause();
        firstPush = ds.push('r1');
        secondPush = ds.push(new Uint8Array([114, 50]));
        firstRead = ds.read(2);
        secondRead = ds.read(2);
        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.on('end', (): void => {
            endCount++;
            resolve(undefined as void);
          });
          ds.push(null);
          ds.resume();
        });
        expect(firstPush).assertTrue();
        expect(secondPush).assertTrue();
        expect(firstRead?.toString()).assertEqual('r1');
        expect(secondRead?.toString()).assertEqual('r2');
        expect(ds.readableLength).assertEqual(0);
        expect(ds.writableLength).assertEqual(0);
        expect(endCount).assertEqual(1);
        expect(ds.readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_2200
     * @tc.name testStreamDuplexInteractionFlow022
     * @tc.desc Verify cork batches multiple writes through doWritev after an independent readable read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTrackWrite = new DuplexTrackWrite();
      ds.cork();
      let firstWrite: boolean = ds.write('left', 'utf8');
      let secondWrite: boolean = ds.write('right', 'utf8');
      let writeCountWhileCorked: int = ds.writeCount;
      ds.pause();
      ds.push('read-side');
      let readValue: Object | null = ds.read();
      ds.end('tail', 'utf8');
      expect(firstWrite).assertTrue();
      expect(secondWrite).assertTrue();
      expect(writeCountWhileCorked).assertEqual(0);
      expect(ds.writableCorked).assertEqual(0);
      expect(ds.writevCount).assertEqual(1);
      expect(ds.dataChunks.length).assertEqual(3);
      expect(ds.dataChunks[0]).assertEqual('left');
      expect(ds.dataChunks[1]).assertEqual('right');
      expect(ds.dataChunks[2]).assertEqual('tail');
      expect(readValue?.toString()).assertEqual('read-side');
      expect(ds.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_2300
     * @tc.name testStreamDuplexInteractionFlow023
     * @tc.desc Verify both Duplex watermarks remain stable while byte writes and manual reads use separate sides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ds: DuplexTrackWrite = new DuplexTrackWrite();
        let readWatermark: int = ds.readableHighWatermark;
        let writeWatermark: int = ds.writableHighWatermark;
        let pushed: boolean = false;
        let written: boolean = false;
        let readValue: string = '';
        let finishCount: int = 0;
        ds.pause();
        pushed = ds.push('water');
        readValue = ds.read()?.toString() ?? '';
        written = ds.write(new Uint8Array([1, 2, 3]), 'utf8');

        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.on('finish', (): void => {
            finishCount++;
            resolve(undefined as void);
          });
          ds.end(undefined, undefined, (): void => {
            resolve(undefined as void);
          });
        });
        expect(readWatermark).assertEqual(16384);
        expect(writeWatermark).assertEqual(16384);
        expect(pushed).assertTrue();
        expect(written).assertTrue();
        expect(readValue).assertEqual('water');
        expect(ds.writeCount).assertEqual(1);
        let recordedBytes: Uint8Array = ds.dataChunks[0] as Uint8Array;
        expect(recordedBytes.length).assertEqual(3);
        expect(recordedBytes[0]).assertEqual(1);
        expect(recordedBytes[2]).assertEqual(3);
        expect(ds.writableLength).assertEqual(0);
        expect(ds.readableLength).assertEqual(0);
        expect(finishCount).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_2400
     * @tc.name testStreamDuplexInteractionFlow024
     * @tc.desc Verify split UTF8 bytes reassemble into one emoji before manual read completion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ds: DuplexManualRead = new DuplexManualRead();
        let firstPush: boolean = false;
        let secondPush: boolean = false;
        let data: Object | null = null;
        let endCount: int = 0;
        ds.setEncoding('utf8');
        ds.pause();
        firstPush = ds.push(new Uint8Array([240, 159]));
        secondPush = ds.push(new Uint8Array([152, 128]));
        data = ds.read();
        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.on('end', (): void => {
            endCount++;
            resolve(undefined as void);
          });
          ds.push(null);
          ds.resume();
        });
        expect(firstPush).assertTrue();
        expect(secondPush).assertTrue();
        expect(ds.readableEncoding).assertEqual('utf-8');
        expect(data?.toString()).assertEqual('😀');
        expect(ds.readableLength).assertEqual(0);
        expect(endCount).assertEqual(1);
        expect(ds.readableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_2500
     * @tc.name testStreamDuplexInteractionFlow025
     * @tc.desc Verify mixed string and byte writes preserve input order through explicit encoding callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ds: DuplexTrackWrite = new DuplexTrackWrite();
        let byteChunk: Uint8Array = new Uint8Array([98, 121, 116, 101]);
        let firstCallback: boolean = false;
        let secondCallback: boolean = false;
        let finishCallback: boolean = false;
        let finishEvent: boolean = false;

        await new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void): void => {
          ds.write('text', 'utf8', (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
            }
            firstCallback = true;
          });
          ds.write(byteChunk, 'utf8', (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
            }
            secondCallback = true;
          });
          ds.on('finish', (): void => {
            finishEvent = true;
          });
          ds.end('tail', 'utf8', (): void => {
            finishCallback = true;
            resolve(undefined as void);
          });
        });

        expect(firstCallback).assertTrue();
        expect(secondCallback).assertTrue();
        expect(finishCallback).assertTrue();
        expect(ds.writeCount).assertEqual(3);
        expect(ds.dataChunks[0]).assertEqual('text');
        let recordedBytes: Uint8Array = ds.dataChunks[1] as Uint8Array;
        expect(recordedBytes.length).assertEqual(4);
        expect(recordedBytes[0]).assertEqual(98);
        expect(recordedBytes[3]).assertEqual(101);
        expect(ds.dataChunks[2]).assertEqual('tail');
        expect(ds.dataEncodings[0]).assertEqual('utf8');
        expect(ds.dataEncodings[1]).assertEqual('utf8');
        expect(ds.dataEncodings[2]).assertEqual('utf8');
        expect(ds.writableFinished).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_2600
     * @tc.name testStreamDuplexInteractionFlow026
     * @tc.desc Verify multiple requests preserve response order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let duplex = new ScenarioDuplex('R:');
        let text = '';
        let allStartsWithR: boolean = true;
        let record0AtEnd: string = '';
        let record2AtEnd: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          duplex.on('data', (chunk: Object): void => {
            let value: string = chunk.toString();
            if (!value.startsWith('R:')) {
              allStartsWithR = false;
            }
            text += value;
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          duplex.on('end', (): void => {
            record0AtEnd = duplex.records[0];
            record2AtEnd = duplex.records[2];
            resolve(undefined as void);
          });
          duplex.write('a');
          duplex.write('b');
          duplex.end('c');
        });
        expect(allStartsWithR).assertTrue();
        expect(text).assertEqual('R:aR:bR:c');
        expect(record0AtEnd).assertEqual('a');
        expect(record2AtEnd).assertEqual('c');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_2700
     * @tc.name testStreamDuplexInteractionFlow027
     * @tc.desc Verify each write callback observes the accepted request record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let duplex = new ScenarioDuplex('ACK:');
        let allAckStarts: boolean = true;
        let writeCountAtFinish: int = 0;
        let recordLenAtEnd: int = 0;
        let record0AtCb1: string = '';
        let record1AtCb2: string = '';
        await new Promise<void>((resolve: (value: void) => void): void => {
          duplex.on('data', (chunk: Object): void => {
            if (!chunk.toString().startsWith('ACK:')) {
              allAckStarts = false;
            }
          });
          duplex.on('finish', (): void => {
            writeCountAtFinish = duplex.writeCount;
            record0AtCb1 = duplex.records[0];
            record1AtCb2 = duplex.records[1];
            duplex.push(null);
          });
          duplex.on('end', (): void => {
            recordLenAtEnd = duplex.records.length;
            resolve(undefined as void);
          });
          duplex.write('one', 'utf8');
          duplex.end('two', 'utf8');
        });
        expect(allAckStarts).assertTrue();
        expect(writeCountAtFinish).assertEqual(2);
        expect(recordLenAtEnd).assertEqual(2);
        expect(record0AtCb1).assertEqual('one');
        expect(record1AtCb2).assertEqual('two');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_2800
     * @tc.name testStreamDuplexInteractionFlow028
     * @tc.desc Verify paused readable responses are delivered after resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let duplex = new ScenarioDuplex('P:');
        let value = '';
        let dataChunkVal: string = '';
        let record0AtCb: string = '';
        await new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void): void => {
          duplex.pause();
          duplex.on('data', (chunk: Object): void => {
            dataChunkVal = chunk.toString();
            value += chunk.toString();
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          duplex.on('end', (): void => {
            resolve(undefined as void);
          });
          duplex.write('held', 'utf8', (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
              return;
            }
            record0AtCb = duplex.records[0];
            duplex.push(null);
            duplex.resume();
            duplex.end();
          });
        });
        expect(dataChunkVal).assertEqual('P:held');
        expect(record0AtCb).assertEqual('held');
        expect(value).assertEqual('P:held');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_2900
     * @tc.name testStreamDuplexInteractionFlow029
     * @tc.desc Verify setEncoding converts response chunks to strings in the data callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let duplex = new ScenarioDuplex('E:');
        let kind = '';
        let dataChunkVal: string = '';
        let setEncodingResult: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          setEncodingResult = duplex.setEncoding('utf8');
          duplex.on('data', (chunk: Object): void => {
            kind = typeof chunk;
            dataChunkVal = chunk.toString();
          });
          duplex.on('finish', (): void => {
            duplex.push(null);
          });
          duplex.on('end', (): void => {
            resolve(undefined as void);
          });
          duplex.end('text');
        });
        expect(setEncodingResult).assertTrue();
        expect(dataChunkVal).assertEqual('E:text');
        expect(kind).assertEqual('string');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_3000
     * @tc.name testStreamDuplexInteractionFlow030
     * @tc.desc Verify interleaved writes are isolated to one Duplex instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let a = new ScenarioDuplex('A:');
        let b = new ScenarioDuplex('B:');
        let at = '';
        let bt = '';
        let completedStreams: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          a.on('data', (chunk: Object): void => {
            at += chunk.toString();
          });
          b.on('data', (chunk: Object): void => {
            bt += chunk.toString();
          });
          a.on('finish', (): void => {
            a.push(null);
          });
          b.on('finish', (): void => {
            b.push(null);
          });
          a.on('end', (): void => {
            completedStreams++;
            if (completedStreams === 2) {
              resolve(undefined as void);
            }
          });
          b.on('end', (): void => {
            completedStreams++;
            if (completedStreams === 2) {
              resolve(undefined as void);
            }
          });
          a.write('1');
          b.write('x');
          a.end('2');
          b.end('y');
        });
        expect(at).assertEqual('A:1A:2');
        expect(bt).assertEqual('B:xB:y');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_3100
     * @tc.name testStreamDuplexInteractionFlow031
     * @tc.desc Verify an empty request stream completes readable and writable sides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let duplex = new ScenarioDuplex();
        let dataCount: int = 0;
        let writeCountAtFinish: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          duplex.on('data', (): void => {
            dataCount++;
          });
          duplex.on('finish', (): void => {
            writeCountAtFinish = duplex.writeCount;
          });
          duplex.on('end', (): void => {
            resolve(undefined as void);
          });
          duplex.push(null);
          duplex.end();
          duplex.resume();
        });
        expect(writeCountAtFinish).assertEqual(0);
        expect(dataCount).assertEqual(0);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_INTERACTION_3200
     * @tc.name testStreamDuplexInteractionFlow032
     * @tc.desc Verify a Duplex can emit a server response independently from its request write side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexInteractionFlow032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let duplex = new ScenarioDuplex('RESP:');
        let response = '';
        let firstDataVal: string = '';
        let secondDataVal: string = '';
        let writableEndedAtFinish: boolean = false;
        let writeCountAtFinish: int = 0;
        let record0AtCb: string = '';
        await new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void): void => {
          duplex.on('data', (chunk: Object): void => {
            let value: string = chunk.toString();
            if (response.length === 0) {
              firstDataVal = value;
            } else {
              secondDataVal = value;
            }
            response += value;
          });
          duplex.on('finish', (): void => {
            writableEndedAtFinish = duplex.writableEnded;
            writeCountAtFinish = duplex.writeCount;
            duplex.push(null);
          });
          duplex.on('end', (): void => {
            resolve(undefined as void);
          });
          duplex.push('server-ready');
          duplex.write('request', 'utf8', (err?: Error): void => {
            if (err !== undefined) {
              reject(err);
              return;
            }
            record0AtCb = duplex.records[0];
          });
          duplex.end();
        });
        expect(firstDataVal).assertEqual('server-ready');
        expect(secondDataVal).assertEqual('RESP:request');
        expect(writableEndedAtFinish).assertTrue();
        expect(writeCountAtFinish).assertEqual(1);
        expect(record0AtCb).assertEqual('request');
        expect(response).assertEqual('server-readyRESP:request');

        done();
      });
  });
}
