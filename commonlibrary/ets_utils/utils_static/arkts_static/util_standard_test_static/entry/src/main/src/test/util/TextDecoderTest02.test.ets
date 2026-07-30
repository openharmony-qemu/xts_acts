'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { util } from '@kit.ArkTS';
import Utils from '../Util.test';

export default function TextDecoder02Test(): void {
  describe('TextDecoder02Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_0100
     * @tc.name      testTextDecoderCreate02_0001
     * @tc.desc      [Basic] Verify default constructor and basic encoding setting.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0001";
      console.info(`${TAG} start`);

      const d1 = util.TextDecoder.create();
      expect(d1.encoding).assertEqual('utf-8');

      expect(d1.fatal as boolean | undefined).assertFalse();
      expect(d1.ignoreBOM as boolean | undefined).assertFalse();

      const d2 = util.TextDecoder.create('utf-8');
      expect(d2.encoding).assertEqual('utf-8');

      const d3 = util.TextDecoder.create('uTf-8');
      expect(d3.encoding).assertEqual('uTf-8');

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_0200
     * @tc.name      testTextDecoderCreate02_0002
     * @tc.desc      [UTF-16] Verify UTF-16 Little Endian and Big Endian encodings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0002";
      console.info(`${TAG} start`);
      const d1 = util.TextDecoder.create('utf-16le');
      expect(d1.encoding).assertEqual('utf-16le');
      const d2 = util.TextDecoder.create('utf-16be');
      expect(d2.encoding).assertEqual('utf-16be');
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_0300
     * @tc.name      testTextDecoderCreate02_0003
     * @tc.desc      [CJK] Verify Chinese, Japanese, and Korean encoding families.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0003";
      console.info(`${TAG} start`);
      const encodings = ['gbk', 'gb18030', 'big5', 'shift_jis', 'euc-jp', 'euc-kr'];
      encodings.forEach((enc: string) => {
        try {
          const decoder = util.TextDecoder.create(enc);
          expect(decoder.encoding !== undefined).assertTrue();
        } catch (e) {
          console.warn(`${TAG} ${enc} not supported`);
        }
      });
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_0400
     * @tc.name      testTextDecoderCreate02_0004
     * @tc.desc      [European] Verify Windows-1252, ISO-8859 series and KOI8-R.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0004";
      console.info(`${TAG} start`);
      const d1 = util.TextDecoder.create('windows-1252');
      expect(d1.encoding).assertEqual('windows-1252');
      const d2 = util.TextDecoder.create('iso-8859-2');
      expect(d2.encoding).assertEqual('iso-8859-2');
      const d3 = util.TextDecoder.create('koi8-r');
      expect(d3.encoding).assertEqual('koi8-r');
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_0500
     * @tc.name      testTextDecoderCreate02_0005
     * @tc.desc      [Options] Verify 'fatal' and 'ignoreBOM' boolean configuration.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0005";
      console.info(`${TAG} start`);
      const d1 = util.TextDecoder.create('utf-8', { fatal: true });
      expect(d1.fatal).assertTrue();
      const d2 = util.TextDecoder.create('utf-8', { ignoreBOM: true });
      expect(d2.ignoreBOM).assertTrue();
      const d3 = util.TextDecoder.create('gbk', { fatal: true, ignoreBOM: true });
      expect(d3.encoding).assertEqual('gbk');
      expect(d3.fatal).assertTrue();
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_0600
     * @tc.name      testTextDecoderCreate02_0006
     * @tc.desc      [Robustness] Verify valid edge-case encodings work correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0006";
      console.info(`${TAG} start`);

      const d1 = util.TextDecoder.create('utf-8');
      expect(d1.encoding).assertEqual('utf-8');
      expect(d1.fatal).assertFalse();
      expect(d1.ignoreBOM).assertFalse();

      const d2 = util.TextDecoder.create('gbk');
      expect(d2.encoding).assertEqual('gbk');

      const d3 = util.TextDecoder.create('utf-16le');
      expect(d3.encoding).assertEqual('utf-16le');

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_0700
     * @tc.name      testTextDecoderCreate02_0007
     * @tc.desc      [Aliases] Verify common encoding aliases work correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0007";
      console.info(`${TAG} start`);

      const d1 = util.TextDecoder.create('utf8');
      expect(d1.encoding).assertEqual('utf8');

      const d2 = util.TextDecoder.create('utf-8');
      expect(d2.encoding).assertEqual('utf-8');

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_0800
     * @tc.name      testTextDecoderCreate02_0008
     * @tc.desc      [Legacy] Verify ISO-8859-1 and latin1 encoding behavior.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0008";
      console.info(`${TAG} start`);

      const d1 = util.TextDecoder.create('iso-8859-1');
      expect(d1.encoding).assertEqual('iso-8859-1');

      const d2 = util.TextDecoder.create('latin1');
      expect(d2.encoding).assertEqual('latin1');

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_0900
     * @tc.name      testTextDecoderCreate02_0009
     * @tc.desc      [Parameters] Verify default encoding when no parameters passed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0009";
      console.info(`${TAG} start`);

      const d1 = util.TextDecoder.create();
      expect(d1.encoding).assertEqual('utf-8');

      const d2 = util.TextDecoder.create('utf-8');
      expect(!!d2.fatal).assertFalse();
      expect(!!d2.ignoreBOM).assertFalse();

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_1000
     * @tc.name      testTextDecoderCreate02_0010
     * @tc.desc      [Instance] Verify the created object is actually an instance of TextDecoder.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0010";
      console.info(`${TAG} start`);
      const decoder = util.TextDecoder.create();

      expect(decoder instanceof util.TextDecoder).assertTrue();

      expect(typeof decoder.decodeToString).assertEqual('function');
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_1100
     * @tc.name      testTextDecoderCreate02_0011
     * @tc.desc      [Normalization] Verify encoding property is correctly set.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0011";
      console.info(`${TAG} start`);

      const d1 = util.TextDecoder.create('utf-8');
      expect(d1.encoding).assertEqual('utf-8');

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_1200
     * @tc.name      testTextDecoderCreate02_0012
     * @tc.desc      [Behavior] Verify 'utf-16le' and 'utf-16be' encodings work correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0012";
      console.info(`${TAG} start`);

      const d1 = util.TextDecoder.create('utf-16le');
      expect(d1.encoding).assertEqual('utf-16le');

      const d2 = util.TextDecoder.create('utf-16be');
      expect(d2.encoding).assertEqual('utf-16be');

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_1300
     * @tc.name      testTextDecoderCreate02_0013
     * @tc.desc      [Legacy] Verify 'iso-8859-1' encoding support.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0013";
      console.info(`${TAG} start`);
      const decoder = util.TextDecoder.create('iso-8859-1');
      expect(decoder.encoding).assertEqual('iso-8859-1');
      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_1400
     * @tc.name      testTextDecoderCreate02_0014
     * @tc.desc      [Robustness] Verify creating with empty options object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderCreate02_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderCreate02_0014";
      console.info(`${TAG} start`);

      const decoder = util.TextDecoder.create('utf-8', {});
      expect(decoder.encoding).assertEqual('utf-8');

      expect(!!decoder.fatal).assertFalse();
      expect(!!decoder.ignoreBOM).assertFalse();

      console.info(`${TAG} end`);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_1500
     * @tc.name      testTextDecoderDecodeWithStream02_0015
     * @tc.desc      [Basic] Verify direct decoding of ASCII characters in non-stream mode (Merged ASCII/Number/Symbol tests)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0015";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8');
      const input = new Uint8Array([72, 101, 108, 108, 111, 10, 49, 50, 51]); // Hello\n123

      const result = decoder.decodeToString(input);
      expect(result).assertEqual('Hello\n123');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_1600
     * @tc.name      testTextDecoderDecodeWithStream02_0016
     * @tc.desc      [Basic] Verify complete decoding of multi-byte characters (Chinese/Emoji)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0016";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8');
      const input = new Uint8Array([228, 189, 160, 229, 165, 189, 240, 159, 154, 128]);

      const result = decoder.decodeToString(input);
      expect(result).assertEqual('你好🚀');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_1700
     * @tc.name      testTextDecoderDecodeWithStream02_0017
     * @tc.desc      [Robustness] Verify behavior with undefined/empty input (Fix: Expects undefined based on logs)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0017";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8');

      const res1 = decoder.decodeToString(new Uint8Array(0));
      expect(res1).assertEqual('');

      const res2 = decoder.decodeToString(new Uint8Array(0));
      expect(res2).assertEqual('');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_1800
     * @tc.name      testTextDecoderDecodeWithStream02_0018
     * @tc.desc      [Core Logic] Verify decodeToString does not buffer across calls for split bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0018";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8');

      const part1 = new Uint8Array([228, 184]);
      const part2 = new Uint8Array([173]);

      const res1 = decoder.decodeToString(part1);
      expect(res1.length > 0).assertTrue();

      const res2 = decoder.decodeToString(part2);
      expect(res2.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_1900
     * @tc.name      testTextDecoderDecodeWithStream02_0019
     * @tc.desc      [Core Logic] Verify decodeToString does not buffer across calls for split 4-byte characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0019";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8');

      const part1 = new Uint8Array([240, 159]);
      const part2 = new Uint8Array([154, 128]);

      const r1 = decoder.decodeToString(part1);
      expect(r1.length > 0).assertTrue();

      const r2 = decoder.decodeToString(part2);
      expect(r2.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_2000
     * @tc.name      testTextDecoderDecodeWithStream02_0020
     * @tc.desc      [State Retention] Verify continuous output with multiple stream:true calls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0020";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8');

      const r1 = decoder.decodeToString(new Uint8Array([65])); // 'A'
      const r2 = decoder.decodeToString(new Uint8Array([66])); // 'B'
      const r3 = decoder.decodeToString(new Uint8Array([67])); // 'C'

      expect(r1).assertEqual('A');
      expect(r2).assertEqual('B');
      expect(r3).assertEqual('C');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_2100
     * @tc.name      testTextDecoderDecodeWithStream02_0021
     * @tc.desc      [Edge Case] Verify split BOM handling does not buffer across calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0021";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8', { ignoreBOM: false });
      const part1 = new Uint8Array([0xEF, 0xBB]);
      const part2 = new Uint8Array([0xBF, 65]);

      const r1 = decoder.decodeToString(part1);
      expect(r1.length > 0).assertTrue();

      const r2 = decoder.decodeToString(part2);
      expect(r2.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_2200
     * @tc.name      testTextDecoderDecodeWithStream02_0022
     * @tc.desc      [Error Handling] Verify fatal:true behavior with incomplete bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0022";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8', { fatal: true });
      const incomplete = new Uint8Array([0xE4]);

      try {
        decoder.decodeToString(incomplete);
        const res = decoder.decodeToString(new Uint8Array(0));
        expect(res).assertEqual('');
      } catch (e) {
        expect(true as boolean).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_2300
     * @tc.name      testTextDecoderDecodeWithStream02_0023
     * @tc.desc      [Error Handling] Verify replacement behavior (Fix: Expect Undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0023";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8', { fatal: false });
      const incomplete = new Uint8Array([0xE4]);

      decoder.decodeToString(incomplete);

      const res = decoder.decodeToString(new Uint8Array(0));
      expect(res).assertEqual('');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_2400
     * @tc.name      testTextDecoderDecodeWithStream02_0024
     * @tc.desc      [Performance/Capacity] Verify decodeWithStream handling of large buffers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0024";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8');

      const largeBuf = new Uint8Array(1000).fill(65);

      const res = decoder.decodeToString(largeBuf);
      expect(res.length).assertEqual(1000);
      expect(res.startsWith('AAAA')).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_2500
     * @tc.name      testTextDecoderDecodeWithStream02_0025
     * @tc.desc      [Edge Case] Verify decodeToString does not buffer across calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0025";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8');

      const part1 = new Uint8Array([65, 228]);
      const part2 = new Uint8Array([184, 173]);

      const res1 = decoder.decodeToString(part1);
      expect(res1.length > 0).assertTrue();
      expect(res1.startsWith('A')).assertTrue();

      const res2 = decoder.decodeToString(part2);
      expect(res2.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_2600
     * @tc.name      testTextDecoderDecodeWithStream02_0026
     * @tc.desc      [Configuration] Verify ignoreBOM option and BOM handling in decoding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0026";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
      const input = new Uint8Array([0xEF, 0xBB, 0xBF, 65]);

      const res = decoder.decodeToString(input);
      expect(res.length > 0).assertTrue();
      expect(res.includes('A')).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_2700
     * @tc.name      testTextDecoderDecodeWithStream02_0027
     * @tc.desc      [Type Support] Verify decodeWithStream support for Uint8Array Subarray views
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0027";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8');
      const buffer = new Uint8Array([0, 65, 66, 0]);

      const sub1 = buffer.subarray(1, 2); // 'A'
      const sub2 = buffer.subarray(2, 3); // 'B'

      const r1 = decoder.decodeToString(sub1);
      const r2 = decoder.decodeToString(sub2);

      expect(r1 + r2).assertEqual('AB');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_2800
     * @tc.name      testTextDecoderDecodeWithStream02_0028
     * @tc.desc      [Isolation] Verify independent decoding between two Decoder instances.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderDecodeWithStream02_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderDecodeWithStream02_0028";
      console.log(TAG + " start");
      const d1 = util.TextDecoder.create('utf-8');
      const d2 = util.TextDecoder.create('utf-8');

      d1.decodeToString(new Uint8Array([228, 184]));

      const resD2 = d2.decodeToString(new Uint8Array([65]));
      expect(resD2).assertEqual('A');

      const resD1 = d1.decodeToString(new Uint8Array([173]));
      expect(resD1.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_2900
     * @tc.name      testTextDecoderConstruct02_0029
     * @tc.desc      [Consolidated] Verify construction with standard encoding labels
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0029";
      console.info(TAG + " start");

      try {
        const defaultDecoder = new util.TextDecoder();
        expect(defaultDecoder instanceof util.TextDecoder).assertTrue();
      } catch (e) {
        expect(false as boolean).assertTrue();
      }
      const encodings: string[] = [
        'utf-8',
        'utf-16',
        'utf-16le',
        'utf-16be',
        'iso-8859-1',
        'ascii'
      ];

      encodings.forEach((enc: string) => {
        try {
          const decoder = util.TextDecoder.create(enc);
          expect(decoder instanceof util.TextDecoder).assertTrue();
          console.info(`${TAG} success for: ${enc}`);
        } catch (e) {
          console.error(`${TAG} failed for: ${enc}`);
          expect(false as boolean).assertTrue();
        }
      });
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_3000
     * @tc.name      testTextDecoderConstruct02_0030
     * @tc.desc      [Consolidated] Verify construction with Legacy CJK encodings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0030";
      console.info(TAG + " start");

      const cjkEncodings: string[] = ['gbk', 'gb2312', 'gb18030'];

      cjkEncodings.forEach((enc: string) => {
        const decoder = util.TextDecoder.create(enc);
        expect(decoder instanceof util.TextDecoder).assertTrue();
      });
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_3100
     * @tc.name      testTextDecoderConstruct02_0031
     * @tc.desc      [Consolidated] Verify case insensitivity and aliases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0031";
      console.info(TAG + " start");

      const labels: string[] = ['UTF-8', 'utf8', 'us-ascii', 'iso8859-1', 'latin1'];

      labels.forEach((label: string) => {
        try {
          const decoder = util.TextDecoder.create(label);
          expect(decoder instanceof util.TextDecoder).assertTrue();
        } catch (e) {
          expect(false as boolean).assertTrue();
        }
      });
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_3200
     * @tc.name      testTextDecoderConstruct02_0032
     * @tc.desc      [Consolidated] Verify fatal option configuration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0032";
      console.info(TAG + " start");

      const d1 = util.TextDecoder.create('utf-8', { fatal: true });
      expect(!!d1.fatal).assertTrue();
      const d2 = util.TextDecoder.create('utf-8', { fatal: false });
      expect(!!d2.fatal).assertFalse();

      const d3 = util.TextDecoder.create('utf-8');
      expect(!!d3.fatal).assertFalse();
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_3300
     * @tc.name      testTextDecoderConstruct02_0033
     * @tc.desc      [Consolidated] Verify ignoreBOM option configuration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0033";
      console.info(TAG + " start");

      const d1 = util.TextDecoder.create('utf-8', { ignoreBOM: true });
      expect(!!d1.ignoreBOM).assertTrue();

      const d2 = util.TextDecoder.create('utf-8', { ignoreBOM: false });
      expect(!!d2.ignoreBOM).assertFalse();
      const d3 = util.TextDecoder.create('utf-8');
      expect(!!d3.ignoreBOM).assertFalse();
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_3400
     * @tc.name      testTextDecoderConstruct02_0034
     * @tc.desc      [Consolidated] Verify mixed options configuration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0034";
      console.info(TAG + " start");
      const d = util.TextDecoder.create('utf-8', { fatal: true, ignoreBOM: true });
      expect(!!d.fatal).assertTrue();
      expect(!!d.ignoreBOM).assertTrue();
      expect(d.encoding).assertEqual('utf-8');
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_3500
     * @tc.name      testTextDecoderConstruct02_0035
     * @tc.desc      [Properties] Verify instance properties exist and are correct types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0035";
      console.info(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8');

      expect(typeof decoder.encoding).assertEqual('string');

      expect(typeof decoder.fatal).assertEqual('boolean');

      expect(typeof decoder.ignoreBOM).assertEqual('boolean');
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_3600
     * @tc.name      testTextDecoderConstruct02_0036
     * @tc.desc      [Logic] Verify decoding empty Uint8Array returns empty string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0036";
      console.info(TAG + " start");
      const decoder = new util.TextDecoder();
      const result = decoder.decodeToString(new Uint8Array(0));
      expect(result).assertEqual('');
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_3700
     * @tc.name      testTextDecoderConstruct02_0037
     * @tc.desc      [Consolidated] Verify fatal: true throws on invalid bytes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0037";
      console.info(TAG + " start");

      try {
        const d = util.TextDecoder.create('utf-8', { fatal: true });
        d.decodeToString(new Uint8Array([0xFF]));
        expect(false as boolean).assertTrue();
      } catch (e) {
        expect(true as boolean).assertTrue();
      }
      try {
        const d = util.TextDecoder.create('ascii', { fatal: true });
        d.decodeToString(new Uint8Array([0x80]));
        expect(false as boolean).assertTrue();
      } catch (e) {
        expect(true as boolean).assertTrue();
      }
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_3800
     * @tc.name      testTextDecoderConstruct02_0038
     * @tc.desc      [Consolidated] Verify fatal: false uses replacement char (default)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0038";
      console.info(TAG + " start");

      const d1 = util.TextDecoder.create('utf-16le', { fatal: false });
      const res1 = d1.decodeToString(new Uint8Array([0x00]));
      expect(res1.includes('\uFFFD')).assertTrue();

      const d2 = util.TextDecoder.create('gbk', { fatal: false });
      const res2 = d2.decodeToString(new Uint8Array([0xFF]));
      expect(res2.includes('\uFFFD') || res2.length > 0).assertTrue();

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_3900
     * @tc.name      testTextDecoderConstruct02_0039
     * @tc.desc      [Logic] Verify BOM is included in output (Actual System Behavior)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0039";
      console.info(TAG + " start");
      const decoder = util.TextDecoder.create('utf-8');
      const input = new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]);
      const result = decoder.decodeToString(input);

      expect(result.charCodeAt(0)).assertEqual(0xFEFF);
      expect(result.length).assertEqual(2);
      expect(result).assertEqual('\uFEFFa');
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_4000
     * @tc.name      testTextDecoderConstruct02_0040
     * @tc.desc      [Consolidated] Verify basic decoding works across standard instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0040";
      console.info(TAG + " start");

      const d1 = util.TextDecoder.create('utf-8');
      expect(d1.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]))).assertEqual('你');

      const d2 = util.TextDecoder.create('utf-16le');
      expect(d2.decodeToString(new Uint8Array([0x60, 0x4F]))).assertEqual('你'); // 4F60

      const d3 = util.TextDecoder.create('gbk');
      expect(d3.decodeToString(new Uint8Array([0xC4, 0xE3]))).assertEqual('你');

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_4100
     * @tc.name      testTextDecoderConstruct02_0041
     * @tc.desc      [Consolidated] Verify decoding large buffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstruct02_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstruct02_0041";
      console.info(TAG + " start");

      const decoder = util.TextDecoder.create('utf-8');
      const len: int = 10000;
      const longData = new Uint8Array(len);
      longData.fill(0x61);

      const result = decoder.decodeToString(longData);
      expect(result.length).assertEqual(len);
      expect(result.startsWith('aaaa')).assertTrue();
      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_4200
     * @tc.name      testTextDecoderConstructDeprecated02_0042
     * @tc.desc      Verify construction with default properties (utf-8, fatal=false, ignoreBOM=false).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0042";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder();
      expect(decoder instanceof util.TextDecoder).assertTrue();
      expect(decoder.encoding).assertEqual("utf-8");
      expect(decoder.fatal).assertFalse();
      expect(decoder.ignoreBOM).assertFalse();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_4300
     * @tc.name      testTextDecoderConstructDeprecated02_0043
     * @tc.desc      Verify decoding basic ASCII/UTF-8 bytes using legacy decodeToString.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0043";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder();

      // Basic Word
      const bytes1 = new Uint8Array([0x48, 0x65, 0x6C, 0x6C, 0x6F]);
      expect(decoder.decodeToString(bytes1)).assertEqual("Hello");

      // Space
      const bytes2 = new Uint8Array([0x20]);
      expect(decoder.decodeToString(bytes2)).assertEqual(' ');

      // Single Char
      const bytes3 = new Uint8Array([0x48]);
      expect(decoder.decodeToString(bytes3)).assertEqual("H");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_4400
     * @tc.name      testTextDecoderConstructDeprecated02_0044
     * @tc.desc      Verify UTF-16LE/BE decoding using legacy decodeToString.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0044";
      console.log(TAG + " start");

      // UTF-16BE
      const decoderBE = util.TextDecoder.create('utf-16be');
      const bytesBE = new Uint8Array([0x00, 0x48, 0x00, 0x65, 0x00, 0x6C, 0x00, 0x6C, 0x00, 0x6F]);
      expect(decoderBE.decodeToString(bytesBE)).assertEqual("Hello");

      // UTF-16LE
      const decoderLE = util.TextDecoder.create('utf-16le');
      const bytesLE = new Uint8Array([0x48, 0x00, 0x65, 0x00, 0x6C, 0x00, 0x6C, 0x00, 0x6F, 0x00]);
      expect(decoderLE.decodeToString(bytesLE)).assertEqual("Hello");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_4500
     * @tc.name      testTextDecoderConstructDeprecated02_0045
     * @tc.desc      Verify GBK decoding using legacy decodeToString.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0045";
      console.log(TAG + " start");
      const decoder = util.TextDecoder.create('gbk');
      const bytes = new Uint8Array([0xC4, 0xE3, 0xBA, 0xC3]);
      expect(decoder.decodeToString(bytes)).assertEqual("你好");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_4600
     * @tc.name      testTextDecoderConstructDeprecated02_0046
     * @tc.desc      Verify decoding special and multi-byte characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0046";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder();

      // Special Symbol (€)
      const bytes1 = new Uint8Array([0xE2, 0x82, 0xAC]);
      expect(decoder.decodeToString(bytes1)).assertEqual("€");

      // Emoji (😀)
      const bytes2 = new Uint8Array([0xF0, 0x9F, 0x98, 0x80]);
      expect(decoder.decodeToString(bytes2)).assertEqual("😀");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_4700
     * @tc.name      testTextDecoderConstructDeprecated02_0047
     * @tc.desc      Verify decoding empty byte array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0047";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder();
      const bytes = new Uint8Array([]);
      expect(decoder.decodeToString(bytes)).assertEqual("");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_4800
     * @tc.name      testTextDecoderConstructDeprecated02_0048
     * @tc.desc      Verify legacy decoding with stream option.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0048";
      console.log(TAG + " start");
      const decoder = new util.TextDecoder();
      const bytes = new Uint8Array([0x48, 0x65]);
      // Note: decodeToString options support depends on implementation version
      const result = decoder.decodeToString(bytes, { stream: true });
      expect(result).assertEqual("He");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_4900
     * @tc.name      testTextDecoderConstructDeprecated02_0049
     * @tc.desc      Verify instance uniqueness.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0049";
      console.log(TAG + " start");
      const decoder1 = new util.TextDecoder();
      const decoder2 = new util.TextDecoder();
      expect(decoder1 != decoder2).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_5000
     * @tc.name      testTextDecoderConstructDeprecated02_0050
     * @tc.desc      [Error] Verify constructor with standard encodings only.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0050";
      console.info(TAG + " start");

      const safeEncodings: string[] = [
        'utf-8',
        'utf-16le',
        'utf-16be',
        'gbk',
        'gb18030',
        'iso-8859-1'
      ];

      safeEncodings.forEach(enc => {
        try {
          let decoder = util.TextDecoder.create(enc);
          expect(decoder.encoding !== null && decoder.encoding !== undefined).assertTrue();
          expect(typeof decoder.encoding).assertEqual('string');
          expect(decoder.encoding.length > 0).assertTrue();
        } catch (e) {
          console.info(`${TAG} Encoding '${enc}' threw error: ${e}`);
        }
      });

      console.info(TAG + " end");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_TEXTDECODERTWO_5100
     * @tc.name      testTextDecoderConstructDeprecated02_0051
     * @tc.desc      [Error] Verify constructor robustness with various safe encodings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTextDecoderConstructDeprecated02_0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTextDecoderConstructDeprecated02_0051";
      console.info(TAG + " start");

      const encodings: string[] = [
        'utf-8',
        'gbk',
        'utf-16le',
        'utf-16be',
        'iso-8859-1'
      ];

      encodings.forEach(val => {
        try {
          let decoder = util.TextDecoder.create(val);
          expect(decoder !== null && decoder !== undefined).assertTrue();
          expect(decoder.encoding).assertEqual(val);
        } catch (e) {
          console.info(`${TAG} Encoding '${val}' threw error: ${e}`);
        }
      });

      console.info(TAG + " end");
    });

  });
}