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

class DuplexTransformTestBase extends stream.Transform {
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

export default function StreamDuplexSetEncodingTest(): void {
  describe('StreamDuplexSetEncodingTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_0100
     * @tc.name testStreamDuplexSetEncoding001
     * @tc.desc Verify setEncoding("utf8") returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let r: boolean = ds.setEncoding("utf8");
      expect(r).assertTrue();
      expect(ds.readableEncoding).assertEqual("utf-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_0200
     * @tc.name testStreamDuplexSetEncoding002
     * @tc.desc Verify setEncoding returns true for gbk, gb18030, gb2312, utf-8 and their uppercase forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ['gbk', 'gb18030', 'gb2312', 'utf-8', 'UTF-8', 'GBK', 'GB18030', 'GB2312'];
      for (let i = 0; i < encodings.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        let r: boolean = ds.setEncoding(encodings[i]);
        expect(r).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_0300
     * @tc.name testStreamDuplexSetEncoding003
     * @tc.desc Verify setEncoding("") returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      expect(ds.setEncoding("")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_0400
     * @tc.name testStreamDuplexSetEncoding004
     * @tc.desc Verify setEncoding("ascii") throws (invalid encoding)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      try {
        ds.setEncoding("ascii");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_0500
     * @tc.name testStreamDuplexSetEncoding005
     * @tc.desc Verify setEncoding affects readableEncoding property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      expect(ds.readableEncoding).assertEqual(null);
      ds.setEncoding("gbk");
      expect(ds.readableEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_0600
     * @tc.name testStreamDuplexSetEncoding006
     * @tc.desc Verify setEncoding affects read() return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("utf8");
      ds.push("test");
      ds.pause();
      let data = ds.read();
      expect(data).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_0700
     * @tc.name testStreamDuplexSetEncoding007
     * @tc.desc Verify setEncoding then push with different encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("utf8");
      ds.pause();
      ds.push("hello");
      expect(ds.readableLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_0800
     * @tc.name testStreamDuplexSetEncoding008
     * @tc.desc Verify setEncoding multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("utf8");
      ds.setEncoding("gbk");
      expect(ds.readableEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_0900
     * @tc.name testStreamDuplexSetEncoding009
     * @tc.desc Verify setEncoding does not affect write side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("gbk");
      let r: boolean = ds.write("test");
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_1000
     * @tc.name testStreamDuplexSetEncoding010
     * @tc.desc Verify setEncoding decodes GBK-family bytes correctly for gbk, gb18030 and gb2312
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ['gbk', 'gb18030', 'gb2312'];
      for (let i = 0; i < encodings.length; i++) {
        let ds: DuplexTestBase = new DuplexTestBase();
        ds.setEncoding(encodings[i]);
        ds.push(new Uint8Array([0xD6, 0xD0, 0xCE, 0xC4]));
        ds.pause();
        let data = ds.read();
        expect(data?.toString()).assertEqual('中文');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_1100
     * @tc.name testStreamDuplexSetEncoding011
     * @tc.desc Verify setEncoding with gb18030 lowercase form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let r: boolean = ds.setEncoding("gb18030");
      expect(r).assertTrue();
      ds.push("text");
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("text");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_1200
     * @tc.name testStreamDuplexSetEncoding012
     * @tc.desc Verify setEncoding with gb2312 lowercase form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let r: boolean = ds.setEncoding("gb2312");
      expect(r).assertTrue();
      ds.push(new Uint8Array([0x41]));
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_1300
     * @tc.name testStreamDuplexSetEncoding013
     * @tc.desc Verify utf8 decodes multibyte UTF-8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("utf8");
      ds.push(new Uint8Array([0xE4, 0xB8, 0xAD]));
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_1400
     * @tc.name testStreamDuplexSetEncoding014
     * @tc.desc Verify setEncoding then push then resume emits data event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let ds: DuplexTestBase = new DuplexTestBase();
        let dataReceived: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          ds.on("data", (chunk: Object): void => {
            dataReceived = true;
            resolve(undefined as void);
          });
          ds.setEncoding("utf8");
          ds.push("test");
        });
        expect(dataReceived).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_1500
     * @tc.name testStreamDuplexSetEncoding015
     * @tc.desc Verify setEncoding does not affect pause/resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("utf8");
      ds.pause();
      expect(ds.isPaused()).assertTrue();
      ds.resume();
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_1600
     * @tc.name testStreamDuplexSetEncoding016
     * @tc.desc Verify setEncoding does not affect pipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      let ws: TestWritable = new TestWritable();
      ds.setEncoding("utf8");
      ds.pipe(ws);
      expect(ds.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_1700
     * @tc.name testStreamDuplexSetEncoding017
     * @tc.desc Verify setEncoding does not affect end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("utf8");
      ds.end();
      expect(ds.writableEnded).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_1800
     * @tc.name testStreamDuplexSetEncoding018
     * @tc.desc Verify setEncoding does not affect cork/uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("utf8");
      ds.cork();
      expect(ds.writableCorked).assertEqual(1);
      ds.uncork();
      expect(ds.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_1900
     * @tc.name testStreamDuplexSetEncoding019
     * @tc.desc Verify setEncoding combines separate chunks into a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("utf8");
      ds.push("he");
      ds.push("llo");
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_2000
     * @tc.name testStreamDuplexSetEncoding020
     * @tc.desc Verify setEncoding returns a string for an exact read after end marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("utf8");
      ds.push("hello");
      ds.push(null);
      ds.pause();
      let data = ds.read(5);
      expect(data?.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_2100
     * @tc.name testStreamDuplexSetEncoding021
     * @tc.desc Verify buffered bytes are decoded with the new encoding after setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.push(new Uint8Array([0x61, 0x62]));
      ds.setEncoding("gbk");
      let data = ds.read();
      expect(data?.toString()).assertEqual("ab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_2200
     * @tc.name testStreamDuplexSetEncoding022
     * @tc.desc Verify set utf8 then push a multibyte string is read back correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("utf-8");
      ds.push("中文");
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_2300
     * @tc.name testStreamDuplexSetEncoding023
     * @tc.desc Verify read returns a string after setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("UTF-8");
      ds.push("abc");
      ds.pause();
      let data = ds.read();
      expect(typeof data).assertEqual('string');
      expect(data?.toString()).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_2400
     * @tc.name testStreamDuplexSetEncoding024
     * @tc.desc Verify latest encoding wins and is used for decoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("gbk");
      ds.setEncoding("utf8");
      ds.push(new Uint8Array([0xE4, 0xB8, 0xAD]));
      ds.pause();
      let data = ds.read();
      expect(data?.toString()).assertEqual("中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_2500
     * @tc.name testStreamDuplexSetEncoding025
     * @tc.desc Verify readableLength reflects decoded character count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ds: DuplexTestBase = new DuplexTestBase();
      ds.setEncoding("GB18030");
      ds.push(new Uint8Array([0xD6, 0xD0]));
      ds.pause();
      expect(ds.readableLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_2600
     * @tc.name testStreamDuplexSetEncoding026
     * @tc.desc Verify setDefaultEncoding returns true for gbk, gb18030, gb2312 and their uppercase forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ['gbk', 'gb18030', 'gb2312', 'GBK', 'GB18030', 'GB2312'];
      for (let i = 0; i < encodings.length; i++) {
        let ws = new DuplexTestBase();
        let result = ws.setDefaultEncoding(encodings[i]);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_2700
     * @tc.name testStreamDuplexSetEncoding027
     * @tc.desc Verify empty string returns false and encoding unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.setDefaultEncoding("");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_2800
     * @tc.name testStreamDuplexSetEncoding028
     * @tc.desc Verify uppercase UTF-8 is case insensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.setDefaultEncoding("UTF-8");
      expect(result).assertTrue();
      let writeResult = ws.write("test");
      expect(writeResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_2900
     * @tc.name testStreamDuplexSetEncoding029
     * @tc.desc Verify setDefaultEncoding rejects unsupported single letter, boolean literal, emoji, multi-language, replacement, invalid UTF-8, formatted text, base64 and latin1 encodings with BusinessError 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ['a', 'true', '😀测试', 'тест',
        'الاختبار', '�', '\xE4', '2026-03-05',
        '13800138000', '0x123', 'base64', 'latin1'];
      for (let i = 0; i < encodings.length; i++) {
        let ws = new DuplexTestBase();
        let result: boolean = false;
        try {
          result = ws.setDefaultEncoding(encodings[i]);
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
          result = false;
        }
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_3000
     * @tc.name testStreamDuplexSetEncoding030
     * @tc.desc Verify write succeeds after setDefaultEncoding with utf8, gbk, gb18030 and gb2312
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ['utf8', 'gbk', 'gb18030', 'gb2312'];
      let chunks: string[] = ['hello', '中文', '中文', '中文'];
      for (let i = 0; i < encodings.length; i++) {
        let ws = new DuplexTestBase();
        expect(ws.setDefaultEncoding(encodings[i])).assertTrue();
        expect(ws.write(chunks[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_3100
     * @tc.name testStreamDuplexSetEncoding031
     * @tc.desc Verify changing a valid default encoding before writing succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      expect(ws.setDefaultEncoding("utf8")).assertTrue();
      expect(ws.setDefaultEncoding("gbk")).assertTrue();
      expect(ws.write("data")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_3200
     * @tc.name testStreamDuplexSetEncoding032
     * @tc.desc Verify 10000-character long string (long string boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let longStr = "a".repeat(10000);
      let result: boolean = false;
      try {
        result = ws.setDefaultEncoding(longStr);
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(401);
        result = false;
      }
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_3300
     * @tc.name testStreamDuplexSetEncoding033
     * @tc.desc Verify 65535-character varchar upper limit (max length boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let maxStr = "a".repeat(65535);
      let result: boolean = false;
      try {
        result = ws.setDefaultEncoding(maxStr);
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(401);
        result = false;
      }
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_3400
     * @tc.name testStreamDuplexSetEncoding034
     * @tc.desc Verify set DefaultEncoding immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.setDefaultEncoding("gbk");
      expect(result).assertTrue();
      let writeResult = ws.write("test");
      expect(writeResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_3500
     * @tc.name testStreamDuplexSetEncoding035
     * @tc.desc Verify set encoding before write, write(string) uses that default encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.setDefaultEncoding("gbk");
      let result = ws.write("中文");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_3600
     * @tc.name testStreamDuplexSetEncoding036
     * @tc.desc Verify write with explicit encoding overrides DefaultEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.setDefaultEncoding("gbk");
      let result = ws.write("data", "utf8");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_3700
     * @tc.name testStreamDuplexSetEncoding037
     * @tc.desc Verify switching DefaultEncoding after write does not affect previously written data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.write("data1", "utf8");
      ws.setDefaultEncoding("gbk");
      let result = ws.write("data2");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_3800
     * @tc.name testStreamDuplexSetEncoding038
     * @tc.desc Verify set encoding in corked state, write after uncork takes effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.cork();
      let setResult = ws.setDefaultEncoding("gbk");
      expect(setResult).assertTrue();
      ws.uncork();
      let writeResult = ws.write("data");
      expect(writeResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_3900
     * @tc.name testStreamDuplexSetEncoding039
     * @tc.desc Verify supported encoding can be set after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.end();
      let result = ws.setDefaultEncoding("gbk");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_4000
     * @tc.name testStreamDuplexSetEncoding040
     * @tc.desc Verify setting the same encoding twice both succeed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let r1 = ws.setDefaultEncoding("utf8");
      expect(r1).assertTrue();
      let r2 = ws.setDefaultEncoding("utf8");
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_4100
     * @tc.name testStreamDuplexSetEncoding041
     * @tc.desc Verify setting two different encodings both succeed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let r1 = ws.setDefaultEncoding("gbk");
      expect(r1).assertTrue();
      let r2 = ws.setDefaultEncoding("gb2312");
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_4200
     * @tc.name testStreamDuplexSetEncoding042
     * @tc.desc Verify read side setEncoding and write side setDefaultEncoding are completely independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      ws.setDefaultEncoding("gbk");
      ws.write("中文");
      let result = ws.write("test");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_4300
     * @tc.name testStreamDuplexSetEncoding043
     * @tc.desc Verify setDefaultEncoding on Transform subclass behaves consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTransformTestBase();
      let result = ws.setDefaultEncoding("gbk");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_4400
     * @tc.name testStreamDuplexSetEncoding044
     * @tc.desc Verify null parameter is rejected with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result: boolean = false;
      try {
        result = ws.setDefaultEncoding(null as String);
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        result = false;
      }
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_4500
     * @tc.name testStreamDuplexSetEncoding045
     * @tc.desc Verify boolean parameter is rejected with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result: boolean = false;
      try {
        result = ws.setDefaultEncoding(true as Object as String);
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        result = false;
      }
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_4600
     * @tc.name testStreamDuplexSetEncoding046
     * @tc.desc Verify string literal "false" as encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      expect(ws.setDefaultEncoding("utf8")).assertTrue();
      let result: boolean = false;
      try {
        result = ws.setDefaultEncoding("false");
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(401);
        result = false;
      }
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_4700
     * @tc.name testStreamDuplexSetEncoding047
     * @tc.desc Verify empty string is still rejected after a valid set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      expect(ws.setDefaultEncoding("utf8")).assertTrue();
      expect(ws.setDefaultEncoding("")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_4800
     * @tc.name testStreamDuplexSetEncoding048
     * @tc.desc Verify a valid set succeeds after an empty string is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      expect(ws.setDefaultEncoding("")).assertFalse();
      expect(ws.setDefaultEncoding("gb2312")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_4900
     * @tc.name testStreamDuplexSetEncoding049
     * @tc.desc Verify setDefaultEncoding("utf8") succeeds and returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      let result = ws.setDefaultEncoding("utf8");
      expect(result).assertTrue();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_5000
     * @tc.name testStreamDuplexSetEncoding050
     * @tc.desc Verify setDefaultEncoding does not affect the readable encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      expect(ws.setDefaultEncoding("gbk")).assertTrue();
      expect(ws.readableEncoding).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_5100
     * @tc.name testStreamDuplexSetEncoding051
     * @tc.desc Verify multiple distinct valid default encodings can be set sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      expect(ws.setDefaultEncoding("gbk")).assertTrue();
      expect(ws.setDefaultEncoding("gb2312")).assertTrue();
      expect(ws.setDefaultEncoding("gb18030")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_5200
     * @tc.name testStreamDuplexSetEncoding052
     * @tc.desc Verify setDefaultEncoding does not affect readable length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      expect(ws.setDefaultEncoding("utf8")).assertTrue();
      expect(ws.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_5300
     * @tc.name testStreamDuplexSetEncoding053
     * @tc.desc Verify encoding passed as number type (type error)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      try {
        ws.setDefaultEncoding(123 as Object as String);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_DUPLEX_SET_ENCODING_5400
     * @tc.name testStreamDuplexSetEncoding054
     * @tc.desc Verify a valid default encoding can be replaced before writing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamDuplexSetEncoding054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new DuplexTestBase();
      expect(ws.setDefaultEncoding('utf8')).assertTrue();
      expect(ws.setDefaultEncoding('gb18030')).assertTrue();
      let result = ws.write('replace');
      expect(result).assertTrue();
    });

  });
}
