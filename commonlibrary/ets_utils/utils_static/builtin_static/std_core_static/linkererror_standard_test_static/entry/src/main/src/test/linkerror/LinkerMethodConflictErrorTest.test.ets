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
  return o instanceof LinkerMethodConflictError;
}

export default function linkerMethodConflictErrorTest(): void {
  describe('LinkerMethodConflictErrorTest', (): void => {
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
     * @tc.name testLinkerMethodConflictError001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_0100
     * @tc.desc Verify no-arg constructor sets correct name and empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError();
      expect(err.name).assertEqual('LinkerMethodConflictError');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerMethodConflictError002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_0200
     * @tc.desc Verify message-only constructor stores message and correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError('test message');
      expect(err.name).assertEqual('LinkerMethodConflictError');
      expect(err.message).assertEqual('test message');
    })

    /**
     * @tc.name testLinkerMethodConflictError003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_0300
     * @tc.desc Verify message+cause constructor stores both correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new Error('root cause');
      let err = new LinkerMethodConflictError('msg', { cause: cause } as ErrorOptions);
      expect(err.name).assertEqual('LinkerMethodConflictError');
      expect(err.message).assertEqual('msg');
      expect(err.cause === cause).assertTrue();
    })

    /**
     * @tc.name testLinkerMethodConflictError004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_0400
     * @tc.desc Verify message and explicit undefined options accepts undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError('msg', undefined);
      expect(err.name).assertEqual('LinkerMethodConflictError');
      expect(err.message).assertEqual('msg');
    })

    /**
     * @tc.name testLinkerMethodConflictError005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_0500
     * @tc.desc Verify undefined message and explicit empty options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError(undefined, {});
      expect(err.message).assertEqual('');
      expect(err.cause === undefined).assertTrue();
    })

    /**
     * @tc.name testLinkerMethodConflictError006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_0600
     * @tc.desc Verify empty string message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError('');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerMethodConflictError007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_0700
     * @tc.desc Verify undefined message yields empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError(undefined);
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerMethodConflictError008
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_0800
     * @tc.desc Verify single character message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError('A');
      expect(err.message).assertEqual('A');
    })

    /**
     * @tc.name testLinkerMethodConflictError009
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_0900
     * @tc.desc Verify whitespace-only message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wsMsg = '     ';
      let err = new LinkerMethodConflictError(wsMsg);
      expect(err.message).assertEqual(wsMsg);
    })

    /**
     * @tc.name testLinkerMethodConflictError010
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_1000
     * @tc.desc Verify tab message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError('\t');
      expect(err.message).assertEqual('\t');
    })

    /**
     * @tc.name testLinkerMethodConflictError011
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_1100
     * @tc.desc Verify newline escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nl = '\n';
      let err = new LinkerMethodConflictError(nl);
      expect(err.message).assertEqual(nl);
    })

    /**
     * @tc.name testLinkerMethodConflictError012
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_1200
     * @tc.desc Verify carriage return escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cr = '\r';
      let err = new LinkerMethodConflictError(cr);
      expect(err.message).assertEqual(cr);
    })

    /**
     * @tc.name testLinkerMethodConflictError013
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_1300
     * @tc.desc Verify zero-width space as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsp = '​';
      let err = new LinkerMethodConflictError(zwsp);
      expect(err.message).assertEqual(zwsp);
      expect(err.message.length).assertEqual(1);
    })

    /**
     * @tc.name testLinkerMethodConflictError014
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_1400
     * @tc.desc Verify 65535-char message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg = 'A'.repeat(65535);
      let err = new LinkerMethodConflictError(longMsg);
      expect(err.message).assertEqual(longMsg);
    })

    /**
     * @tc.name testLinkerMethodConflictError015
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_1500
     * @tc.desc Verify Number.MAX_VALUE.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxStr = Number.MAX_VALUE.toString();
      let err = new LinkerMethodConflictError(maxStr);
      expect(err.message).assertEqual(maxStr);
    })

    /**
     * @tc.name testLinkerMethodConflictError016
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_1600
     * @tc.desc Verify Number.MAX_SAFE_INTEGER.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let safeStr = Number.MAX_SAFE_INTEGER.toString();
      let err = new LinkerMethodConflictError(safeStr);
      expect(err.message).assertEqual(safeStr);
    })

    /**
     * @tc.name testLinkerMethodConflictError017
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_1700
     * @tc.desc Verify Chinese message is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg = '中文测试';
      let err = new LinkerMethodConflictError(msg);
      expect(err.message).assertEqual(msg);
    })

    /**
     * @tc.name testLinkerMethodConflictError018
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_1800
     * @tc.desc Verify emoji message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiMsg = '😀😁';
      let err = new LinkerMethodConflictError(emojiMsg);
      expect(err.message).assertEqual(emojiMsg);
    })

    /**
     * @tc.name testLinkerMethodConflictError019
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_1900
     * @tc.desc Verify RTL text message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtlMsg = '‮عربي';
      let err = new LinkerMethodConflictError(rtlMsg);
      expect(err.message).assertEqual(rtlMsg);
    })

    /**
     * @tc.name testLinkerMethodConflictError020
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_2000
     * @tc.desc Verify fullwidth message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fwMsg = 'ＡＢＣ';
      let err = new LinkerMethodConflictError(fwMsg);
      expect(err.message).assertEqual(fwMsg);
    })

    /**
     * @tc.name testLinkerMethodConflictError021
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_2100
     * @tc.desc Verify ASCII math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '+-*/';
      let err = new LinkerMethodConflictError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerMethodConflictError022
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_2200
     * @tc.desc Verify Unicode math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '∑∫∞';
      let err = new LinkerMethodConflictError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerMethodConflictError023
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_2300
     * @tc.desc Verify Japanese message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jpMsg = 'テスト';
      let err = new LinkerMethodConflictError(jpMsg);
      expect(err.message).assertEqual(jpMsg);
    })

    /**
     * @tc.name testLinkerMethodConflictError024
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_2400
     * @tc.desc Verify Korean message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let krMsg = '테스트';
      let err = new LinkerMethodConflictError(krMsg);
      expect(err.message).assertEqual(krMsg);
    })

    /**
     * @tc.name testLinkerMethodConflictError025
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_2500
     * @tc.desc Verify Russian message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ruMsg = 'АБВГД';
      let err = new LinkerMethodConflictError(ruMsg);
      expect(err.message).assertEqual(ruMsg);
    })

    /**
     * @tc.name testLinkerMethodConflictError026
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_2600
     * @tc.desc Verify Arabic message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arMsg = 'الاختبار';
      let err = new LinkerMethodConflictError(arMsg);
      expect(err.message).assertEqual(arMsg);
    })

    /**
     * @tc.name testLinkerMethodConflictError027
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_2700
     * @tc.desc Verify mixed Latin and Chinese message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixMsg = 'Test 測試';
      let err = new LinkerMethodConflictError(mixMsg);
      expect(err.message).assertEqual(mixMsg);
    })

    /**
     * @tc.name testLinkerMethodConflictError028
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_2800
     * @tc.desc Verify XSS string as message preserves special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssMsg = '<script>alert(1)</script>';
      let err = new LinkerMethodConflictError(xssMsg);
      expect(err.message).assertEqual(xssMsg);
    })

    /**
     * @tc.name testLinkerMethodConflictError029
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_2900
     * @tc.desc Verify special punctuation as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let punct = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      let err = new LinkerMethodConflictError(punct);
      expect(err.message).assertEqual(punct);
    })

    /**
     * @tc.name testLinkerMethodConflictError030
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_3000
     * @tc.desc Verify Unicode replacement character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rp = '�';
      let err = new LinkerMethodConflictError(rp);
      expect(err.message).assertEqual(rp);
    })

    /**
     * @tc.name testLinkerMethodConflictError031
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_3100
     * @tc.desc Verify illegal Unicode non-character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nc = '￾';
      let err = new LinkerMethodConflictError(nc);
      expect(err.message).assertEqual(nc);
    })

    /**
     * @tc.name testLinkerMethodConflictError032
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_3200
     * @tc.desc Verify lone surrogate character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lone = '\udc04';
      let err = new LinkerMethodConflictError(lone);
      expect(err.message).assertEqual(lone);
    })

    /**
     * @tc.name testLinkerMethodConflictError033
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_3300
     * @tc.desc Verify mojibake garbled text as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gb = 'æµè¯';
      let err = new LinkerMethodConflictError(gb);
      expect(err.message).assertEqual(gb);
    })

    /**
     * @tc.name testLinkerMethodConflictError034
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_3400
     * @tc.desc Verify Map as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapMsg = new Map<string, string>();
      try {
        let err = new LinkerMethodConflictError(mapMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerMethodConflictError035
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_3500
     * @tc.desc Verify Set as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setMsg = new Set<string>();
      try {
        let err = new LinkerMethodConflictError(setMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerMethodConflictError036
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_3600
     * @tc.desc Verify Date as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateMsg = new Date();
      try {
        let err = new LinkerMethodConflictError(dateMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerMethodConflictError037
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_3700
     * @tc.desc Verify RegExp as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let regMsg = new RegExp('test', 'gi');
      try {
        let err = new LinkerMethodConflictError(regMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerMethodConflictError038
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_3800
     * @tc.desc Verify Function as cause is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fnCause: Object = ((): void => {
      }) as Object;
      try {
        throw new LinkerMethodConflictError('msg', { cause: fnCause as Object as Error } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerMethodConflictError039
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_3900
     * @tc.desc Verify NaN as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanOpts: ErrorOptions = { cause: NaN as Object };
      let err = new LinkerMethodConflictError('msg', nanOpts);
      expect(isErr(err as Object)).assertEqual(true);
      expect(isNaN(err.cause as number)).assertTrue();
    })

    /**
     * @tc.name testLinkerMethodConflictError040
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_4000
     * @tc.desc Verify Infinity as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infOpts: ErrorOptions = { cause: Infinity as Object };
      let err = new LinkerMethodConflictError('msg', infOpts);
      expect(isErr(err as Object)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerMethodConflictError041
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_4100
     * @tc.desc Verify message property is writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError('original');
      err.message = 'modified';
      expect(err.message).assertEqual('modified');
    })

    /**
     * @tc.name testLinkerMethodConflictError042
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_4200
     * @tc.desc Verify multi-instance independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1 = new LinkerMethodConflictError('msg1', { cause: new Error('c1') } as ErrorOptions);
      let err2 = new LinkerMethodConflictError('msg2', { cause: new Error('c2') } as ErrorOptions);
      expect(err1.message).assertEqual('msg1');
      expect(err2.message).assertEqual('msg2');
      expect(err1.cause !== err2.cause).assertTrue();
    })

    /**
     * @tc.name testLinkerMethodConflictError043
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_4300
     * @tc.desc Verify instanceof self type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerMethodConflictError('msg');
      expect(isSelf(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerMethodConflictError044
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_4400
     * @tc.desc Verify instanceof LinkerError parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerMethodConflictError('msg');
      expect(isLinkerErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerMethodConflictError045
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_4500
     * @tc.desc Verify instanceof Error parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerMethodConflictError('msg');
      expect(isErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerMethodConflictError046
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_4600
     * @tc.desc Verify throw-catch with no-arg preserves name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerMethodConflictError();
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('LinkerMethodConflictError');
      }
    })

    /**
     * @tc.name testLinkerMethodConflictError047
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_4700
     * @tc.desc Verify throw-catch with message preserves name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerMethodConflictError('thrown msg');
        expect().assertFail();
      } catch (e) {
        expect((e as LinkerMethodConflictError).name).assertEqual('LinkerMethodConflictError');
        expect((e as LinkerMethodConflictError).message).assertEqual('thrown msg');
      }
    })

    /**
     * @tc.name testLinkerMethodConflictError048
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_4800
     * @tc.desc Verify throw-catch with message and cause preserves full chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('root');
      try {
        throw new LinkerMethodConflictError('msg', { cause: root } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).cause === root).assertTrue();
        expect(((e as Error).cause as Error).message).assertEqual('root');
      }
    })

    /**
     * @tc.name testLinkerMethodConflictError049
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_4900
     * @tc.desc Verify stack contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError('msg');
      let stack = err.stack as string;
      expect(stack.includes('LinkerMethodConflictError')).assertTrue();
    })

    /**
     * @tc.name testLinkerMethodConflictError050
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_5000
     * @tc.desc Verify toString format is ClassName: message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError('format test');
      expect(err.toString()).assertEqual('LinkerMethodConflictError: format test');
    })

    /**
     * @tc.name testLinkerMethodConflictError051
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_5100
     * @tc.desc Verify single-level cause chain with Error cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Error('root cause');
      let outer = new LinkerMethodConflictError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as Error).message).assertEqual('root cause');
    })

    /**
     * @tc.name testLinkerMethodConflictError052
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_5200
     * @tc.desc Verify single-level cause chain with TypeError cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new TypeError('type error');
      let outer = new LinkerMethodConflictError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as TypeError).message).assertEqual('type error');
    })

    /**
     * @tc.name testLinkerMethodConflictError053
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_5300
     * @tc.desc Verify cause chain with LinkerError as cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new LinkerError('inner');
      let outer = new LinkerMethodConflictError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as LinkerError).name).assertEqual('LinkerError');
    })

    /**
     * @tc.name testLinkerMethodConflictError054
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_5400
     * @tc.desc Verify 3-level same-type cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3 = new LinkerMethodConflictError('level3');
      let l2 = new LinkerMethodConflictError('level2', { cause: l3 } as ErrorOptions);
      let l1 = new LinkerMethodConflictError('level1', { cause: l2 } as ErrorOptions);
      expect((l1.cause as LinkerMethodConflictError).message).assertEqual('level2');
      expect(((l1.cause as LinkerMethodConflictError).cause as LinkerMethodConflictError).message)
        .assertEqual('level3');
    })

    /**
     * @tc.name testLinkerMethodConflictError055
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_5500
     * @tc.desc Verify 5-level deep cause chain with full traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('depth0');
      let current: Object = root;
      for (let d = 1; d <= 5; d++) {
        current = new LinkerMethodConflictError('depth' + d, { cause: current as Object as Error } as ErrorOptions) as LinkerError;
      }
      expect((current as LinkerError).name).assertEqual('LinkerMethodConflictError');
      let walk: Object = current;
      for (let d = 5; d >= 1; d--) {
        expect((walk as LinkerError).message).assertEqual('depth' + d);
        walk = (walk as LinkerError).cause as Object;
      }
    })

    /**
     * @tc.name testLinkerMethodConflictError056
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_5600
     * @tc.desc Verify try-catch wrapping preserves cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapped: Error = new Error('root failure');
      try {
        throw wrapped;
      } catch (e1) {
        wrapped = new LinkerMethodConflictError('wrapper', { cause: e1 as Error } as ErrorOptions);
      }
      expect((wrapped as LinkerMethodConflictError).name).assertEqual('LinkerMethodConflictError');
      expect((wrapped as LinkerMethodConflictError).message).assertEqual('wrapper');
      expect(((wrapped as LinkerMethodConflictError).cause as Error).message).assertEqual('root failure');
    })

    /**
     * @tc.name testLinkerMethodConflictError057
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_5700
     * @tc.desc Verify string value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError('msg', { cause: 'string cause' as Object } as ErrorOptions);
      expect(err.cause).assertEqual('string cause');
    })

    /**
     * @tc.name testLinkerMethodConflictError058
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_5800
     * @tc.desc Verify number value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError('msg', { cause: 42 as Object } as ErrorOptions);
      expect(err.cause).assertEqual(42);
    })

    /**
     * @tc.name testLinkerMethodConflictError059
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_5900
     * @tc.desc Verify boolean value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError('msg', { cause: true as Object } as ErrorOptions);
      expect(err.cause).assertEqual(true);
    })

    /**
     * @tc.name testLinkerMethodConflictError060
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_METHOD_CONFLICT_ERROR_6000
     * @tc.desc Verify undefined cause results in undefined cause property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerMethodConflictError060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerMethodConflictError('msg', { cause: undefined } as ErrorOptions);
      expect(err.cause).assertUndefined();
    })

  })
}
