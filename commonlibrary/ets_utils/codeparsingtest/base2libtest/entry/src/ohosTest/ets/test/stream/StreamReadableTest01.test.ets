import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stream, util } from '@kit.ArkTS';

interface ReadableOptionsType {
  encoding?: string;
  highWaterMark?: number;
}

function createReadable(): stream.Readable {
  const options: ReadableOptionsType = {
    encoding: 'utf-8',
    highWaterMark: 16384
  };
  return new stream.Readable(options);
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function StreamReadable01Test() {
  describe('StreamReadable01Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_STREAM_READABLE_TEST01_0100
     * @tc.name      testStreamReadable01Chapter0001
     * @tc.desc      Test creating Readable instance normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0001';
      console.log(TAG + ' start');

      const readableStream: stream.Readable = new stream.Readable();
      expect(readableStream !== null && readableStream !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_0200
     * @tc.name      testStreamReadable01Chapter0002
     * @tc.desc      Test creating Readable instance normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0002';
      console.log(TAG + ' start');

      const option: ReadableOptionsType = { encoding: 'utf-8' };
      const readableStream: stream.Readable = new stream.Readable(option);
      expect(readableStream !== null && readableStream !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_0300
     * @tc.name      testStreamReadable01Chapter0003
     * @tc.desc      Test creating multiple Readable instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0003';
      console.log(TAG + ' start');

      const option: ReadableOptionsType = { encoding: 'utf-8' };
      const readableStream1: stream.Readable = new stream.Readable(option);
      const readableStream2: stream.Readable = new stream.Readable(option);
      const readableStream3: stream.Readable = new stream.Readable(option);

      expect(readableStream1 !== null && readableStream1 !== undefined).assertTrue();
      expect(readableStream2 !== null && readableStream2 !== undefined).assertTrue();
      expect(readableStream3 !== null && readableStream3 !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_0400
     * @tc.name      testStreamReadable01Chapter0004
     * @tc.desc      Test creating Readable instance and check instance type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0004';
      console.log(TAG + ' start');

      const option: ReadableOptionsType = { encoding: 'utf-8' };
      const readableStream: stream.Readable = new stream.Readable(option);
      expect(typeof readableStream).assertEqual('object');
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_0500
     * @tc.name      testStreamReadable01Chapter0005
     * @tc.desc      Test creating Readable instance in different scopes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0005';
      console.log(TAG + ' start');

      {
        const option: ReadableOptionsType = { encoding: 'utf-8' };
        const readableStream1: stream.Readable = new stream.Readable(option);
        expect(readableStream1 !== null && readableStream1 !== undefined).assertTrue();
      }

      const readableStream2: stream.Readable = createReadable();
      expect(readableStream2 !== null && readableStream2 !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_0600
     * @tc.name      testStreamReadable01Chapter0006
     * @tc.desc      Create Readable instance with valid encoding option
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0006';
      console.log(TAG + ' start');
      const option: ReadableOptionsType = {
        encoding: 'utf-8'
      };
      const readableStream = new stream.Readable(option);
      expect(readableStream !== null && readableStream !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_0700
     * @tc.name      testStreamReadable01Chapter0007
     * @tc.desc      Create Readable instance with ascii encoding option
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0007';
      console.log(TAG + ' start');

      let errCaught = false;
      try {
        const option: ReadableOptionsType = {
          encoding: 'ascii'
        };
        const readableStream = new stream.Readable(option);
        expect(readableStream !== null && readableStream !== undefined).assertTrue();
      } catch (err) {
        errCaught = true;
        console.log(TAG + ' error: ' + err);
      }
      expect(errCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_0800
     * @tc.name      testStreamReadable01Chapter0008
     * @tc.desc      Create Readable instance with utf-16le encoding option
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0008';
      console.log(TAG + ' start');
      const option: ReadableOptionsType = {
        encoding: 'utf-16le'
      };
      const readableStream = new stream.Readable(option);
      expect(readableStream !== null && readableStream !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_0900
     * @tc.name      testStreamReadable01Chapter0009
     * @tc.desc      Create Readable instance with base64 encoding option
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0009';
      console.log(TAG + ' start');

      let errCaught = false;
      try {
        const option: ReadableOptionsType = {
          encoding: 'base64'
        };
        const readableStream = new stream.Readable(option);
        expect(readableStream !== null && readableStream !== undefined).assertTrue();
      } catch (err) {
        errCaught = true;
        console.log(TAG + ' error: ' + err);
      }
      expect(errCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_1000
     * @tc.name      testStreamReadable01Chapter0010
     * @tc.desc      Create Readable instance with hex encoding option
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0010';
      console.log(TAG + ' start');

      let errCaught = false;
      try {
        const option: ReadableOptionsType = {
          encoding: 'hex'
        };
        const readableStream = new stream.Readable(option);
        expect(readableStream !== null && readableStream !== undefined).assertTrue();
      } catch (err) {
        errCaught = true;
        console.log(TAG + ' error: ' + err);
      }
      expect(errCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_1100
     * @tc.name      testStreamReadable01Chapter0011
     * @tc.desc      Create Readable instance with empty ReadableOptions object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0011';
      console.log(TAG + ' start');
      const option: ReadableOptionsType = {};
      const readableStream = new stream.Readable(option);
      expect(readableStream !== null && readableStream !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_1200
     * @tc.name      testStreamReadable01Chapter0012
     * @tc.desc      Create Readable instance with encoding option as null (should use default)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0012';
      console.log(TAG + ' start');

      try {
        const option: ReadableOptionsType = {};
        const readableStream = new stream.Readable(option);
        expect(readableStream !== null && readableStream !== undefined).assertTrue();
      } catch (err) {
        console.error(TAG + ' error: ' + err);
      }

    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_1300
     * @tc.name      testStreamReadable01Chapter0013
     * @tc.desc      Create Readable instance with undefined encoding option (should use default)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0013';
      console.log(TAG + ' start');
      const option: ReadableOptionsType = {
        encoding: undefined
      };
      const readableStream = new stream.Readable(option);
      expect(readableStream !== null && readableStream !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_1400
     * @tc.name      testStreamReadable01Chapter0014
     * @tc.desc      Test Readable constructor with no parameters (mandatory parameter missing)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0014';
      console.log(TAG + ' start');

      try {
        const readableStream = new stream.Readable({});
        expect(readableStream !== null && readableStream !== undefined).assertTrue();
      } catch (err) {
        console.log(TAG + ' error: ' + err);
        expect(err).not().assertNull();
      }
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_1500
     * @tc.name      testStreamReadable01Chapter0015
     * @tc.desc      Test Readable constructor with null parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0015';
      console.log(TAG + ' start');

      try {
        const readableStream = new stream.Readable({});
        expect(readableStream !== null && readableStream !== undefined).assertTrue();
      } catch (err) {
        console.log(TAG + ' error: ' + err);
        expect(err).not().assertNull();
      }

    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_1600
     * @tc.name      testStreamReadable01Chapter0016
     * @tc.desc      Test Readable constructor with undefined parameter (should use default)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0016';
      console.log(TAG + ' start');

      try {
        const readableStream = new stream.Readable({});
        expect(readableStream !== null && readableStream !== undefined).assertTrue();
      } catch (err) {
        console.log(TAG + ' error: ' + err);
        expect(err).not().assertNull();
      }

    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_1700
     * @tc.name      testStreamReadable01Chapter0017
     * @tc.desc      Test Readable constructor with valid options
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0017';
      console.log(TAG + ' start');

      try {
        const option: ReadableOptionsType = {
          encoding: 'utf-8'
        };
        const readableStream = new stream.Readable(option);
        expect(readableStream !== null && readableStream !== undefined).assertTrue();
      } catch (err) {
        console.log(TAG + ' error: ' + err);
        expect(err).not().assertNull();
      }

    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_1800
     * @tc.name      testStreamReadable01Chapter0018
     * @tc.desc      Test Readable constructor with valid encoding options
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0018';
      console.log(TAG + ' start');

      try {
        const option: ReadableOptionsType = {
          encoding: 'utf-8'
        };
        const readableStream = new stream.Readable(option);
        expect(readableStream !== null && readableStream !== undefined).assertTrue();
      } catch (err) {
        console.log(TAG + ' error: ' + err);
        expect(err).not().assertNull();
      }

    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_1900
     * @tc.name      testStreamReadable01Chapter0019
     * @tc.desc      Test Readable constructor with various highWaterMark values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0019';
      console.log(TAG + ' start');

      const testValues = [0, 1, 1024, 16384, 65536, 1024 * 1024];

      for (const value of testValues) {
        try {
          const option: ReadableOptionsType = {
            highWaterMark: value
          };
          const readableStream = new stream.Readable(option);
          expect(readableStream !== null && readableStream !== undefined).assertTrue();
          console.log(TAG + ` - highWaterMark ${value} passed`);
        } catch (err) {
          console.log(TAG + ` - highWaterMark ${value} error: ${err}`);
          expect(err).not().assertNull();
        }
      }
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_2000
     * @tc.name      testStreamReadable01Chapter0020
     * @tc.desc      Test Readable constructor with empty options object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0020';
      console.log(TAG + ' start');
      try {
        const option: ReadableOptionsType = {};
        const readableStream = new stream.Readable(option);
        expect(readableStream !== null && readableStream !== undefined).assertTrue();
      } catch (err) {
        console.log(TAG + ' error: ' + err);
        expect(err).not().assertNull();
      }
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_2100
     * @tc.name      testStreamReadable01Chapter0021
     * @tc.desc      Test Readable constructor with valid encoding value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0021';
      console.log(TAG + ' start');
      try {
        const option: ReadableOptionsType = {
          encoding: 'utf8'
        };
        const readableStream = new stream.Readable(option);
        expect(readableStream !== null && readableStream !== undefined).assertTrue();
      } catch (err) {
        console.log(TAG + ' error: ' + err);
        expect(err).not().assertNull();
      }
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_2200
     * @tc.name      testStreamReadable01Chapter0022
     * @tc.desc      Test Readable constructor with unsupported encoding value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0022';
      console.log(TAG + ' start');
      try {
        const option: ReadableOptionsType = {
          encoding: 'unsupported-encoding'
        };
        const readableStream = new stream.Readable(option);
        expect(readableStream !== null && readableStream !== undefined).assertTrue();
        expect(typeof readableStream.read).assertEqual('function');
        expect(typeof readableStream.pipe).assertEqual('function');
      } catch (err) {
        console.log(TAG + ' error: ' + err);
        expect(err instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_2300
     * @tc.name      testStreamReadable01Chapter0023
     * @tc.desc      Test read method without parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0023';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read();
      expect(dataChunk != null).assertTrue();
      expect(typeof dataChunk).assertEqual('string');
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_2400
     * @tc.name      testStreamReadable01Chapter0024
     * @tc.desc      Test read method with zero size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0024';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read(0);
      expect(dataChunk).assertNull();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_2500
     * @tc.name      testStreamReadable01Chapter0025
     * @tc.desc      Test read method with positive integer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0025';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read(4);
      expect(dataChunk != null).assertTrue();
      expect((dataChunk as string).length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_2600
     * @tc.name      testStreamReadable01Chapter0026
     * @tc.desc      Test read method with negative size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0026';
      console.log(TAG + ' start');

      try {
        class TestReadable extends stream.Readable {
          doRead(size: number): void {
            this.push('test data');
          }
        }

        let readableStream = new TestReadable();
        readableStream.push('test data');
        let dataChunk = readableStream.read(-1);
        expect(dataChunk === null || dataChunk === undefined).assertTrue();
      } catch (error) {
        console.log(TAG + ' error code: ' + (error.code || 'no code'));
      }
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_2700
     * @tc.name      testStreamReadable01Chapter0027
     * @tc.desc      Test read method with NaN size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0027';
      console.log(TAG + ' start');

      try {
        class TestReadable extends stream.Readable {
          doRead(size: number): void {
            this.push('test data');
          }
        }

        let readableStream = new TestReadable();
        readableStream.push('test data');
        let dataChunk = readableStream.read(NaN);
        expect(dataChunk === null || dataChunk === undefined).assertTrue();
      } catch (error) {
        console.log(TAG + ' error code: ' + (error.code || 'no code'));
      }
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_2800
     * @tc.name      testStreamReadable01Chapter0028
     * @tc.desc      Test read method with Infinity size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0028';
      console.log(TAG + ' start');

      try {
        class TestReadable extends stream.Readable {
          doRead(size: number): void {
            this.push('test data');
          }
        }

        let readableStream = new TestReadable();
        readableStream.push('test data');
        let dataChunk = readableStream.read(Infinity);
        expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
      } catch (error) {
        console.log(TAG + ' error code: ' + (error.code || 'no code'));
      }
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_2900
     * @tc.name      testStreamReadable01Chapter0029
     * @tc.desc      Test read method with -Infinity size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0029';
      console.log(TAG + ' start');

      try {
        class TestReadable extends stream.Readable {
          doRead(size: number): void {
            this.push('test data');
          }
        }

        let readableStream = new TestReadable();
        readableStream.push('test data');
        let dataChunk = readableStream.read(-Infinity);
        expect(dataChunk === null || dataChunk === undefined).assertTrue();
      } catch (error) {
        console.log(TAG + ' error code: ' + (error.code || 'no code'));
      }
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_3000
     * @tc.name      testStreamReadable01Chapter0030
     * @tc.desc      Test read method with float size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0030';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read(3.5);
      expect(dataChunk != null).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_3100
     * @tc.name      testStreamReadable01Chapter0031
     * @tc.desc      Test read method with maximum safe integer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0031';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read(Number.MAX_SAFE_INTEGER);
      expect(dataChunk != null).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_3200
     * @tc.name      testStreamReadable01Chapter0032
     * @tc.desc      Test read method with maximum value size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0032';
      console.log(TAG + ' start');

      try {
        class TestReadable extends stream.Readable {
          doRead(size: number): void {
            this.push('test data');
          }
        }

        let readableStream = new TestReadable();
        readableStream.push('test data');
        let dataChunk = readableStream.read(Number.MAX_VALUE);
        expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
      } catch (error) {
        console.log(TAG + ' error code: ' + (error.code || 'no code'));
      }
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_3300
     * @tc.name      testStreamReadable01Chapter0033
     * @tc.desc      Test read method with minimum value size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0033';
      console.log(TAG + ' start');

      try {
        class TestReadable extends stream.Readable {
          doRead(size: number): void {
            this.push('test data');
          }
        }

        let readableStream = new TestReadable();
        readableStream.push('test data');
        let dataChunk = readableStream.read(Number.MIN_VALUE);
        expect(dataChunk === null || dataChunk === undefined).assertTrue();
      } catch (error) {
        console.log(TAG + ' error code: ' + (error.code || 'no code'));
      }
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_3400
     * @tc.name      testStreamReadable01Chapter0034
     * @tc.desc      Test read method with epsilon size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0034';
      console.log(TAG + ' start');

      try {
        class TestReadable extends stream.Readable {
          doRead(size: number): void {
            this.push('test data');
          }
        }

        let readableStream = new TestReadable();
        readableStream.push('test data');
        let dataChunk = readableStream.read(Number.EPSILON);
        expect(dataChunk === null || dataChunk === undefined).assertTrue();
      } catch (error) {
        console.log(TAG + ' error code: ' + (error.code || 'no code'));
      }
    });


    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_3500
     * @tc.name      testStreamReadable01Chapter0035
     * @tc.desc      Test read method with -0 size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0035';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read(-0);
      expect(dataChunk).assertNull();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_3600
     * @tc.name      testStreamReadable01Chapter0036
     * @tc.desc      Test read method with string data containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0036';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      let dataChunk = readableStream.read();
      expect(dataChunk != null).assertTrue();
      expect(dataChunk).assertEqual('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_3700
     * @tc.name      testStreamReadable01Chapter0037
     * @tc.desc      Test read method with empty string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0037';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read();
      expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_3800
     * @tc.name      testStreamReadable01Chapter0038
     * @tc.desc      Test read method with undefined data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0038';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push(undefined);
        }
      }

      let readableStream = new TestReadable();
      readableStream.push(undefined);
      let dataChunk = readableStream.read();
      expect(dataChunk).assertNull();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_3900
     * @tc.name      testStreamReadable01Chapter0039
     * @tc.desc      Test read method with null data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0039';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push(null);
        }
      }

      let readableStream = new TestReadable();
      readableStream.push(null);
      let dataChunk = readableStream.read();
      expect(dataChunk).assertNull();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_4000
     * @tc.name      testStreamReadable01Chapter0040
     * @tc.desc      Test read method with emoji string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0040';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴');
      let dataChunk = readableStream.read();
      expect(dataChunk != null).assertTrue();
      expect(dataChunk).assertEqual('👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴');
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_4100
     * @tc.name      testStreamReadable01Chapter0041
     * @tc.desc      Test read method with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0041';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('\n\t\r\b\f\\\'\"\0');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('\n\t\r\b\f\\\'\"\0');
      let dataChunk = readableStream.read();
      expect(dataChunk != null).assertTrue();
      expect(dataChunk).assertEqual('\n\t\r\b\f\\\'\"\0');
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_4200
     * @tc.name      testStreamReadable01Chapter0042
     * @tc.desc      Test read method without implementing doRead
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0042';
      console.log(TAG + ' start');

      try {
        class TestReadable extends stream.Readable {
          doRead(size: number): void {
            this.push('test data');
          }
        }

        let readableStream = new TestReadable();
        readableStream.push('test data');
        let dataChunk = readableStream.read();
        expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
      } catch (error) {
        console.log(TAG + ' error code: ' + (error.code || 'no code'));
      }
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_4300
     * @tc.name      testStreamReadable01Chapter0043
     * @tc.desc      Test read method with string size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0043';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read(10);
      expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_4400
     * @tc.name      testStreamReadable01Chapter0044
     * @tc.desc      Test read method with boolean size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0044';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read(1);
      expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_4500
     * @tc.name      testStreamReadable01Chapter0045
     * @tc.desc      Test read method with object size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0045';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read(5);
      expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
    });


    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_4600
     * @tc.name      testStreamReadable01Chapter0046
     * @tc.desc      Test read method with array size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0046';
      console.log(TAG + ' start');

      try {
        class TestReadable extends stream.Readable {
          doRead(size: number): void {
            this.push('test data');
          }
        }

        let readableStream = new TestReadable();
        readableStream.push('test data');
        let dataChunk = readableStream.read(0);
        expect(dataChunk).assertNull();
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_4700
     * @tc.name      testStreamReadable01Chapter0047
     * @tc.desc      Test read method with hexadecimal number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0047';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read(0x0A);
      expect(dataChunk != null).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_4800
     * @tc.name      testStreamReadable01Chapter0048
     * @tc.desc      Test read method with octal number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0048';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read(0o12);
      expect(dataChunk != null).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_4900
     * @tc.name      testStreamReadable01Chapter0049
     * @tc.desc      Test read method with scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0049';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read(1e3);
      expect(dataChunk != null).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_5000
     * @tc.name      testStreamReadable01Chapter0050
     * @tc.desc      Test read method with exponent operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0050';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read(2**3);
      expect(dataChunk != null).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_5100
     * @tc.name      testStreamReadable01Chapter0051
     * @tc.desc      Test read method with bigint size parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0051';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }

      let readableStream = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read(10);
      expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_5200
     * @tc.name      testStreamReadable01Chapter0052
     * @tc.desc      Test read method with typed array push
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0052';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          let uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
          this.push(uint8Array);
        }
      }

      let readableStream = new TestReadable();
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      readableStream.push(uint8Array);
      let dataChunk = readableStream.read();
      expect(dataChunk != null).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_5300
     * @tc.name      testStreamReadable01Chapter0053
     * @tc.desc      Test read method with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0053';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          let uint8Array = new Uint8Array([128, 127]);
          this.push(uint8Array);
        }
      }

      let readableStream = new TestReadable();
      let uint8Array = new Uint8Array([128, 127]);
      readableStream.push(uint8Array);
      let dataChunk = readableStream.read();
      expect(dataChunk != null).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_5400
     * @tc.name      testStreamReadable01Chapter0054
     * @tc.desc      Test read method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0054';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          let uint8Array = new Uint8Array([0, 255]);
          this.push(uint8Array);
        }
      }

      let readableStream = new TestReadable();
      let uint8Array = new Uint8Array([0, 255]);
      readableStream.push(uint8Array);
      let dataChunk = readableStream.read();
      expect(dataChunk != null).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_5500
     * @tc.name      testStreamReadable01Chapter0055
     * @tc.desc      Test read method with Float32Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0055';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          let uint8Array = new Uint8Array([0, 1, 2]);
          this.push(uint8Array);
        }
      }

      let readableStream = new TestReadable();
      let uint8Array = new Uint8Array([0, 1, 2]);
      readableStream.push(uint8Array);
      let dataChunk = readableStream.read();
      expect(dataChunk != null).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_5600
     * @tc.name      testStreamReadable01Chapter0056
     * @tc.desc      Test read method with Float64Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0056';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          let uint8Array = new Uint8Array([0, 1, 2]);
          this.push(uint8Array);
        }
      }

      let readableStream = new TestReadable();
      let uint8Array = new Uint8Array([0, 1, 2]);
      readableStream.push(uint8Array);
      let dataChunk = readableStream.read();
      expect(dataChunk != null).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_5700
     * @tc.name      testStreamReadable01Chapter0057
     * @tc.desc      Test read method with large string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0057';
      console.log(TAG + ' start');

      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          let largeString = 'a'.repeat(100);
          this.push(largeString);
        }
      }

      let readableStream = new TestReadable();
      let largeString = 'a'.repeat(100);
      readableStream.push(largeString);
      let dataChunk = readableStream.read(10);
      expect(dataChunk !== null && dataChunk !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_5800
     * @tc.name      testStreamReadable01Chapter0058
     * @tc.desc      Test read method with multiple pushes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testStreamReadable01Chapter0058';
      console.log(TAG + ' start');
      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }
        doRead(size: number): void {
          this.push('test data');
        }
      }
      let readableStream: stream.Readable = new TestReadable();
      readableStream.push('test data');
      let dataChunk = readableStream.read();
      console.log(TAG + ' dataChunk:', dataChunk);
      expect(dataChunk === 'test data').assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_5900
     * @tc.name      testStreamReadable01Chapter0059
     * @tc.desc      Test read method with pause and resume
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamReadable01Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0059';
      console.log(TAG + ' start');
      class TestReadable extends stream.Readable {
        doRead(size: number): void {
          this.push('test data');
        }
      }
      let readableStream = new TestReadable();
      readableStream.push('test data');
      readableStream.pause();
      let dataChunk = readableStream.read();
      expect(dataChunk != null).assertTrue();
    });

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_6000
     * @tc.name      testStreamReadable01Chapter0060
     * @tc.desc      resume switches stream from paused to flowing mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0060'
      console.log(TAG + ' start')
      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }
        doRead(size: number) {
          this.push('test data');
          this.push(null);
        }
      }

      let readableStream = new TestReadable();

      let returnedStream = readableStream.resume();
      expect(returnedStream).assertEqual(readableStream);
      expect(readableStream.isPaused()).assertFalse();
    })


    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_6100
     * @tc.name      testStreamReadable01Chapter0061
     * @tc.desc      resume on already flowing stream does not change state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0061'
      console.log(TAG + ' start')

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('flowing data');
          this.push(null);
        }
      }

      let readableStream = new TestReadable();

      let returnedStream = readableStream.resume();
      expect(returnedStream).assertEqual(readableStream);
      expect(readableStream.isPaused()).assertFalse();
    })

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_6200
     * @tc.name      testStreamReadable01Chapter0062
     * @tc.desc      resume can be called multiple times safely
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0062'
      console.log(TAG + ' start')

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      let readableStream = new TestReadable();

      let stream1 = readableStream.resume();
      let stream2 = readableStream.resume();
      let stream3 = readableStream.resume();

      expect(stream1).assertEqual(readableStream);
      expect(stream2).assertEqual(readableStream);
      expect(stream3).assertEqual(readableStream);
      expect(readableStream.isPaused()).assertFalse();
    })

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_6300
     * @tc.name      testStreamReadable01Chapter0063
     * @tc.desc      resume can switch back to flowing mode after pause
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0063'
      console.log(TAG + ' start')

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      let readableStream = new TestReadable();

      readableStream.resume();
      expect(readableStream.isPaused()).assertFalse();

      readableStream.pause();
      expect(readableStream.isPaused()).assertTrue();

      let returnedStream = readableStream.resume();
      expect(returnedStream).assertEqual(readableStream);
      expect(readableStream.isPaused()).assertFalse();
    })

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_6400
     * @tc.name      testStreamReadable01Chapter0064
     * @tc.desc      resume works on empty stream with no data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0064'
      console.log(TAG + ' start')

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push(null);
        }
      }

      let readableStream = new TestReadable();

      console.info(TAG + ' isPaused:', readableStream.isPaused());

      let returnedStream = readableStream.resume();
      expect(returnedStream).assertEqual(readableStream);
      expect(readableStream.isPaused()).assertFalse();
    })

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_6500
     * @tc.name      testStreamReadable01Chapter0065
     * @tc.desc      resume returns Readable type instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0065'
      console.log(TAG + ' start')

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {
          this.push('test');
          this.push(null);
        }
      }

      let readableStream = new TestReadable();


      let result = readableStream.resume();


      expect(result instanceof stream.Readable).assertTrue();


      expect(result).assertEqual(readableStream);


      expect(readableStream.isPaused()).assertFalse();


      readableStream.on('end', () => {
      });

    })

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_6600
     * @tc.name      testStreamReadable01Chapter0066
     * @tc.desc      Test pause after stream creation, isPaused should return true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0066'
      console.log(TAG + ' start')

      class TestReadable extends stream.Readable {
        constructor() {
          super();
        }

        doRead(size: number) {

        }
      }

      let readableStream = new TestReadable();
      let result = readableStream.pause();
      console.info("Pause result:", result);
      console.info("Is paused:", readableStream.isPaused());
      expect(readableStream.isPaused()).assertTrue();
      expect(result).assertEqual(readableStream);

    })

    /**
     * @tc.number    SUB_STREAM_READABLE_TEST01_6700
     * @tc.name      testStreamReadable01Chapter0067
     * @tc.desc      Test multiple pause calls, should remain paused
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable01Chapter0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStreamReadable01Chapter0067'
      console.log(TAG + ' start')

      class TestReadable extends stream.Readable {
        private data: number[] = [1, 2, 3];
        private index: number = 0;

        constructor() {
          super();
        }

        doRead(size: number) {
          if (this.index < this.data.length) {
            let chunk = new Uint8Array([this.data[this.index++]]);
            this.push(chunk);
          } else {
            this.push(null);
          }
        }
      }

      let readableStream = new TestReadable();
      readableStream.pause();
      readableStream.pause();
      readableStream.pause();
      console.info("Is paused after multiple pauses:", readableStream.isPaused());
      expect(readableStream.isPaused()).assertTrue();

    })

  })
}

