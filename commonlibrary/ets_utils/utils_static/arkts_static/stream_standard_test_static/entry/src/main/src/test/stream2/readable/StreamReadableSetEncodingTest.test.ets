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

class WritableTestBase extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamReadableSetEncodingTest(): void {
  describe('StreamReadableSetEncodingTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_0100
     * @tc.name testStreamReadableSetEncoding001
     * @tc.desc Verify setEncoding accepts gbk, gb18030, gb2312, utf8 and their uppercase forms and normalizes readableEncoding to lowercase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ['gbk', 'gb18030', 'gb2312', 'GBK', 'GB18030', 'GB2312', 'utf8'];
      let expected: string[] = ['gbk', 'gb18030', 'gb2312', 'gbk', 'gb18030', 'gb2312', 'utf-8'];
      for (let i = 0; i < encodings.length; i++) {
        let r = new ReadableTestBase();
        let result = r.setEncoding(encodings[i]);
        expect(result).assertTrue();
        expect(r.readableEncoding).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_0200
     * @tc.name testStreamReadableSetEncoding002
     * @tc.desc Verify setEncoding rejects unsupported encodings with BusinessError 401 for ascii, base64, single letter, blank, Chinese, null literal and non-ASCII inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ['ascii', 'base64', 'a', ' ', '测试工程师', 'null', 'ä'];
      for (let i = 0; i < encodings.length; i++) {
        let r = new ReadableTestBase();
        let result: boolean = false;
        try {
          result = r.setEncoding(encodings[i]);
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
          result = false;
        }
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_0300
     * @tc.name testStreamReadableSetEncoding003
     * @tc.desc Verify empty string encoding returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let result = r.setEncoding('');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_0400
     * @tc.name testStreamReadableSetEncoding004
     * @tc.desc Verify null parameter is rejected with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let result: boolean = false;
      try {
        result = r.setEncoding(null as String);
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        result = false;
      }
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_0500
     * @tc.name testStreamReadableSetEncoding005
     * @tc.desc Verify varchar max length 65535 character encoding name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let longStr: string = '';
      for (let i: int = 0; i < 65535; i++) {
        longStr += 'a';
      }
      let result: boolean = false;
      try {
        result = r.setEncoding(longStr);
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        expect(e.code).assertEqual(401);
        result = false;
      }
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_0600
     * @tc.name testStreamReadableSetEncoding006
     * @tc.desc Verify boolean parameter is rejected with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let result: boolean = false;
      try {
        result = r.setEncoding(true as Object as String);
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        result = false;
      }
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_0700
     * @tc.name testStreamReadableSetEncoding007
     * @tc.desc Verify setting encoding before push, data decoded with new encoding after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let result = r.setEncoding('gbk');
      expect(result).assertTrue();
      expect(r.readableEncoding).assertEqual('gbk');
      let pushResult = r.push(new Uint8Array([0x61, 0x62, 0x63]));
      expect(pushResult).assertTrue();
      let data = r.read();
      expect(data).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_0800
     * @tc.name testStreamReadableSetEncoding008
     * @tc.desc Verify setting encoding succeeds after consuming buffered data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      r.push("a");
      r.read();
      let result = r.setEncoding('gbk');
      expect(result).assertTrue();
      expect(r.readableEncoding).assertEqual('gbk');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_0900
     * @tc.name testStreamReadableSetEncoding009
     * @tc.desc Verify setting different encodings twice in a row (both with empty buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let result1 = r.setEncoding('gbk');
      expect(result1).assertTrue();
      expect(r.readableEncoding).assertEqual('gbk');
      let result2 = r.setEncoding('gb2312');
      expect(result2).assertTrue();
      expect(r.readableEncoding).assertEqual('gb2312');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_1000
     * @tc.name testStreamReadableSetEncoding010
     * @tc.desc Verify setting encoding with empty buffer in flowing mode (data listener)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let callbackCount: int = 0;
      r.on('data', (chunk: Object): void => {
        callbackCount++;
      });
      let result = r.setEncoding('gbk');
      expect(result).assertTrue();
      expect(r.readableEncoding).assertEqual('gbk');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_1100
     * @tc.name testStreamReadableSetEncoding011
     * @tc.desc Verify setting encoding with empty buffer in paused mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      r.pause();
      let result = r.setEncoding('gb18030');
      expect(result).assertTrue();
      expect(r.readableEncoding).assertEqual('gb18030');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_1200
     * @tc.name testStreamReadableSetEncoding012
     * @tc.desc Verify setting encoding with empty buffer after piping to Writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let w = new WritableTestBase();
      r.pipe(w);
      let result = r.setEncoding('gbk');
      expect(result).assertTrue();
      expect(r.readableEncoding).assertEqual('gbk');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_1300
     * @tc.name testStreamReadableSetEncoding013
     * @tc.desc Verify utf8 decodes multibyte UTF-8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      expect(r.setEncoding('utf8')).assertTrue();
      r.push(new Uint8Array([0xE4, 0xB8, 0xAD]));
      r.pause();
      let data = r.read();
      expect(data).assertEqual('中');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_1400
     * @tc.name testStreamReadableSetEncoding014
     * @tc.desc Verify setEncoding returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let result = r.setEncoding('gbk');
      expect(result).assertTrue();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_1500
     * @tc.name testStreamReadableSetEncoding015
     * @tc.desc Verify the latest encoding wins after repeated setEncoding and setting the same encoding twice is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sequences: string[][] = [['utf8', 'gbk'], ['gbk', 'gbk']];
      for (let i = 0; i < sequences.length; i++) {
        let r = new ReadableTestBase();
        for (let j = 0; j < sequences[i].length; j++) {
          expect(r.setEncoding(sequences[i][j])).assertTrue();
        }
        expect(r.readableEncoding).assertEqual(sequences[i][sequences[i].length - 1]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_1600
     * @tc.name testStreamReadableSetEncoding016
     * @tc.desc Verify multiple distinct valid encodings can be set sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      expect(r.setEncoding('gbk')).assertTrue();
      expect(r.readableEncoding).assertEqual('gbk');
      expect(r.setEncoding('gb2312')).assertTrue();
      expect(r.readableEncoding).assertEqual('gb2312');
      expect(r.setEncoding('gb18030')).assertTrue();
      expect(r.readableEncoding).assertEqual('gb18030');
      expect(r.setEncoding('utf8')).assertTrue();
      expect(r.readableEncoding).assertEqual('utf-8');
      r.push(new Uint8Array([0x68, 0x65, 0x6c, 0x6c, 0x6f]));
      r.pause();
      let data = r.read();
      expect(data).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_1700
     * @tc.name testStreamReadableSetEncoding017
     * @tc.desc Verify buffered bytes are decoded with the new encoding after setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      r.push(new Uint8Array([0x61, 0x62]));
      expect(r.setEncoding('gbk')).assertTrue();
      let data = r.read();
      expect(data).assertEqual('ab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_1800
     * @tc.name testStreamReadableSetEncoding018
     * @tc.desc Verify gbk decodes GBK multibyte bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      expect(r.setEncoding('gbk')).assertTrue();
      r.push(new Uint8Array([0xD6, 0xD0]));
      r.pause();
      let data = r.read();
      expect(data).assertEqual('中');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_1900
     * @tc.name testStreamReadableSetEncoding019
     * @tc.desc Verify empty string is still rejected after a valid set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      expect(r.setEncoding('gbk')).assertTrue();
      expect(r.setEncoding('')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_2000
     * @tc.name testStreamReadableSetEncoding020
     * @tc.desc Verify a valid set succeeds after an empty string is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      expect(r.setEncoding('')).assertFalse();
      expect(r.setEncoding('gb2312')).assertTrue();
      expect(r.readableEncoding).assertEqual('gb2312');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_2100
     * @tc.name testStreamReadableSetEncoding021
     * @tc.desc Verify set utf8 then push a multibyte string is read back correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      expect(r.setEncoding('utf8')).assertTrue();
      r.push('中文');
      r.pause();
      let data = r.read();
      expect(data).assertEqual('中文');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_2200
     * @tc.name testStreamReadableSetEncoding022
     * @tc.desc Verify read returns a string after setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      expect(r.setEncoding('utf8')).assertTrue();
      r.push('abc');
      r.pause();
      let data = r.read();
      expect(typeof data).assertEqual('string');
      expect(data).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_2300
     * @tc.name testStreamReadableSetEncoding023
     * @tc.desc Verify utf8 encoding set succeeds and decodes binary data correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      let result = r.setEncoding('utf8');
      expect(result).assertTrue();
      expect(r.readableEncoding).assertEqual('utf-8');
      r.push(new Uint8Array([0xE4, 0xB8, 0xAD, 0xE6, 0x96, 0x87]));
      r.pause();
      let data = r.read();
      expect(typeof data).assertEqual('string');
      expect(data).assertEqual('中文');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_SET_ENCODING_2400
     * @tc.name testStreamReadableSetEncoding024
     * @tc.desc Verify uppercase UTF-8 decodes a binary boundary correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableSetEncoding024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new ReadableTestBase();
      expect(r.setEncoding('UTF-8')).assertTrue();
      r.push(new Uint8Array([65, 66, 67]));
      r.pause();
      expect(r.read()?.toString()).assertEqual('ABC');
    });
  });
}
