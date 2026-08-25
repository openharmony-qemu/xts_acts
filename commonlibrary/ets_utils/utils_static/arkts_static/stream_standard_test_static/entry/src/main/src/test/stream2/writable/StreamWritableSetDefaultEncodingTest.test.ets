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

class SetDefaultEncodingTestBase extends stream.Writable {
  public lastEncoding: string = '';

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.lastEncoding = encoding;
    callback.unsafeCall();
  }
}

class MultiEncodingTestBase extends stream.Writable {
  public encodings: string[] = [];

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.encodings.push(encoding);
    callback.unsafeCall();
  }
}

export default function StreamWritableSetDefaultEncodingTest(): void {
  describe('StreamWritableSetDefaultEncodingTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_0100
     * @tc.name testStreamWritableSetDefaultEncoding001
     * @tc.desc Verify setDefaultEncoding accepts gb2312 and uppercase UTF-8, GBK, GB18030, GB2312 and applies the normalized lowercase encoding to write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ['gb2312', 'UTF-8', 'GBK', 'GB18030', 'GB2312'];
      let expected: string[] = ['gb2312', 'utf-8', 'gbk', 'gb18030', 'gb2312'];
      for (let i = 0; i < encodings.length; i++) {
        let ws = new SetDefaultEncodingTestBase();
        let result = ws.setDefaultEncoding(encodings[i]);
        expect(result).assertTrue();
        ws.write('data');
        expect(ws.lastEncoding).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_0200
     * @tc.name testStreamWritableSetDefaultEncoding002
     * @tc.desc Verify setting empty string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
      let result = ws.setDefaultEncoding("");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_0300
     * @tc.name testStreamWritableSetDefaultEncoding003
     * @tc.desc Verify setDefaultEncoding rejects unsupported single letter, space, tab, Japanese and base64 encodings with BusinessError 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ['a', ' ', '\t', 'テスト', 'base64'];
      for (let i = 0; i < encodings.length; i++) {
        let ws = new SetDefaultEncodingTestBase();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_0400
     * @tc.name testStreamWritableSetDefaultEncoding004
     * @tc.desc Verify null parameter is rejected with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_0500
     * @tc.name testStreamWritableSetDefaultEncoding005
     * @tc.desc Verify setDefaultEncoding remains usable after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
      ws.end();
      let result = ws.setDefaultEncoding("utf8");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_0600
     * @tc.name testStreamWritableSetDefaultEncoding006
     * @tc.desc Verify 65536-character long string is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
      let longStr = 'x'.repeat(65536);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_0700
     * @tc.name testStreamWritableSetDefaultEncoding007
     * @tc.desc Verify set encoding before write is used during write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
      let setResult = ws.setDefaultEncoding("gbk");
      expect(setResult).assertTrue();
      ws.write("data");
      expect(ws.lastEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_0800
     * @tc.name testStreamWritableSetDefaultEncoding008
     * @tc.desc Verify switching encoding after write does not affect already written data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new MultiEncodingTestBase();
      ws.write("hello", "utf8");
      ws.setDefaultEncoding("gbk");
      ws.write("world");
      expect(ws.encodings[0]).assertEqual("utf8");
      expect(ws.encodings[1]).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_0900
     * @tc.name testStreamWritableSetDefaultEncoding009
     * @tc.desc Verify set encoding in corked state takes effect after uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
      ws.cork();
      let setResult = ws.setDefaultEncoding("gbk");
      expect(setResult).assertTrue();
      ws.write("data");
      ws.uncork();
      expect(ws.lastEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_1000
     * @tc.name testStreamWritableSetDefaultEncoding010
     * @tc.desc Verify repeated setDefaultEncoding is idempotent and last wins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
      expect(ws.setDefaultEncoding("utf8")).assertTrue();
      expect(ws.setDefaultEncoding("gbk")).assertTrue();
      ws.write("data");
      expect(ws.lastEncoding).assertEqual("gbk");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_1100
     * @tc.name testStreamWritableSetDefaultEncoding011
     * @tc.desc Verify setDefaultEncoding("utf8") returns the boolean value true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
      let result = ws.setDefaultEncoding("utf8");
      expect(result).assertTrue();
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_1200
     * @tc.name testStreamWritableSetDefaultEncoding012
     * @tc.desc Verify explicit per-write encoding overrides default encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new MultiEncodingTestBase();
      ws.setDefaultEncoding("gbk");
      ws.write("hello", "utf8");
      expect(ws.encodings[0]).assertEqual("utf8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_1300
     * @tc.name testStreamWritableSetDefaultEncoding013
     * @tc.desc Verify empty string is still rejected after a valid set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
      expect(ws.setDefaultEncoding("utf8")).assertTrue();
      expect(ws.setDefaultEncoding("")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_1400
     * @tc.name testStreamWritableSetDefaultEncoding014
     * @tc.desc Verify boolean parameter is rejected with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_1500
     * @tc.name testStreamWritableSetDefaultEncoding015
     * @tc.desc Verify multibyte content write still uses the default encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
      let setResult = ws.setDefaultEncoding("utf8");
      expect(setResult).assertTrue();
      ws.write("中文");
      expect(ws.lastEncoding).assertEqual("utf-8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_1600
     * @tc.name testStreamWritableSetDefaultEncoding016
     * @tc.desc Verify setting the same encoding twice returns true each time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
      expect(ws.setDefaultEncoding("utf8")).assertTrue();
      expect(ws.setDefaultEncoding("utf8")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_1700
     * @tc.name testStreamWritableSetDefaultEncoding017
     * @tc.desc Verify multiple distinct valid encodings can be set sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
      expect(ws.setDefaultEncoding("utf8")).assertTrue();
      expect(ws.setDefaultEncoding("gb2312")).assertTrue();
      expect(ws.setDefaultEncoding("gb18030")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_WRITABLE_SET_DEFAULT_ENCODING_1800
     * @tc.name testStreamWritableSetDefaultEncoding018
     * @tc.desc Verify mixed-case uTf-8 encoding name is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamWritableSetDefaultEncoding018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws = new SetDefaultEncodingTestBase();
      let result: boolean = false;
      result = ws.setDefaultEncoding('uTf-8');
      expect(result).assertTrue();
      ws.write("data");
      expect(ws.lastEncoding).assertEqual("utf-8");
    });
  });
}
