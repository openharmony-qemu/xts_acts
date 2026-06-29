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
  return o instanceof LinkerUnresolvedClassError;
}

export default function linkerUnresolvedClassErrorTest(): void {
  describe('LinkerUnresolvedClassErrorTest', (): void => {
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
     * @tc.name testLinkerUnresolvedClassError001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_0100
     * @tc.desc Verify no-arg constructor sets correct name and empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError();
      expect(err.name).assertEqual('LinkerUnresolvedClassError');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_0200
     * @tc.desc Verify message-only constructor stores message and correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError('test message');
      expect(err.name).assertEqual('LinkerUnresolvedClassError');
      expect(err.message).assertEqual('test message');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_0300
     * @tc.desc Verify message+cause constructor stores both correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new Error('root cause');
      let err = new LinkerUnresolvedClassError('msg', { cause: cause } as ErrorOptions);
      expect(err.name).assertEqual('LinkerUnresolvedClassError');
      expect(err.message).assertEqual('msg');
      expect(err.cause === cause).assertTrue();
    })

    /**
     * @tc.name testLinkerUnresolvedClassError004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_0400
     * @tc.desc Verify message and explicit undefined options accepts undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError('msg', undefined);
      expect(err.name).assertEqual('LinkerUnresolvedClassError');
      expect(err.message).assertEqual('msg');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_0500
     * @tc.desc Verify undefined message and explicit empty options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError(undefined, {});
      expect(err.message).assertEqual('');
      expect(err.cause === undefined).assertTrue();
    })

    /**
     * @tc.name testLinkerUnresolvedClassError006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_0600
     * @tc.desc Verify empty string message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError('');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_0700
     * @tc.desc Verify undefined message yields empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError(undefined);
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError008
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_0800
     * @tc.desc Verify single character message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError('A');
      expect(err.message).assertEqual('A');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError009
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_0900
     * @tc.desc Verify whitespace-only message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wsMsg = '     ';
      let err = new LinkerUnresolvedClassError(wsMsg);
      expect(err.message).assertEqual(wsMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError010
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_1000
     * @tc.desc Verify tab message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError('\t');
      expect(err.message).assertEqual('\t');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError011
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_1100
     * @tc.desc Verify newline escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nl = '\n';
      let err = new LinkerUnresolvedClassError(nl);
      expect(err.message).assertEqual(nl);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError012
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_1200
     * @tc.desc Verify carriage return escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cr = '\r';
      let err = new LinkerUnresolvedClassError(cr);
      expect(err.message).assertEqual(cr);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError013
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_1300
     * @tc.desc Verify zero-width space as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsp = '​';
      let err = new LinkerUnresolvedClassError(zwsp);
      expect(err.message).assertEqual(zwsp);
      expect(err.message.length).assertEqual(1);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError014
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_1400
     * @tc.desc Verify 65535-char message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg = 'A'.repeat(65535);
      let err = new LinkerUnresolvedClassError(longMsg);
      expect(err.message).assertEqual(longMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError015
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_1500
     * @tc.desc Verify Number.MAX_VALUE.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxStr = Number.MAX_VALUE.toString();
      let err = new LinkerUnresolvedClassError(maxStr);
      expect(err.message).assertEqual(maxStr);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError016
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_1600
     * @tc.desc Verify Number.MAX_SAFE_INTEGER.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let safeStr = Number.MAX_SAFE_INTEGER.toString();
      let err = new LinkerUnresolvedClassError(safeStr);
      expect(err.message).assertEqual(safeStr);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError017
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_1700
     * @tc.desc Verify Chinese message is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg = '中文测试';
      let err = new LinkerUnresolvedClassError(msg);
      expect(err.message).assertEqual(msg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError018
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_1800
     * @tc.desc Verify emoji message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiMsg = '😀😁';
      let err = new LinkerUnresolvedClassError(emojiMsg);
      expect(err.message).assertEqual(emojiMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError019
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_1900
     * @tc.desc Verify RTL text message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtlMsg = '‮عربي';
      let err = new LinkerUnresolvedClassError(rtlMsg);
      expect(err.message).assertEqual(rtlMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError020
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_2000
     * @tc.desc Verify fullwidth message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fwMsg = 'ＡＢＣ';
      let err = new LinkerUnresolvedClassError(fwMsg);
      expect(err.message).assertEqual(fwMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError021
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_2100
     * @tc.desc Verify ASCII math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '+-*/';
      let err = new LinkerUnresolvedClassError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError022
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_2200
     * @tc.desc Verify Unicode math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '∑∫∞';
      let err = new LinkerUnresolvedClassError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError023
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_2300
     * @tc.desc Verify Japanese message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jpMsg = 'テスト';
      let err = new LinkerUnresolvedClassError(jpMsg);
      expect(err.message).assertEqual(jpMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError024
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_2400
     * @tc.desc Verify Korean message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let krMsg = '테스트';
      let err = new LinkerUnresolvedClassError(krMsg);
      expect(err.message).assertEqual(krMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError025
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_2500
     * @tc.desc Verify Russian message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ruMsg = 'АБВГД';
      let err = new LinkerUnresolvedClassError(ruMsg);
      expect(err.message).assertEqual(ruMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError026
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_2600
     * @tc.desc Verify Arabic message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arMsg = 'الاختبار';
      let err = new LinkerUnresolvedClassError(arMsg);
      expect(err.message).assertEqual(arMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError027
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_2700
     * @tc.desc Verify mixed Latin and Chinese message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixMsg = 'Test 測試';
      let err = new LinkerUnresolvedClassError(mixMsg);
      expect(err.message).assertEqual(mixMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError028
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_2800
     * @tc.desc Verify XSS string as message preserves special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssMsg = '<script>alert(1)</script>';
      let err = new LinkerUnresolvedClassError(xssMsg);
      expect(err.message).assertEqual(xssMsg);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError029
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_2900
     * @tc.desc Verify special punctuation as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let punct = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      let err = new LinkerUnresolvedClassError(punct);
      expect(err.message).assertEqual(punct);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError030
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_3000
     * @tc.desc Verify Unicode replacement character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rp = '�';
      let err = new LinkerUnresolvedClassError(rp);
      expect(err.message).assertEqual(rp);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError031
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_3100
     * @tc.desc Verify illegal Unicode non-character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nc = '￾';
      let err = new LinkerUnresolvedClassError(nc);
      expect(err.message).assertEqual(nc);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError032
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_3200
     * @tc.desc Verify lone surrogate character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lone = '\udc04';
      let err = new LinkerUnresolvedClassError(lone);
      expect(err.message).assertEqual(lone);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError033
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_3300
     * @tc.desc Verify mojibake garbled text as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gb = 'æµè¯';
      let err = new LinkerUnresolvedClassError(gb);
      expect(err.message).assertEqual(gb);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError034
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_3400
     * @tc.desc Verify Map as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapMsg = new Map<string, string>();
      try {
        let err = new LinkerUnresolvedClassError(mapMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedClassError035
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_3500
     * @tc.desc Verify Set as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setMsg = new Set<string>();
      try {
        let err = new LinkerUnresolvedClassError(setMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedClassError036
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_3600
     * @tc.desc Verify Date as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateMsg = new Date();
      try {
        let err = new LinkerUnresolvedClassError(dateMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedClassError037
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_3700
     * @tc.desc Verify RegExp as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let regMsg = new RegExp('test', 'gi');
      try {
        let err = new LinkerUnresolvedClassError(regMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedClassError038
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_3800
     * @tc.desc Verify Function as cause is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fnCause: Object = ((): void => {
      }) as Object;
      try {
        throw new LinkerUnresolvedClassError('msg', { cause: fnCause as Object as Error } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedClassError039
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_3900
     * @tc.desc Verify NaN as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanOpts: ErrorOptions = { cause: NaN as Object };
      let err = new LinkerUnresolvedClassError('msg', nanOpts);
      expect(isErr(err as Object)).assertEqual(true);
      expect(isNaN(err.cause as number)).assertTrue();
    })

    /**
     * @tc.name testLinkerUnresolvedClassError040
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_4000
     * @tc.desc Verify Infinity as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infOpts: ErrorOptions = { cause: Infinity as Object };
      let err = new LinkerUnresolvedClassError('msg', infOpts);
      expect(isErr(err as Object)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError041
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_4100
     * @tc.desc Verify message property is writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError('original');
      err.message = 'modified';
      expect(err.message).assertEqual('modified');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError042
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_4200
     * @tc.desc Verify multi-instance independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1 = new LinkerUnresolvedClassError('msg1', { cause: new Error('c1') } as ErrorOptions);
      let err2 = new LinkerUnresolvedClassError('msg2', { cause: new Error('c2') } as ErrorOptions);
      expect(err1.message).assertEqual('msg1');
      expect(err2.message).assertEqual('msg2');
      expect(err1.cause !== err2.cause).assertTrue();
    })

    /**
     * @tc.name testLinkerUnresolvedClassError043
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_4300
     * @tc.desc Verify instanceof self type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerUnresolvedClassError('msg');
      expect(isSelf(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError044
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_4400
     * @tc.desc Verify instanceof LinkerError parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerUnresolvedClassError('msg');
      expect(isLinkerErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError045
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_4500
     * @tc.desc Verify instanceof Error parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerUnresolvedClassError('msg');
      expect(isErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError046
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_4600
     * @tc.desc Verify throw-catch with no-arg preserves name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerUnresolvedClassError();
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('LinkerUnresolvedClassError');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedClassError047
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_4700
     * @tc.desc Verify throw-catch with message preserves name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerUnresolvedClassError('thrown msg');
        expect().assertFail();
      } catch (e) {
        expect((e as LinkerUnresolvedClassError).name).assertEqual('LinkerUnresolvedClassError');
        expect((e as LinkerUnresolvedClassError).message).assertEqual('thrown msg');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedClassError048
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_4800
     * @tc.desc Verify throw-catch with message and cause preserves full chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('root');
      try {
        throw new LinkerUnresolvedClassError('msg', { cause: root } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).cause === root).assertTrue();
        expect(((e as Error).cause as Error).message).assertEqual('root');
      }
    })

    /**
     * @tc.name testLinkerUnresolvedClassError049
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_4900
     * @tc.desc Verify stack contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError('msg');
      let stack = err.stack as string;
      expect(stack.includes('LinkerUnresolvedClassError')).assertTrue();
    })

    /**
     * @tc.name testLinkerUnresolvedClassError050
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_5000
     * @tc.desc Verify toString format is ClassName: message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError('format test');
      expect(err.toString()).assertEqual('LinkerUnresolvedClassError: format test');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError051
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_5100
     * @tc.desc Verify single-level cause chain with Error cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Error('root cause');
      let outer = new LinkerUnresolvedClassError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as Error).message).assertEqual('root cause');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError052
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_5200
     * @tc.desc Verify single-level cause chain with TypeError cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new TypeError('type error');
      let outer = new LinkerUnresolvedClassError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as TypeError).message).assertEqual('type error');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError053
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_5300
     * @tc.desc Verify cause chain with LinkerError as cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new LinkerError('inner');
      let outer = new LinkerUnresolvedClassError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as LinkerError).name).assertEqual('LinkerError');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError054
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_5400
     * @tc.desc Verify 3-level same-type cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3 = new LinkerUnresolvedClassError('level3');
      let l2 = new LinkerUnresolvedClassError('level2', { cause: l3 } as ErrorOptions);
      let l1 = new LinkerUnresolvedClassError('level1', { cause: l2 } as ErrorOptions);
      expect((l1.cause as LinkerUnresolvedClassError).message).assertEqual('level2');
      expect(((l1.cause as LinkerUnresolvedClassError).cause as LinkerUnresolvedClassError).message)
        .assertEqual('level3');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError055
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_5500
     * @tc.desc Verify 5-level deep cause chain with full traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('depth0');
      let current: Object = root;
      for (let d = 1; d <= 5; d++) {
        current = new LinkerUnresolvedClassError('depth' + d, { cause: current as Object as Error } as ErrorOptions) as LinkerError;
      }
      expect((current as LinkerError).name).assertEqual('LinkerUnresolvedClassError');
      let walk: Object = current;
      for (let d = 5; d >= 1; d--) {
        expect((walk as LinkerError).message).assertEqual('depth' + d);
        walk = (walk as LinkerError).cause as Object;
      }
    })

    /**
     * @tc.name testLinkerUnresolvedClassError056
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_5600
     * @tc.desc Verify try-catch wrapping preserves cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapped: Error = new Error('root failure');
      try {
        throw wrapped;
      } catch (e1) {
        wrapped = new LinkerUnresolvedClassError('wrapper', { cause: e1 as Error } as ErrorOptions);
      }
      expect((wrapped as LinkerUnresolvedClassError).name).assertEqual('LinkerUnresolvedClassError');
      expect((wrapped as LinkerUnresolvedClassError).message).assertEqual('wrapper');
      expect(((wrapped as LinkerUnresolvedClassError).cause as Error).message).assertEqual('root failure');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError057
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_5700
     * @tc.desc Verify string value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError('msg', { cause: 'string cause' as Object } as ErrorOptions);
      expect(err.cause).assertEqual('string cause');
    })

    /**
     * @tc.name testLinkerUnresolvedClassError058
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_5800
     * @tc.desc Verify number value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError('msg', { cause: 42 as Object } as ErrorOptions);
      expect(err.cause).assertEqual(42);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError059
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_5900
     * @tc.desc Verify boolean value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError('msg', { cause: true as Object } as ErrorOptions);
      expect(err.cause).assertEqual(true);
    })

    /**
     * @tc.name testLinkerUnresolvedClassError060
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_UNRESOLVED_CLASS_ERROR_6000
     * @tc.desc Verify undefined cause results in undefined cause property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerUnresolvedClassError060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerUnresolvedClassError('msg', { cause: undefined } as ErrorOptions);
      expect(err.cause).assertUndefined();
    })

  })
}
