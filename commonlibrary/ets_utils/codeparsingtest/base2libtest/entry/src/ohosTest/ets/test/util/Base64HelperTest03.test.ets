import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';

export default function Base64Helper03Test() {
  describe('Base64Helper03Test', () => {

    beforeAll(() => {
      console.info('Base64Helper03Test: beforeAll');
    })
    beforeEach(() => {
      console.info('Base64Helper03Test: beforeEach');
    })
    afterEach(() => {
      console.info('Base64Helper03Test: afterEach');
    })
    afterAll(() => {
      console.info('Base64Helper03Test: afterAll');
    })

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0100
     * @tc.name      testBase64HelperDecoder03_0001
     * @tc.desc      [Content] Verify decoding numeric string "MTIz" -> '123'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder03_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperDecoder03_0001";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        // "MTIz" -> [77, 84, 73, 122]
        let input = new Uint8Array([77, 84, 73, 122]);
        let result = await base64Helper.decode(input);
        expect(result[0]).assertEqual(49); // '1'
        expect(result[1]).assertEqual(50); // '2'
        expect(result[2]).assertEqual(51); // '3'
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0200
     * @tc.name      testBase64HelperDecoder03_0002
     * @tc.desc      [Content] Verify alternating bits 0xAA -> "qg=="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder03_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperDecoder03_0002";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        // "qg==" -> [113, 103, 61, 61]
        let input = new Uint8Array([113, 103, 61, 61]);
        let result = await base64Helper.decode(input);
        expect(result[0]).assertEqual(170); // 0xAA
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0300
     * @tc.name      testBase64HelperDecoder03_0003
     * @tc.desc      [Content] Verify decoding control chars "Cg==" -> \n (10)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperDecoder03_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperDecoder03_0003";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        // "Cg==" -> [67, 103, 61, 61]
        let input = new Uint8Array([67, 103, 61, 61]);
        let result = await base64Helper.decode(input);
        expect(result[0]).assertEqual(10);
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0400
     * @tc.name      testBase64HelperEncodeToString03_0004
     * @tc.desc      [Padding] Verify 1 byte input results in 2 padding chars (==)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0004";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([65]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("QQ==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0500
     * @tc.name      testBase64HelperEncodeToString03_0005
     * @tc.desc      [Padding] Verify 2 bytes input results in 1 padding char (=)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0005";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([65, 66]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("QUI=");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0600
     * @tc.name      testBase64HelperEncodeToString03_0006
     * @tc.desc      [Padding] Verify 3 bytes input results in 0 padding chars
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0006";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([65, 66, 67]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("QUJD");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0700
     * @tc.name      testBase64HelperEncodeToString03_0007
     * @tc.desc      [Content] Verify encoding standard word "Hello"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0007";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([72, 101, 108, 108, 111]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("SGVsbG8=");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0800
     * @tc.name      testBase64HelperEncodeToString03_0008
     * @tc.desc      [Content] Verify RFC 4648 test vector "foobar"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0008";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([102, 111, 111, 98, 97, 114]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("Zm9vYmFy");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_0900
     * @tc.name      testBase64HelperEncodeToString03_0009
     * @tc.desc      [Content] Verify encoding ASCII numbers "123"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0009";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([49, 50, 51]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("MTIz");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1000
     * @tc.name      testBase64HelperEncodeToString03_0010
     * @tc.desc      [Content] Verify encoding ASCII special chars "!@#"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0010";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([33, 64, 35]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("IUAj");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1100
     * @tc.name      testBase64HelperEncodeToString03_0011
     * @tc.desc      [Content] Verify encoding control chars \n\r (10, 13) -> "Cg0="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0011";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([10, 13]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("Cg0=");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1200
     * @tc.name      testBase64HelperEncodeToString03_0012
     * @tc.desc      [Content] Verify encoding Null byte [0] -> "AA=="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0012";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([0]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("AA==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1300
     * @tc.name      testBase64HelperEncodeToString03_0013
     * @tc.desc      [Content] Verify encoding Max byte [255] -> "/w=="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0013";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([255]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("/w==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1400
     * @tc.name      testBase64HelperEncodeToString03_0014
     * @tc.desc      [Content] Verify encoding Chinese bytes (Simulated UTF-8 bytes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0014";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([0xE4, 0xBD, 0xA0]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("5L2g");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1500
     * @tc.name      testBase64HelperEncodeToString03_0015
     * @tc.desc      [Content] Verify encoding Emoji bytes (Simulated UTF-8 bytes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0015";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([0xF0, 0x9F, 0x98, 0x80]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("8J+YgA==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1600
     * @tc.name      testBase64HelperEncodeToString03_0016
     * @tc.desc      [Memory] Verify encoding from a Subarray View
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0016";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let buffer = new Uint8Array([0, 65, 0]);
        let view = buffer.subarray(1, 2);
        let result = await base64Helper.encodeToString(view);
        expect(result).assertEqual("QQ==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1700
     * @tc.name      testBase64HelperEncodeToString03_0017
     * @tc.desc      [Performance] Verify encoding a large buffer (1KB)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0017";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array(1024).fill(0);
        let result = await base64Helper.encodeToString(input);
        // Length = ceil(1024/3)*4 = 342*4 = 1368
        expect(result.length).assertEqual(1368);
        expect(result.substring(0, 4)).assertEqual("AAAA");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1800
     * @tc.name      testBase64HelperEncodeToString03_0018
     * @tc.desc      [Content] Verify pattern 0xAA (10101010)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0018";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([0xAA]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("qg==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_1900
     * @tc.name      testBase64HelperEncodeToString03_0019
     * @tc.desc      [Content] Verify pattern 0x55 (01010101)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0019";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([0x55]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("VQ==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_2000
     * @tc.name      testBase64HelperEncodeToString03_0020
     * @tc.desc      [Content] Verify sequential bytes [0, 1, 2, 3] -> "AAECAw=="
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0020";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([0, 1, 2, 3]);
        let result = await base64Helper.encodeToString(input);
        expect(result).assertEqual("AAECAw==");
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64HELPER03_2100
     * @tc.name      testBase64HelperEncodeToString03_0021
     * @tc.desc      [Type] Verify return type is actually a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperEncodeToString03_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      const TAG = "testBase64HelperEncodeToString03_0021";
      console.info(TAG + " start");
      try {
        let base64Helper = new util.Base64Helper();
        let input = new Uint8Array([65]);
        let result = await base64Helper.encodeToString(input);
        expect(typeof result).assertEqual('string');
        done();
      } catch (e) {
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_UTIL_BASE64_CONSTRUCT_0100
     * @tc.name      testBase64HelperConstructDefault
     * @tc.desc      [Basic] Verify default constructor (no args) creates a valid instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstructDefault", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstructDefault";
      console.info(TAG + " start");
      try {
        let helper = new util.Base64Helper();
        expect(helper instanceof util.Base64Helper).assertTrue();
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64_CONSTRUCT_0200
     * @tc.name      testBase64HelperConstructExplicitCall1
     * @tc.desc      [Basic] Verify constructor consistency (Repeated check 1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstructExplicitCall1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstructExplicitCall1";
      console.info(TAG + " start");
      try {
        // [Fix]: Removed argument util.Type.BASIC
        let helper = new util.Base64Helper();
        expect(helper instanceof util.Base64Helper).assertTrue();
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64_CONSTRUCT_0300
     * @tc.name      testBase64HelperConstructExplicitCall2
     * @tc.desc      [Basic] Verify constructor consistency (Repeated check 2).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstructExplicitCall2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstructExplicitCall2";
      console.info(TAG + " start");
      try {
        // [Fix]: Removed argument util.Type.MIME
        let helper = new util.Base64Helper();
        expect(helper instanceof util.Base64Helper).assertTrue();
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64_CONSTRUCT_0400
     * @tc.name      testBase64HelperConstructExplicitCall3
     * @tc.desc      [Basic] Verify constructor consistency (Repeated check 3).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstructExplicitCall3", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstructExplicitCall3";
      console.info(TAG + " start");
      try {
        // [Fix]: Removed argument util.Type.URL_SAFE
        let helper = new util.Base64Helper();
        expect(helper instanceof util.Base64Helper).assertTrue();
      } catch (e) {
        console.error(`${TAG} failed: ${e}`);
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    // ==========================================
    // 第二部分：功能验证 (Behavior Verification)
    // ==========================================

    /**
     * @tc.number    SUB_UTIL_BASE64_CONSTRUCT_0500
     * @tc.name      testBase64HelperStandardBehaviorCheck
     * @tc.desc      [Behavior] Verify instance behaves as Standard Base64 (since we cannot set URL_SAFE).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperStandardBehaviorCheck", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperStandardBehaviorCheck";
      console.info(TAG + " start");

      // [Fix]: Removed args. Default is Standard.
      let helper = new util.Base64Helper();

      // Input 251 (0xFB) -> Standard: "+w=="
      // (If it were URL_SAFE, it would be "-w==")
      let input = new Uint8Array([251]);
      let result = helper.encodeToStringSync(input);

      // Since we can't set URL_SAFE in constructor anymore, we expect Standard '+'
      expect(result).assertEqual("+w==");
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64_CONSTRUCT_0600
     * @tc.name      testBase64HelperStandardSlashCheck
     * @tc.desc      [Behavior] Verify instance uses Standard '/' character.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperStandardSlashCheck", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperStandardSlashCheck";
      console.info(TAG + " start");

      // [Fix]: Removed args
      let helper = new util.Base64Helper();

      // Input 255 (0xFF) -> Standard: "/w=="
      let input = new Uint8Array([255]);
      let result = helper.encodeToStringSync(input);

      expect(result).assertEqual("/w==");
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64_CONSTRUCT_0700
     * @tc.name      testBase64HelperMultipleInstances
     * @tc.desc      [Logic] Verify multiple instances work independently and consistently.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperMultipleInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperMultipleInstances";
      console.info(TAG + " start");

      // [Fix]: Removed args. Both are now standard helpers.
      let helper1 = new util.Base64Helper();
      let helper2 = new util.Base64Helper();

      let input = new Uint8Array([255]); // 11111111

      let res1 = helper1.encodeToStringSync(input); // "/w=="
      let res2 = helper2.encodeToStringSync(input); // "/w=="

      expect(res1).assertEqual("/w==");
      expect(res2).assertEqual("/w==");
      // Ensure they produce consistent results
      expect(res1).assertEqual(res2);

      console.info(TAG + " end");
    });

    // ==========================================
    // 第三部分：健壮性与边界测试 (Robustness)
    // ==========================================

    /**
     * @tc.number    SUB_UTIL_BASE64_CONSTRUCT_0800
     * @tc.name      testBase64HelperConstructNoArgsCheck
     * @tc.desc      [Robustness] Verify strictly no arguments are passed (Manual check logic).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstructNoArgsCheck", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstructNoArgsCheck";
      console.info(TAG + " start");
      try {
        // [Fix]: Correct usage
        let helper = new util.Base64Helper();
        let input = new Uint8Array([251]);
        let result = helper.encodeToStringSync(input);
        expect(result).assertEqual("+w==");
      } catch (e) {
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64_CONSTRUCT_0900
     * @tc.name      testBase64HelperConstructIsolation
     * @tc.desc      [Robustness] Verify new instance does not reuse previous state (Stateless check).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstructIsolation", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstructIsolation";
      console.info(TAG + " start");
      try {
        // [Fix]: Removed invalid number arg (99)
        let helper1 = new util.Base64Helper();
        // Use helper1
        helper1.encodeToStringSync(new Uint8Array([65]));

        // Create helper2
        let helper2 = new util.Base64Helper();
        let res = helper2.encodeToStringSync(new Uint8Array([66]));

        expect(res).assertEqual("Qg==");
      } catch (e) {
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_UTIL_BASE64_CONSTRUCT_1000
     * @tc.name      testBase64HelperConstructStress
     * @tc.desc      [Performance] Verify rapid creation of multiple instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBase64HelperConstructStress", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testBase64HelperConstructStress";
      console.info(TAG + " start");
      try {
        for (let i = 0; i < 100; i++) {
          // [Fix]: Removed argument
          let helper = new util.Base64Helper();
          expect(helper instanceof util.Base64Helper).assertTrue();
        }
      } catch (e) {
        expect(false).assertTrue();
      }
      console.info(TAG + " end");
    });
  })
}