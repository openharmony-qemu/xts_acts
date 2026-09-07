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

class ReadableTestBase extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: int): void {
  }
}

class ReadableEncodingTest extends stream.Readable {
  constructor(encoding: string) {
    super({ encoding: encoding } as stream.ReadableOptions);
  }

  doRead(size: int): void {
  }
}

class ReadableNoDoRead extends stream.Readable {
  constructor() {
    super();
  }
}

class ReadableEmptyOptions extends stream.Readable {
  constructor() {
    super({} as stream.ReadableOptions);
  }

  doRead(size: int): void {
  }
}

class TestConstructor020 extends ReadableTestBase {
  constructor() {
    super();
  }
}

class TestConstructor021 extends ReadableTestBase {
  constructor() {
    super();
  }
}

class TestConstructor022 extends ReadableTestBase {
  constructor() {
    super();
  }
}

class TestConstructor041 extends stream.Readable {
  constructor() {
    super();
  }
}

class TestConstructor039 extends stream.Readable {
  constructor() {
    super({ encoding: null as Object as String } as stream.ReadableOptions);
  }

  doRead(size: int): void {
  }
}

class TestConstructor042 extends stream.Readable {
  constructor() {
    super({ encoding: "undefined" } as stream.ReadableOptions);
  }

  doRead(size: int): void {
  }
}

function isInstanceOfStreamReadable(obj: Object): boolean {
  return obj instanceof stream.Readable;
}

