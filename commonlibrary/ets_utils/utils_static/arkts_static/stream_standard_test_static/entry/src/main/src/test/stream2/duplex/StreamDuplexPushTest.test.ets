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
import { stream, util } from '@kit.ArkTS';

class DuplexTestBase extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamDuplexPushTest(): void {
  describe('StreamDuplexPushTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_0100
     * @tc.name testStreamDuplexPush001
     * @tc.desc Verify push returns true when buffer below highWaterMark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let r: boolean = ds.push("test");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_0200
     * @tc.name testStreamDuplexPush002
     * @tc.desc Verify push returns false at and beyond highWaterMark boundary for string and Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds0: DuplexTestBase = new DuplexTestBase();
      ds0.pause();
      let chunk: string = "";
      for (let i: int = 0; i < 16385; i++) {
        chunk += "a";
      }
      expect(ds0.push(chunk)).assertFalse();
      let sizes: int[] = [16385, 16384];
      for (let i = 0; i < sizes.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.pause();
        expect(ds.push(new Uint8Array(sizes[i]))).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_0300
     * @tc.name testStreamDuplexPush003
     * @tc.desc Verify push(null) ends the stream only after previously pushed data is delivered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let deliveredBeforeEnd: string = "";
        let endedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexTestBase = new DuplexTestBase();
          ds.on("data", (chunk: Object): void => {
            deliveredBeforeEnd += chunk.toString();
          });
          ds.on("end", (): void => {
            endedAtEnd = ds.readableEnded;
            resolve(undefined as void);
          });
          ds.resume();
          ds.push("tail");
          ds.push(null);
        });
        expect(deliveredBeforeEnd).assertEqual("tail");
        expect(endedAtEnd).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_0400
     * @tc.name testStreamDuplexPush004
     * @tc.desc Verify push(string) with encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let r: boolean = ds.push("test", "utf8");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_0500
     * @tc.name testStreamDuplexPush005
     * @tc.desc Verify push(Uint8Array) adds bytes to buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push(new Uint8Array([1, 2, 3, 4, 5]));
      expect(ds.readableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_0600
     * @tc.name testStreamDuplexPush006
     * @tc.desc Verify push in flowing mode emits data event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let dataReceived: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexTestBase = new DuplexTestBase();
          ds.on("data", (chunk: Object): void => {
            dataReceived = chunk.toString();
            resolve(undefined as void);
          });
          ds.push("flowing-data");
        });
        expect(dataReceived).assertEqual("flowing-data");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_0700
     * @tc.name testStreamDuplexPush007
     * @tc.desc Verify push in paused mode does NOT emit data event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataReceived: boolean = false;
      ds.on("data", (chunk: Object): void => {
        dataReceived = true;
      });
      ds.pause();
      ds.push("paused-data");
      expect(dataReceived).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_0800
     * @tc.name testStreamDuplexPush008
     * @tc.desc Verify push(empty string) does not increase readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push("");
      expect(ds.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_0900
     * @tc.name testStreamDuplexPush009
     * @tc.desc Verify push(undefined) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let r: boolean = ds.push(undefined);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_1000
     * @tc.name testStreamDuplexPush010
     * @tc.desc Verify push(null) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let r: boolean = ds.push(null);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_1100
     * @tc.name testStreamDuplexPush011
     * @tc.desc Verify multiple push calls accumulate in buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push("a");
      ds.push("b");
      ds.push("c");
      expect(ds.readableLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_1200
     * @tc.name testStreamDuplexPush012
     * @tc.desc Verify push after end is ignored (readableEnded stays true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedEnded: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("end", (): void => {
          ds.push("after-end");
          capturedEnded = ds.readableEnded;
          resolve(undefined as void);
        });
        ds.resume();
        ds.push(null);
      });
      expect(capturedEnded).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_1300
     * @tc.name testStreamDuplexPush013
     * @tc.desc Verify push(null) makes readableEnded true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedEnded: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        expect(ds.readableEnded).assertFalse();
        ds.on("end", (): void => {
          capturedEnded = ds.readableEnded;
          resolve(undefined as void);
        });
        ds.resume();
        ds.push(null);
      });
      expect(capturedEnded).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_1400
     * @tc.name testStreamDuplexPush014
     * @tc.desc Verify push then read returns the pushed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("hello");
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_1500
     * @tc.name testStreamDuplexPush015
     * @tc.desc Verify push with size below highWaterMark returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      let r: boolean = ds.push(new Uint8Array(16383));
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_1600
     * @tc.name testStreamDuplexPush016
     * @tc.desc Verify push then resume emits data event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let dataReceived: string = "";
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexTestBase = new DuplexTestBase();
          ds.on("data", (chunk: Object): void => {
            dataReceived = chunk.toString();
            resolve(undefined as void);
          });
          ds.pause();
          ds.push("resume-data");
          ds.resume();
        });
        expect(dataReceived).assertEqual("resume-data");
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_1700
     * @tc.name testStreamDuplexPush017
     * @tc.desc Verify push then read then push again works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("a");
      ds.pause();
      let d1 = ds.read();
      expect(d1?.toString()).assertEqual("a");
      ds.push("b");
      let d2 = ds.read();
      expect(d2?.toString()).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_1800
     * @tc.name testStreamDuplexPush018
     * @tc.desc Verify push with invalid encoding throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      try {
        ds.push("test", "invalid-encoding");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_1900
     * @tc.name testStreamDuplexPush019
     * @tc.desc Verify readableLength lifecycle: push increases it and read reduces it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      expect(ds.readableLength).assertEqual(0);
      ds.push("hello");
      expect(ds.readableLength).assertEqual(5);
      ds.read(2);
      expect(ds.readableLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_2000
     * @tc.name testStreamDuplexPush020
     * @tc.desc Verify push in flowing mode reduces readableLength to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedLength: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("data", (chunk: Object): void => {
          capturedLength = ds.readableLength;
        });
        ds.on("end", (): void => {
          resolve(undefined as void);
        });
        ds.resume();
        ds.push("data");
        ds.push(null);
      });
      expect(capturedLength).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_2100
     * @tc.name testStreamDuplexPush021
     * @tc.desc Verify push after push(null) does not emit data event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let dataReceived: boolean = false;
      ds.on("data", (chunk: Object): void => {
        dataReceived = true;
      });
      ds.push(null);
      ds.push("after-end");
      expect(dataReceived).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_2200
     * @tc.name testStreamDuplexPush022
     * @tc.desc Verify push then resume emits data event in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let received: string = "";
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("data", (chunk: Object): void => {
          received += chunk.toString();
        });
        ds.on("end", (): void => {
          resolve(undefined as void);
        });
        ds.pause();
        ds.push("a");
        ds.push("b");
        ds.push("c");
        ds.push(null);
        ds.resume();
      });
      expect(received).assertEqual("abc");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_2300
     * @tc.name testStreamDuplexPush023
     * @tc.desc Verify push with encoding "utf-8"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push("hello", "utf-8");
      expect(ds.readableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_2400
     * @tc.name testStreamDuplexPush024
     * @tc.desc Verify push throws BusinessError for uppercase encoding names UTF-8, GBK, GB18030 and GB2312
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ["UTF-8", "GBK", "GB18030", "GB2312"];
      let payloads: string[] = ["hello", "中文", "中文", "中文"];
      for (let i = 0; i < encodings.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.pause();
        let thrown: boolean = false;
        try {
          ds.push(payloads[i], encodings[i]);
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
          thrown = true;
        }
        expect(thrown).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_PUSH_2500
     * @tc.name testStreamDuplexPush025
     * @tc.desc Verify push on a stream that was never paused emits the data event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexPush025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let dataReceived: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexTestBase = new DuplexTestBase();
          ds.on("data", (chunk: Object): void => {
            dataReceived = true;
            resolve(undefined as void);
          });
          ds.push("test");
        });
        expect(dataReceived).assertTrue();
        done();
      });
  });
}
