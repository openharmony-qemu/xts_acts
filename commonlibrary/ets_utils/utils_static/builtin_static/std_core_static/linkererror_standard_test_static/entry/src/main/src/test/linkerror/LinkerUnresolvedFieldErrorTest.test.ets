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
  return o instanceof LinkerUnresolvedFieldError;
}

export default function linkerUnresolvedFieldErrorTest(): void {
  describe('LinkerUnresolvedFieldErrorTest', (): void => {
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
     * @tc.name testLinkerUnresolvedFieldError001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_0100
     * @tc.desc Verify no-arg constructor sets correct name and empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError();
      expect(err.name).assertEqual('LinkerUnresolvedFieldError');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_0200
     * @tc.desc Verify message-only constructor stores message and correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError('test message');
      expect(err.name).assertEqual('LinkerUnresolvedFieldError');
      expect(err.message).assertEqual('test message');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_0300
     * @tc.desc Verify message+cause constructor stores both correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new Error('root cause');
      let err = new LinkerUnresolvedFieldError('msg', { cause: cause } as ErrorOptions);
      expect(err.name).assertEqual('LinkerUnresolvedFieldError');
      expect(err.message).assertEqual('msg');
      expect(err.cause === cause).assertTrue();
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_0400
     * @tc.desc Verify message and explicit undefined options accepts undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError('msg', undefined);
      expect(err.name).assertEqual('LinkerUnresolvedFieldError');
      expect(err.message).assertEqual('msg');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_0500
     * @tc.desc Verify undefined message and explicit empty options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError(undefined, {});
      expect(err.message).assertEqual('');
      expect(err.cause === undefined).assertTrue();
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_0600
     * @tc.desc Verify empty string message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError('');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_0700
     * @tc.desc Verify undefined message yields empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError(undefined);
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError008
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_0800
     * @tc.desc Verify single character message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError('A');
      expect(err.message).assertEqual('A');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError009
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_0900
     * @tc.desc Verify whitespace-only message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wsMsg = '     ';
      let err = new LinkerUnresolvedFieldError(wsMsg);
      expect(err.message).assertEqual(wsMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError010
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_1000
     * @tc.desc Verify tab message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError('\t');
      expect(err.message).assertEqual('\t');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError011
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_1100
     * @tc.desc Verify newline escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nl = '\n';
      let err = new LinkerUnresolvedFieldError(nl);
      expect(err.message).assertEqual(nl);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError012
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_1200
     * @tc.desc Verify carriage return escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cr = '\r';
      let err = new LinkerUnresolvedFieldError(cr);
      expect(err.message).assertEqual(cr);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError013
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_1300
     * @tc.desc Verify zero-width space as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsp = '​';
      let err = new LinkerUnresolvedFieldError(zwsp);
      expect(err.message).assertEqual(zwsp);
      expect(err.message.length).assertEqual(1);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError014
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_1400
     * @tc.desc Verify 65535-char message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg = 'A'.repeat(65535);
      let err = new LinkerUnresolvedFieldError(longMsg);
      expect(err.message).assertEqual(longMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError015
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_1500
     * @tc.desc Verify Number.MAX_VALUE.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxStr = Number.MAX_VALUE.toString();
      let err = new LinkerUnresolvedFieldError(maxStr);
      expect(err.message).assertEqual(maxStr);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError016
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_1600
     * @tc.desc Verify Number.MAX_SAFE_INTEGER.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let safeStr = Number.MAX_SAFE_INTEGER.toString();
      let err = new LinkerUnresolvedFieldError(safeStr);
      expect(err.message).assertEqual(safeStr);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError017
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_1700
     * @tc.desc Verify Chinese message is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg = '中文测试';
      let err = new LinkerUnresolvedFieldError(msg);
      expect(err.message).assertEqual(msg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError018
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_1800
     * @tc.desc Verify emoji message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiMsg = '😀😁';
      let err = new LinkerUnresolvedFieldError(emojiMsg);
      expect(err.message).assertEqual(emojiMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError019
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_1900
     * @tc.desc Verify RTL text message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtlMsg = '‮عربي';
      let err = new LinkerUnresolvedFieldError(rtlMsg);
      expect(err.message).assertEqual(rtlMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError020
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_2000
     * @tc.desc Verify fullwidth message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fwMsg = 'ＡＢＣ';
      let err = new LinkerUnresolvedFieldError(fwMsg);
      expect(err.message).assertEqual(fwMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError021
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_2100
     * @tc.desc Verify ASCII math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '+-*/';
      let err = new LinkerUnresolvedFieldError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError022
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_2200
     * @tc.desc Verify Unicode math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '∑∫∞';
      let err = new LinkerUnresolvedFieldError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError023
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_2300
     * @tc.desc Verify Japanese message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jpMsg = 'テスト';
      let err = new LinkerUnresolvedFieldError(jpMsg);
      expect(err.message).assertEqual(jpMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError024
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_2400
     * @tc.desc Verify Korean message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let krMsg = '테스트';
      let err = new LinkerUnresolvedFieldError(krMsg);
      expect(err.message).assertEqual(krMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError025
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_2500
     * @tc.desc Verify Russian message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ruMsg = 'АБВГД';
      let err = new LinkerUnresolvedFieldError(ruMsg);
      expect(err.message).assertEqual(ruMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError026
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_2600
     * @tc.desc Verify Arabic message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arMsg = 'الاختبار';
      let err = new LinkerUnresolvedFieldError(arMsg);
      expect(err.message).assertEqual(arMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError027
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_2700
     * @tc.desc Verify mixed Latin and Chinese message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixMsg = 'Test 測試';
      let err = new LinkerUnresolvedFieldError(mixMsg);
      expect(err.message).assertEqual(mixMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError028
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_2800
     * @tc.desc Verify XSS string as message preserves special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssMsg = '<script>alert(1)</script>';
      let err = new LinkerUnresolvedFieldError(xssMsg);
      expect(err.message).assertEqual(xssMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError029
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_2900
     * @tc.desc Verify special punctuation as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let punct = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      let err = new LinkerUnresolvedFieldError(punct);
      expect(err.message).assertEqual(punct);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError030
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_3000
     * @tc.desc Verify Unicode replacement character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rp = '�';
      let err = new LinkerUnresolvedFieldError(rp);
      expect(err.message).assertEqual(rp);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError031
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_3100
     * @tc.desc Verify illegal Unicode non-character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nc = '￾';
      let err = new LinkerUnresolvedFieldError(nc);
      expect(err.message).assertEqual(nc);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError032
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_3200
     * @tc.desc Verify lone surrogate character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lone = '\udc04';
      let err = new LinkerUnresolvedFieldError(lone);
      expect(err.message).assertEqual(lone);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError033
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_3300
     * @tc.desc Verify mojibake garbled text as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gb = 'æµè¯';
      let err = new LinkerUnresolvedFieldError(gb);
      expect(err.message).assertEqual(gb);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError034
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_3400
     * @tc.desc Verify Map as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapMsg = new Map<string, string>();
      try {
        let err = new LinkerUnresolvedFieldError(mapMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError035
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_3500
     * @tc.desc Verify Set as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setMsg = new Set<string>();
      try {
        let err = new LinkerUnresolvedFieldError(setMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError036
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_3600
     * @tc.desc Verify Date as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateMsg = new Date();
      try {
        let err = new LinkerUnresolvedFieldError(dateMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError037
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_3700
     * @tc.desc Verify RegExp as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let regMsg = new RegExp('test', 'gi');
      try {
        let err = new LinkerUnresolvedFieldError(regMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError038
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_3800
     * @tc.desc Verify Function as cause is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fnCause: Object = ((): void => {
      }) as Object;
      try {
        throw new LinkerUnresolvedFieldError('msg', { cause: fnCause as Object as Error } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError039
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_3900
     * @tc.desc Verify NaN as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanOpts: ErrorOptions = { cause: NaN as Object };
      let err = new LinkerUnresolvedFieldError('msg', nanOpts);
      expect(isErr(err as Object)).assertEqual(true);
      expect(isNaN(err.cause as number)).assertTrue();
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError040
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_4000
     * @tc.desc Verify Infinity as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infOpts: ErrorOptions = { cause: Infinity as Object };
      let err = new LinkerUnresolvedFieldError('msg', infOpts);
      expect(isErr(err as Object)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError041
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_4100
     * @tc.desc Verify message property is writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError('original');
      err.message = 'modified';
      expect(err.message).assertEqual('modified');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError042
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_4200
     * @tc.desc Verify multi-instance independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1 = new LinkerUnresolvedFieldError('msg1', { cause: new Error('c1') } as ErrorOptions);
      let err2 = new LinkerUnresolvedFieldError('msg2', { cause: new Error('c2') } as ErrorOptions);
      expect(err1.message).assertEqual('msg1');
      expect(err2.message).assertEqual('msg2');
      expect(err1.cause !== err2.cause).assertTrue();
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError043
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_4300
     * @tc.desc Verify instanceof self type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerUnresolvedFieldError('msg');
      expect(isSelf(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError044
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_4400
     * @tc.desc Verify instanceof LinkerError parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerUnresolvedFieldError('msg');
      expect(isLinkerErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError045
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_4500
     * @tc.desc Verify instanceof Error parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerUnresolvedFieldError('msg');
      expect(isErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError046
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_4600
     * @tc.desc Verify throw-catch with no-arg preserves name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerUnresolvedFieldError();
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('LinkerUnresolvedFieldError');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError047
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_4700
     * @tc.desc Verify throw-catch with message preserves name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerUnresolvedFieldError('thrown msg');
        expect().assertFail();
      } catch (e) {
        expect((e as LinkerUnresolvedFieldError).name).assertEqual('LinkerUnresolvedFieldError');
        expect((e as LinkerUnresolvedFieldError).message).assertEqual('thrown msg');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError048
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_4800
     * @tc.desc Verify throw-catch with message and cause preserves full chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('root');
      try {
        throw new LinkerUnresolvedFieldError('msg', { cause: root } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).cause === root).assertTrue();
        expect(((e as Error).cause as Error).message).assertEqual('root');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError049
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_4900
     * @tc.desc Verify stack contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError('msg');
      let stack = err.stack as string;
      expect(stack.length > 0).assertTrue();
      expect(stack.includes('LinkerUnresolvedFieldError')).assertTrue();
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError050
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_5000
     * @tc.desc Verify toString format is ClassName: message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError('format test');
      expect(err.toString()).assertEqual('LinkerUnresolvedFieldError: format test');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError051
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_5100
     * @tc.desc Verify single-level cause chain with Error cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Error('root cause');
      let outer = new LinkerUnresolvedFieldError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as Error).message).assertEqual('root cause');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError052
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_5200
     * @tc.desc Verify single-level cause chain with TypeError cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new TypeError('type error');
      let outer = new LinkerUnresolvedFieldError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as TypeError).message).assertEqual('type error');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError053
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_5300
     * @tc.desc Verify cause chain with LinkerError as cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new LinkerError('inner');
      let outer = new LinkerUnresolvedFieldError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as LinkerError).name).assertEqual('LinkerError');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError054
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_5400
     * @tc.desc Verify 3-level same-type cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3 = new LinkerUnresolvedFieldError('level3');
      let l2 = new LinkerUnresolvedFieldError('level2', { cause: l3 } as ErrorOptions);
      let l1 = new LinkerUnresolvedFieldError('level1', { cause: l2 } as ErrorOptions);
      expect((l1.cause as LinkerUnresolvedFieldError).message).assertEqual('level2');
      expect(((l1.cause as LinkerUnresolvedFieldError).cause as LinkerUnresolvedFieldError).message)
        .assertEqual('level3');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError055
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_5500
     * @tc.desc Verify 5-level deep cause chain with full traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('depth0');
      let current: Object = root;
      for (let d = 1; d <= 5; d++) {
        current = new LinkerUnresolvedFieldError('depth' + d, { cause: current as Object as Error } as ErrorOptions) as LinkerError;
      }
      expect((current as LinkerError).name).assertEqual('LinkerUnresolvedFieldError');
      let walk: Object = current;
      for (let d = 5; d >= 1; d--) {
        expect((walk as LinkerError).message).assertEqual('depth' + d);
        walk = (walk as LinkerError).cause as Object;
      }
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError056
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_5600
     * @tc.desc Verify try-catch wrapping preserves cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapped: Error = new Error('root failure');
      try {
        throw wrapped;
      } catch (e1) {
        wrapped = new LinkerUnresolvedFieldError('wrapper', { cause: e1 as Error } as ErrorOptions);
      }
      expect((wrapped as LinkerUnresolvedFieldError).name).assertEqual('LinkerUnresolvedFieldError');
      expect((wrapped as LinkerUnresolvedFieldError).message).assertEqual('wrapper');
      expect(((wrapped as LinkerUnresolvedFieldError).cause as Error).message).assertEqual('root failure');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError057
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_5700
     * @tc.desc Verify string value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError('msg', { cause: 'string cause' as Object } as ErrorOptions);
      expect(err.cause).assertEqual('string cause');
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError058
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_5800
     * @tc.desc Verify number value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError('msg', { cause: 42 as Object } as ErrorOptions);
      expect(err.cause).assertEqual(42);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError059
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_5900
     * @tc.desc Verify boolean value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError('msg', { cause: true as Object } as ErrorOptions);
      expect(err.cause).assertEqual(true);
    })

    /**
     * @tc.name testLinkerUnresolvedFieldError060
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_FIELD_ERROR_6000
     * @tc.desc Verify undefined cause results in undefined cause property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedFieldError060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedFieldError('msg', { cause: undefined } as ErrorOptions);
      expect(err.cause).assertUndefined();
    })

  })
}