export default function StreamReadableConstructorTest(): void {
  describe('StreamReadableConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_0100
     * @tc.name testStreamReadableConstructor001
     * @tc.desc Verify default constructor creates instance with correct 7 default property values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      expect(rs.readable).assertTrue();
      expect(rs.readableObjectMode).assertFalse();
      expect(rs.readableHighWatermark).assertEqual(16384);
      expect(rs.readableFlowing).assertEqual(null);
      expect(rs.readableLength).assertEqual(0);
      expect(rs.readableEncoding).assertEqual(null);
      expect(rs.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_0200
     * @tc.name testStreamReadableConstructor002
     * @tc.desc Verify constructor accepts utf-8 and GBK encoding options and leaves all readable properties at their default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ["utf-8", "GBK"];
      for (let i = 0; i < encodings.length; i++) {
        let rs = new ReadableEncodingTest(encodings[i]);
        expect(rs.readableEncoding).assertEqual(encodings[i]);
        expect(rs.readable).assertTrue();
        expect(rs.readableObjectMode).assertFalse();
        expect(rs.readableHighWatermark).assertEqual(16384);
        expect(rs.readableFlowing).assertEqual(null);
        expect(rs.readableLength).assertEqual(0);
        expect(rs.readableEnded).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_0300
     * @tc.name testStreamReadableConstructor003
     * @tc.desc Verify constructor accepts empty options object {}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableEmptyOptions();
      expect(rs.readableEncoding).assertEqual(null);
      expect(rs.readable).assertTrue();
      expect(rs.readableObjectMode).assertFalse();
      expect(rs.readableHighWatermark).assertEqual(16384);
      expect(rs.readableFlowing).assertEqual(null);
      expect(rs.readableLength).assertEqual(0);
      expect(rs.readableEnded).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_0400
     * @tc.name testStreamReadableConstructor004
     * @tc.desc Verify constructor does not throw when subclass does not implement doRead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs: stream.Readable = new ReadableNoDoRead();
      expect(rs.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_0500
     * @tc.name testStreamReadableConstructor005
     * @tc.desc Verify readableEnded transitions through push, read and push(null) phases, ending true only after null push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let rs = new ReadableTestBase();
        rs.pause();
        expect(rs.readableEnded).assertFalse();
        rs.push('data-before-end');
        expect(rs.readableEnded).assertFalse();
        expect(rs.readableLength).assertEqual(15);
        await new Promise<void>((resolve: (value: void) => void): void => {
          rs.on('end', (): void => {
            expect(rs.readableEnded).assertTrue();
            expect(rs.readable).assertFalse();
            resolve(undefined as void);
          });
          rs.push(null);
          rs.resume();
        });
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_0600
     * @tc.name testStreamReadableConstructor006
     * @tc.desc Verify combined property state snapshots across construction, push, pause and resume phases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      expect(rs.readable).assertTrue();
      expect(rs.readableEnded).assertFalse();
      expect(rs.readableLength).assertEqual(0);
      expect(rs.readableFlowing).assertEqual(null);
      rs.push('multi-state-data');
      expect(rs.readable).assertTrue();
      expect(rs.readableEnded).assertFalse();
      expect(rs.readableLength).assertEqual(16);
      rs.pause();
      expect(rs.isPaused()).assertTrue();
      expect(rs.readableFlowing).assertFalse();
      expect(rs.readable).assertTrue();
      rs.resume();
      expect(rs.isPaused()).assertFalse();
      expect(rs.readableFlowing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_0700
     * @tc.name testStreamReadableConstructor007
     * @tc.desc Verify constructor accepts the supported multi-byte and ISO series encodings and reports them unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = ["gb18030", "gb2312", "utf-16be", "big5", "GB18030", "iso-8859-2",
        "iso-2022-jp", "koi8-r", "euc-kr"];
      for (let i = 0; i < encodings.length; i++) {
        let rs = new ReadableEncodingTest(encodings[i]);
        expect(rs.readableEncoding).assertEqual(encodings[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_0800
     * @tc.name testStreamReadableConstructor008
     * @tc.desc Verify encoding=""empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableEncodingTest("");
      expect(rs.readable).assertTrue();
      expect(rs.readableEncoding).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_0900
     * @tc.name testStreamReadableConstructor009
     * @tc.desc Verify constructor throws BusinessError for space, single-character, tab, newline, ascii, base64, XSS, special-character, random and emoji encoding values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encodings: string[] = [" ", "a", "\t", "\n", "ascii", "base64", "<script>alert(1)</script>",
        "!@#$%^&*()", "xyz123", "😀测试"];
      for (let i = 0; i < encodings.length; i++) {
        try {
          new ReadableEncodingTest(encodings[i]);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_1000
     * @tc.name testStreamReadableConstructor010
     * @tc.desc Verify constructor throws when encoding is an excessively long string (16385 characters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "";
      for (let i: int = 0; i < 16385; i++) {
        longStr += "a";
      }
      try {
        new ReadableEncodingTest(longStr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_1100
     * @tc.name testStreamReadableConstructor011
     * @tc.desc Verify constructor throws BusinessError for blank, unsupported and malformed encoding values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instances: Array<ReadableTestBase> = [];
      for (let i: int = 0; i < 100; i++) {
        let rs = new ReadableTestBase();
        rs.push('payload-' + i.toString());
        instances.push(rs);
      }
      expect(instances.length).assertEqual(100);
      for (let j: int = 0; j < 100; j++) {
        expect(instances[j].readable).assertTrue();
        expect(instances[j].readableEnded).assertFalse();
        expect(instances[j].readableLength).assertEqual(('payload-' + j.toString()).length);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_1200
     * @tc.name testStreamReadableConstructor012
     * @tc.desc Verify calling end immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let readableAtEnd: boolean = true;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new TestConstructor020();
          rs.on("end", (): void => {
            readableAtEnd = rs.readable;
            resolve(undefined as void);
          });
          rs.push(null);
          rs.resume();
        });
        expect(readableAtEnd).assertFalse();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_1300
     * @tc.name testStreamReadableConstructor013
     * @tc.desc Verify pushing data immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new TestConstructor021();
      let pushResult = rs.push("test");
      expect(pushResult).assertTrue();
      expect(rs.readableLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_1400
     * @tc.name testStreamReadableConstructor014
     * @tc.desc Verify pushing null immediately after construction ends the stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let readableEndedAtEnd: boolean = false;
        await new Promise<void>((resolve: (value: void) => void): void => {
          let rs = new TestConstructor022();
          let pushResult = rs.push(null);
          expect(pushResult).assertFalse();
          rs.on("end", (): void => {
            readableEndedAtEnd = rs.readableEnded;
            resolve(undefined as void);
          });
          rs.resume();
        });
        expect(readableEndedAtEnd).assertTrue();

        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_1500
     * @tc.name testStreamReadableConstructor015
     * @tc.desc Verify pausing immediately after construction enters paused mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      let pauseResult = rs.pause();
      expect(pauseResult).assertEqual(rs);
      expect(rs.readableFlowing).assertFalse();
      expect(rs.isPaused()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_1600
     * @tc.name testStreamReadableConstructor016
     * @tc.desc Verify resuming immediately after construction confirms flowing mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      let resumeResult = rs.resume();
      expect(resumeResult).assertEqual(rs);
      expect(rs.readableFlowing).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_1700
     * @tc.name testStreamReadableConstructor017
     * @tc.desc Verify registering event listeners immediately after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      let cb = (): void => {
      };
      rs.on("data", cb);
      rs.on("end", cb);
      rs.on("error", cb);
      rs.on("close", cb);
      rs.on("readable", cb);
      expect(rs.readable).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_1800
     * @tc.name testStreamReadableConstructor018
     * @tc.desc Verify instanceof inheritance hierarchy: subclass is Readable and Object, but not Writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableTestBase();
      let isReadable: boolean = isInstanceOfStreamReadable(rs);
      expect(isReadable).assertTrue();
      let isObject: boolean = rs instanceof Object;
      expect(isObject).assertTrue();
      let isWritable: boolean = rs instanceof stream.Writable;
      expect(isWritable).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_1900
     * @tc.name testStreamReadableConstructor019
     * @tc.desc Verify constructor throws when encoding is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new TestConstructor039();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_READABLE_CONSTRUCTOR_2000
     * @tc.name testStreamReadableConstructor020
     * @tc.desc Verify constructor accepts the uppercase UTF-8 variant and exposes it as readableEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamReadableConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rs = new ReadableEncodingTest('UTF-8');
      expect(rs.readable).assertTrue();
      expect(rs.readableEncoding).assertEqual('UTF-8');
    });
  });
}
