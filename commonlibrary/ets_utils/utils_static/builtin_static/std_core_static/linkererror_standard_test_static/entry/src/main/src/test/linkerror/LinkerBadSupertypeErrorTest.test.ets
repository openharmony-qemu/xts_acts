'use static'

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
} from '../../../../hypium/index'
import Utils from '../Util.test'

function isErr(o: Object): boolean {
  return o instanceof Error;
}

function isLinkerErr(o: Object): boolean {
  return o instanceof LinkerError;
}

function isSelf(o: Object): boolean {
  return o instanceof LinkerBadSupertypeError;
}

export default function linkerBadSupertypeErrorTest(): void {
  describe('LinkerBadSupertypeErrorTest', (): void => {
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
     * @tc.name testLinkerBadSupertypeError001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_0100
     * @tc.desc Verify no-arg constructor sets correct name and empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError();
      expect(err.name).assertEqual('LinkerBadSupertypeError');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerBadSupertypeError002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_0200
     * @tc.desc Verify message-only constructor stores message and correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError('test message');
      expect(err.name).assertEqual('LinkerBadSupertypeError');
      expect(err.message).assertEqual('test message');
    })

    /**
     * @tc.name testLinkerBadSupertypeError003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_0300
     * @tc.desc Verify message+cause constructor stores both correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new Error('root cause');
      let err = new LinkerBadSupertypeError('msg', { cause: cause } as ErrorOptions);
      expect(err.name).assertEqual('LinkerBadSupertypeError');
      expect(err.message).assertEqual('msg');
      expect(err.cause === cause).assertTrue();
    })

    /**
     * @tc.name testLinkerBadSupertypeError004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_0400
     * @tc.desc Verify message and explicit undefined options accepts undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError('msg', undefined);
      expect(err.name).assertEqual('LinkerBadSupertypeError');
      expect(err.message).assertEqual('msg');
    })

    /**
     * @tc.name testLinkerBadSupertypeError005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_0500
     * @tc.desc Verify undefined message and explicit empty options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError(undefined, {});
      expect(err.message).assertEqual('');
      expect(err.cause === undefined).assertTrue();
    })

    /**
     * @tc.name testLinkerBadSupertypeError006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_0600
     * @tc.desc Verify empty string message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError('');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerBadSupertypeError007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_0700
     * @tc.desc Verify undefined message yields empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError(undefined);
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerBadSupertypeError008
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_0800
     * @tc.desc Verify single character message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError('A');
      expect(err.message).assertEqual('A');
    })

    /**
     * @tc.name testLinkerBadSupertypeError009
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_0900
     * @tc.desc Verify whitespace-only message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wsMsg = '     ';
      let err = new LinkerBadSupertypeError(wsMsg);
      expect(err.message).assertEqual(wsMsg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError010
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_1000
     * @tc.desc Verify tab message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError('\t');
      expect(err.message).assertEqual('\t');
    })

    /**
     * @tc.name testLinkerBadSupertypeError011
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_1100
     * @tc.desc Verify newline escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nl = '\n';
      let err = new LinkerBadSupertypeError(nl);
      expect(err.message).assertEqual(nl);
    })

    /**
     * @tc.name testLinkerBadSupertypeError012
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_1200
     * @tc.desc Verify carriage return escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cr = '\r';
      let err = new LinkerBadSupertypeError(cr);
      expect(err.message).assertEqual(cr);
    })

    /**
     * @tc.name testLinkerBadSupertypeError013
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_1300
     * @tc.desc Verify zero-width space as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsp = '​';
      let err = new LinkerBadSupertypeError(zwsp);
      expect(err.message).assertEqual(zwsp);
      expect(err.message.length).assertEqual(1);
    })

    /**
     * @tc.name testLinkerBadSupertypeError014
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_1400
     * @tc.desc Verify 65535-char message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg = 'A'.repeat(65535);
      let err = new LinkerBadSupertypeError(longMsg);
      expect(err.message).assertEqual(longMsg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError015
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_1500
     * @tc.desc Verify Number.MAX_VALUE.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxStr = Number.MAX_VALUE.toString();
      let err = new LinkerBadSupertypeError(maxStr);
      expect(err.message).assertEqual(maxStr);
    })

    /**
     * @tc.name testLinkerBadSupertypeError016
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_1600
     * @tc.desc Verify Number.MAX_SAFE_INTEGER.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let safeStr = Number.MAX_SAFE_INTEGER.toString();
      let err = new LinkerBadSupertypeError(safeStr);
      expect(err.message).assertEqual(safeStr);
    })

    /**
     * @tc.name testLinkerBadSupertypeError017
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_1700
     * @tc.desc Verify Chinese message is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg = '中文测试';
      let err = new LinkerBadSupertypeError(msg);
      expect(err.message).assertEqual(msg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError018
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_1800
     * @tc.desc Verify emoji message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiMsg = '😀😁';
      let err = new LinkerBadSupertypeError(emojiMsg);
      expect(err.message).assertEqual(emojiMsg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError019
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_1900
     * @tc.desc Verify RTL text message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtlMsg = '‮عربي';
      let err = new LinkerBadSupertypeError(rtlMsg);
      expect(err.message).assertEqual(rtlMsg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError020
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_2000
     * @tc.desc Verify fullwidth message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fwMsg = 'ＡＢＣ';
      let err = new LinkerBadSupertypeError(fwMsg);
      expect(err.message).assertEqual(fwMsg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError021
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_2100
     * @tc.desc Verify ASCII math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '+-*/';
      let err = new LinkerBadSupertypeError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError022
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_2200
     * @tc.desc Verify Unicode math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '∑∫∞';
      let err = new LinkerBadSupertypeError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError023
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_2300
     * @tc.desc Verify Japanese message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jpMsg = 'テスト';
      let err = new LinkerBadSupertypeError(jpMsg);
      expect(err.message).assertEqual(jpMsg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError024
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_2400
     * @tc.desc Verify Korean message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let krMsg = '테스트';
      let err = new LinkerBadSupertypeError(krMsg);
      expect(err.message).assertEqual(krMsg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError025
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_2500
     * @tc.desc Verify Russian message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ruMsg = 'АБВГД';
      let err = new LinkerBadSupertypeError(ruMsg);
      expect(err.message).assertEqual(ruMsg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError026
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_2600
     * @tc.desc Verify Arabic message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arMsg = 'الاختبار';
      let err = new LinkerBadSupertypeError(arMsg);
      expect(err.message).assertEqual(arMsg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError027
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_2700
     * @tc.desc Verify mixed Latin and Chinese message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixMsg = 'Test 測試';
      let err = new LinkerBadSupertypeError(mixMsg);
      expect(err.message).assertEqual(mixMsg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError028
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_2800
     * @tc.desc Verify XSS string as message preserves special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssMsg = '<script>alert(1)</script>';
      let err = new LinkerBadSupertypeError(xssMsg);
      expect(err.message).assertEqual(xssMsg);
    })

    /**
     * @tc.name testLinkerBadSupertypeError029
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_2900
     * @tc.desc Verify special punctuation as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let punct = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      let err = new LinkerBadSupertypeError(punct);
      expect(err.message).assertEqual(punct);
    })

    /**
     * @tc.name testLinkerBadSupertypeError030
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_3000
     * @tc.desc Verify Unicode replacement character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rp = '�';
      let err = new LinkerBadSupertypeError(rp);
      expect(err.message).assertEqual(rp);
    })

    /**
     * @tc.name testLinkerBadSupertypeError031
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_3100
     * @tc.desc Verify illegal Unicode non-character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nc = '￾';
      let err = new LinkerBadSupertypeError(nc);
      expect(err.message).assertEqual(nc);
    })

    /**
     * @tc.name testLinkerBadSupertypeError032
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_3200
     * @tc.desc Verify lone surrogate character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lone = '\udc04';
      let err = new LinkerBadSupertypeError(lone);
      expect(err.message).assertEqual(lone);
    })

    /**
     * @tc.name testLinkerBadSupertypeError033
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_3300
     * @tc.desc Verify mojibake garbled text as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gb = 'æµè¯';
      let err = new LinkerBadSupertypeError(gb);
      expect(err.message).assertEqual(gb);
    })

    /**
     * @tc.name testLinkerBadSupertypeError034
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_3400
     * @tc.desc Verify Map as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapMsg = new Map<string, string>();
      try {
        let err = new LinkerBadSupertypeError(mapMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e)).assertEqual(true);
      }
    })

    /**
     * @tc.name testLinkerBadSupertypeError035
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_3500
     * @tc.desc Verify Set as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setMsg = new Set<string>();
      try {
        let err = new LinkerBadSupertypeError(setMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e)).assertEqual(true);
      }
    })

    /**
     * @tc.name testLinkerBadSupertypeError036
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_3600
     * @tc.desc Verify Date as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateMsg = new Date();
      try {
        let err = new LinkerBadSupertypeError(dateMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e)).assertEqual(true);
      }
    })

    /**
     * @tc.name testLinkerBadSupertypeError037
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_3700
     * @tc.desc Verify RegExp as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let regMsg = new RegExp('test', 'gi');
      try {
        let err = new LinkerBadSupertypeError(regMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e)).assertEqual(true);
      }
    })

    /**
     * @tc.name testLinkerBadSupertypeError038
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_3800
     * @tc.desc Verify Function as cause is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fnCause: Object = ((): void => {
      }) as Object;
      try {
        throw new LinkerBadSupertypeError('msg', { cause: fnCause as Object as Error } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e)).assertEqual(true);
      }
    })

    /**
     * @tc.name testLinkerBadSupertypeError039
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_3900
     * @tc.desc Verify NaN as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanOpts: ErrorOptions = { cause: NaN as Object };
      let err = new LinkerBadSupertypeError('msg', nanOpts);
      expect(isErr(err as Object)).assertEqual(true);
      expect(isNaN(err.cause as number)).assertTrue();
    })

    /**
     * @tc.name testLinkerBadSupertypeError040
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_4000
     * @tc.desc Verify Infinity as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infOpts: ErrorOptions = { cause: Infinity as Object };
      let err = new LinkerBadSupertypeError('msg', infOpts);
      expect(isErr(err as Object)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerBadSupertypeError041
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_4100
     * @tc.desc Verify message property is writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError('original');
      err.message = 'modified';
      expect(err.message).assertEqual('modified');
    })

    /**
     * @tc.name testLinkerBadSupertypeError042
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_4200
     * @tc.desc Verify multi-instance independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1 = new LinkerBadSupertypeError('msg1', { cause: new Error('c1') } as ErrorOptions);
      let err2 = new LinkerBadSupertypeError('msg2', { cause: new Error('c2') } as ErrorOptions);
      expect(err1.message).assertEqual('msg1');
      expect(err2.message).assertEqual('msg2');
      expect(err1.cause !== err2.cause).assertTrue();
    })

    /**
     * @tc.name testLinkerBadSupertypeError043
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_4300
     * @tc.desc Verify instanceof self type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerBadSupertypeError('msg');
      expect(isSelf(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerBadSupertypeError044
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_4400
     * @tc.desc Verify instanceof LinkerError parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerBadSupertypeError('msg');
      expect(isLinkerErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerBadSupertypeError045
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_4500
     * @tc.desc Verify instanceof Error parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerBadSupertypeError('msg');
      expect(isErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerBadSupertypeError046
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_4600
     * @tc.desc Verify throw-catch with no-arg preserves name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerBadSupertypeError();
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('LinkerBadSupertypeError');
      }
    })

    /**
     * @tc.name testLinkerBadSupertypeError047
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_4700
     * @tc.desc Verify throw-catch with message preserves name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerBadSupertypeError('thrown msg');
        expect().assertFail();
      } catch (e) {
        expect((e as LinkerBadSupertypeError).name).assertEqual('LinkerBadSupertypeError');
        expect((e as LinkerBadSupertypeError).message).assertEqual('thrown msg');
      }
    })

    /**
     * @tc.name testLinkerBadSupertypeError048
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_4800
     * @tc.desc Verify throw-catch with message and cause preserves full chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('root');
      try {
        throw new LinkerBadSupertypeError('msg', { cause: root } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).cause === root).assertTrue();
        expect(((e as Error).cause as Error).message).assertEqual('root');
      }
    })

    /**
     * @tc.name testLinkerBadSupertypeError049
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_4900
     * @tc.desc Verify stack contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError('msg');
      let stack = err.stack as string;
      expect(stack.length > 0).assertTrue();
    })

    /**
     * @tc.name testLinkerBadSupertypeError050
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_5000
     * @tc.desc Verify toString format is ClassName: message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError('format test');
      expect(err.toString()).assertEqual('LinkerBadSupertypeError: format test');
    })

    /**
     * @tc.name testLinkerBadSupertypeError051
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_5100
     * @tc.desc Verify single-level cause chain with Error cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Error('root cause');
      let outer = new LinkerBadSupertypeError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as Error).message).assertEqual('root cause');
    })

    /**
     * @tc.name testLinkerBadSupertypeError052
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_5200
     * @tc.desc Verify single-level cause chain with TypeError cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new TypeError('type error');
      let outer = new LinkerBadSupertypeError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as TypeError).message).assertEqual('type error');
    })

    /**
     * @tc.name testLinkerBadSupertypeError053
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_5300
     * @tc.desc Verify cause chain with LinkerError as cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new LinkerError('inner');
      let outer = new LinkerBadSupertypeError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as LinkerError).name).assertEqual('LinkerError');
    })

    /**
     * @tc.name testLinkerBadSupertypeError054
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_5400
     * @tc.desc Verify 3-level same-type cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3 = new LinkerBadSupertypeError('level3');
      let l2 = new LinkerBadSupertypeError('level2', { cause: l3 } as ErrorOptions);
      let l1 = new LinkerBadSupertypeError('level1', { cause: l2 } as ErrorOptions);
      expect((l1.cause as LinkerBadSupertypeError).message).assertEqual('level2');
      expect(((l1.cause as LinkerBadSupertypeError).cause as LinkerBadSupertypeError).message).assertEqual('level3');
    })

    /**
     * @tc.name testLinkerBadSupertypeError055
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_5500
     * @tc.desc Verify 5-level deep cause chain with full traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('depth0');
      let current: Object = root;
      for (let d = 1; d <= 5; d++) {
        current = new LinkerBadSupertypeError('depth' + d, { cause: current as Object as Error } as ErrorOptions) as LinkerError;
      }
      expect((current as LinkerError).name).assertEqual('LinkerBadSupertypeError');
      let walk: Object = current;
      for (let d = 5; d >= 1; d--) {
        expect((walk as LinkerError).message).assertEqual('depth' + d);
        walk = (walk as LinkerError).cause as Object;
      }
    })

    /**
     * @tc.name testLinkerBadSupertypeError056
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_5600
     * @tc.desc Verify try-catch wrapping preserves cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapped: Error = new Error('root failure');
      try {
        throw wrapped;
      } catch (e1) {
        wrapped = new LinkerBadSupertypeError('wrapper', { cause: e1 as Error } as ErrorOptions);
      }
      expect((wrapped as LinkerBadSupertypeError).name).assertEqual('LinkerBadSupertypeError');
      expect((wrapped as LinkerBadSupertypeError).message).assertEqual('wrapper');
      expect(((wrapped as LinkerBadSupertypeError).cause as Error).message).assertEqual('root failure');
    })

    /**
     * @tc.name testLinkerBadSupertypeError057
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_5700
     * @tc.desc Verify string value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError('msg', { cause: 'string cause' as Object } as ErrorOptions);
      expect(err.cause).assertEqual('string cause');
    })

    /**
     * @tc.name testLinkerBadSupertypeError058
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_5800
     * @tc.desc Verify number value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError('msg', { cause: 42 as Object } as ErrorOptions);
      expect(err.cause).assertEqual(42);
    })

    /**
     * @tc.name testLinkerBadSupertypeError059
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_5900
     * @tc.desc Verify boolean value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError('msg', { cause: true as Object } as ErrorOptions);
      expect(err.cause).assertEqual(true);
    })

    /**
     * @tc.name testLinkerBadSupertypeError060
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_BAD_SUPERTYPE_ERROR_6000
     * @tc.desc Verify undefined cause results in undefined cause property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerBadSupertypeError060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerBadSupertypeError('msg', { cause: undefined } as ErrorOptions);
      expect(err.cause).assertUndefined();
    })

  })
}
