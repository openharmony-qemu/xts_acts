import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util, collections, taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

@Concurrent
function SendableEncodeSyncTask(): string {
  const helper = new util.Base64Helper();
  const input = new collections.Uint8Array([72, 101, 108, 108, 111]); // "Hello"
  return helper.encodeToStringSync(input);
}

@Concurrent
function MakeSendableArrayTask(): collections.Uint8Array {
  return new collections.Uint8Array([87, 111, 114, 108, 100]); // "World"
}

@Concurrent
async function SendableEncodeAsyncTask(): Promise<string> {
  const helper = new util.Base64Helper();
  const input = new collections.Uint8Array([72, 101, 108, 108, 111]); // "Hello"
  return await helper.encodeToString(input);
}

@Concurrent
function SendableEncodeByIndexTask(index: number): string {
  const helper = new util.Base64Helper();
  const input = new collections.Uint8Array([65 + index, 66 + index, 67 + index]);
  return helper.encodeToStringSync(input);
}

export default function Base64Helper04Test() {
  describe('Base64Helper04Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_0100
     * @tc.name      testEncodeToStringSyncSendableBasic04_0001
     * @tc.desc      [Content] Encode collections.Uint8Array "Hello" to "SGVsbG8=" with encodeToStringSync.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendableBasic04_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendableBasic04_0001";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([72, 101, 108, 108, 111]); // "Hello"
      let result = base64Helper.encodeToStringSync(input);
      expect(result).assertEqual("SGVsbG8=");
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_0200
     * @tc.name      testEncodeToStringSyncSendableFrom04_0002
     * @tc.desc      [Content] Encode collections.Uint8Array created by from() (with mapFn) via encodeToStringSync.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendableFrom04_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendableFrom04_0002";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = collections.Uint8Array.from([72, 101, 108, 108, 111], (value: number): number => value);
      expect(input.length).assertEqual(5);
      let result = base64Helper.encodeToStringSync(input);
      expect(result).assertEqual("SGVsbG8=");
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_0300
     * @tc.name      testEncodeToStringSyncSendableChinese04_0003
     * @tc.desc      [Content] Encode collections.Uint8Array holding UTF-8 bytes of "你好世界" via encodeToStringSync.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendableChinese04_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendableChinese04_0003";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // UTF-8 bytes of "你好世界": E4 BD A0 E5 A5 BD E4 B8 96 E7 95 8C
      let input = new collections.Uint8Array([228, 189, 160, 229, 165, 189, 228, 184, 150, 231, 149, 140]);
      let result = base64Helper.encodeToStringSync(input);
      expect(result).assertEqual("5L2g5aW95LiW55WM");
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_0400
     * @tc.name      testEncodeToStringSyncSendablePadOne04_0004
     * @tc.desc      [Padding] Encode 1-byte collections.Uint8Array to "QQ==" via encodeToStringSync.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendablePadOne04_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendablePadOne04_0004";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([65]);
      let result = base64Helper.encodeToStringSync(input);
      expect(result).assertEqual("QQ==");
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_0500
     * @tc.name      testEncodeToStringSyncSendablePadTwo04_0005
     * @tc.desc      [Padding] Encode 2-byte collections.Uint8Array to "QUI=" via encodeToStringSync.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendablePadTwo04_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendablePadTwo04_0005";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([65, 66]);
      let result = base64Helper.encodeToStringSync(input);
      expect(result).assertEqual("QUI=");
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_0600
     * @tc.name      testEncodeToStringSyncSendablePadThree04_0006
     * @tc.desc      [Padding] Encode 3-byte collections.Uint8Array to "QUJD" (no padding) via encodeToStringSync.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendablePadThree04_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendablePadThree04_0006";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([65, 66, 67]);
      let result = base64Helper.encodeToStringSync(input);
      expect(result).assertEqual("QUJD");
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_0700
     * @tc.name      testEncodeToStringSyncSendableAllBytes04_0007
     * @tc.desc      [Content] Encode collections.Uint8Array of all byte values 0-255, result equals plain Uint8Array result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendableAllBytes04_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendableAllBytes04_0007";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let allBytes: Array<number> = [];
      for (let i = 0; i <= 255; i++) {
        allBytes.push(i);
      }
      let sendableInput = new collections.Uint8Array(allBytes);
      let plainInput = new Uint8Array(allBytes);
      let sendableResult = base64Helper.encodeToStringSync(sendableInput);
      let plainResult = base64Helper.encodeToStringSync(plainInput);
      expect(sendableResult.length).assertEqual(344); // 256 bytes -> 344 base64 chars
      expect(sendableResult).assertEqual(plainResult);
      expect(sendableResult.startsWith("AAECAwQFBgcICQoLDA0ODxAREhMUFRYXGBkaGxwdHh8")).assertTrue();
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_0800
     * @tc.name      testEncodeToStringSyncSendableSubarray04_0008
     * @tc.desc      [Content] Encode a collections.Uint8Array subarray view with non-zero byteOffset via encodeToStringSync.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendableSubarray04_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendableSubarray04_0008";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let base = new collections.Uint8Array([0, 0, 0, 72, 101, 108, 108, 111, 0, 0]);
      let view = base.subarray(3, 8); // "Hello" with byteOffset 3
      expect(view.byteOffset).assertEqual(3);
      expect(view.length).assertEqual(5);
      let result = base64Helper.encodeToStringSync(view);
      expect(result).assertEqual("SGVsbG8=");
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_0900
     * @tc.name      testEncodeToStringSyncSendableDefaultOptions04_0009
     * @tc.desc      [Option] Omitting options equals Type.BASIC for collections.Uint8Array input of encodeToStringSync.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendableDefaultOptions04_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendableDefaultOptions04_0009";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([251]); // 0xFB -> "+" in BASIC
      let defaultResult = base64Helper.encodeToStringSync(input);
      let basicResult = base64Helper.encodeToStringSync(input, util.Type.BASIC);
      expect(defaultResult).assertEqual("+w==");
      expect(defaultResult).assertEqual(basicResult);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_1000
     * @tc.name      testEncodeToStringSyncSendableUrlSafe04_0010
     * @tc.desc      [Option] BASIC_URL_SAFE maps 0xFB to '-' and 0xFF to '_' for collections.Uint8Array input.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendableUrlSafe04_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendableUrlSafe04_0010";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let fbInput = new collections.Uint8Array([251]);
      let ffInput = new collections.Uint8Array([255]);
      expect(base64Helper.encodeToStringSync(fbInput, util.Type.BASIC_URL_SAFE)).assertEqual("-w");
      expect(base64Helper.encodeToStringSync(ffInput, util.Type.BASIC_URL_SAFE)).assertEqual("_w");
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_1100
     * @tc.name      testEncodeToStringSyncSendableMime04_0011
     * @tc.desc      [Option] MIME inserts '\r\n' every 76 chars for collections.Uint8Array input of 58 'A's.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendableMime04_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendableMime04_0011";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let mimeInput: Array<number> = [];
      for (let i = 0; i < 58; i++) {
        mimeInput.push(65); // 'A' * 58 -> 80 base64 chars: "QUFB" * 19 + "QQ=="
      }
      let input = new collections.Uint8Array(mimeInput);
      let result = base64Helper.encodeToStringSync(input, util.Type.MIME);
      let expected = "QUFB".repeat(19) + "\r\n" + "QQ==" + "\r\n";
      expect(result).assertEqual(expected);
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_1200
     * @tc.name      testEncodeToStringSyncSendableMimeUrlSafe04_0012
     * @tc.desc      [Option] MIME_URL_SAFE uses url-safe alphabet and '\r\n' breaks for collections.Uint8Array input.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendableMimeUrlSafe04_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendableMimeUrlSafe04_0012";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let mimeInput: Array<number> = [];
      for (let i = 0; i < 58; i++) {
        mimeInput.push(251); // 0xFB * 58 -> "-_v7" * 19 + "-w" in url-safe alphabet, no padding
      }
      let input = new collections.Uint8Array(mimeInput);
      let result = base64Helper.encodeToStringSync(input, util.Type.MIME_URL_SAFE);
      let expected = "-_v7".repeat(19) + "\r\n" + "-w" + "\r\n";
      expect(result).assertEqual(expected);
      expect(result.includes("+")).assertFalse();
      expect(result.includes("/")).assertFalse();
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_1300
     * @tc.name      testEncodeToStringSyncSendableMimeShort04_0013
     * @tc.desc      [Option] encodeToStringSync with MIME and short collections.Uint8Array input throws Error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendableMimeShort04_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendableMimeShort04_0013";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new collections.Uint8Array([72, 101, 108, 108, 111]); // encoded length 8 < 76
        base64Helper.encodeToStringSync(input, util.Type.MIME);
        expect().assertFail();
      } catch (e) {
        let err = e as BusinessError;
        expect(err.message.includes("The parameter length does not meet this encoding format")).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_1400
     * @tc.name      testEncodeToStringSyncSendableEmpty04_0014
     * @tc.desc      [Exception] encodeToStringSync with empty collections.Uint8Array throws error 401.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendableEmpty04_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendableEmpty04_0014";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let empty: Array<number> = [];
        let input = new collections.Uint8Array(empty);
        base64Helper.encodeToStringSync(input);
        expect().assertFail();
      } catch (e) {
        let err = e as BusinessError;
        expect(Number(err.code)).assertEqual(401);
        expect(err.message.includes("greater than zero")).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_1500
     * @tc.name      testEncodeToStringSyncSendableInt8Array04_0015
     * @tc.desc      [Exception] encodeToStringSync with collections.Int8Array (wrong element type) throws error 401.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendableInt8Array04_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendableInt8Array04_0015";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new collections.Int8Array([72, 101, 108, 108, 111]) as ESObject as Uint8Array;
        base64Helper.encodeToStringSync(input);
        expect().assertFail();
      } catch (e) {
        let err = e as BusinessError;
        expect(Number(err.code)).assertEqual(401);
        expect(err.message.includes("must be Uint8Array")).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_1600
     * @tc.name      testEncodeToStringSyncSendablePlainInt8Array04_0016
     * @tc.desc      [Exception] encodeToStringSync with plain Int8Array (wrong element type) throws error 401.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendablePlainInt8Array04_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendablePlainInt8Array04_0016";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Int8Array([72, 101, 108, 108, 111]) as ESObject as Uint8Array;
        base64Helper.encodeToStringSync(input);
        expect().assertFail();
      } catch (e) {
        let err = e as BusinessError;
        expect(Number(err.code)).assertEqual(401);
        expect(err.message.includes("must be Uint8Array")).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_1700
     * @tc.name      testEncodeToStringSendableBasic04_0017
     * @tc.desc      [Content] Encode collections.Uint8Array "Hello" to "SGVsbG8=" with encodeToString (promise).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableBasic04_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableBasic04_0017";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([72, 101, 108, 108, 111]); // "Hello"
      let result = await base64Helper.encodeToString(input);
      expect(result).assertEqual("SGVsbG8=");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_1800
     * @tc.name      testEncodeToStringSendableConsistency04_0018
     * @tc.desc      [Content] encodeToString results of collections.Uint8Array equal plain Uint8Array for various lengths.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableConsistency04_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableConsistency04_0018";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let lengths: Array<number> = [1, 2, 3, 57, 58, 100];
      for (let len of lengths) {
        let content: Array<number> = [];
        for (let i = 0; i < len; i++) {
          content.push((i * 7 + 13) % 256);
        }
        let sendableInput = new collections.Uint8Array(content);
        let plainInput = new Uint8Array(content);
        let sendableResult = await base64Helper.encodeToString(sendableInput);
        let plainResult = await base64Helper.encodeToString(plainInput);
        expect(sendableResult).assertEqual(plainResult);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_1900
     * @tc.name      testEncodeToStringSendableSubarray04_0019
     * @tc.desc      [Content] Encode a collections.Uint8Array subarray view with non-zero byteOffset via encodeToString.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableSubarray04_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableSubarray04_0019";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let base = new collections.Uint8Array([0, 0, 0, 87, 111, 114, 108, 100, 0, 0]);
      let view = base.subarray(3, 8); // "World" with byteOffset 3
      expect(view.byteOffset).assertEqual(3);
      let result = await base64Helper.encodeToString(view);
      expect(result).assertEqual("V29ybGQ=");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_2000
     * @tc.name      testEncodeToStringSendableUrlSafe04_0020
     * @tc.desc      [Option] BASIC_URL_SAFE of collections.Uint8Array equals plain Uint8Array result and avoids '+'/'/'.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableUrlSafe04_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableUrlSafe04_0020";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let content: Array<number> = [];
      for (let i = 0; i < 30; i++) {
        content.push(248 + (i % 8)); // bytes 0xF8-0xFF to trigger '+' and '/' in basic alphabet
      }
      let sendableInput = new collections.Uint8Array(content);
      let plainInput = new Uint8Array(content);
      let sendableResult = await base64Helper.encodeToString(sendableInput, util.Type.BASIC_URL_SAFE);
      let plainResult = await base64Helper.encodeToString(plainInput, util.Type.BASIC_URL_SAFE);
      expect(sendableResult).assertEqual(plainResult);
      expect(sendableResult.includes("+")).assertFalse();
      expect(sendableResult.includes("/")).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_2100
     * @tc.name      testEncodeToStringSendableMime04_0021
     * @tc.desc      [Option] MIME of collections.Uint8Array equals plain Uint8Array result and breaks lines every 76 chars.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableMime04_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableMime04_0021";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let content: Array<number> = [];
      for (let i = 0; i < 200; i++) {
        content.push((i * 31 + 7) % 256);
      }
      let sendableInput = new collections.Uint8Array(content);
      let plainInput = new Uint8Array(content);
      let sendableResult = await base64Helper.encodeToString(sendableInput, util.Type.MIME);
      let plainResult = await base64Helper.encodeToString(plainInput, util.Type.MIME);
      expect(sendableResult).assertEqual(plainResult);
      // 200 bytes -> ceil(200/3)*4 = 268 base64 chars -> 4 lines: 76 + 76 + 76 + 40
      expect(sendableResult.length).assertEqual(268 + 4 * 2); // content + 4 x '\r\n'
      expect(sendableResult.charCodeAt(76)).assertEqual(13);
      expect(sendableResult.charCodeAt(77)).assertEqual(10);
      expect(sendableResult.charCodeAt(154)).assertEqual(13);
      expect(sendableResult.charCodeAt(155)).assertEqual(10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_2200
     * @tc.name      testEncodeToStringSendableMimeShort04_0022
     * @tc.desc      [Option] encodeToString with MIME and short collections.Uint8Array input rejects with Error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableMimeShort04_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableMimeShort04_0022";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new collections.Uint8Array([72, 101, 108, 108, 111]); // encoded length 8 < 76
        await base64Helper.encodeToString(input, util.Type.MIME);
        expect().assertFail();
      } catch (e) {
        let err = e as BusinessError;
        expect(err.message.includes("The parameter length does not meet this encoding format")).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_2300
     * @tc.name      testEncodeToStringSendableInvalidOptions04_0023
     * @tc.desc      [Exception] encodeToString with invalid options throws BusinessError 401 synchronously.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableInvalidOptions04_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSendableInvalidOptions04_0023";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new collections.Uint8Array([72, 101, 108, 108, 111]);
        let invalidOptions: util.Type = 99 as util.Type;
        base64Helper.encodeToString(input, invalidOptions);
        expect().assertFail();
      } catch (e) {
        let err = e as BusinessError;
        expect(Number(err.code)).assertEqual(401);
        expect(err.message.includes("must be one of the type enumerations")).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_2400
     * @tc.name      testEncodeToStringSendableEmpty04_0024
     * @tc.desc      [Exception] encodeToString with empty collections.Uint8Array throws error 401.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableEmpty04_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSendableEmpty04_0024";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let empty: Array<number> = [];
        let input = new collections.Uint8Array(empty);
        base64Helper.encodeToString(input);
        expect().assertFail();
      } catch (e) {
        let err = e as BusinessError;
        expect(Number(err.code)).assertEqual(401);
        expect(err.message.includes("greater than zero")).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_2500
     * @tc.name      testEncodeToStringSendableInt8Array04_0025
     * @tc.desc      [Exception] encodeToString with collections.Int8Array (wrong element type) throws error 401.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableInt8Array04_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSendableInt8Array04_0025";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new collections.Int8Array([72, 101, 108, 108, 111]) as ESObject as Uint8Array;
        base64Helper.encodeToString(input);
        expect().assertFail();
      } catch (e) {
        let err = e as BusinessError;
        expect(Number(err.code)).assertEqual(401);
        expect(err.message.includes("must be Uint8Array")).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_2600
     * @tc.name      testEncodeToStringSendableChinese04_0026
     * @tc.desc      [Content] Encode collections.Uint8Array holding UTF-8 bytes of "你好世界" via encodeToString.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableChinese04_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableChinese04_0026";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      // UTF-8 bytes of "你好世界": E4 BD A0 E5 A5 BD E4 B8 96 E7 95 8C
      let input = new collections.Uint8Array([228, 189, 160, 229, 165, 189, 228, 184, 150, 231, 149, 140]);
      let result = await base64Helper.encodeToString(input);
      expect(result).assertEqual("5L2g5aW95LiW55WM");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_2700
     * @tc.name      testEncodeToStringSendableAllBytes04_0027
     * @tc.desc      [Content] Encode collections.Uint8Array of all byte values 0-255 via encodeToString, equals plain result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableAllBytes04_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableAllBytes04_0027";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let allBytes: Array<number> = [];
      for (let i = 0; i <= 255; i++) {
        allBytes.push(i);
      }
      let sendableInput = new collections.Uint8Array(allBytes);
      let plainInput = new Uint8Array(allBytes);
      let sendableResult = await base64Helper.encodeToString(sendableInput);
      let plainResult = await base64Helper.encodeToString(plainInput);
      expect(sendableResult.length).assertEqual(344); // 256 bytes -> 344 base64 chars
      expect(sendableResult).assertEqual(plainResult);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_2800
     * @tc.name      testSendableTaskpoolEncodeInside04_0028
     * @tc.desc      [Concurrent] encodeToStringSync on collections.Uint8Array inside a taskpool task.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSendableTaskpoolEncodeInside04_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testSendableTaskpoolEncodeInside04_0028";
      console.info(TAG + " start");
      let result = await taskpool.execute(SendableEncodeSyncTask) as string;
      expect(result).assertEqual("SGVsbG8=");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_2900
     * @tc.name      testSendableTaskpoolPassBack04_0029
     * @tc.desc      [Concurrent] Encode a collections.Uint8Array returned from taskpool on the main thread.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSendableTaskpoolPassBack04_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testSendableTaskpoolPassBack04_0029";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let sendable = await taskpool.execute(MakeSendableArrayTask) as collections.Uint8Array;
      expect(sendable.length).assertEqual(5);
      let syncResult = base64Helper.encodeToStringSync(sendable);
      expect(syncResult).assertEqual("V29ybGQ=");
      let asyncResult = await base64Helper.encodeToString(sendable);
      expect(asyncResult).assertEqual("V29ybGQ=");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_3000
     * @tc.name      testSendableTaskpoolAsync04_0030
     * @tc.desc      [Concurrent] Await encodeToString on collections.Uint8Array inside a taskpool task.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSendableTaskpoolAsync04_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testSendableTaskpoolAsync04_0030";
      console.info(TAG + " start");
      let result = await taskpool.execute(SendableEncodeAsyncTask) as string;
      expect(result).assertEqual("SGVsbG8=");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_3100
     * @tc.name      testSendableTaskpoolParallel04_0031
     * @tc.desc      [Concurrent] Parallel taskpool tasks encoding different collections.Uint8Array inputs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSendableTaskpoolParallel04_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testSendableTaskpoolParallel04_0031";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let taskCount = 8;
      let tasks: Array<Promise<string>> = [];
      for (let i = 0; i < taskCount; i++) {
        tasks.push(taskpool.execute(SendableEncodeByIndexTask, i) as Promise<string>);
      }
      let results: Array<string> = await Promise.all(tasks);
      for (let i = 0; i < taskCount; i++) {
        let plainInput = new Uint8Array([65 + i, 66 + i, 67 + i]);
        let expected = base64Helper.encodeToStringSync(plainInput);
        expect(results[i]).assertEqual(expected);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_3200
     * @tc.name      testSendableLargeInput04_0032
     * @tc.desc      [Stress] Encode a 60000-byte collections.Uint8Array, result equals plain Uint8Array result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSendableLargeInput04_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testSendableLargeInput04_0032";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let size = 60000;
      let content: Array<number> = [];
      for (let i = 0; i < size; i++) {
        content.push(i % 256);
      }
      let sendableInput = new collections.Uint8Array(content);
      let plainInput = new Uint8Array(content);
      let syncResult = base64Helper.encodeToStringSync(sendableInput);
      expect(syncResult).assertEqual(base64Helper.encodeToStringSync(plainInput));
      expect(syncResult.length).assertEqual(80000); // 60000 bytes -> 80000 base64 chars
      let asyncResult = await base64Helper.encodeToString(sendableInput);
      expect(asyncResult).assertEqual(syncResult);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_3300
     * @tc.name      testSendableRepeatStability04_0033
     * @tc.desc      [Stress] Repeated encodeToStringSync/encodeToString calls on collections.Uint8Array are stable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSendableRepeatStability04_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testSendableRepeatStability04_0033";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([72, 101, 108, 108, 111]);
      for (let i = 0; i < 100; i++) {
        expect(base64Helper.encodeToStringSync(input)).assertEqual("SGVsbG8=");
      }
      for (let i = 0; i < 10; i++) {
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("SGVsbG8=");
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_3400
     * @tc.name      testEncodeToStringSendableFoobar04_0034
     * @tc.desc      [Content] Verify RFC 4648 test vector "foobar" with collections.Uint8Array input.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableFoobar04_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableFoobar04_0034";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([102, 111, 111, 98, 97, 114]); // "foobar"
      let result = await base64Helper.encodeToString(input);
      expect(result).assertEqual("Zm9vYmFy");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_3500
     * @tc.name      testEncodeToStringSendableNumbers04_0035
     * @tc.desc      [Content] Verify encoding ASCII numbers "123" with collections.Uint8Array input.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableNumbers04_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableNumbers04_0035";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([49, 50, 51]); // "123"
      let result = await base64Helper.encodeToString(input);
      expect(result).assertEqual("MTIz");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_3600
     * @tc.name      testEncodeToStringSendableSpecialChars04_0036
     * @tc.desc      [Content] Verify encoding ASCII special chars "!@#" with collections.Uint8Array input.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableSpecialChars04_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableSpecialChars04_0036";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([33, 64, 35]); // "!@#"
      let result = await base64Helper.encodeToString(input);
      expect(result).assertEqual("IUAj");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_3700
     * @tc.name      testEncodeToStringSendableControlChars04_0037
     * @tc.desc      [Content] Verify encoding control chars \n\r (10, 13) -> "Cg0=" with collections.Uint8Array input.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableControlChars04_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableControlChars04_0037";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([10, 13]); // "\n\r"
      let result = await base64Helper.encodeToString(input);
      expect(result).assertEqual("Cg0=");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_3800
     * @tc.name      testEncodeToStringSendableNullByte04_0038
     * @tc.desc      [Content] Verify encoding Null byte [0] -> "AA==" with collections.Uint8Array input.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableNullByte04_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableNullByte04_0038";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([0]);
      let result = await base64Helper.encodeToString(input);
      expect(result).assertEqual("AA==");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_3900
     * @tc.name      testEncodeToStringSendableEmoji04_0039
     * @tc.desc      [Content] Verify encoding Emoji bytes (Simulated UTF-8 bytes) with collections.Uint8Array input.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableEmoji04_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableEmoji04_0039";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([0xF0, 0x9F, 0x98, 0x80]); // UTF-8 bytes of an emoji
      let result = await base64Helper.encodeToString(input);
      expect(result).assertEqual("8J+YgA==");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_4000
     * @tc.name      testEncodeToStringSendableMimeUrlSafe04_0040
     * @tc.desc      [Option] MIME_URL_SAFE of collections.Uint8Array equals plain Uint8Array result, uses url-safe alphabet and '\r\n' breaks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableMimeUrlSafe04_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableMimeUrlSafe04_0040";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let mimeInput: Array<number> = [];
      for (let i = 0; i < 58; i++) {
        mimeInput.push(251); // 0xFB * 58 -> "-_v7" * 19 + "-w" in url-safe alphabet, no padding
      }
      let sendableInput = new collections.Uint8Array(mimeInput);
      let plainInput = new Uint8Array(mimeInput);
      let sendableResult = await base64Helper.encodeToString(sendableInput, util.Type.MIME_URL_SAFE);
      let plainResult = await base64Helper.encodeToString(plainInput, util.Type.MIME_URL_SAFE);
      let expected = "-_v7".repeat(19) + "\r\n" + "-w" + "\r\n";
      expect(sendableResult).assertEqual(plainResult);
      expect(sendableResult).assertEqual(expected);
      expect(sendableResult.includes("+")).assertFalse();
      expect(sendableResult.includes("/")).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_4100
     * @tc.name      testEncodeToStringSendableReturnType04_0041
     * @tc.desc      [Type] Verify return type of encodeToString with collections.Uint8Array input is actually a string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSendableReturnType04_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
      const TAG = "testEncodeToStringSendableReturnType04_0041";
      console.info(TAG + " start");
      let base64Helper = new util.Base64Helper();
      let input = new collections.Uint8Array([65]);
      let result = await base64Helper.encodeToString(input);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE64HELPER4_4200
     * @tc.name      testEncodeToStringSyncSendableMultiInstance04_0042
     * @tc.desc      [Instance] Multiple Base64Helper instances work independently and consistently on collections.Uint8Array input.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEncodeToStringSyncSendableMultiInstance04_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
      const TAG = "testEncodeToStringSyncSendableMultiInstance04_0042";
      console.info(TAG + " start");
      let helper1 = new util.Base64Helper();
      let helper2 = new util.Base64Helper();
      let input = new collections.Uint8Array([255]);
      let res1 = helper1.encodeToStringSync(input);
      let res2 = helper2.encodeToStringSync(input);
      expect(res1).assertEqual("/w==");
      expect(res2).assertEqual("/w==");
      expect(res1).assertEqual(res2);
      helper1.encodeToStringSync(new collections.Uint8Array([65]));
      let res = helper2.encodeToStringSync(new collections.Uint8Array([66]));
      expect(res).assertEqual("Qg==");
      console.info(TAG + " end");
    });
  })
}
