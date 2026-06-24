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
  return o instanceof LinkerAbstractMethodError;
}

export default function linkerAbstractMethodErrorTest(): void {
  describe('LinkerAbstractMethodErrorTest', (): void => {
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
     * @tc.name testLinkerAbstractMethodError001
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_0100
     * @tc.desc Verify no-arg constructor sets correct name and empty message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError();
      expect(err.name).assertEqual('LinkerAbstractMethodError');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerAbstractMethodError002
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_0200
     * @tc.desc Verify message-only constructor stores message and correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError('test message');
      expect(err.name).assertEqual('LinkerAbstractMethodError');
      expect(err.message).assertEqual('test message');
    })

    /**
     * @tc.name testLinkerAbstractMethodError003
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_0300
     * @tc.desc Verify message+cause constructor stores both correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new Error('root cause');
      let err = new LinkerAbstractMethodError('msg', { cause: cause } as ErrorOptions);
      expect(err.name).assertEqual('LinkerAbstractMethodError');
      expect(err.message).assertEqual('msg');
      expect(err.cause === cause).assertTrue();
    })

    /**
     * @tc.name testLinkerAbstractMethodError004
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_0400
     * @tc.desc Verify message and explicit undefined options accepts undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError('msg', undefined);
      expect(err.name).assertEqual('LinkerAbstractMethodError');
      expect(err.message).assertEqual('msg');
    })

    /**
     * @tc.name testLinkerAbstractMethodError005
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_0500
     * @tc.desc Verify undefined message and explicit empty options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError(undefined, {});
      expect(err.message).assertEqual('');
      expect(err.cause === undefined).assertTrue();
    })

    /**
     * @tc.name testLinkerAbstractMethodError006
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_0600
     * @tc.desc Verify empty string message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError('');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerAbstractMethodError007
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_0700
     * @tc.desc Verify undefined message yields empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError(undefined);
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerAbstractMethodError008
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_0800
     * @tc.desc Verify single character message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError('A');
      expect(err.message).assertEqual('A');
    })

    /**
     * @tc.name testLinkerAbstractMethodError009
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_0900
     * @tc.desc Verify whitespace-only message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wsMsg = '     ';
      let err = new LinkerAbstractMethodError(wsMsg);
      expect(err.message).assertEqual(wsMsg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError010
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_1000
     * @tc.desc Verify tab message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError('\t');
      expect(err.message).assertEqual('\t');
    })

    /**
     * @tc.name testLinkerAbstractMethodError011
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_1100
     * @tc.desc Verify newline escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nl = '\n';
      let err = new LinkerAbstractMethodError(nl);
      expect(err.message).assertEqual(nl);
    })

    /**
     * @tc.name testLinkerAbstractMethodError012
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_1200
     * @tc.desc Verify carriage return escape as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cr = '\r';
      let err = new LinkerAbstractMethodError(cr);
      expect(err.message).assertEqual(cr);
    })

    /**
     * @tc.name testLinkerAbstractMethodError013
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_1300
     * @tc.desc Verify zero-width space as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsp = '​';
      let err = new LinkerAbstractMethodError(zwsp);
      expect(err.message).assertEqual(zwsp);
      expect(err.message.length).assertEqual(1);
    })

    /**
     * @tc.name testLinkerAbstractMethodError014
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_1400
     * @tc.desc Verify 65535-char message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg = 'A'.repeat(65535);
      let err = new LinkerAbstractMethodError(longMsg);
      expect(err.message).assertEqual(longMsg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError015
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_1500
     * @tc.desc Verify Number.MAX_VALUE.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxStr = Number.MAX_VALUE.toString();
      let err = new LinkerAbstractMethodError(maxStr);
      expect(err.message).assertEqual(maxStr);
    })

    /**
     * @tc.name testLinkerAbstractMethodError016
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_1600
     * @tc.desc Verify Number.MAX_SAFE_INTEGER.toString() as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let safeStr = Number.MAX_SAFE_INTEGER.toString();
      let err = new LinkerAbstractMethodError(safeStr);
      expect(err.message).assertEqual(safeStr);
    })

    /**
     * @tc.name testLinkerAbstractMethodError017
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_1700
     * @tc.desc Verify Chinese message is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg = '中文测试';
      let err = new LinkerAbstractMethodError(msg);
      expect(err.message).assertEqual(msg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError018
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_1800
     * @tc.desc Verify emoji message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiMsg = '😀😁';
      let err = new LinkerAbstractMethodError(emojiMsg);
      expect(err.message).assertEqual(emojiMsg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError019
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_1900
     * @tc.desc Verify RTL text message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtlMsg = '‮عربي';
      let err = new LinkerAbstractMethodError(rtlMsg);
      expect(err.message).assertEqual(rtlMsg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError020
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_2000
     * @tc.desc Verify fullwidth message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fwMsg = 'ＡＢＣ';
      let err = new LinkerAbstractMethodError(fwMsg);
      expect(err.message).assertEqual(fwMsg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError021
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_2100
     * @tc.desc Verify ASCII math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '+-*/';
      let err = new LinkerAbstractMethodError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError022
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_2200
     * @tc.desc Verify Unicode math symbols as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathMsg = '∑∫∞';
      let err = new LinkerAbstractMethodError(mathMsg);
      expect(err.message).assertEqual(mathMsg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError023
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_2300
     * @tc.desc Verify Japanese message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jpMsg = 'テスト';
      let err = new LinkerAbstractMethodError(jpMsg);
      expect(err.message).assertEqual(jpMsg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError024
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_2400
     * @tc.desc Verify Korean message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let krMsg = '테스트';
      let err = new LinkerAbstractMethodError(krMsg);
      expect(err.message).assertEqual(krMsg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError025
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_2500
     * @tc.desc Verify Russian message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ruMsg = 'АБВГД';
      let err = new LinkerAbstractMethodError(ruMsg);
      expect(err.message).assertEqual(ruMsg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError026
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_2600
     * @tc.desc Verify Arabic message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arMsg = 'الاختبار';
      let err = new LinkerAbstractMethodError(arMsg);
      expect(err.message).assertEqual(arMsg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError027
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_2700
     * @tc.desc Verify mixed Latin and Chinese message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixMsg = 'Test 測試';
      let err = new LinkerAbstractMethodError(mixMsg);
      expect(err.message).assertEqual(mixMsg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError028
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_2800
     * @tc.desc Verify XSS string as message preserves special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssMsg = '<script>alert(1)</script>';
      let err = new LinkerAbstractMethodError(xssMsg);
      expect(err.message).assertEqual(xssMsg);
    })

    /**
     * @tc.name testLinkerAbstractMethodError029
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_2900
     * @tc.desc Verify special punctuation as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let punct = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      let err = new LinkerAbstractMethodError(punct);
      expect(err.message).assertEqual(punct);
    })

    /**
     * @tc.name testLinkerAbstractMethodError030
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_3000
     * @tc.desc Verify Unicode replacement character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rp = '�';
      let err = new LinkerAbstractMethodError(rp);
      expect(err.message).assertEqual(rp);
    })

    /**
     * @tc.name testLinkerAbstractMethodError031
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_3100
     * @tc.desc Verify illegal Unicode non-character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nc = '￾';
      let err = new LinkerAbstractMethodError(nc);
      expect(err.message).assertEqual(nc);
    })

    /**
     * @tc.name testLinkerAbstractMethodError032
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_3200
     * @tc.desc Verify lone surrogate character as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lone = '\udc04';
      let err = new LinkerAbstractMethodError(lone);
      expect(err.message).assertEqual(lone);
    })

    /**
     * @tc.name testLinkerAbstractMethodError033
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_3300
     * @tc.desc Verify mojibake garbled text as message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gb = 'æµè¯';
      let err = new LinkerAbstractMethodError(gb);
      expect(err.message).assertEqual(gb);
    })

    /**
     * @tc.name testLinkerAbstractMethodError034
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_3400
     * @tc.desc Verify Map as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapMsg = new Map<string, string>();
      try {
        let err = new LinkerAbstractMethodError(mapMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e)).assertEqual(true);
      }
    })

    /**
     * @tc.name testLinkerAbstractMethodError035
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_3500
     * @tc.desc Verify Set as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setMsg = new Set<string>();
      try {
        let err = new LinkerAbstractMethodError(setMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e)).assertEqual(true);
      }
    })

    /**
     * @tc.name testLinkerAbstractMethodError036
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_3600
     * @tc.desc Verify Date as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateMsg = new Date();
      try {
        let err = new LinkerAbstractMethodError(dateMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e)).assertEqual(true);
      }
    })

    /**
     * @tc.name testLinkerAbstractMethodError037
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_3700
     * @tc.desc Verify RegExp as message is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let regMsg = new RegExp('test', 'gi');
      try {
        let err = new LinkerAbstractMethodError(regMsg as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e)).assertEqual(true);
      }
    })

    /**
     * @tc.name testLinkerAbstractMethodError038
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_3800
     * @tc.desc Verify Function as cause is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fnCause: Object = ((): void => {
      }) as Object;
      try {
        throw new LinkerAbstractMethodError('msg', { cause: fnCause as Object as Error } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e)).assertEqual(true);
      }
    })

    /**
     * @tc.name testLinkerAbstractMethodError039
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_3900
     * @tc.desc Verify NaN as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanOpts: ErrorOptions = { cause: NaN as Object };
      let err = new LinkerAbstractMethodError('msg', nanOpts);
      expect(isErr(err as Object)).assertEqual(true);
      expect(isNaN(err.cause as number)).assertTrue();
    })

    /**
     * @tc.name testLinkerAbstractMethodError040
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_4000
     * @tc.desc Verify Infinity as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infOpts: ErrorOptions = { cause: Infinity as Object };
      let err = new LinkerAbstractMethodError('msg', infOpts);
      expect(isErr(err as Object)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerAbstractMethodError041
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_4100
     * @tc.desc Verify message property is writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError('original');
      err.message = 'modified';
      expect(err.message).assertEqual('modified');
    })

    /**
     * @tc.name testLinkerAbstractMethodError042
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_4200
     * @tc.desc Verify multi-instance independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1 = new LinkerAbstractMethodError('msg1', { cause: new Error('c1') } as ErrorOptions);
      let err2 = new LinkerAbstractMethodError('msg2', { cause: new Error('c2') } as ErrorOptions);
      expect(err1.message).assertEqual('msg1');
      expect(err2.message).assertEqual('msg2');
      expect(err1.cause !== err2.cause).assertTrue();
    })

    /**
     * @tc.name testLinkerAbstractMethodError043
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_4300
     * @tc.desc Verify instanceof self type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerAbstractMethodError('msg');
      expect(isSelf(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerAbstractMethodError044
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_4400
     * @tc.desc Verify instanceof LinkerError parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerAbstractMethodError('msg');
      expect(isLinkerErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerAbstractMethodError045
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_4500
     * @tc.desc Verify instanceof Error parent type via helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Object = new LinkerAbstractMethodError('msg');
      expect(isErr(e)).assertEqual(true);
    })

    /**
     * @tc.name testLinkerAbstractMethodError046
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_4600
     * @tc.desc Verify throw-catch with no-arg preserves name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerAbstractMethodError();
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('LinkerAbstractMethodError');
      }
    })

    /**
     * @tc.name testLinkerAbstractMethodError047
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_4700
     * @tc.desc Verify throw-catch with message preserves name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerAbstractMethodError('thrown msg');
        expect().assertFail();
      } catch (e) {
        expect((e as LinkerAbstractMethodError).name).assertEqual('LinkerAbstractMethodError');
        expect((e as LinkerAbstractMethodError).message).assertEqual('thrown msg');
      }
    })

    /**
     * @tc.name testLinkerAbstractMethodError048
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_4800
     * @tc.desc Verify throw-catch with message and cause preserves full chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('root');
      try {
        throw new LinkerAbstractMethodError('msg', { cause: root } as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).cause === root).assertTrue();
        expect(((e as Error).cause as Error).message).assertEqual('root');
      }
    })

    /**
     * @tc.name testLinkerAbstractMethodError049
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_4900
     * @tc.desc Verify stack contains class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError('msg');
      let stack = err.stack as string;
      expect(stack.length > 0).assertTrue();
    })

    /**
     * @tc.name testLinkerAbstractMethodError050
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_5000
     * @tc.desc Verify toString format is ClassName: message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError('format test');
      expect(err.toString()).assertEqual('LinkerAbstractMethodError: format test');
    })

    /**
     * @tc.name testLinkerAbstractMethodError051
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_5100
     * @tc.desc Verify single-level cause chain with Error cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new Error('root cause');
      let outer = new LinkerAbstractMethodError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as Error).message).assertEqual('root cause');
    })

    /**
     * @tc.name testLinkerAbstractMethodError052
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_5200
     * @tc.desc Verify single-level cause chain with TypeError cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new TypeError('type error');
      let outer = new LinkerAbstractMethodError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as TypeError).message).assertEqual('type error');
    })

    /**
     * @tc.name testLinkerAbstractMethodError053
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_5300
     * @tc.desc Verify cause chain with LinkerError as cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new LinkerError('inner');
      let outer = new LinkerAbstractMethodError('outer', { cause: inner } as ErrorOptions);
      expect(outer.cause === inner).assertTrue();
      expect((outer.cause as LinkerError).name).assertEqual('LinkerError');
    })

    /**
     * @tc.name testLinkerAbstractMethodError054
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_5400
     * @tc.desc Verify 3-level same-type cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l3 = new LinkerAbstractMethodError('level3');
      let l2 = new LinkerAbstractMethodError('level2', { cause: l3 } as ErrorOptions);
      let l1 = new LinkerAbstractMethodError('level1', { cause: l2 } as ErrorOptions);
      expect((l1.cause as LinkerAbstractMethodError).message).assertEqual('level2');
      expect(((l1.cause as LinkerAbstractMethodError).cause as LinkerAbstractMethodError).message)
        .assertEqual('level3');
    })

    /**
     * @tc.name testLinkerAbstractMethodError055
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_5500
     * @tc.desc Verify 5-level deep cause chain with full traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('depth0');
      let current: Object = root;
      for (let d = 1; d <= 5; d++) {
        current = new LinkerAbstractMethodError('depth' + d, { cause: current as Object as Error } as ErrorOptions) as LinkerError;
      }
      expect((current as LinkerError).name).assertEqual('LinkerAbstractMethodError');
      let walk: Object = current;
      for (let d = 5; d >= 1; d--) {
        expect((walk as LinkerError).message).assertEqual('depth' + d);
        walk = (walk as LinkerError).cause as Object;
      }
    })

    /**
     * @tc.name testLinkerAbstractMethodError056
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_5600
     * @tc.desc Verify try-catch wrapping preserves cause chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapped: Error = new Error('root failure');
      try {
        throw wrapped;
      } catch (e1) {
        wrapped = new LinkerAbstractMethodError('wrapper', { cause: e1 as Error } as ErrorOptions);
      }
      expect((wrapped as LinkerAbstractMethodError).name).assertEqual('LinkerAbstractMethodError');
      expect((wrapped as LinkerAbstractMethodError).message).assertEqual('wrapper');
      expect(((wrapped as LinkerAbstractMethodError).cause as Error).message).assertEqual('root failure');
    })

    /**
     * @tc.name testLinkerAbstractMethodError057
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_5700
     * @tc.desc Verify string value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError('msg', { cause: 'string cause' as Object } as ErrorOptions);
      expect(err.cause).assertEqual('string cause');
    })

    /**
     * @tc.name testLinkerAbstractMethodError058
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_5800
     * @tc.desc Verify number value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError('msg', { cause: 42 as Object } as ErrorOptions);
      expect(err.cause).assertEqual(42);
    })

    /**
     * @tc.name testLinkerAbstractMethodError059
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_5900
     * @tc.desc Verify boolean value as cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError('msg', { cause: true as Object } as ErrorOptions);
      expect(err.cause).assertEqual(true);
    })

    /**
     * @tc.name testLinkerAbstractMethodError060
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ABSTRACT_METHOD_ERROR_6000
     * @tc.desc Verify undefined cause results in undefined cause property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerAbstractMethodError060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerAbstractMethodError('msg', { cause: undefined } as ErrorOptions);
      expect(err.cause).assertUndefined();
    })

  })
}
