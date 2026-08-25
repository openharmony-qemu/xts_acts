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

class TestWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: Uint8Array | string, encoding: string, cb: Function): void {
    cb.unsafeCall();
  }
}

export default function StreamDuplexIsPausedTest(): void {
  describe('StreamDuplexIsPausedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_0100
     * @tc.name testStreamDuplexIsPaused001
     * @tc.desc Verify isPaused returns false on fresh Duplex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_0200
     * @tc.name testStreamDuplexIsPaused002
     * @tc.desc Verify isPaused tracks readableFlowing through a pause then resume transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      expect(ds.readableFlowing).assertFalse();
      expect(ds.isPaused()).assertTrue();
      ds.resume();
      expect(ds.readableFlowing).assertTrue();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_0300
     * @tc.name testStreamDuplexIsPaused003
     * @tc.desc Verify isPaused returns false after multiple resume() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.resume();
      ds.resume();
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_0400
     * @tc.name testStreamDuplexIsPaused004
     * @tc.desc Verify isPaused returns true after pause() with data in buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push("data");
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_0500
     * @tc.name testStreamDuplexIsPaused005
     * @tc.desc Verify isPaused returns false after resume() with data in buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push("data");
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_0600
     * @tc.name testStreamDuplexIsPaused006
     * @tc.desc Verify isPaused stays true after buffered data and push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push(null);
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_0700
     * @tc.name testStreamDuplexIsPaused007
     * @tc.desc Verify isPaused returns false after resume() then push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.resume();
      ds.push(null);
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_0800
     * @tc.name testStreamDuplexIsPaused008
     * @tc.desc Verify isPaused returns true after pause() then read()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push("data");
      ds.read();
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_0900
     * @tc.name testStreamDuplexIsPaused009
     * @tc.desc Verify isPaused returns false after resume() then read()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.resume();
      ds.push("data");
      ds.read();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_1000
     * @tc.name testStreamDuplexIsPaused010
     * @tc.desc Verify isPaused returns true after pause() and the readable buffer stays empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      expect(ds.readableLength).assertEqual(0);
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_1100
     * @tc.name testStreamDuplexIsPaused011
     * @tc.desc Verify isPaused returns false after resume() with empty buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.resume();
      expect(ds.readableLength).assertEqual(0);
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_1200
     * @tc.name testStreamDuplexIsPaused012
     * @tc.desc Verify isPaused returns true after pause() then setEncoding()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.setEncoding("gbk");
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_1300
     * @tc.name testStreamDuplexIsPaused013
     * @tc.desc Verify isPaused stays true after pause() followed by write, end, cork, uncork, setDefaultEncoding or on(data)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ops: string[] = ["write", "end", "cork", "uncork", "setDefaultEncoding", "on"];
      for (let i = 0; i < ops.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.pause();
        let op: string = ops[i];
        if (op == "write") {
          ds.write("data");
        } else if (op == "end") {
          ds.end();
        } else if (op == "cork") {
          ds.cork();
        } else if (op == "uncork") {
          ds.cork();
          ds.uncork();
        } else if (op == "setDefaultEncoding") {
          ds.setDefaultEncoding("gbk");
        } else {
          ds.on("data", (chunk: Object): void => {
          });
        }
        expect(ds.isPaused()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_1400
     * @tc.name testStreamDuplexIsPaused014
     * @tc.desc Verify isPaused stays false after resume() followed by write, end, cork, uncork or setDefaultEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ops: string[] = ["write", "end", "cork", "uncork", "setDefaultEncoding"];
      for (let i = 0; i < ops.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.resume();
        let op: string = ops[i];
        if (op == "write") {
          ds.write("data");
        } else if (op == "end") {
          ds.end();
        } else if (op == "cork") {
          ds.cork();
        } else if (op == "uncork") {
          ds.cork();
          ds.uncork();
        } else {
          ds.setDefaultEncoding("gbk");
        }
        expect(ds.isPaused()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_1500
     * @tc.name testStreamDuplexIsPaused015
     * @tc.desc Verify isPaused returns false after resume() then on("data", cb)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.resume();
      ds.on("data", (chunk: Object): void => {
      });
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_1600
     * @tc.name testStreamDuplexIsPaused016
     * @tc.desc Verify isPaused returns true after pause() then off("data", cb)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let cb = (chunk: Object): void => {
      };
      ds.on("data", cb);
      ds.pause();
      ds.off("data", cb);
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_1700
     * @tc.name testStreamDuplexIsPaused017
     * @tc.desc Verify isPaused returns false after resume() then off("data", cb)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let cb = (chunk: Object): void => {
      };
      ds.on("data", cb);
      ds.resume();
      ds.off("data", cb);
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_1800
     * @tc.name testStreamDuplexIsPaused018
     * @tc.desc Verify isPaused returns true after pause() then push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.push("buffered");
      ds.push(null);
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_1900
     * @tc.name testStreamDuplexIsPaused019
     * @tc.desc Verify isPaused remains true after partial reads of buffered chunks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pushes: string[][] = [["data", "more"], ["data"]];
      let readSizes: int[] = [4, 2];
      for (let i = 0; i < readSizes.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.pause();
        let chunks: string[] = pushes[i];
        for (let j = 0; j < chunks.length; j++) {
          ds.push(chunks[j]);
        }
        ds.read(readSizes[i]);
        expect(ds.isPaused()).assertTrue();
        expect(ds.readableLength).assertEqual(readSizes[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_2000
     * @tc.name testStreamDuplexIsPaused020
     * @tc.desc Verify isPaused remains false after reading one byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.resume();
      ds.push("data");
      ds.read(1);
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_2100
     * @tc.name testStreamDuplexIsPaused021
     * @tc.desc Verify isPaused returns true after pause() then pipe()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: TestWritable = new TestWritable();
      ds.pause();
      ds.pipe(ws);
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_2200
     * @tc.name testStreamDuplexIsPaused022
     * @tc.desc Verify isPaused returns false after resume() then pipe()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: TestWritable = new TestWritable();
      ds.resume();
      ds.pipe(ws);
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_2300
     * @tc.name testStreamDuplexIsPaused023
     * @tc.desc Verify isPaused stays true after unpipe() following either pause() or resume()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let usePause: boolean[] = [true, false];
      for (let i = 0; i < usePause.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        let ws: TestWritable = new TestWritable();
        ds.pipe(ws);
        if (usePause[i]) {
          ds.pause();
        } else {
          ds.resume();
        }
        ds.unpipe(ws);
        expect(ds.isPaused()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_2400
     * @tc.name testStreamDuplexIsPaused024
     * @tc.desc Verify isPaused remains false after pushing the end marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.resume();
      ds.push("data");
      ds.read();
      ds.push(null);
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_2500
     * @tc.name testStreamDuplexIsPaused025
     * @tc.desc Verify isPaused can be re-entered after pause() and resume()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.resume();
      ds.pause();
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_2600
     * @tc.name testStreamDuplexIsPaused026
     * @tc.desc Verify pause() re-enters the paused state after resume()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.resume();
      ds.pause();
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_2700
     * @tc.name testStreamDuplexIsPaused027
     * @tc.desc Verify repeated isPaused queries are side-effect free on a flowing Duplex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.resume();
      for (let i: int = 0; i < 10; i++) {
        expect(ds.isPaused()).assertFalse();
      }
      expect(ds.readableFlowing).assertTrue();
      expect(ds.readableLength).assertEqual(0);
      expect(ds.writable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_2800
     * @tc.name testStreamDuplexIsPaused028
     * @tc.desc Verify repeated pause() calls keep the stream paused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.pause();
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_2900
     * @tc.name testStreamDuplexIsPaused029
     * @tc.desc Verify isPaused stays true while buffered bytes accumulate after pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push("data");
      ds.pause();
      expect(ds.isPaused()).assertTrue();
      ds.push("more");
      expect(ds.readableLength).assertEqual(8);
      expect(ds.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_IS_PAUSED_3000
     * @tc.name testStreamDuplexIsPaused030
     * @tc.desc Verify isPaused returns false after resume() and push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexIsPaused030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.pause();
      ds.resume();
      ds.push(null);
      expect(ds.isPaused()).assertFalse();
    });
  });
}
