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
import { BusinessError } from '@kit.BasicServicesKit';

class ReadableTestBase extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class ReadableNoDoRead extends stream.Readable {
  constructor() {
    super();
  }
}

class SubA extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class SubB extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class ReadableInitTest extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }

  doInitialize(callback: Function): void {
    callback.unsafeCall();
  }
}

class ReadableEncodingPropTest extends stream.Readable {
  constructor(encoding: string) {
    super({ encoding: encoding } as stream.ReadableOptions);
  }

  doRead(size: int): void {
  }
}

class SimpleWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(data: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

class ReadableNoDoReadWithData extends stream.Readable {
  constructor() {
    super();
    this.push("test");
  }
}

class ReadableInvalidEncodingConstructor extends stream.Readable {
  constructor() {
    super({ encoding: 'invalid_enc' } as stream.ReadableOptions);
  }

  doRead(size: int): void {
  }
}

function isInstanceOfStreamReadable(obj: Object): boolean {
  return obj instanceof stream.Readable;
}

export default function StreamReadablePropertiesTest(): void {
  describe('StreamReadablePropertiesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_0100
     * @tc.name testStreamReadableProperties001
     * @tc.desc Verify readableObjectMode remains false through push, read, pause and resume operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      expect(rs.readableObjectMode).assertFalse();
      rs.push('objectmode-data');
      expect(rs.readableObjectMode).assertFalse();
      rs.read();
      expect(rs.readableObjectMode).assertFalse();
      rs.pause();
      expect(rs.readableObjectMode).assertFalse();
      rs.resume();
      expect(rs.readableObjectMode).assertFalse();
      rs.push(null);
      expect(rs.readableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_0200
     * @tc.name testStreamReadableProperties002
     * @tc.desc Verify readable transitions from true to false after push(null) while remaining true during push and read operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new ReadableTestBase();
        rs.pause();
        expect(rs.readable).assertTrue();
        rs.push('readable-data');
        expect(rs.readable).assertTrue();
        rs.read();
        expect(rs.readable).assertTrue();
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            expect(rs.readable).assertFalse();
            expect(rs.readableEnded).assertTrue();
            resolve(undefined as void);
          });
          rs.push(null);
          rs.resume();
        });
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_0300
     * @tc.name testStreamReadableProperties003
     * @tc.desc Verify readableHighWatermark remains 16384 through push, read, pause and resume operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      expect(rs.readableHighWatermark).assertEqual(16384);
      rs.push('hwm-data');
      expect(rs.readableHighWatermark).assertEqual(16384);
      rs.pause();
      expect(rs.readableHighWatermark).assertEqual(16384);
      rs.resume();
      expect(rs.readableHighWatermark).assertEqual(16384);
      rs.push(null);
      expect(rs.readableHighWatermark).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_0400
     * @tc.name testStreamReadableProperties004
     * @tc.desc Verify readableFlowing transitions from true to false after pause and back to true after resume, with isPaused() consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      expect(rs.readableFlowing).assertEqual(null);
      rs.pause();
      expect(rs.readableFlowing).assertFalse();
      expect(rs.isPaused()).assertTrue();
      rs.resume();
      expect(rs.readableFlowing).assertTrue();
      expect(rs.isPaused()).assertFalse();
      rs.pause();
      expect(rs.readableFlowing).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_0500
     * @tc.name testStreamReadableProperties005
     * @tc.desc Verify readableLength tracks buffered bytes after push, decreases after partial read, and returns to zero after full consumption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      expect(rs.readableLength).assertEqual(0);
      rs.push('length-data');
      expect(rs.readableLength).assertEqual(11);
      rs.read();
      expect(rs.readableLength).assertEqual(0);
      rs.push('more-data');
      rs.push('extra-data');
      expect(rs.readableLength).assertEqual(19);
      rs.push(null);
      expect(rs.readableLength).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_0600
     * @tc.name testStreamReadableProperties006
     * @tc.desc Verify readableEncoding defaults to utf8, changes to gbk after setEncoding, and setEncoding fails when buffer has data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      expect(rs.readableEncoding).assertEqual(null);
      rs.setEncoding('utf8');
      expect(rs.readableEncoding).assertEqual('utf-8');
      rs.push('encoding-data');
      expect(rs.readableEncoding).assertEqual('utf-8');
      rs.read();
      expect(rs.readableEncoding).assertEqual('utf-8');
      rs.pause();
      expect(rs.readableEncoding).assertEqual('utf-8');
      rs.resume();
      expect(rs.readableEncoding).assertEqual('utf-8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_0700
     * @tc.name testStreamReadableProperties007
     * @tc.desc Verify readableEnded remains false while a paused stream has only received the end marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.pause();
      rs.push(null);
      expect(rs.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_0800
     * @tc.name testStreamReadableProperties008
     * @tc.desc Verify property values remain coherent after gbk encoding and buffered input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.setEncoding("gbk");
      rs.push(new Uint8Array([0xD6, 0xD0, 0xCE, 0xC4]));
      expect(rs.readable).assertTrue();
      expect(rs.readableObjectMode).assertFalse();
      expect(rs.readableHighWatermark).assertEqual(16384);
      expect(rs.readableFlowing).assertEqual(null);
      expect(rs.readableLength).assertEqual(2);
      expect(rs.readableEncoding).assertEqual("gbk");
      expect(rs.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_0900
     * @tc.name testStreamReadableProperties009
     * @tc.desc Verify readable is not false when readableEnded is false (not ended)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      expect(rs.readableEnded).assertFalse();
      expect(rs.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_1000
     * @tc.name testStreamReadableProperties010
     * @tc.desc Verify readableEnded stays false and readable stays true while buffered data remains after push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push("data");
      rs.push(null);
      expect(rs.readableEnded).assertFalse();
      expect(rs.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_1100
     * @tc.name testStreamReadableProperties011
     * @tc.desc Verify readableObjectMode is always false (object mode not supported)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push("data");
      expect(rs.readableObjectMode).assertFalse();
      rs.push(null);
      expect(rs.readableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_1200
     * @tc.name testStreamReadableProperties012
     * @tc.desc Verify readableHighWatermark is not changed by push/read operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push("data");
      rs.read();
      expect(rs.readableHighWatermark).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_1300
     * @tc.name testStreamReadableProperties013
     * @tc.desc Verify readableLength does not become negative after consuming all data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push("x");
      rs.read();
      rs.read();
      expect(rs.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_1400
     * @tc.name testStreamReadableProperties014
     * @tc.desc Verify setEncoding with ascii or base64 throws BusinessError and leaves readableEncoding at null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ["ascii", "base64"];
      for (let i = 0; i < encodings.length; i++) {
        let rs = new ReadableTestBase();
        let setResult: boolean = false;
        try {
          setResult = rs.setEncoding(encodings[i]);
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
        }
        expect(setResult).assertFalse();
        expect(rs.readableEncoding).assertEqual(null);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_1500
     * @tc.name testStreamReadableProperties015
     * @tc.desc Verify different subclass instances have consistent default property values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new SubA();
      let b = new SubB();
      expect(a.readable).assertEqual(b.readable);
      expect(a.readableObjectMode).assertEqual(b.readableObjectMode);
      expect(a.readableHighWatermark).assertEqual(b.readableHighWatermark);
      expect(a.readableFlowing).assertEqual(b.readableFlowing);
      expect(a.readableLength).assertEqual(b.readableLength);
      expect(a.readableEncoding).assertEqual(b.readableEncoding);
      expect(a.readableEnded).assertEqual(b.readableEnded);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_1600
     * @tc.name testStreamReadableProperties016
     * @tc.desc Verify properties initialize correctly in subclass overriding doInitialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableInitTest();
      expect(rs.readable).assertTrue();
      expect(rs.readableObjectMode).assertFalse();
      expect(rs.readableHighWatermark).assertEqual(16384);
      expect(rs.readableFlowing).assertEqual(null);
      expect(rs.readableLength).assertEqual(0);
      expect(rs.readableEncoding).assertEqual(null);
      expect(rs.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_1700
     * @tc.name testStreamReadableProperties017
     * @tc.desc Verify properties can still be read normally on subclass without doRead implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableNoDoRead();
      expect(rs.readable).assertTrue();
      expect(rs.readableObjectMode).assertFalse();
      expect(rs.readableHighWatermark).assertEqual(16384);
      expect(rs.readableFlowing).assertEqual(null);
      expect(rs.readableLength).assertEqual(0);
      expect(rs.readableEncoding).assertEqual(null);
      expect(rs.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_1800
     * @tc.name testStreamReadableProperties018
     * @tc.desc Verify constructor with ReadableOptions({encoding:"gbk"}) affects readableEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableEncodingPropTest("gbk");
      expect(rs.readableEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_1900
     * @tc.name testStreamReadableProperties019
     * @tc.desc Verify readableLength matches the pushed byte size for string, emoji, zero-width and Uint8Array payloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payloads: (string | Uint8Array)[] = ["a", "test", "😀", "​",
        new Uint8Array(0), new Uint8Array([0, 0, 0]), new Uint8Array([255, 128, 0])];
      let lengths: int[] = [1, 4, 4, 3, 0, 3, 3];
      for (let i = 0; i < payloads.length; i++) {
        let rs = new ReadableTestBase();
        rs.push(payloads[i]);
        expect(rs.readableLength).assertEqual(lengths[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_2000
     * @tc.name testStreamReadableProperties020
     * @tc.desc Verify readableLength is 16383 (1 byte below high water mark)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      let str: string = "";
      for (let i: int = 0; i < 16383; i++) {
        str += "a";
      }
      let pushResult = rs.push(str);
      expect(pushResult).assertTrue();
      expect(rs.readableLength).assertEqual(16383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_2100
     * @tc.name testStreamReadableProperties021
     * @tc.desc Verify readableLength is 16384, 16385 and 102400 after pushing strings at or above the high water mark, and push returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [16384, 16385, 102400];
      for (let i = 0; i < sizes.length; i++) {
        let rs = new ReadableTestBase();
        let str: string = "";
        for (let j: int = 0; j < sizes[i]; j++) {
          str += "a";
        }
        let pushResult = rs.push(str);
        expect(pushResult).assertFalse();
        expect(rs.readableLength).assertEqual(sizes[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_2200
     * @tc.name testStreamReadableProperties022
     * @tc.desc Verify readableFlowing is true (flowing state boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.pause();
      rs.resume();
      expect(rs.readableFlowing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_2300
     * @tc.name testStreamReadableProperties023
     * @tc.desc Verify readableHighWatermark is always 16384 (not customizable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push("test");
      rs.read();
      rs.push("data");
      expect(rs.readableHighWatermark).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_2400
     * @tc.name testStreamReadableProperties024
     * @tc.desc Verify readableLength equals high water mark after pushing Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push(new Uint8Array(16384));
      expect(rs.readableLength).assertEqual(16384);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_2500
     * @tc.name testStreamReadableProperties025
     * @tc.desc Verify readableEnded becomes true immediately after push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push("x");
      rs.push(null);
      expect(rs.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_2600
     * @tc.name testStreamReadableProperties026
     * @tc.desc Verify readableFlowing is false and isPaused is true after pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.pause();
      expect(rs.readableFlowing).assertFalse();
      expect(rs.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_2700
     * @tc.name testStreamReadableProperties027
     * @tc.desc Verify readableFlowing is true after pipe(writable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      let ws = new SimpleWritable();
      rs.pipe(ws);
      expect(rs.readableFlowing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_2800
     * @tc.name testStreamReadableProperties028
     * @tc.desc Verify readableEncoding changes after setEncoding("gbk")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.setEncoding("gbk");
      expect(rs.readableEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_2900
     * @tc.name testStreamReadableProperties029
     * @tc.desc Verify setEncoding returns false and encoding stays unchanged when buffer has data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push("data");
      let setResult = rs.setEncoding("gbk");
      expect(setResult).assertTrue();
      expect(rs.readableEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_3000
     * @tc.name testStreamReadableProperties030
     * @tc.desc Verify readableLength decreases after partial read and returns to zero after fully consuming
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payloads: string[] = ["helloworld", "test"];
      let readSizes: int[] = [5, 4];
      let remainings: int[] = [5, 0];
      for (let i = 0; i < payloads.length; i++) {
        let rs = new ReadableTestBase();
        rs.push(payloads[i]);
        rs.read(readSizes[i]);
        expect(rs.readableLength).assertEqual(remainings[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_3100
     * @tc.name testStreamReadableProperties031
     * @tc.desc Verify readableFlowing reverts after unpipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      let ws = new SimpleWritable();
      rs.pipe(ws);
      rs.unpipe(ws);
      expect(rs.readableFlowing).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_3200
     * @tc.name testStreamReadableProperties032
     * @tc.desc Verify properties are in normal state after pushing lone surrogate character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push("\uDC04");
      expect(rs.readable).assertTrue();
      expect(rs.readableLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_3300
     * @tc.name testStreamReadableProperties033
     * @tc.desc Verify readableLength is correct after pushing Uint8Array with newline and carriage return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push(new Uint8Array([0x0A, 0x0D]));
      expect(rs.readableLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_3400
     * @tc.name testStreamReadableProperties034
     * @tc.desc Verify readableEnded is true and readableLength stays unchanged after push(null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push("test");
      rs.push(null);
      expect(rs.readableEnded).assertFalse();
      expect(rs.readableLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_3500
     * @tc.name testStreamReadableProperties035
     * @tc.desc Verify pushing empty string may throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      try {
        rs.push("");
        expect(rs.readableLength).assertEqual(0);
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_3600
     * @tc.name testStreamReadableProperties036
     * @tc.desc Verify properties stay unchanged after push(null converted to string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push("data");
      expect(rs.readable).assertTrue();
      expect(rs.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_3700
     * @tc.name testStreamReadableProperties037
     * @tc.desc Verify properties stay unchanged when setEncoding is called with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      let setResult = rs.setEncoding("");
      expect(setResult).assertFalse();
      expect(rs.readableEncoding).assertEqual("utf-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_3800
     * @tc.name testStreamReadableProperties038
     * @tc.desc Verify setEncoding failure when buffer has data does not affect other properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.push("data");
      let setResult = rs.setEncoding("gbk");
      expect(setResult).assertTrue();
      expect(rs.readableLength).assertEqual(4);
      expect(rs.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_3900
     * @tc.name testStreamReadableProperties039
     * @tc.desc Verify properties are in normal state after unpiping non-existent destination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      let ws = new SimpleWritable();
      rs.unpipe(ws);
      expect(rs.readableFlowing).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_4000
     * @tc.name testStreamReadableProperties040
     * @tc.desc Verify readable is still true after read() throws without doRead implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableNoDoRead();
      try {
        rs.read();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
      expect(rs.readable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_4100
     * @tc.name testStreamReadableProperties041
     * @tc.desc Verify constructor throws when passed invalid encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new ReadableInvalidEncodingConstructor();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_4200
     * @tc.name testStreamReadableProperties042
     * @tc.desc Verify readableLength stays unchanged after read() throws without doRead implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableNoDoRead();
      rs.push("test");
      try {
        rs.read();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
      expect(rs.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_PROPERTIES_4300
     * @tc.name testStreamReadableProperties043
     * @tc.desc Verify readableLength decreases exactly after consuming a buffered chunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableProperties043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      rs.pause();
      rs.push('length');
      expect(rs.readableLength).assertEqual(6);
      let data = rs.read();
      expect(data?.toString()).assertEqual('length');
      expect(rs.readableLength).assertEqual(0);
    });
  });
}
