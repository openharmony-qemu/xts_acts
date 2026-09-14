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
import { stream } from '@kit.ArkTS';

class SenTestTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

class SdeTestTransform extends stream.Transform {
  public receivedEncoding: string = '';

  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.receivedEncoding = encoding;
    this.push(chunk);
    callback.unsafeCall();
  }

  doFlush(callback: Function): void {
    callback.unsafeCall();
  }
}

export default function StreamTransformSetEncodingTest(): void {
  describe('StreamTransformSetEncodingTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_0100
     * @tc.name testStreamTransformSetEncoding001
     * @tc.desc Verify setEncoding("gbk") returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      let result = transform.setEncoding('gbk');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_0200
     * @tc.name testStreamTransformSetEncoding002
     * @tc.desc Verify setEncoding with empty string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      let result = transform.setEncoding('');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_0300
     * @tc.name testStreamTransformSetEncoding003
     * @tc.desc Verify setEncoding changes the decoded readable output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      let result = transform.setEncoding('utf8');
      expect(result).assertTrue();
      transform.push('hello');
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_0400
     * @tc.name testStreamTransformSetEncoding004
     * @tc.desc Verify repeated setEncoding calls use the latest valid encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      expect(transform.setEncoding('utf8')).assertTrue();
      expect(transform.setEncoding('gb18030')).assertTrue();
      transform.push('test');
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_0500
     * @tc.name testStreamTransformSetEncoding005
     * @tc.desc Verify uppercase GBK encoding is accepted before reading data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      let result = transform.setEncoding('GBK');
      expect(result).assertTrue();
      transform.push('abc');
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_0600
     * @tc.name testStreamTransformSetEncoding006
     * @tc.desc Verify empty encoding is rejected without changing readable data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      transform.push('data');
      transform.pause();
      let result = transform.setEncoding('');
      expect(result).assertFalse();
      let data = transform.read();
      expect(data?.toString()).assertEqual('data');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_0700
     * @tc.name testStreamTransformSetEncoding007
     * @tc.desc Verify setEncoding utf8 decodes multibyte UTF-8 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      expect(transform.setEncoding('utf8')).assertTrue();
      transform.push(new Uint8Array([0xE4, 0xB8, 0xAD]));
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('中');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_0800
     * @tc.name testStreamTransformSetEncoding008
     * @tc.desc Verify repeated setEncoding decodes multibyte data correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      expect(transform.setEncoding('gb18030')).assertTrue();
      expect(transform.setEncoding('utf8')).assertTrue();
      transform.push('中文');
      transform.pause();
      expect(transform.read()?.toString()).assertEqual('中文');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_0900
     * @tc.name testStreamTransformSetEncoding009
     * @tc.desc Verify uppercase UTF-8 encoding is accepted for byte data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      expect(transform.setEncoding('UTF-8')).assertTrue();
      transform.push(new Uint8Array([72, 105]));
      transform.pause();
      expect(transform.read()?.toString()).assertEqual('Hi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_1000
     * @tc.name testStreamTransformSetEncoding010
     * @tc.desc Verify setEncoding is independent for separate Transform instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first = new SenTestTransform();
      let second = new SenTestTransform();
      expect(first.setEncoding('utf8')).assertTrue();
      expect(second.setEncoding('gbk')).assertTrue();
      first.push('first');
      second.push('second');
      first.pause();
      second.pause();
      expect(first.read()?.toString()).assertEqual('first');
      expect(second.read()?.toString()).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_1100
     * @tc.name testStreamTransformSetEncoding011
     * @tc.desc Verify setEncoding changes decoding for a Uint8Array boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      expect(transform.setEncoding('utf8')).assertTrue();
      transform.push(new Uint8Array([65, 66, 67]));
      transform.pause();
      let data = transform.read();
      expect(data?.toString()).assertEqual('ABC');
      expect(transform.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_1200
     * @tc.name testStreamTransformSetEncoding012
     * @tc.desc Verify a valid encoding can be set on a zero-length readable buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      transform.push('');
      expect(transform.readableLength).assertEqual(0);
      expect(transform.setEncoding('gb18030')).assertTrue();
      expect(transform.readableEncoding).assertEqual('gb18030');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_1300
     * @tc.name testStreamTransformSetEncoding013
     * @tc.desc Verify the latest encoding is used for bytes pushed after repeated configuration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      expect(transform.setEncoding('gbk')).assertTrue();
      expect(transform.setEncoding('gb2312')).assertTrue();
      transform.push(new Uint8Array([65, 66]));
      transform.pause();
      expect(transform.read()?.toString()).assertEqual('AB');
      expect(transform.readableEncoding).assertEqual('gb2312');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_1400
     * @tc.name testStreamTransformSetEncoding014
     * @tc.desc Verify setEncoding updates readableEncoding for a valid gb18030 configuration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      expect(transform.setEncoding('gb18030')).assertTrue();
      expect(transform.readableEncoding).assertEqual('gb18030');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_1500
     * @tc.name testStreamTransformSetEncoding015
     * @tc.desc Verify setEncoding gb18030 decodes pushed data and readableEncoding is updated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      expect(transform.setEncoding('gb18030')).assertTrue();
      transform.push('ok');
      transform.pause();
      expect(transform.read()?.toString()).assertEqual('ok');
      expect(transform.readableEncoding).assertEqual('gb18030');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_1600
     * @tc.name testStreamTransformSetEncoding016
     * @tc.desc Verify setEncoding does not affect writable* properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      transform.setEncoding('utf8');
      expect(transform.writable).assertTrue();
      expect(transform.writableEnded).assertFalse();
      expect(transform.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_1700
     * @tc.name testStreamTransformSetEncoding017
     * @tc.desc Verify setEncoding("utf8") leaves isPaused, readableFlowing and all readable* properties unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      transform.setEncoding('utf8');
      expect(transform.isPaused()).assertFalse();
      expect(transform.readableEnded).assertFalse();
      expect(transform.readableHighWatermark).assertEqual(16384);
      expect(transform.readableObjectMode).assertFalse();
      expect(transform.readableLength).assertEqual(0);
      expect(transform.readableFlowing).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_1800
     * @tc.name testStreamTransformSetEncoding018
     * @tc.desc Verify setEncoding readableEncoding null initially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      expect(transform.readableEncoding).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_1900
     * @tc.name testStreamTransformSetEncoding019
     * @tc.desc Verify setEncoding works after cork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      transform.cork();
      let result: boolean = transform.setEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_2000
     * @tc.name testStreamTransformSetEncoding020
     * @tc.desc Verify setEncoding works after pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      transform.pause();
      let result: boolean = transform.setEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_2100
     * @tc.name testStreamTransformSetEncoding021
     * @tc.desc Verify setEncoding works after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      transform.end();
      let result: boolean = transform.setEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_2200
     * @tc.name testStreamTransformSetEncoding022
     * @tc.desc Verify setEncoding multiple calls keep latest readableEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      transform.setEncoding('utf8');
      transform.setEncoding('gbk');
      transform.setEncoding('gb18030');
      expect(transform.readableEncoding).assertEqual('gb18030');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_2300
     * @tc.name testStreamTransformSetEncoding023
     * @tc.desc Verify setEncoding changes decoding for bytes pushed after configuration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      transform.setEncoding('utf8');
      transform.pause();
      transform.push('中文');
      let data = transform.read();
      expect(data?.toString()).assertEqual('中文');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_2400
     * @tc.name testStreamTransformSetEncoding024
     * @tc.desc Verify setEncoding with whitespace-only string rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      let caught: boolean = false;
      try {
        transform.setEncoding('   ');
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_2500
     * @tc.name testStreamTransformSetEncoding025
     * @tc.desc Verify setEncoding rejected encoding does not change readableEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      transform.setEncoding('utf8');
      let before: string = transform.readableEncoding!;
      let caught: boolean = false;
      try {
        transform.setEncoding('invalid-encoding');
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        caught = true;
      }
      expect(caught).assertTrue();
      expect(transform.readableEncoding).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_2600
     * @tc.name testStreamTransformSetEncoding026
     * @tc.desc Verify setEncoding with Uint8Array boundary bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      transform.setEncoding('utf8');
      transform.pause();
      transform.push(new Uint8Array([0x00, 0xFF, 0x7F, 0x80]));
      let data = transform.read();
      expect(data?.toString().length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_2700
     * @tc.name testStreamTransformSetEncoding027
     * @tc.desc Verify setEncoding("utf8") returns true with boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      let result: boolean = transform.setEncoding('utf8');
      expect(result).assertTrue();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_2800
     * @tc.name testStreamTransformSetEncoding028
     * @tc.desc Verify setEncoding('utf8') decode Chinese chars read correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      transform.setEncoding('utf8');
      transform.pause();
      transform.push('你好世界');
      let data = transform.read();
      expect(data?.toString()).assertEqual('你好世界');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_2900
     * @tc.name testStreamTransformSetEncoding029
     * @tc.desc Verify setEncoding('utf8') decode emoji read correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      transform.setEncoding('utf8');
      transform.pause();
      transform.push('😀😃');
      let data = transform.read();
      expect(data?.toString()).assertEqual('😀😃');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_3000
     * @tc.name testStreamTransformSetEncoding030
     * @tc.desc Verify setEncoding on piped transform does not affect downstream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      let writable: stream.Writable = new stream.Writable();
      transform.pipe(writable);
      let result: boolean = transform.setEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_3100
     * @tc.name testStreamTransformSetEncoding031
     * @tc.desc Verify setEncoding with lowercase 'utf-8' accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SenTestTransform();
      let result: boolean = transform.setEncoding('utf-8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_3200
     * @tc.name testStreamTransformSetEncoding032
     * @tc.desc Verify setDefaultEncoding returns true for utf8, gbk, gb18030, gb2312 and their uppercase forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ['utf8', 'gbk', 'gb18030', 'gb2312', 'UTF-8', 'GBK'];
      for (let i = 0; i < encodings.length; i++) {
        let transform = new SdeTestTransform();
        let result = transform.setDefaultEncoding(encodings[i]);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_3300
     * @tc.name testStreamTransformSetEncoding033
     * @tc.desc Verify explicit write encoding overrides default and writable state is unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      expect(transform.setDefaultEncoding('gbk')).assertTrue();
      transform.write('hello', 'utf8');
      expect(transform.receivedEncoding).assertEqual('utf8');
      expect(transform.writable).assertTrue();
      expect(transform.writableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_3400
     * @tc.name testStreamTransformSetEncoding034
     * @tc.desc Verify setDefaultEncoding with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      let result = transform.setDefaultEncoding('');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_3500
     * @tc.name testStreamTransformSetEncoding035
     * @tc.desc Verify explicit write encoding overrides the latest default encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      expect(transform.setDefaultEncoding('gb18030')).assertTrue();
      transform.write('explicit', 'utf8');
      expect(transform.receivedEncoding).assertEqual('utf8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_3600
     * @tc.name testStreamTransformSetEncoding036
     * @tc.desc Verify explicit gbk encoding overrides the default utf8 encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      expect(transform.setDefaultEncoding('utf8')).assertTrue();
      transform.write('explicit', 'gbk');
      expect(transform.receivedEncoding).assertEqual('gbk');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_3700
     * @tc.name testStreamTransformSetEncoding037
     * @tc.desc Verify explicit write encoding remains authoritative after default encoding is changed twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      expect(transform.setDefaultEncoding('gbk')).assertTrue();
      expect(transform.setDefaultEncoding('gb18030')).assertTrue();
      transform.write('explicit-after-switch', 'utf8');
      expect(transform.receivedEncoding).assertEqual('utf8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_3800
     * @tc.name testStreamTransformSetEncoding038
     * @tc.desc Verify rejecting an empty default encoding does not prevent a later valid configuration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      expect(transform.setDefaultEncoding('')).assertFalse();
      expect(transform.setDefaultEncoding('gb2312')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_3900
     * @tc.name testStreamTransformSetEncoding039
     * @tc.desc Verify setDefaultEncoding("utf8") default applied to write without explicit encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      transform.setDefaultEncoding('utf8');
      transform.write('hello');
      expect(transform.receivedEncoding).assertEqual('utf8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_4000
     * @tc.name testStreamTransformSetEncoding040
     * @tc.desc Verify setDefaultEncoding does not affect readable side
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      transform.setDefaultEncoding('gbk');
      expect(transform.readableEncoding).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_4100
     * @tc.name testStreamTransformSetEncoding041
     * @tc.desc Verify setDefaultEncoding rejects null with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      let caught: boolean = false;
      try {
        transform.setDefaultEncoding(null as Object as string);
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_4200
     * @tc.name testStreamTransformSetEncoding042
     * @tc.desc Verify setDefaultEncoding rejects undefined with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      let caught: boolean = false;
      try {
        transform.setDefaultEncoding(undefined as string);
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_4300
     * @tc.name testStreamTransformSetEncoding043
     * @tc.desc Verify setDefaultEncoding does not affect writable state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      transform.setDefaultEncoding('utf8');
      expect(transform.writable).assertTrue();
      expect(transform.writableEnded).assertFalse();
      expect(transform.writableFinished).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_4400
     * @tc.name testStreamTransformSetEncoding044
     * @tc.desc Verify setDefaultEncoding does not affect readable state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      transform.setDefaultEncoding('gbk');
      expect(transform.readable).assertTrue();
      expect(transform.readableEnded).assertFalse();
      expect(transform.readableLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_4500
     * @tc.name testStreamTransformSetEncoding045
     * @tc.desc Verify setDefaultEncoding does not affect isPaused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      transform.setDefaultEncoding('utf8');
      expect(transform.isPaused()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_4600
     * @tc.name testStreamTransformSetEncoding046
     * @tc.desc Verify setDefaultEncoding works after end() rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      transform.end();
      let result = transform.setDefaultEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_4700
     * @tc.name testStreamTransformSetEncoding047
     * @tc.desc Verify setDefaultEncoding works on paused transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      transform.pause();
      let result = transform.setDefaultEncoding('utf8');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_4800
     * @tc.name testStreamTransformSetEncoding048
     * @tc.desc Verify setDefaultEncoding with whitespace-only string rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      let caught: boolean = false;
      try {
        transform.setDefaultEncoding('   ');
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_SET_ENCODING_4900
     * @tc.name testStreamTransformSetEncoding049
     * @tc.desc Verify setDefaultEncoding does not affect highWaterMark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformSetEncoding049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new SdeTestTransform();
      transform.setDefaultEncoding('utf8');
      expect(transform.readableHighWatermark).assertEqual(16384);
      expect(transform.writableHighWatermark).assertEqual(16384);
    });

  });
}
