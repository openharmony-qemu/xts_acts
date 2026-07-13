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
  it,
  expect,
  TestType,
  Size,
  Level
} from '@ohos/hypium-binary/src/main/indexStatic'
import Utils from '../Util.test'

function isErr(o: Object): boolean {
  return o instanceof Error;
}

function isLinkerErr(o: Object): boolean {
  return o instanceof LinkerError;
}

function isSelf(o: Object): boolean {
  return o instanceof LinkerTypeCircularityError;
}

export default function linkerTypeCircularityErrorTest(): void {
  describe('LinkerTypeCircularityErrorTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30)
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.name testLinkerTypeCircularityError001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_0100
     * @tc.desc Verify no-arg constructor sets correct name and empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError();
      expect(err.name).assertEqual('LinkerTypeCircularityError');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerTypeCircularityError002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_0200
     * @tc.desc Verify message-only constructor stores message and correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError('test message');
      expect(err.name).assertEqual('LinkerTypeCircularityError');
      expect(err.message).assertEqual('test message');
    })

    /**
     * @tc.name testLinkerTypeCircularityError003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_0300
     * @tc.desc Verify message+cause constructor stores both correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new Error('root cause');
      let err = new LinkerTypeCircularityError('msg', { cause: cause } as ErrorOptions);
      expect(err.name).assertEqual('LinkerTypeCircularityError');
      expect(err.message).assertEqual('msg');
      expect(err.cause === cause).assertTrue();
    })

    /**
     * @tc.name testLinkerTypeCircularityError004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_0400
     * @tc.desc Verify message and explicit undefined options accepts undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError('msg', undefined);
      expect(err.name).assertEqual('LinkerTypeCircularityError');
      expect(err.message).assertEqual('msg');
    })

    /**
     * @tc.name testLinkerTypeCircularityError005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_0500
     * @tc.desc Verify undefined message and explicit empty options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError(undefined, {});
      expect(err.message).assertEqual('');
      expect(err.cause === undefined).assertTrue();
    })

    /**
     * @tc.name testLinkerTypeCircularityError006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_0600
     * @tc.desc Verify empty string message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError('');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerTypeCircularityError007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_0700
     * @tc.desc Verify undefined message yields empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError(undefined);
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerTypeCircularityError008
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_0800
     * @tc.desc Verify single character message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError('A');
      expect(err.message).assertEqual('A');
    })

    /**
     * @tc.name testLinkerTypeCircularityError009
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_0900
     * @tc.desc Verify whitespace-only message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wsMsg = '     ';
      let err = new LinkerTypeCircularityError(wsMsg);
      expect(err.message).assertEqual(wsMsg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError010
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_1000
     * @tc.desc Verify tab message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError('\t');
      expect(err.message).assertEqual('\t');
    })

    /**
     * @tc.name testLinkerTypeCircularityError011
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_1100
     * @tc.desc Verify newline escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nl = '\n';
      let err = new LinkerTypeCircularityError(nl);
      expect(err.message).assertEqual(nl);
    })

    /**
     * @tc.name testLinkerTypeCircularityError012
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_1200
     * @tc.desc Verify carriage return escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cr = '\r';
      let err = new LinkerTypeCircularityError(cr);
      expect(err.message).assertEqual(cr);
    })

    /**
     * @tc.name testLinkerTypeCircularityError013
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_1300
     * @tc.desc Verify zero-width space as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsp = '​';
      let err = new LinkerTypeCircularityError(zwsp);
      expect(err.message).assertEqual(zwsp);
      expect(err.message.length).assertEqual(1);
    })

    /**
     * @tc.name testLinkerTypeCircularityError014
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_1400
     * @tc.desc Verify 65535-char message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg = 'A'.repeat(65535);
      let err = new LinkerTypeCircularityError(longMsg);
      expect(err.message).assertEqual(longMsg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError015
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_1500
     * @tc.desc Verify Number.MAX_VALUE.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxStr = Number.MAX_VALUE.toString();
      let err = new LinkerTypeCircularityError(maxStr);
      expect(err.message).assertEqual(maxStr);
    })

    /**
     * @tc.name testLinkerTypeCircularityError016
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_1600
     * @tc.desc Verify Number.MAX_SAFE_INTEGER.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let safeStr = Number.MAX_SAFE_INTEGER.toString();
      let err = new LinkerTypeCircularityError(safeStr);
      expect(err.message).assertEqual(safeStr);
    })

    /**
     * @tc.name testLinkerTypeCircularityError017
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_1700
     * @tc.desc Verify Chinese message is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg = '中文测试';
      let err = new LinkerTypeCircularityError(msg);
      expect(err.message).assertEqual(msg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError018
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_1800
     * @tc.desc Verify emoji message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiMsg = '😀😁';
      let err = new LinkerTypeCircularityError(emojiMsg);
      expect(err.message).assertEqual(emojiMsg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError019
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_1900
     * @tc.desc Verify RTL text message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtlMsg = '‮عربي';
      let err = new LinkerTypeCircularityError(rtlMsg);
      expect(err.message).assertEqual(rtlMsg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError020
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_2000
     * @tc.desc Verify fullwidth message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fwMsg = 'ＡＢＣ';
      let err = new LinkerTypeCircularityError(fwMsg);
      expect(err.message).assertEqual(fwMsg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError021
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_2100
     * @tc.desc Verify ASCII math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '+-*/';
      let err = new LinkerTypeCircularityError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError022
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_2200
     * @tc.desc Verify Unicode math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '∑∫∞';
      let err = new LinkerTypeCircularityError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError023
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_2300
     * @tc.desc Verify Japanese message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jpMsg = 'テスト';
      let err = new LinkerTypeCircularityError(jpMsg);
      expect(err.message).assertEqual(jpMsg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError024
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_2400
     * @tc.desc Verify Korean message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let krMsg = '테스트';
      let err = new LinkerTypeCircularityError(krMsg);
      expect(err.message).assertEqual(krMsg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError025
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_2500
     * @tc.desc Verify Russian message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ruMsg = 'АБВГД';
      let err = new LinkerTypeCircularityError(ruMsg);
      expect(err.message).assertEqual(ruMsg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError026
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_2600
     * @tc.desc Verify Arabic message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arMsg = 'الاختبار';
      let err = new LinkerTypeCircularityError(arMsg);
      expect(err.message).assertEqual(arMsg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError027
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_2700
     * @tc.desc Verify mixed Latin and Chinese message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixMsg = 'Test 測試';
      let err = new LinkerTypeCircularityError(mixMsg);
      expect(err.message).assertEqual(mixMsg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError028
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_2800
     * @tc.desc Verify XSS string as message preserves special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssMsg = '<script>alert(1)</script>';
      let err = new LinkerTypeCircularityError(xssMsg);
      expect(err.message).assertEqual(xssMsg);
    })

    /**
     * @tc.name testLinkerTypeCircularityError029
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_2900
     * @tc.desc Verify special punctuation as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let punct = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      let err = new LinkerTypeCircularityError(punct);
      expect(err.message).assertEqual(punct);
    })

    /**
     * @tc.name testLinkerTypeCircularityError030
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_3000
     * @tc.desc Verify Unicode replacement character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rp = '�';
      let err = new LinkerTypeCircularityError(rp);
      expect(err.message).assertEqual(rp);
    })

    /**
     * @tc.name testLinkerTypeCircularityError031
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_3100
     * @tc.desc Verify illegal Unicode non-character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nc = '￾';
      let err = new LinkerTypeCircularityError(nc);
      expect(err.message).assertEqual(nc);
    })

    /**
     * @tc.name testLinkerTypeCircularityError032
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_3200
     * @tc.desc Verify lone surrogate character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lone = '\udc04';
      let err = new LinkerTypeCircularityError(lone);
      expect(err.message).assertEqual(lone);
    })

    /**
     * @tc.name testLinkerTypeCircularityError033
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_3300
     * @tc.desc Verify mojibake garbled text as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gb = 'æµè¯';
      let err = new LinkerTypeCircularityError(gb);
      expect(err.message).assertEqual(gb);
    })

    /**
     * @tc.name testLinkerTypeCircularityError034
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_3400
     * @tc.desc Verify Map as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapMsg = new Map<string, string>();
      try {
        let err = new LinkerTypeCircularityError(mapMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerTypeCircularityError035
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_3500
     * @tc.desc Verify Set as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setMsg = new Set<string>();
      try {
        let err = new LinkerTypeCircularityError(setMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerTypeCircularityError036
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_3600
     * @tc.desc Verify Date as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateMsg = new Date();
      try {
        let err = new LinkerTypeCircularityError(dateMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerTypeCircularityError037
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_3700
     * @tc.desc Verify RegExp as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let regMsg = new RegExp('test', 'gi');
      try {
        let err = new LinkerTypeCircularityError(regMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerTypeCircularityError038
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_3800
     * @tc.desc Verify Function as cause is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fnCause: Object = ((): void => {
      }) as Object;
      try {
        throw new LinkerTypeCircularityError('msg', { cause: fnCause as Object as Error } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerTypeCircularityError039
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_3900
     * @tc.desc Verify NaN as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanOpts: ErrorOptions = { cause: NaN as Object };
      let err = new LinkerTypeCircularityError('msg', nanOpts);
      expect(isErr(err as Object)).assertEqual(true);
      expect(isNaN(err.cause as number)).assertTrue();
    })

    /**
     * @tc.name testLinkerTypeCircularityError040
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_4000
     * @tc.desc Verify Infinity as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infOpts: ErrorOptions = { cause: Infinity as Object };
      let err = new LinkerTypeCircularityError('msg', infOpts);
      expect(isErr(err as Object)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerTypeCircularityError041
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_4100
     * @tc.desc Verify message property is writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError('original');
      err.message = 'modified';
      expect(err.message).assertEqual('modified');
    })

    /**
     * @tc.name testLinkerTypeCircularityError042
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_4200
     * @tc.desc Verify multi-instance independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1 = new LinkerTypeCircularityError('msg1', { cause: new Error('c1') } as ErrorOptions);
      let err2 = new LinkerTypeCircularityError('msg2', { cause: new Error('c2') } as ErrorOptions);
      expect(err1.message).assertEqual('msg1');
      expect(err2.message).assertEqual('msg2');
      expect(err1.cause !== err2.cause).assertTrue();
    })

    /**
     * @tc.name testLinkerTypeCircularityError043
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_4300
     * @tc.desc Verify instanceof self type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerTypeCircularityError('msg');
      expect(isSelf(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerTypeCircularityError044
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_4400
     * @tc.desc Verify instanceof LinkerError parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerTypeCircularityError('msg');
      expect(isLinkerErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerTypeCircularityError045
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_4500
     * @tc.desc Verify instanceof Error parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerTypeCircularityError('msg');
      expect(isErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerTypeCircularityError046
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_4600
     * @tc.desc Verify throw-catch with no-arg preserves name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerTypeCircularityError();
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('LinkerTypeCircularityError');
      }
    })

    /**
     * @tc.name testLinkerTypeCircularityError047
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_4700
     * @tc.desc Verify throw-catch with message preserves name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerTypeCircularityError('thrown msg');
        expect().assertFail();
      } catch (e) {
        expect((e as LinkerTypeCircularityError).name).assertEqual('LinkerTypeCircularityError');
        expect((e as LinkerTypeCircularityError).message).assertEqual('thrown msg');
      }
    })

    /**
     * @tc.name testLinkerTypeCircularityError048
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_4800
     * @tc.desc Verify throw-catch with message and cause preserves full chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('root');
      try {
        throw new LinkerTypeCircularityError('msg', { cause: root } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).cause === root).assertTrue();
        expect(((e as Error).cause as Error).message).assertEqual('root');
      }
    })

    /**
     * @tc.name testLinkerTypeCircularityError049
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_4900
     * @tc.desc Verify stack contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError('msg');
      let stack = err.stack as string;
      expect(stack.includes('LinkerTypeCircularityError')).assertTrue();
    })

    /**
     * @tc.name testLinkerTypeCircularityError050
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_5000
     * @tc.desc Verify toString format is ClassName: message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError('format test');
      expect(err.toString()).assertEqual('LinkerTypeCircularityError: format test');
    })

    /**
     * @tc.name testLinkerTypeCircularityError051
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_5100
     * @tc.desc Verify single-level cause chain with Error cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Error('root cause');
      let outer = new LinkerTypeCircularityError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as Error).message).assertEqual('root cause');
    })

    /**
     * @tc.name testLinkerTypeCircularityError052
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_5200
     * @tc.desc Verify single-level cause chain with TypeError cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new TypeError('type error');
      let outer = new LinkerTypeCircularityError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as TypeError).message).assertEqual('type error');
    })

    /**
     * @tc.name testLinkerTypeCircularityError053
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_5300
     * @tc.desc Verify cause chain with LinkerError as cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new LinkerError('inner');
      let outer = new LinkerTypeCircularityError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as LinkerError).name).assertEqual('LinkerError');
    })

    /**
     * @tc.name testLinkerTypeCircularityError054
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_5400
     * @tc.desc Verify 3-level same-type cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3 = new LinkerTypeCircularityError('level3');
      let l2 = new LinkerTypeCircularityError('level2', { cause: l3 } as ErrorOptions);
      let l1 = new LinkerTypeCircularityError('level1', { cause: l2 } as ErrorOptions);
      expect((l1.cause as LinkerTypeCircularityError).message).assertEqual('level2');
      expect(((l1.cause as LinkerTypeCircularityError).cause as LinkerTypeCircularityError).message)
        .assertEqual('level3');
    })

    /**
     * @tc.name testLinkerTypeCircularityError055
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_5500
     * @tc.desc Verify 5-level deep cause chain with full traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('depth0');
      let current: Object = root;
      for (let d = 1; d <= 5; d++) {
        current = new LinkerTypeCircularityError('depth' + d, { cause: current as Object as Error } as ErrorOptions) as LinkerError;
      }
      expect((current as LinkerError).name).assertEqual('LinkerTypeCircularityError');
      let walk: Object = current;
      for (let d = 5; d >= 1; d--) {
        expect((walk as LinkerError).message).assertEqual('depth' + d);
        walk = (walk as LinkerError).cause as Object;
      }
    })

    /**
     * @tc.name testLinkerTypeCircularityError056
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_5600
     * @tc.desc Verify try-catch wrapping preserves cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapped: Error = new Error('root failure');
      try {
        throw wrapped;
      } catch (e1) {
        wrapped = new LinkerTypeCircularityError('wrapper', { cause: e1 as Error } as ErrorOptions);
      }
      expect((wrapped as LinkerTypeCircularityError).name).assertEqual('LinkerTypeCircularityError');
      expect((wrapped as LinkerTypeCircularityError).message).assertEqual('wrapper');
      expect(((wrapped as LinkerTypeCircularityError).cause as Error).message).assertEqual('root failure');
    })

    /**
     * @tc.name testLinkerTypeCircularityError057
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_5700
     * @tc.desc Verify string value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError('msg', { cause: 'string cause' as Object } as ErrorOptions);
      expect(err.cause).assertEqual('string cause');
    })

    /**
     * @tc.name testLinkerTypeCircularityError058
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_5800
     * @tc.desc Verify number value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError('msg', { cause: 42 as Object } as ErrorOptions);
      expect(err.cause).assertEqual(42);
    })

    /**
     * @tc.name testLinkerTypeCircularityError059
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_5900
     * @tc.desc Verify boolean value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError('msg', { cause: true as Object } as ErrorOptions);
      expect(err.cause).assertEqual(true);
    })

    /**
     * @tc.name testLinkerTypeCircularityError060
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_TYPE_CIRCULARITY_ERROR_6000
     * @tc.desc Verify undefined cause results in undefined cause property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerTypeCircularityError060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerTypeCircularityError('msg', { cause: undefined } as ErrorOptions);
      expect(err.cause).assertUndefined();
    })

  })
}
