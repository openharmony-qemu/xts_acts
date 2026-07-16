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
} from '../../../../hypium/index'
import Utils from '../Util.test'

function isErr(o: Object): boolean {
  return o instanceof Error;
}

function isLinkerErr(o: Object): boolean {
  return o instanceof LinkerError;
}

function isSelf(o: Object): boolean {
  return o instanceof LinkerClassNotFoundError;
}

export default function linkerClassNotFoundErrorTest(): void {
  describe('LinkerClassNotFoundErrorTest', (): void => {
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
     * @tc.name testLinkerClassNotFoundError001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_0100
     * @tc.desc Verify no-arg constructor sets correct name and empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError();
      expect(err.name).assertEqual('LinkerClassNotFoundError');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerClassNotFoundError002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_0200
     * @tc.desc Verify message-only constructor stores message and correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError('test message');
      expect(err.name).assertEqual('LinkerClassNotFoundError');
      expect(err.message).assertEqual('test message');
    })

    /**
     * @tc.name testLinkerClassNotFoundError003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_0300
     * @tc.desc Verify message+cause constructor stores both correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new Error('root cause');
      let err = new LinkerClassNotFoundError('msg', { cause: cause } as ErrorOptions);
      expect(err.name).assertEqual('LinkerClassNotFoundError');
      expect(err.message).assertEqual('msg');
      expect(err.cause === cause).assertTrue();
    })

    /**
     * @tc.name testLinkerClassNotFoundError004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_0400
     * @tc.desc Verify message and explicit undefined options accepts undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError('msg', undefined);
      expect(err.name).assertEqual('LinkerClassNotFoundError');
      expect(err.message).assertEqual('msg');
    })

    /**
     * @tc.name testLinkerClassNotFoundError005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_0500
     * @tc.desc Verify undefined message and explicit empty options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError(undefined, {});
      expect(err.message).assertEqual('');
      expect(err.cause === undefined).assertTrue();
    })

    /**
     * @tc.name testLinkerClassNotFoundError006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_0600
     * @tc.desc Verify empty string message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError('');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerClassNotFoundError007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_0700
     * @tc.desc Verify undefined message yields empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError(undefined);
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerClassNotFoundError008
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_0800
     * @tc.desc Verify single character message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError('A');
      expect(err.message).assertEqual('A');
    })

    /**
     * @tc.name testLinkerClassNotFoundError009
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_0900
     * @tc.desc Verify whitespace-only message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wsMsg = '     ';
      let err = new LinkerClassNotFoundError(wsMsg);
      expect(err.message).assertEqual(wsMsg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError010
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_1000
     * @tc.desc Verify tab message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError('\t');
      expect(err.message).assertEqual('\t');
    })

    /**
     * @tc.name testLinkerClassNotFoundError011
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_1100
     * @tc.desc Verify newline escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nl = '\n';
      let err = new LinkerClassNotFoundError(nl);
      expect(err.message).assertEqual(nl);
    })

    /**
     * @tc.name testLinkerClassNotFoundError012
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_1200
     * @tc.desc Verify carriage return escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cr = '\r';
      let err = new LinkerClassNotFoundError(cr);
      expect(err.message).assertEqual(cr);
    })

    /**
     * @tc.name testLinkerClassNotFoundError013
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_1300
     * @tc.desc Verify zero-width space as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsp = '​';
      let err = new LinkerClassNotFoundError(zwsp);
      expect(err.message).assertEqual(zwsp);
      expect(err.message.length).assertEqual(1);
    })

    /**
     * @tc.name testLinkerClassNotFoundError014
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_1400
     * @tc.desc Verify 65535-char message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg = 'A'.repeat(65535);
      let err = new LinkerClassNotFoundError(longMsg);
      expect(err.message).assertEqual(longMsg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError015
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_1500
     * @tc.desc Verify Number.MAX_VALUE.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxStr = Number.MAX_VALUE.toString();
      let err = new LinkerClassNotFoundError(maxStr);
      expect(err.message).assertEqual(maxStr);
    })

    /**
     * @tc.name testLinkerClassNotFoundError016
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_1600
     * @tc.desc Verify Number.MAX_SAFE_INTEGER.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let safeStr = Number.MAX_SAFE_INTEGER.toString();
      let err = new LinkerClassNotFoundError(safeStr);
      expect(err.message).assertEqual(safeStr);
    })

    /**
     * @tc.name testLinkerClassNotFoundError017
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_1700
     * @tc.desc Verify Chinese message is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg = '中文测试';
      let err = new LinkerClassNotFoundError(msg);
      expect(err.message).assertEqual(msg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError018
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_1800
     * @tc.desc Verify emoji message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiMsg = '😀😁';
      let err = new LinkerClassNotFoundError(emojiMsg);
      expect(err.message).assertEqual(emojiMsg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError019
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_1900
     * @tc.desc Verify RTL text message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtlMsg = '‮عربي';
      let err = new LinkerClassNotFoundError(rtlMsg);
      expect(err.message).assertEqual(rtlMsg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError020
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_2000
     * @tc.desc Verify fullwidth message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fwMsg = 'ＡＢＣ';
      let err = new LinkerClassNotFoundError(fwMsg);
      expect(err.message).assertEqual(fwMsg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError021
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_2100
     * @tc.desc Verify ASCII math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '+-*/';
      let err = new LinkerClassNotFoundError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError022
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_2200
     * @tc.desc Verify Unicode math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '∑∫∞';
      let err = new LinkerClassNotFoundError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError023
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_2300
     * @tc.desc Verify Japanese message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jpMsg = 'テスト';
      let err = new LinkerClassNotFoundError(jpMsg);
      expect(err.message).assertEqual(jpMsg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError024
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_2400
     * @tc.desc Verify Korean message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let krMsg = '테스트';
      let err = new LinkerClassNotFoundError(krMsg);
      expect(err.message).assertEqual(krMsg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError025
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_2500
     * @tc.desc Verify Russian message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ruMsg = 'АБВГД';
      let err = new LinkerClassNotFoundError(ruMsg);
      expect(err.message).assertEqual(ruMsg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError026
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_2600
     * @tc.desc Verify Arabic message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arMsg = 'الاختبار';
      let err = new LinkerClassNotFoundError(arMsg);
      expect(err.message).assertEqual(arMsg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError027
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_2700
     * @tc.desc Verify mixed Latin and Chinese message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixMsg = 'Test 測試';
      let err = new LinkerClassNotFoundError(mixMsg);
      expect(err.message).assertEqual(mixMsg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError028
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_2800
     * @tc.desc Verify XSS string as message preserves special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssMsg = '<script>alert(1)</script>';
      let err = new LinkerClassNotFoundError(xssMsg);
      expect(err.message).assertEqual(xssMsg);
    })

    /**
     * @tc.name testLinkerClassNotFoundError029
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_2900
     * @tc.desc Verify special punctuation as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let punct = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      let err = new LinkerClassNotFoundError(punct);
      expect(err.message).assertEqual(punct);
    })

    /**
     * @tc.name testLinkerClassNotFoundError030
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_3000
     * @tc.desc Verify Unicode replacement character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rp = '�';
      let err = new LinkerClassNotFoundError(rp);
      expect(err.message).assertEqual(rp);
    })

    /**
     * @tc.name testLinkerClassNotFoundError031
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_3100
     * @tc.desc Verify illegal Unicode non-character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nc = '￾';
      let err = new LinkerClassNotFoundError(nc);
      expect(err.message).assertEqual(nc);
    })

    /**
     * @tc.name testLinkerClassNotFoundError032
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_3200
     * @tc.desc Verify lone surrogate character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lone = '\udc04';
      let err = new LinkerClassNotFoundError(lone);
      expect(err.message).assertEqual(lone);
    })

    /**
     * @tc.name testLinkerClassNotFoundError033
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_3300
     * @tc.desc Verify mojibake garbled text as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gb = 'æµè¯';
      let err = new LinkerClassNotFoundError(gb);
      expect(err.message).assertEqual(gb);
    })

    /**
     * @tc.name testLinkerClassNotFoundError034
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_3400
     * @tc.desc Verify Map as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapMsg = new Map<string, string>();
      try {
        let err = new LinkerClassNotFoundError(mapMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerClassNotFoundError035
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_3500
     * @tc.desc Verify Set as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setMsg = new Set<string>();
      try {
        let err = new LinkerClassNotFoundError(setMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerClassNotFoundError036
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_3600
     * @tc.desc Verify Date as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateMsg = new Date();
      try {
        let err = new LinkerClassNotFoundError(dateMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerClassNotFoundError037
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_3700
     * @tc.desc Verify RegExp as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let regMsg = new RegExp('test', 'gi');
      try {
        let err = new LinkerClassNotFoundError(regMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerClassNotFoundError038
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_3800
     * @tc.desc Verify Function as cause is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fnCause: Object = ((): void => {
      }) as Object;
      try {
        throw new LinkerClassNotFoundError('msg', { cause: fnCause as Object as Error } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerClassNotFoundError039
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_3900
     * @tc.desc Verify NaN as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanOpts: ErrorOptions = { cause: NaN as Object };
      let err = new LinkerClassNotFoundError('msg', nanOpts);
      expect(isErr(err as Object)).assertEqual(true);
      expect(isNaN(err.cause as number)).assertTrue();
    })

    /**
     * @tc.name testLinkerClassNotFoundError040
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_4000
     * @tc.desc Verify Infinity as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infOpts: ErrorOptions = { cause: Infinity as Object };
      let err = new LinkerClassNotFoundError('msg', infOpts);
      expect(isErr(err as Object)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerClassNotFoundError041
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_4100
     * @tc.desc Verify message property is writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError('original');
      err.message = 'modified';
      expect(err.message).assertEqual('modified');
    })

    /**
     * @tc.name testLinkerClassNotFoundError042
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_4200
     * @tc.desc Verify multi-instance independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1 = new LinkerClassNotFoundError('msg1', { cause: new Error('c1') } as ErrorOptions);
      let err2 = new LinkerClassNotFoundError('msg2', { cause: new Error('c2') } as ErrorOptions);
      expect(err1.message).assertEqual('msg1');
      expect(err2.message).assertEqual('msg2');
      expect(err1.cause !== err2.cause).assertTrue();
    })

    /**
     * @tc.name testLinkerClassNotFoundError043
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_4300
     * @tc.desc Verify instanceof self type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerClassNotFoundError('msg');
      expect(isSelf(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerClassNotFoundError044
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_4400
     * @tc.desc Verify instanceof LinkerError parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerClassNotFoundError('msg');
      expect(isLinkerErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerClassNotFoundError045
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_4500
     * @tc.desc Verify instanceof Error parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerClassNotFoundError('msg');
      expect(isErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerClassNotFoundError046
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_4600
     * @tc.desc Verify throw-catch with no-arg preserves name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerClassNotFoundError();
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('LinkerClassNotFoundError');
      }
    })

    /**
     * @tc.name testLinkerClassNotFoundError047
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_4700
     * @tc.desc Verify throw-catch with message preserves name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerClassNotFoundError('thrown msg');
        expect().assertFail();
      } catch (e) {
        expect((e as LinkerClassNotFoundError).name).assertEqual('LinkerClassNotFoundError');
        expect((e as LinkerClassNotFoundError).message).assertEqual('thrown msg');
      }
    })

    /**
     * @tc.name testLinkerClassNotFoundError048
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_4800
     * @tc.desc Verify throw-catch with message and cause preserves full chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('root');
      try {
        throw new LinkerClassNotFoundError('msg', { cause: root } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).cause === root).assertTrue();
        expect(((e as Error).cause as Error).message).assertEqual('root');
      }
    })

    /**
     * @tc.name testLinkerClassNotFoundError049
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_4900
     * @tc.desc Verify stack contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError('msg');
      let stack = err.stack as string;
      expect(stack.includes('LinkerClassNotFoundError')).assertTrue();
    })

    /**
     * @tc.name testLinkerClassNotFoundError050
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_5000
     * @tc.desc Verify toString format is ClassName: message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError('format test');
      expect(err.toString()).assertEqual('LinkerClassNotFoundError: format test');
    })

    /**
     * @tc.name testLinkerClassNotFoundError051
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_5100
     * @tc.desc Verify single-level cause chain with Error cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Error('root cause');
      let outer = new LinkerClassNotFoundError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as Error).message).assertEqual('root cause');
    })

    /**
     * @tc.name testLinkerClassNotFoundError052
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_5200
     * @tc.desc Verify single-level cause chain with TypeError cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new TypeError('type error');
      let outer = new LinkerClassNotFoundError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as TypeError).message).assertEqual('type error');
    })

    /**
     * @tc.name testLinkerClassNotFoundError053
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_5300
     * @tc.desc Verify cause chain with LinkerError as cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new LinkerError('inner');
      let outer = new LinkerClassNotFoundError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as LinkerError).name).assertEqual('LinkerError');
    })

    /**
     * @tc.name testLinkerClassNotFoundError054
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_5400
     * @tc.desc Verify 3-level same-type cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3 = new LinkerClassNotFoundError('level3');
      let l2 = new LinkerClassNotFoundError('level2', { cause: l3 } as ErrorOptions);
      let l1 = new LinkerClassNotFoundError('level1', { cause: l2 } as ErrorOptions);
      expect((l1.cause as LinkerClassNotFoundError).message).assertEqual('level2');
      expect(((l1.cause as LinkerClassNotFoundError).cause as LinkerClassNotFoundError).message).assertEqual('level3');
    })

    /**
     * @tc.name testLinkerClassNotFoundError055
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_5500
     * @tc.desc Verify 5-level deep cause chain with full traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('depth0');
      let current: Object = root;
      for (let d = 1; d <= 5; d++) {
        current = new LinkerClassNotFoundError('depth' + d, { cause: current as Object as Error } as ErrorOptions) as LinkerError;
      }
      expect((current as LinkerError).name).assertEqual('LinkerClassNotFoundError');
      let walk: Object = current;
      for (let d = 5; d >= 1; d--) {
        expect((walk as LinkerError).message).assertEqual('depth' + d);
        walk = (walk as LinkerError).cause as Object;
      }
    })

    /**
     * @tc.name testLinkerClassNotFoundError056
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_5600
     * @tc.desc Verify try-catch wrapping preserves cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapped: Error = new Error('root failure');
      try {
        throw wrapped;
      } catch (e1) {
        wrapped = new LinkerClassNotFoundError('wrapper', { cause: e1 as Error } as ErrorOptions);
      }
      expect((wrapped as LinkerClassNotFoundError).name).assertEqual('LinkerClassNotFoundError');
      expect((wrapped as LinkerClassNotFoundError).message).assertEqual('wrapper');
      expect(((wrapped as LinkerClassNotFoundError).cause as Error).message).assertEqual('root failure');
    })

    /**
     * @tc.name testLinkerClassNotFoundError057
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_5700
     * @tc.desc Verify string value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError('msg', { cause: 'string cause' as Object } as ErrorOptions);
      expect(err.cause).assertEqual('string cause');
    })

    /**
     * @tc.name testLinkerClassNotFoundError058
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_5800
     * @tc.desc Verify number value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError('msg', { cause: 42 as Object } as ErrorOptions);
      expect(err.cause).assertEqual(42);
    })

    /**
     * @tc.name testLinkerClassNotFoundError059
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_5900
     * @tc.desc Verify boolean value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError('msg', { cause: true as Object } as ErrorOptions);
      expect(err.cause).assertEqual(true);
    })

    /**
     * @tc.name testLinkerClassNotFoundError060
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_CLASS_NOT_FOUND_ERROR_6000
     * @tc.desc Verify undefined cause results in undefined cause property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerClassNotFoundError060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerClassNotFoundError('msg', { cause: undefined } as ErrorOptions);
      expect(err.cause).assertUndefined();
    })

  })
}
