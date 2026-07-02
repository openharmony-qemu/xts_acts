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
  return o instanceof LinkerVerificationError;
}

export default function linkerVerificationErrorTest(): void {
  describe('LinkerVerificationErrorTest', (): void => {
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
     * @tc.name testLinkerVerificationError001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_0100
     * @tc.desc Verify no-arg constructor sets correct name and empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError();
      expect(err.name).assertEqual('LinkerVerificationError');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerVerificationError002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_0200
     * @tc.desc Verify message-only constructor stores message and correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError('test message');
      expect(err.name).assertEqual('LinkerVerificationError');
      expect(err.message).assertEqual('test message');
    })

    /**
     * @tc.name testLinkerVerificationError003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_0300
     * @tc.desc Verify message+cause constructor stores both correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new Error('root cause');
      let err = new LinkerVerificationError('msg', { cause: cause } as ErrorOptions);
      expect(err.name).assertEqual('LinkerVerificationError');
      expect(err.message).assertEqual('msg');
      expect(err.cause === cause).assertTrue();
    })

    /**
     * @tc.name testLinkerVerificationError004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_0400
     * @tc.desc Verify message and explicit undefined options accepts undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError('msg', undefined);
      expect(err.name).assertEqual('LinkerVerificationError');
      expect(err.message).assertEqual('msg');
    })

    /**
     * @tc.name testLinkerVerificationError005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_0500
     * @tc.desc Verify undefined message and explicit empty options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError(undefined, {});
      expect(err.message).assertEqual('');
      expect(err.cause === undefined).assertTrue();
    })

    /**
     * @tc.name testLinkerVerificationError006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_0600
     * @tc.desc Verify empty string message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError('');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerVerificationError007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_0700
     * @tc.desc Verify undefined message yields empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError(undefined);
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerVerificationError008
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_0800
     * @tc.desc Verify single character message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError('A');
      expect(err.message).assertEqual('A');
    })

    /**
     * @tc.name testLinkerVerificationError009
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_0900
     * @tc.desc Verify whitespace-only message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wsMsg = '     ';
      let err = new LinkerVerificationError(wsMsg);
      expect(err.message).assertEqual(wsMsg);
    })

    /**
     * @tc.name testLinkerVerificationError010
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_1000
     * @tc.desc Verify tab message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError('\t');
      expect(err.message).assertEqual('\t');
    })

    /**
     * @tc.name testLinkerVerificationError011
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_1100
     * @tc.desc Verify newline escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nl = '\n';
      let err = new LinkerVerificationError(nl);
      expect(err.message).assertEqual(nl);
    })

    /**
     * @tc.name testLinkerVerificationError012
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_1200
     * @tc.desc Verify carriage return escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cr = '\r';
      let err = new LinkerVerificationError(cr);
      expect(err.message).assertEqual(cr);
    })

    /**
     * @tc.name testLinkerVerificationError013
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_1300
     * @tc.desc Verify zero-width space as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsp = '​';
      let err = new LinkerVerificationError(zwsp);
      expect(err.message).assertEqual(zwsp);
      expect(err.message.length).assertEqual(1);
    })

    /**
     * @tc.name testLinkerVerificationError014
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_1400
     * @tc.desc Verify 65535-char message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg = 'A'.repeat(65535);
      let err = new LinkerVerificationError(longMsg);
      expect(err.message).assertEqual(longMsg);
    })

    /**
     * @tc.name testLinkerVerificationError015
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_1500
     * @tc.desc Verify Number.MAX_VALUE.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxStr = Number.MAX_VALUE.toString();
      let err = new LinkerVerificationError(maxStr);
      expect(err.message).assertEqual(maxStr);
    })

    /**
     * @tc.name testLinkerVerificationError016
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_1600
     * @tc.desc Verify Number.MAX_SAFE_INTEGER.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let safeStr = Number.MAX_SAFE_INTEGER.toString();
      let err = new LinkerVerificationError(safeStr);
      expect(err.message).assertEqual(safeStr);
    })

    /**
     * @tc.name testLinkerVerificationError017
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_1700
     * @tc.desc Verify Chinese message is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg = '中文测试';
      let err = new LinkerVerificationError(msg);
      expect(err.message).assertEqual(msg);
    })

    /**
     * @tc.name testLinkerVerificationError018
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_1800
     * @tc.desc Verify emoji message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiMsg = '😀😁';
      let err = new LinkerVerificationError(emojiMsg);
      expect(err.message).assertEqual(emojiMsg);
    })

    /**
     * @tc.name testLinkerVerificationError019
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_1900
     * @tc.desc Verify RTL text message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtlMsg = '‮عربي';
      let err = new LinkerVerificationError(rtlMsg);
      expect(err.message).assertEqual(rtlMsg);
    })

    /**
     * @tc.name testLinkerVerificationError020
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_2000
     * @tc.desc Verify fullwidth message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fwMsg = 'ＡＢＣ';
      let err = new LinkerVerificationError(fwMsg);
      expect(err.message).assertEqual(fwMsg);
    })

    /**
     * @tc.name testLinkerVerificationError021
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_2100
     * @tc.desc Verify ASCII math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '+-*/';
      let err = new LinkerVerificationError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerVerificationError022
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_2200
     * @tc.desc Verify Unicode math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '∑∫∞';
      let err = new LinkerVerificationError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerVerificationError023
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_2300
     * @tc.desc Verify Japanese message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jpMsg = 'テスト';
      let err = new LinkerVerificationError(jpMsg);
      expect(err.message).assertEqual(jpMsg);
    })

    /**
     * @tc.name testLinkerVerificationError024
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_2400
     * @tc.desc Verify Korean message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let krMsg = '테스트';
      let err = new LinkerVerificationError(krMsg);
      expect(err.message).assertEqual(krMsg);
    })

    /**
     * @tc.name testLinkerVerificationError025
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_2500
     * @tc.desc Verify Russian message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ruMsg = 'АБВГД';
      let err = new LinkerVerificationError(ruMsg);
      expect(err.message).assertEqual(ruMsg);
    })

    /**
     * @tc.name testLinkerVerificationError026
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_2600
     * @tc.desc Verify Arabic message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arMsg = 'الاختبار';
      let err = new LinkerVerificationError(arMsg);
      expect(err.message).assertEqual(arMsg);
    })

    /**
     * @tc.name testLinkerVerificationError027
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_2700
     * @tc.desc Verify mixed Latin and Chinese message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixMsg = 'Test 測試';
      let err = new LinkerVerificationError(mixMsg);
      expect(err.message).assertEqual(mixMsg);
    })

    /**
     * @tc.name testLinkerVerificationError028
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_2800
     * @tc.desc Verify XSS string as message preserves special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssMsg = '<script>alert(1)</script>';
      let err = new LinkerVerificationError(xssMsg);
      expect(err.message).assertEqual(xssMsg);
    })

    /**
     * @tc.name testLinkerVerificationError029
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_2900
     * @tc.desc Verify special punctuation as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let punct = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      let err = new LinkerVerificationError(punct);
      expect(err.message).assertEqual(punct);
    })

    /**
     * @tc.name testLinkerVerificationError030
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_3000
     * @tc.desc Verify Unicode replacement character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rp = '�';
      let err = new LinkerVerificationError(rp);
      expect(err.message).assertEqual(rp);
    })

    /**
     * @tc.name testLinkerVerificationError031
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_3100
     * @tc.desc Verify illegal Unicode non-character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nc = '￾';
      let err = new LinkerVerificationError(nc);
      expect(err.message).assertEqual(nc);
    })

    /**
     * @tc.name testLinkerVerificationError032
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_3200
     * @tc.desc Verify lone surrogate character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lone = '\udc04';
      let err = new LinkerVerificationError(lone);
      expect(err.message).assertEqual(lone);
    })

    /**
     * @tc.name testLinkerVerificationError033
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_3300
     * @tc.desc Verify mojibake garbled text as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gb = 'æµè¯';
      let err = new LinkerVerificationError(gb);
      expect(err.message).assertEqual(gb);
    })

    /**
     * @tc.name testLinkerVerificationError034
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_3400
     * @tc.desc Verify Map as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapMsg = new Map<string, string>();
      try {
        let err = new LinkerVerificationError(mapMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerVerificationError035
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_3500
     * @tc.desc Verify Set as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setMsg = new Set<string>();
      try {
        let err = new LinkerVerificationError(setMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerVerificationError036
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_3600
     * @tc.desc Verify Date as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateMsg = new Date();
      try {
        let err = new LinkerVerificationError(dateMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerVerificationError037
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_3700
     * @tc.desc Verify RegExp as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let regMsg = new RegExp('test', 'gi');
      try {
        let err = new LinkerVerificationError(regMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerVerificationError038
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_3800
     * @tc.desc Verify Function as cause is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fnCause: Object = ((): void => {
      }) as Object;
      try {
        throw new LinkerVerificationError('msg', { cause: fnCause as Object as Error } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerVerificationError039
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_3900
     * @tc.desc Verify NaN as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanOpts: ErrorOptions = { cause: NaN as Object };
      let err = new LinkerVerificationError('msg', nanOpts);
      expect(isErr(err as Object)).assertEqual(true);
      expect(isNaN(err.cause as number)).assertTrue();
    })

    /**
     * @tc.name testLinkerVerificationError040
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_4000
     * @tc.desc Verify Infinity as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infOpts: ErrorOptions = { cause: Infinity as Object };
      let err = new LinkerVerificationError('msg', infOpts);
      expect(isErr(err as Object)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerVerificationError041
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_4100
     * @tc.desc Verify message property is writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError('original');
      err.message = 'modified';
      expect(err.message).assertEqual('modified');
    })

    /**
     * @tc.name testLinkerVerificationError042
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_4200
     * @tc.desc Verify multi-instance independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1 = new LinkerVerificationError('msg1', { cause: new Error('c1') } as ErrorOptions);
      let err2 = new LinkerVerificationError('msg2', { cause: new Error('c2') } as ErrorOptions);
      expect(err1.message).assertEqual('msg1');
      expect(err2.message).assertEqual('msg2');
      expect(err1.cause !== err2.cause).assertTrue();
    })

    /**
     * @tc.name testLinkerVerificationError043
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_4300
     * @tc.desc Verify instanceof self type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerVerificationError('msg');
      expect(isSelf(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerVerificationError044
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_4400
     * @tc.desc Verify instanceof LinkerError parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerVerificationError('msg');
      expect(isLinkerErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerVerificationError045
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_4500
     * @tc.desc Verify instanceof Error parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerVerificationError('msg');
      expect(isErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerVerificationError046
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_4600
     * @tc.desc Verify throw-catch with no-arg preserves name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerVerificationError();
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('LinkerVerificationError');
      }
    })

    /**
     * @tc.name testLinkerVerificationError047
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_4700
     * @tc.desc Verify throw-catch with message preserves name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerVerificationError('thrown msg');
        expect().assertFail();
      } catch (e) {
        expect((e as LinkerVerificationError).name).assertEqual('LinkerVerificationError');
        expect((e as LinkerVerificationError).message).assertEqual('thrown msg');
      }
    })

    /**
     * @tc.name testLinkerVerificationError048
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_4800
     * @tc.desc Verify throw-catch with message and cause preserves full chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('root');
      try {
        throw new LinkerVerificationError('msg', { cause: root } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).cause === root).assertTrue();
        expect(((e as Error).cause as Error).message).assertEqual('root');
      }
    })

    /**
     * @tc.name testLinkerVerificationError049
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_4900
     * @tc.desc Verify stack contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError('msg');
      let stack = err.stack as string;
      expect(stack.includes('LinkerVerificationError')).assertTrue();
    })

    /**
     * @tc.name testLinkerVerificationError050
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_5000
     * @tc.desc Verify toString format is ClassName: message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError('format test');
      expect(err.toString()).assertEqual('LinkerVerificationError: format test');
    })

    /**
     * @tc.name testLinkerVerificationError051
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_5100
     * @tc.desc Verify single-level cause chain with Error cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Error('root cause');
      let outer = new LinkerVerificationError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as Error).message).assertEqual('root cause');
    })

    /**
     * @tc.name testLinkerVerificationError052
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_5200
     * @tc.desc Verify single-level cause chain with TypeError cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new TypeError('type error');
      let outer = new LinkerVerificationError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as TypeError).message).assertEqual('type error');
    })

    /**
     * @tc.name testLinkerVerificationError053
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_5300
     * @tc.desc Verify cause chain with LinkerError as cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new LinkerError('inner');
      let outer = new LinkerVerificationError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as LinkerError).name).assertEqual('LinkerError');
    })

    /**
     * @tc.name testLinkerVerificationError054
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_5400
     * @tc.desc Verify 3-level same-type cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3 = new LinkerVerificationError('level3');
      let l2 = new LinkerVerificationError('level2', { cause: l3 } as ErrorOptions);
      let l1 = new LinkerVerificationError('level1', { cause: l2 } as ErrorOptions);
      expect((l1.cause as LinkerVerificationError).message).assertEqual('level2');
      expect(((l1.cause as LinkerVerificationError).cause as LinkerVerificationError).message).assertEqual('level3');
    })

    /**
     * @tc.name testLinkerVerificationError055
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_5500
     * @tc.desc Verify 5-level deep cause chain with full traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('depth0');
      let current: Object = root;
      for (let d = 1; d <= 5; d++) {
        current = new LinkerVerificationError('depth' + d, { cause: current as Object as Error } as ErrorOptions) as LinkerError;
      }
      expect((current as LinkerError).name).assertEqual('LinkerVerificationError');
      let walk: Object = current;
      for (let d = 5; d >= 1; d--) {
        expect((walk as LinkerError).message).assertEqual('depth' + d);
        walk = (walk as LinkerError).cause as Object;
      }
    })

    /**
     * @tc.name testLinkerVerificationError056
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_5600
     * @tc.desc Verify try-catch wrapping preserves cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapped: Error = new Error('root failure');
      try {
        throw wrapped;
      } catch (e1) {
        wrapped = new LinkerVerificationError('wrapper', { cause: e1 as Error } as ErrorOptions);
      }
      expect((wrapped as LinkerVerificationError).name).assertEqual('LinkerVerificationError');
      expect((wrapped as LinkerVerificationError).message).assertEqual('wrapper');
      expect(((wrapped as LinkerVerificationError).cause as Error).message).assertEqual('root failure');
    })

    /**
     * @tc.name testLinkerVerificationError057
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_5700
     * @tc.desc Verify string value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError('msg', { cause: 'string cause' as Object } as ErrorOptions);
      expect(err.cause).assertEqual('string cause');
    })

    /**
     * @tc.name testLinkerVerificationError058
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_5800
     * @tc.desc Verify number value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError('msg', { cause: 42 as Object } as ErrorOptions);
      expect(err.cause).assertEqual(42);
    })

    /**
     * @tc.name testLinkerVerificationError059
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_5900
     * @tc.desc Verify boolean value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError('msg', { cause: true as Object } as ErrorOptions);
      expect(err.cause).assertEqual(true);
    })

    /**
     * @tc.name testLinkerVerificationError060
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_VERIFICATION_ERROR_6000
     * @tc.desc Verify undefined cause results in undefined cause property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerVerificationError060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerVerificationError('msg', { cause: undefined } as ErrorOptions);
      expect(err.cause).assertUndefined();
    })

  })
}
