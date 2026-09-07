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

class DuplexThrowDoRead extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
    throw new Error("source error");
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class TestWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: Uint8Array | string, encoding: string, cb: Function): void {
    cb.unsafeCall();
  }
}

class EventDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.push(chunk as string);
    callback.unsafeCall();
  }
}

export default function StreamDuplexOnTest(): void {
  describe('StreamDuplexOnTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_0100
     * @tc.name testStreamDuplexOn001
     * @tc.desc Verify on("end", cb) registers end callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let endFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexTestBase = new DuplexTestBase();
          ds.on("end", (): void => {
            endFired = true;
            resolve(undefined as void);
          });
          ds.resume();
          ds.push(null);
        });
        expect(endFired).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_0200
     * @tc.name testStreamDuplexOn002
     * @tc.desc Verify on("error", cb) registers error callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let errName: string = "";
      let errMsg: string = "";
      let errorCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexThrowDoRead = new DuplexThrowDoRead();
        ds.on("error", (err: Error): void => {
          errorCount++;
          errName = err.name;
          errMsg = err.message;
          resolve(undefined as void);
        });
        ds.resume();
      });
      expect(errName).assertEqual("Error");
      expect(errMsg).assertEqual("source error");
      expect(errorCount).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_0300
     * @tc.name testStreamDuplexOn003
     * @tc.desc Verify on("close", cb) registers close callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let closeFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexTestBase = new DuplexTestBase();
          ds.on("close", (): void => {
            closeFired = true;
            resolve(undefined as void);
          });
          ds.push(null);
          ds.end();
        });
        expect(closeFired).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_0400
     * @tc.name testStreamDuplexOn004
     * @tc.desc Verify on("readable", cb) registers readable callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let readableFired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexTestBase = new DuplexTestBase();
          ds.on("readable", (): void => {
            readableFired = true;
            resolve(undefined as void);
          });
          ds.push("test");
        });
        expect(readableFired).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_0500
     * @tc.name testStreamDuplexOn005
     * @tc.desc Verify multiple on same event all fire in registration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let order: string = "";
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("data", (): void => {
          order += "a";
        });
        ds.on("data", (): void => {
          order += "b";
        });
        ds.on("data", (): void => {
          order += "c";
        });
        ds.on("end", (): void => {
          resolve(undefined as void);
        });
        ds.resume();
        ds.push("x");
        ds.push(null);
      });
      expect(order).assertEqual("abc");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_0600
     * @tc.name testStreamDuplexOn006
     * @tc.desc Verify on("data", cb) in pause mode does not fire on push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let received: boolean = false;
      ds.on("data", (chunk: Object): void => {
        received = true;
      });
      ds.pause();
      ds.push("test");
      expect(received).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_0700
     * @tc.name testStreamDuplexOn007
     * @tc.desc Verify end on an empty stream reports readableEnded with no data callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let dataCount: int = 0;
      let endedAtEnd: boolean = false;
      let lengthAtEnd: int = -1;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("data", (chunk: Object): void => {
          dataCount++;
        });
        ds.on("end", (): void => {
          endedAtEnd = ds.readableEnded;
          lengthAtEnd = ds.readableLength;
          resolve(undefined as void);
        });
        ds.resume();
        ds.push(null);
      });
      expect(dataCount).assertEqual(0);
      expect(endedAtEnd).assertTrue();
      expect(lengthAtEnd).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_0800
     * @tc.name testStreamDuplexOn008
     * @tc.desc Verify on("error", cb) fires after pause-resume triggers doRead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let errName: string = "";
      let errMsg: string = "";
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexThrowDoRead = new DuplexThrowDoRead();
        ds.on("error", (err: Error): void => {
          errName = err.name;
          errMsg = err.message;
          resolve(undefined as void);
        });
        ds.pause();
        ds.resume();
      });
      expect(errName).assertEqual("Error");
      expect(errMsg).assertEqual("source error");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_0900
     * @tc.name testStreamDuplexOn009
     * @tc.desc Verify on("readable", cb) fires after push in pause mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let readableFired: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("readable", (): void => {
          readableFired = true;
          resolve(undefined as void);
        });
        ds.pause();
        ds.push("test");
      });
      expect(readableFired).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_1000
     * @tc.name testStreamDuplexOn010
     * @tc.desc Verify on("data", cb) multiple push fires multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let count: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("data", (chunk: Object): void => {
          count++;
        });
        ds.on("end", (): void => {
          resolve(undefined as void);
        });
        ds.resume();
        ds.push("a");
        ds.push("b");
        ds.push("c");
        ds.push(null);
      });
      expect(count).assertEqual(3);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_1100
     * @tc.name testStreamDuplexOn011
     * @tc.desc Verify on("data", cb) fires with Uint8Array chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let received: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("data", (chunk: Object): void => {
          received = true;
          resolve(undefined as void);
        });
        ds.push(new Uint8Array([1, 2, 3]));
      });
      expect(received).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_1200
     * @tc.name testStreamDuplexOn012
     * @tc.desc Verify on("end", cb) fires only once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let endCount: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("end", (): void => {
          endCount++;
          resolve(undefined as void);
        });
        ds.resume();
        ds.push(null);
        ds.push(null);
      });
      expect(endCount).assertEqual(1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_1300
     * @tc.name testStreamDuplexOn013
     * @tc.desc Verify on("data", cb) after pause then resume fires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let received: string = "";
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("data", (chunk: Object): void => {
          received = chunk.toString();
          resolve(undefined as void);
        });
        ds.pause();
        ds.push("test");
        ds.resume();
      });
      expect(received).assertEqual("test");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_1400
     * @tc.name testStreamDuplexOn014
     * @tc.desc Verify data callback receives string, binary and emoji chunks with correct content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let strings: string[] = ["test", "😀"];
      for (let i = 0; i < strings.length; i++) {
        let receivedStr: string = "";
        let received: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let ds: DuplexTestBase = new DuplexTestBase();
          ds.on("data", (chunk: Object): void => {
            received = true;
            receivedStr = chunk.toString();
            resolve(undefined as void);
          });
          ds.push(strings[i]);
        });
        expect(received).assertTrue();
        expect(receivedStr).assertEqual(strings[i]);
      }
      let binReceived: boolean = false;
      let binStr: string = "";
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("data", (chunk: Object): void => {
          binReceived = true;
          binStr = chunk.toString();
          resolve(undefined as void);
        });
        ds.push(new Uint8Array([0x74, 0x65, 0x73, 0x74]));
      });
      expect(binReceived).assertTrue();
      expect(binStr).assertEqual("test");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_1500
     * @tc.name testStreamDuplexOn015
     * @tc.desc Verify on does not affect isPaused or readableLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.on("data", (chunk: Object): void => {
      });
      expect(ds.isPaused()).assertFalse();
      expect(ds.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_1600
     * @tc.name testStreamDuplexOn016
     * @tc.desc Verify on("data", cb) after setEncoding fires with decoded string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let received: string = "";
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("data", (chunk: Object): void => {
          received = chunk.toString();
          resolve(undefined as void);
        });
        ds.setEncoding("gbk");
        ds.push(new Uint8Array([0xD6, 0xD0, 0xCE, 0xC4]));
      });
      expect(received).assertEqual("中文");
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_1700
     * @tc.name testStreamDuplexOn017
     * @tc.desc Verify on("data", cb) then read returns null in flowing mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let data: Object | null = null;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("data", (chunk: Object): void => {
          data = ds.read();
        });
        ds.on("end", (): void => {
          resolve(undefined as void);
        });
        ds.resume();
        ds.push("test");
        ds.push(null);
      });
      expect(data).assertEqual(null);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_1800
     * @tc.name testStreamDuplexOn018
     * @tc.desc Verify end callback fires after data and end marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let endFired: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("end", (): void => {
          endFired = true;
          resolve(undefined as void);
        });
        ds.resume();
        ds.push("data");
        ds.push(null);
      });
      expect(endFired).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_1900
     * @tc.name testStreamDuplexOn019
     * @tc.desc Verify on("data", cb) with large chunk fires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let received: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("data", (chunk: Object): void => {
          received = true;
          resolve(undefined as void);
        });
        ds.push(new Uint8Array(1024));
      });
      expect(received).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_2000
     * @tc.name testStreamDuplexOn020
     * @tc.desc Verify on("data", cb) after pipe fires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let receivedStr: string = "";
      let received: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws: TestWritable = new TestWritable();
        ds.pipe(ws);
        ds.on("data", (chunk: Object): void => {
          received = true;
          receivedStr = chunk.toString();
          resolve(undefined as void);
        });
        ds.push("test");
      });
      expect(receivedStr).assertEqual('test');
      expect(received).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_2100
     * @tc.name testStreamDuplexOn021
     * @tc.desc Verify on("data", cb) after cork fires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let received: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.cork();
        ds.on("data", (chunk: Object): void => {
          received = true;
          resolve(undefined as void);
        });
        ds.push("test");
      });
      expect(received).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_2200
     * @tc.name testStreamDuplexOn022
     * @tc.desc Verify on("data", cb) after end() on write side still fires on read side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let received: boolean = false;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.end();
        ds.on("data", (chunk: Object): void => {
          received = true;
          resolve(undefined as void);
        });
        ds.push("test");
      });
      expect(received).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_2300
     * @tc.name testStreamDuplexOn023
     * @tc.desc Verify on("data", cb) with empty string does not fire
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let received: boolean = false;
      ds.on("data", (chunk: Object): void => {
        received = true;
      });
      ds.push("");
      expect(received).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_2400
     * @tc.name testStreamDuplexOn024
     * @tc.desc Verify on does not affect write side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.on("data", (chunk: Object): void => {
      });
      let r: boolean = ds.write("test");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_2500
     * @tc.name testStreamDuplexOn025
     * @tc.desc Verify readable callback fires with a binary buffer available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let readableFired: boolean = false;
      let len: int = 0;
      await new Promise<void>((resolve: (value: void) => void): void => {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.on("readable", (): void => {
          readableFired = true;
          len = ds.readableLength;
          resolve(undefined as void);
        });
        ds.pause();
        ds.push(new Uint8Array([0x74, 0x65, 0x73, 0x74]));
      });
      expect(len).assertEqual(4);
      expect(readableFired).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_2600
     * @tc.name testStreamDuplexOn026
     * @tc.desc Verify on("data", cb) then off then push does not fire
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let received: boolean = false;
      let cb = (chunk: Object): void => {
        received = true;
      };
      ds.on("data", cb);
      ds.off("data", cb);
      ds.push("test");
      expect(received).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_2700
     * @tc.name testStreamDuplexOn027
     * @tc.desc Verify on("data", cb) after stream end does not fire
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let received: boolean = false;
      ds.on("data", (chunk: Object): void => {
        received = true;
      });
      ds.push(null);
      ds.end();
      ds.push("after-end");
      expect(received).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_2800
     * @tc.name testStreamDuplexOn028
     * @tc.desc Verify on("finish") registers and fires after end() completes the writable side of Duplex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let d = new EventDuplex();
        let finishFired: boolean = false;
        let finishedAtFinish: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          d.on('finish', (): void => {
            finishFired = true;
            finishedAtFinish = d.writableFinished;
            resolve(undefined as void);
          });
          d.write('finish-data');
          d.end();
        });
        expect(finishFired).assertTrue();
        expect(finishedAtFinish).assertTrue();
        expect(d.writableEnded).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_2900
     * @tc.name testStreamDuplexOn029
     * @tc.desc Verify on("pause") registers and fires when pause() is called on the readable side of Duplex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new EventDuplex();
      let pauseFired: boolean = false;
      d.on('pause', (): void => {
        pauseFired = true;
      });
      d.pause();
      expect(pauseFired).assertTrue();
      expect(d.isPaused()).assertTrue();
      expect(d.readableFlowing).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_ON_3000
     * @tc.name testStreamDuplexOn030
     * @tc.desc Verify on("resume") registers and fires when resume() is called after pause() on the readable side of Duplex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexOn030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let d = new EventDuplex();
      let resumeFired: boolean = false;
      d.pause();
      d.on('resume', (): void => {
        resumeFired = true;
      });
      d.resume();
      await new Promise<void>((resolve: (value: void) => void): void => {
        setTimeout((): void => resolve(undefined as void), 100);
      });
      expect(resumeFired).assertTrue();
      expect(d.isPaused()).assertFalse();
      done();
    });
  });
}
