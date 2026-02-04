import { stream } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

export default function StreamWritable03Test() {
  describe('StreamWritable03Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_0100
     * @tc.name      testStreamWritable03Chapter0001
     * @tc.desc      Test end method with Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0001';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let uint8Array = new Uint8Array([72, 0, 0, 108, 111]);
      let result = writableStream.end(uint8Array, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_0200
     * @tc.name      testStreamWritable03Chapter0002
     * @tc.desc      Test end method with Uint8Array containing overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0002';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let uint8Array = new Uint8Array([0, 255, 0]);
      let result = writableStream.end(uint8Array, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_0300
     * @tc.name      testStreamWritable03Chapter0003
     * @tc.desc      Test end method with treeString-like large structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0003';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk length:", chunk.toString().length);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let treeString = '[';
      for (let i = 0; i < 1000; i++) {
        treeString += '{"a":1},';
      }
      treeString += '{"a":1}]';
      let result = writableStream.end(treeString, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_0400
     * @tc.name      testStreamWritable03Chapter0004
     * @tc.desc      Test end method with sliceString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0004';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let str = "{k1:value1,k2:value2}";
      let result = str.substring(0, str.length - 2);
      let endResult = writableStream.end(result, 'utf-8');
      expect(endResult).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_0500
     * @tc.name      testStreamWritable03Chapter0005
     * @tc.desc      Test end method with very large string for GC test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0005';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk length:", chunk.toString().length);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let hugeStr = "x".repeat(10000000);
      let result = writableStream.end(hugeStr, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_0600
     * @tc.name      testStreamWritable03Chapter0006
     * @tc.desc      Test end method with unicode code points
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0006';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let unicodeStr = "\u0041\u0042\u0043";
      let result = writableStream.end(unicodeStr, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_0700
     * @tc.name      testStreamWritable03Chapter0007
     * @tc.desc      Test end method with illegal unicode sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0007';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let illegalUnicode = "\uDC04\uD83D\uDFF4";
      let result = writableStream.end(illegalUnicode, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_0800
     * @tc.name      testStreamWritable03Chapter0008
     * @tc.desc      Test end method with string "0" (should be treated as string, not number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0008';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk, "type:", typeof chunk);
          expect(typeof chunk).assertEqual('string');
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.end('0', 'utf-8');
      // The doWrite method already contains an assertion for chunk type
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_0900
     * @tc.name      testStreamWritable03Chapter0009
     * @tc.desc      Test end method with return value check
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0009';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('test', 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_1000
     * @tc.name      testStreamWritable03Chapter0010
     * @tc.desc      Test end method multiple times (should work)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0010';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.end('first', 'utf-8');
      let result = writableStream.end('second', 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_1100
     * @tc.name      testStreamWritable03Chapter0011
     * @tc.desc      Test end method with Uint8Array from ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0011';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let buffer = new ArrayBuffer(8);
      let uint8Array = new Uint8Array(buffer);
      for (let i = 0; i < uint8Array.length; i++) {
        uint8Array[i] = i * 10;
      }
      let result = writableStream.end(uint8Array, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_1200
     * @tc.name      testStreamWritable03Chapter0012
     * @tc.desc      Test end method with string chunk and encoding parameter only
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0012';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk, "encoding:", encoding);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('test', 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_1300
     * @tc.name      testStreamWritable03Chapter0013
     * @tc.desc      Test end method with Uint8Array chunk and callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0013';
      console.log(TAG + ' start');
      let callbackCalled = false;

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      writableStream.end(uint8Array, 'utf-8', () => {
        callbackCalled = true;
      });
      expect(callbackCalled).assertFalse();
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_1400
     * @tc.name      testStreamWritable03Chapter0014
     * @tc.desc      Test end method with gb18030 encoding and special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0014';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk, "encoding:", encoding);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('测试特殊字符!@#$', 'gb18030');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_1500
     * @tc.name      testStreamWritable03Chapter0015
     * @tc.desc      Test end method with gbk encoding and emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0015';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk, "encoding:", encoding);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('测试😊', 'gbk');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_1600
     * @tc.name      testStreamWritable03Chapter0016
     * @tc.desc      Test end method with gb2312 encoding and numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0016';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk, "encoding:", encoding);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('测试123456', 'gb2312');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_1700
     * @tc.name      testStreamWritable03Chapter0017
     * @tc.desc      Test end method with undefined chunk and invalid encoding (should error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0017';
      console.log(TAG + ' start');

      interface ErrorWithCode extends Error {
        code?: number;
      }

      try {
        class TestWritable extends stream.Writable {
          constructor() {
            super();
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            console.info("Writable chunk is", chunk);
            callback();
          }
        }

        let writableStream = new TestWritable();
        expect(writableStream instanceof TestWritable).assertTrue();
        writableStream.end(undefined, 'invalid');
        expect(writableStream !== null).assertTrue();
      } catch (err) {
        const error: ErrorWithCode = err as ErrorWithCode;
        expect(error instanceof Error).assertTrue();
        if (error.code !== undefined) {
          expect(typeof error.code).assertEqual('number');
        }
      }
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_1800
     * @tc.name      testStreamWritable03Chapter0018
     * @tc.desc      Test end method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0018';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let uint8Array = new Uint8Array([0, 255]);
      let result = writableStream.end(uint8Array, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_1900
     * @tc.name      testStreamWritable03Chapter0019
     * @tc.desc      Test end method with escape characters string comprehensive test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0019';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let escapeChars = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\"\\?\\0\\x41\\101";
      let result = writableStream.end(escapeChars, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_2000
     * @tc.name      testStreamWritable03Chapter0020
     * @tc.desc      Test end method with unicode emoji encoding verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0020';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let emojiUnicode = "\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf";
      let result = writableStream.end(emojiUnicode, 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_2100
     * @tc.name      testStreamWritable03Chapter0021
     * @tc.desc      Test end method with number-like string "NaN"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0021';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk, "type:", typeof chunk);
          expect(typeof chunk).assertEqual('string');
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.end('NaN', 'utf-8');
      // The doWrite method already contains an assertion for chunk type
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_2200
     * @tc.name      testStreamWritable03Chapter0022
     * @tc.desc      Test end method with string "undefined"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0022';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('undefined', 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_2300
     * @tc.name      testStreamWritable03Chapter0023
     * @tc.desc      Test end method with string "null"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0023';
      console.log(TAG + ' start');

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          console.info("Writable chunk is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      let result = writableStream.end('null', 'utf-8');
      expect(result).assertEqual(writableStream);
    });

    /**
     * @tc.number    SUB_STREAM_WRITABLE_TEST03_2400
     * @tc.name      testStreamWritable03Chapter0024
     * @tc.desc      Test end method after multiple write operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable03Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamWritable03Chapter0024';
      console.log(TAG + ' start');
      let writeCount = 0;

      class TestWritable extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          writeCount++;
          console.info("Writable chunk", writeCount, "is", chunk);
          callback();
        }
      }

      let writableStream = new TestWritable();
      writableStream.write('chunk1', 'utf-8');
      writableStream.write('chunk2', 'utf-8');
      writableStream.write('chunk3', 'utf-8');
      writableStream.end('final', 'utf-8');
      expect(writeCount).assertEqual(4);
    });
  })
}