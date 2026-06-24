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

export default function linkerErrorTest(): void {
  describe('LinkerErrorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_0100
     * @tc.name testLinkerError001
     * @tc.desc Verify 3-param constructor with all required args stores name message cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new Error('root');
      let err = new LinkerError('MyError', 'msg', { cause: cause } as ErrorOptions);
      expect(err.name).assertEqual('MyError');
      expect(err.message).assertEqual('msg');
      expect(err.cause === cause).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_0200
     * @tc.name testLinkerError002
     * @tc.desc Verify name parameter with normal English string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('MyError', 'test message', {});
      expect(err.name).assertEqual('MyError');
      expect(err.message).assertEqual('test message');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_0300
     * @tc.name testLinkerError003
     * @tc.desc Verify Map as name is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapName = new Map<string, string>();
      try {
        let err = new LinkerError(mapName as Object as String, 'msg', undefined);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_0400
     * @tc.name testLinkerError004
     * @tc.desc Verify name parameter with Chinese string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chineseName = '\u94FE\u63A5\u9519\u8BEF';
      let err = new LinkerError(chineseName, 'msg', {});
      expect(err.name).assertEqual(chineseName);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_0500
     * @tc.name testLinkerError005
     * @tc.desc Verify name parameter with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('', 'msg', {});
      expect(err.name).assertEqual('');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_0600
     * @tc.name testLinkerError006
     * @tc.desc Verify name parameter with single character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('A', 'msg', {});
      expect(err.name).assertEqual('A');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_0700
     * @tc.name testLinkerError007
     * @tc.desc Verify name parameter with long string 1000 chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longName = 'x'.repeat(500);
      let err = new LinkerError(longName, 'msg', {});
      expect(err.name).assertEqual(longName);
      expect(err.name.length).assertEqual(500);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_0800
     * @tc.name testLinkerError008
     * @tc.desc Verify message parameter with normal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('MyError', 'error message', {});
      expect(err.message).assertEqual('error message');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_0900
     * @tc.name testLinkerError009
     * @tc.desc Verify message parameter with undefined yields empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('MyError', undefined, {});
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_1000
     * @tc.name testLinkerError010
     * @tc.desc Verify message parameter with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('MyError', '', {});
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_1100
     * @tc.name testLinkerError011
     * @tc.desc Verify message parameter with long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg = 'M'.repeat(1000);
      let err = new LinkerError('MyError', longMsg, {});
      expect(err.message).assertEqual(longMsg);
      expect(err.message.length).assertEqual(1000);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_1200
     * @tc.name testLinkerError012
     * @tc.desc Verify Function as name is rejected by runtime as-cast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fnName = (): void => {
      };
      try {
        let err = new LinkerError(fnName as Object as String, 'msg', undefined);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_1300
     * @tc.name testLinkerError013
     * @tc.desc Verify options with TypeError subclass cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new TypeError('type error');
      let err = new LinkerError('TestError', 'message', { cause: cause } as ErrorOptions);
      expect((err as Error).cause).assertEqual(cause);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_1400
     * @tc.name testLinkerError014
     * @tc.desc Verify options undefined yields undefined cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('TestError', 'message', undefined);
      expect((err as Error).cause === undefined).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_1500
     * @tc.name testLinkerError015
     * @tc.desc Verify options empty object yields undefined cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('TestError', 'message', {});
      expect((err as Error).cause === undefined).assertTrue();
    })

    /**
     * @tc.name testLinkerError016
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_1600
     * @tc.desc Verify lone high surrogate as name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hi = '\ud800';
      let err = new LinkerError(hi, hi, undefined);
      expect(err.name).assertEqual(hi);
      expect(err.message).assertEqual(hi);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_1700
     * @tc.name testLinkerError017
     * @tc.desc Verify message undefined with options valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new Error('root cause');
      let err = new LinkerError('MyError', undefined, { cause: cause } as ErrorOptions);
      expect(err.name).assertEqual('MyError');
      expect((err as Error).cause).assertEqual(cause);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_1800
     * @tc.name testLinkerError018
     * @tc.desc Verify multi-instance independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1 = new LinkerError('Error1', 'msg1', undefined);
      let err2 = new LinkerError('Error2', 'msg2', { cause: new Error('c') } as ErrorOptions);
      expect(err1.name).assertEqual('Error1');
      expect(err2.name).assertEqual('Error2');
      expect(err1.message).assertEqual('msg1');
      expect(err2.message).assertEqual('msg2');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_1900
     * @tc.name testLinkerError019
     * @tc.desc Verify cause chain with LinkerError as cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new LinkerError('InnerError', 'inner msg', undefined);
      let outer = new LinkerError('OuterError', 'outer msg', { cause: inner } as ErrorOptions);
      expect((outer as Error).cause).assertEqual(inner);
      expect(((outer as Error).cause as LinkerError).name).assertEqual('InnerError');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_2000
     * @tc.name testLinkerError020
     * @tc.desc Verify cause chain remains readable through nested errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new Error('root');
      let middle = new LinkerError('MiddleError', 'middle', { cause: root } as ErrorOptions);
      let outer = new LinkerError('OuterError', 'outer', { cause: middle } as ErrorOptions);
      expect(((outer as Error).cause as LinkerError).name).assertEqual('MiddleError');
      expect((((outer as Error).cause as LinkerError).cause as Error).message).assertEqual('root');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_2100
     * @tc.name testLinkerError021
     * @tc.desc Verify name property is writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('TestError', 'message', undefined);
      err.name = 'ModifiedError'
      expect(err.name).assertEqual('ModifiedError');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_2200
     * @tc.name testLinkerError022
     * @tc.desc Verify message property is writable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('TestError', 'message', undefined);
      err.message = 'modified message'
      expect(err.message).assertEqual('modified message');
    })

    /**
     * @tc.name testLinkerError023
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_2300
     * @tc.desc Verify Unicode non-character FFFF as name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nc = '￿';
      let err = new LinkerError(nc, 'msg', { cause: new Error('root') } as ErrorOptions);
      expect(err.name).assertEqual(nc);
      expect(err.message).assertEqual('msg');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_2400
     * @tc.name testLinkerError024
     * @tc.desc Verify toString returns name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('TestError', 'error detail', undefined);
      expect(err.toString()).assertEqual('TestError: error detail');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_2500
     * @tc.name testLinkerError025
     * @tc.desc Verify null as name throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let err = new LinkerError(null as Object as String, 'msg', undefined);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_2600
     * @tc.name testLinkerError026
     * @tc.desc Verify throw LinkerError caught with correct name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new LinkerError('ThrownError', 'thrown message', { cause: new Error('root') } as ErrorOptions)
        expect().assertFail();
      } catch (error) {
        expect(error instanceof LinkerError).assertTrue();
        expect((error as LinkerError).name).assertEqual('ThrownError');
        expect((error as LinkerError).message).assertEqual('thrown message');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_2700
     * @tc.name testLinkerError027
     * @tc.desc Verify cause chain preserved in throw catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rootCause = new Error('root cause');
      try {
        throw new LinkerError('WrapperError', 'wrapper', { cause: rootCause } as ErrorOptions)
        expect().assertFail();
      } catch (error) {
        expect(error instanceof LinkerError).assertTrue();
        expect(((error as Error).cause as Error).message).assertEqual('root cause');
      }
    })

    /**
     * @tc.name testLinkerError028
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_2800
     * @tc.desc Verify 2-param constructor no arguments sets name to LinkerError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError();
      expect(err.name).assertEqual('LinkerError');
      expect(err.message).assertEqual('');
      expect(err.cause === undefined).assertTrue();
    })

    /**
     * @tc.name testLinkerError029
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_2900
     * @tc.desc Verify emoji as name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiName1 = '\uD83D\uDE00\uD83D\uDE01';
      let err1 = new LinkerError(emojiName1, 'msg', undefined);
      expect(err1.name).assertEqual(emojiName1);
      let emojiName2 = '\u2764\uFE0F';
      let err2 = new LinkerError(emojiName2, 'desc', undefined);
      expect(err2.name).assertEqual(emojiName2);
    })

    /**
     * @tc.name testLinkerError030
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_3000
     * @tc.desc Verify RTL as name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtlName1 = '\u202E\u0639\u0631\u0628\u064A';
      let err1 = new LinkerError(rtlName1, 'msg', undefined);
      expect(err1.name).assertEqual(rtlName1);
      let rtlName2 = '\u202E\u0645\u0631\u062D\u0628\u0627';
      let err2 = new LinkerError(rtlName2, 'desc', undefined);
      expect(err2.name).assertEqual(rtlName2);
    })

    /**
     * @tc.name testLinkerError031
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_3100
     * @tc.desc Verify fullwidth as name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fullName1 = '\uFF21\uFF22\uFF23';
      let err1 = new LinkerError(fullName1, 'msg', undefined);
      expect(err1.name).assertEqual(fullName1);
      let fullName2 = '\uFF34\uFF45\uFF53\uFF54';
      let err2 = new LinkerError(fullName2, 'desc', undefined);
      expect(err2.name).assertEqual(fullName2);
    })

    /**
     * @tc.name testLinkerError032
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_3200
     * @tc.desc Verify whitespace-only name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wsName1 = '   ';
      let err1 = new LinkerError(wsName1, 'msg', undefined);
      expect(err1.name).assertEqual(wsName1);
      let wsName2 = ' ';
      let err2 = new LinkerError(wsName2, 'desc', undefined);
      expect(err2.name).assertEqual(wsName2);
    })

    /**
     * @tc.name testLinkerError033
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_3300
     * @tc.desc Verify tab-only name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tabName1 = '\t\t\t';
      let err1 = new LinkerError(tabName1, 'msg', undefined);
      expect(err1.name).assertEqual(tabName1);
      let tabName2 = '\t';
      let err2 = new LinkerError(tabName2, 'desc', undefined);
      expect(err2.name).assertEqual(tabName2);
    })

    /**
     * @tc.name testLinkerError034
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_3400
     * @tc.desc Verify 65535-char name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longName1 = 'A'.repeat(65535);
      let err1 = new LinkerError(longName1, 'msg', undefined);
      expect(err1.name).assertEqual(longName1);
    })

    /**
     * @tc.name testLinkerError035
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_3500
     * @tc.desc Verify Number.MAX_VALUE.toString() as name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxName1 = Number.MAX_VALUE.toString();
      let err1 = new LinkerError(maxName1, 'msg', undefined);
      expect(err1.name).assertEqual(maxName1);
      let maxName2 = Number.MIN_VALUE.toString();
      let err2 = new LinkerError(maxName2, 'desc', undefined);
      expect(err2.name).assertEqual(maxName2);
    })

    /**
     * @tc.name testLinkerError036
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_3600
     * @tc.desc Verify 2-param constructor message only stores message and default name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('test message');
      expect(err.name).assertEqual('LinkerError');
      expect(err.message).assertEqual('test message');
    })

    /**
     * @tc.name testLinkerError037
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_3700
     * @tc.desc Verify mojibake garbled text as name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gb = 'æµè¯';
      let err = new LinkerError(gb, gb, undefined);
      expect(err.name).assertEqual(gb);
      expect(err.message).assertEqual(gb);
    })

    /**
     * @tc.name testLinkerError038
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_3800
     * @tc.desc Verify 2-param constructor undefined message yields empty message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError(undefined);
      expect(err.name).assertEqual('LinkerError');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerError039
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_3900
     * @tc.desc Verify 2-param constructor message and cause stores both
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new Error('root cause');
      let err = new LinkerError('msg', { cause: cause } as ErrorOptions);
      expect(err.name).assertEqual('LinkerError');
      expect(err.message).assertEqual('msg');
      expect(err.cause === cause).assertTrue();
    })

    /**
     * @tc.name testLinkerError040
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_4000
     * @tc.desc Verify 2-param constructor message and empty options
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('msg', {});
      expect(err.name).assertEqual('LinkerError');
      expect(err.message).assertEqual('msg');
      expect(err.cause === undefined).assertTrue();
    })

    /**
     * @tc.name testLinkerError041
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_4100
     * @tc.desc Verify 2-param constructor undefined message and cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new Error('cause');
      let err = new LinkerError(undefined, { cause: cause } as ErrorOptions);
      expect(err.name).assertEqual('LinkerError');
      expect(err.message).assertEqual('');
      expect(err.cause === cause).assertTrue();
    })

    /**
     * @tc.name testLinkerError042
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_4200
     * @tc.desc Verify 3-param constructor empty message and cause preserves name and cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause = new Error('root');
      let err = new LinkerError('CustomName', '', { cause: cause } as ErrorOptions);
      expect(err.name).assertEqual('CustomName');
      expect(err.message).assertEqual('');
      expect(err.cause === cause).assertTrue();
    })

    /**
     * @tc.name testLinkerError043
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_4300
     * @tc.desc Verify 2-param constructor message and explicit undefined options
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('msg', undefined);
      expect(err.name).assertEqual('LinkerError');
      expect(err.message).assertEqual('msg');
    })

    /**
     * @tc.name testLinkerError044
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_4400
     * @tc.desc Verify 2-param constructor undefined message and explicit empty options
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError(undefined, {});
      expect(err.name).assertEqual('LinkerError');
      expect(err.message).assertEqual('');
      expect(err.cause === undefined).assertTrue();
    })

    /**
     * @tc.name testLinkerError045
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_4500
     * @tc.desc Verify 2-param constructor both arguments explicitly undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError(undefined, undefined);
      expect(err.name).assertEqual('LinkerError');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerError046
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_4600
     * @tc.desc Verify name=A.repeat(1001) + emoji message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longName1 = 'A'.repeat(1001);
      let emojiMsg1 = '\uD83D\uDE00\uD83D\uDE01';
      let err1 = new LinkerError(longName1, emojiMsg1, undefined);
      expect(err1.name).assertEqual(longName1);
      expect(err1.message).assertEqual(emojiMsg1);
    })

    /**
     * @tc.name testLinkerError047
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_4700
     * @tc.desc Verify zero-width space as name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsp = '\u200B';
      let err = new LinkerError(zwsp, zwsp, undefined);
      expect(err.name).assertEqual(zwsp);
      expect(err.message).assertEqual(zwsp);
      expect(err.name.length).assertEqual(1);
      expect(err.message.length).assertEqual(1);
    })

    /**
     * @tc.name testLinkerError048
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_4800
     * @tc.desc Verify newline escape as name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nl = '\n';
      let err = new LinkerError(nl, nl, { cause: new Error('root') } as ErrorOptions);
      expect(err.name).assertEqual(nl);
      expect(err.message).assertEqual(nl);
    })

    /**
     * @tc.name testLinkerError049
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_4900
     * @tc.desc Verify carriage return escape as name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cr = '\r';
      let err = new LinkerError(cr, cr, undefined);
      expect(err.name).assertEqual(cr);
      expect(err.message).assertEqual(cr);
    })

    /**
     * @tc.name testLinkerError050
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_5000
     * @tc.desc Verify Unicode replacement character as name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rp = '�';
      let err = new LinkerError(rp, 'msg', { cause: new Error('root') } as ErrorOptions);
      expect(err.name).assertEqual(rp);
      expect(err.message).assertEqual('msg');
    })

    /**
     * @tc.name testLinkerError051
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_5100
     * @tc.desc Verify Russian multi-language as name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ru = 'АБВГД';
      let err = new LinkerError(ru, ru, undefined);
      expect(err.name).assertEqual(ru);
      expect(err.message).assertEqual(ru);
    })

    /**
     * @tc.name testLinkerError052
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_5200
     * @tc.desc Verify special punctuation as name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let punct = '!@#$%^&*()_+-=[]{}|;:,.<>?/~`';
      let err = new LinkerError(punct, punct, { cause: new Error('root') } as ErrorOptions);
      expect(err.name).assertEqual(punct);
      expect(err.message).assertEqual(punct);
    })

    /**
     * @tc.name testLinkerError053
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_5300
     * @tc.desc Verify lone surrogate character as name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lone = '\udc04';
      let err = new LinkerError(lone, lone, undefined);
      expect(err.name).assertEqual(lone);
      expect(err.message).assertEqual(lone);
    })

    /**
     * @tc.name testLinkerError054
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_5400
     * @tc.desc Verify 65535 chars of 0 as message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg1 = '0'.repeat(65535);
      let err1 = new LinkerError('LongMsg', longMsg1, { cause: new Error('root') } as ErrorOptions);
      expect(err1.message).assertEqual(longMsg1);
    })

    /**
     * @tc.name testLinkerError055
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_5500
     * @tc.desc Verify name fullwidth numerical string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fwName1 = '\uFF11\uFF12\uFF13';
      let err1 = new LinkerError(fwName1, 'msg', { cause: new Error('root') } as ErrorOptions);
      expect(err1.name).assertEqual(fwName1);
      let fwName2 = '\uFF10';
      let err2 = new LinkerError(fwName2, '', {});
      expect(err2.name).assertEqual(fwName2);
    })

    /**
     * @tc.name testLinkerError056
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_5600
     * @tc.desc Verify deep cause chain 10 levels with escalating abnormal names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chain1: Error = new Error('level10');
      chain1 = new LinkerError('L9', 'msg9', { cause: chain1 } as ErrorOptions)
      chain1 = new LinkerError('L8', 'msg8', { cause: chain1 } as ErrorOptions)
      chain1 = new LinkerError('', 'msg7', { cause: chain1 } as ErrorOptions)
      chain1 = new LinkerError('-999', 'msg6', { cause: chain1 } as ErrorOptions)
      chain1 = new LinkerError('\uFF11\uFF12\uFF13', 'msg5', { cause: chain1 } as ErrorOptions)
      chain1 = new LinkerError(' ', 'msg4', { cause: chain1 } as ErrorOptions)
      chain1 = new LinkerError('NaN', 'msg3', { cause: chain1 } as ErrorOptions)
      chain1 = new LinkerError('Infinity', 'msg2', { cause: chain1 } as ErrorOptions)
      chain1 = new LinkerError('Symbol', 'msg1', { cause: chain1 } as ErrorOptions)
      expect((chain1 as LinkerError).name).assertEqual('Symbol');
      let cur: Object = chain1;
      let names: string[] = [];
      for (let i = 0; i < 9; i++) {
        names.push((cur as LinkerError).name);
        cur = (cur as LinkerError).cause as Object;
      }
      expect(names[0]).assertEqual('Symbol');
      expect(names[8]).assertEqual('L9');
      expect(cur instanceof Error).assertTrue();
    })

    /**
     * @tc.name testLinkerError057
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_5700
     * @tc.desc Verify name + message + options all whitespace only
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1 = new LinkerError('   ', '   ', { cause: new Error('root') } as ErrorOptions);
      expect(err1.name).assertEqual('   ');
      expect(err1.message).assertEqual('   ');
      let err2 = new LinkerError(' ', ' ', {});
      expect(err2.name).assertEqual(' ');
      expect(err2.message).assertEqual(' ');
    })

    /**
     * @tc.name testLinkerError058
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_5800
     * @tc.desc Verify illegal Unicode non-character as name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nc = '￾';
      let err = new LinkerError(nc, 'msg', { cause: new Error('root') } as ErrorOptions);
      expect(err.name).assertEqual(nc);
      expect(err.message).assertEqual('msg');
    })

    /**
     * @tc.name testLinkerError059
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_5900
     * @tc.desc Verify ASCII math symbols as name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathName = '+-*/';
      let err = new LinkerError(mathName, 'msg', { cause: new Error('root') } as ErrorOptions);
      expect(err.name).assertEqual(mathName);
    })

    /**
     * @tc.name testLinkerError060
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_6000
     * @tc.desc Verify Unicode math symbols as name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mathName = '\u2211\u222B\u221E';
      let err = new LinkerError(mathName, 'test', { cause: new TypeError('t') } as ErrorOptions);
      expect(err.name).assertEqual(mathName);
    })

    /**
     * @tc.name testLinkerError061
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_6100
     * @tc.desc Verify toString with whitespace name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('   ', '   ', { cause: new Error('root') } as ErrorOptions);
      expect(err.toString()).assertEqual('   :    ');
    })

    /**
     * @tc.name testLinkerError062
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_6200
     * @tc.desc Verify toString with fullwidth name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('\uFF11\uFF12\uFF13', '\u221E\u221E', {});
      expect(err.toString()).assertEqual('\uFF11\uFF12\uFF13: \u221E\u221E');
    })

    /**
     * @tc.name testLinkerError063
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_6300
     * @tc.desc Verify mixed Latin and Chinese as name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mix = 'Test 測試';
      let err = new LinkerError(mix, mix, undefined);
      expect(err.name).assertEqual(mix);
      expect(err.message).assertEqual(mix);
    })

    /**
     * @tc.name testLinkerError064
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_6400
     * @tc.desc Verify multi-language Japanese and Korean as name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jpName = 'テスト';
      let krMsg = '테스트';
      let err = new LinkerError(jpName, krMsg, { cause: new Error('root') } as ErrorOptions);
      expect(err.name).assertEqual(jpName);
      expect(err.message).assertEqual(krMsg);
    })

    /**
     * @tc.name testLinkerError065
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_6500
     * @tc.desc Verify Arabic multi-language as name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ar = 'الاختبار';
      let err = new LinkerError(ar, ar, { cause: new Error('root') } as ErrorOptions);
      expect(err.name).assertEqual(ar);
      expect(err.message).assertEqual(ar);
    })

    /**
     * @tc.name testLinkerError066
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_6600
     * @tc.desc Verify XSS string as message preserves special characters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssMsg = '<script>alert(1)</script>';
      let err = new LinkerError('XSSErr', xssMsg, { cause: new Error('root') } as ErrorOptions);
      expect(err.name).assertEqual('XSSErr');
      expect(err.message).assertEqual(xssMsg);
    })

    /**
     * @tc.name testLinkerError067
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_6700
     * @tc.desc Verify name whitespace and message undefined with options undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1 = new LinkerError(' ', undefined, undefined);
      expect(err1.name).assertEqual(' ');
      expect(err1.message).assertEqual('');
    })

    /**
     * @tc.name testLinkerError068
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_6800
     * @tc.desc Verify Number.MAX_SAFE_INTEGER.toString as name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxName1 = Number.MAX_SAFE_INTEGER.toString();
      let err1 = new LinkerError(maxName1, 'msg', { cause: new Error('root') } as ErrorOptions);
      expect(err1.name).assertEqual(maxName1);
    })

    /**
     * @tc.name testLinkerError069
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_6900
     * @tc.desc Verify multi-level try-catch wrapping preserves full cause chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapped: Error = new Error('root failure');
      try {
        throw wrapped;
      } catch (e1) {
        wrapped = new LinkerError('Layer3', 'wrapped at layer3', { cause: e1 as Error } as ErrorOptions);
        try {
          throw wrapped;
        } catch (e2) {
          wrapped = new LinkerError('Layer2', 'wrapped at layer2', { cause: e2 as Error } as ErrorOptions);
          try {
            throw wrapped;
          } catch (e3) {
            wrapped = new LinkerError('Layer1', 'wrapped at layer1', { cause: e3 as Error } as ErrorOptions);
          }
        }
      }
      // Layer1: LinkerError
      expect(wrapped instanceof LinkerError).assertTrue();
      expect((wrapped as LinkerError).name).assertEqual('Layer1');
      expect((wrapped as LinkerError).message).assertEqual('wrapped at layer1');
      // Layer2: LinkerError
      let l2 = (wrapped as LinkerError).cause as LinkerError;
      expect(l2 instanceof LinkerError).assertTrue();
      expect(l2.name).assertEqual('Layer2');
      expect(l2.message).assertEqual('wrapped at layer2');
      // Layer3: LinkerError
      let l3 = l2.cause as LinkerError;
      expect(l3 instanceof LinkerError).assertTrue();
      expect(l3.name).assertEqual('Layer3');
      expect(l3.message).assertEqual('wrapped at layer3');
      // Root: Error
      let root = l3.cause as Error;
      expect(root instanceof Error).assertTrue();
      expect(root.name).assertEqual('Error');
      expect(root.message).assertEqual('root failure');
    })

    /**
     * @tc.name testLinkerError070
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_7000
     * @tc.desc Verify Set as name is rejected by runtime as-cast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setName = new Set<string>();
      try {
        let err = new LinkerError(setName as Object as String, 'msg', undefined);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.name testLinkerError071
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_7100
     * @tc.desc Verify Date as name is rejected by runtime as-cast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateName = new Date();
      try {
        let err = new LinkerError(dateName as Object as String, 'msg', undefined);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.name testLinkerError072
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_7200
     * @tc.desc Verify RegExp as name is rejected by runtime as-cast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let regName = new RegExp('test', 'gi');
      try {
        let err = new LinkerError(regName as Object as String, 'msg', undefined);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.name testLinkerError073
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_7300
     * @tc.desc Verify NaN as name throws ClassCastError with correct properties
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let err = new LinkerError(NaN as Object as String, 'msg', undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerError074
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_7400
     * @tc.desc Verify Infinity as name throws ClassCastError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let err = new LinkerError(Infinity as Object as String, 'msg', undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.name testLinkerError075
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_7500
     * @tc.desc Verify stack property contains error name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError("StackName1", "msg", { cause: new Error("root") } as ErrorOptions);
      let stack = err.stack as string;
      expect(stack.length > 0).assertTrue();
      expect(stack.includes('LinkerError')).assertTrue();

      let errShort = new LinkerError("A", "b", {});
      let stackShort = errShort.stack as string;
      expect(stackShort.length > 0).assertTrue();
      expect(stackShort.includes('LinkerError')).assertTrue();
    })

    /**
     * @tc.name testLinkerError076
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_7600
     * @tc.desc Verify self-referencing cause chain preserves reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError("SelfRef", "self", {});
      let opts: ErrorOptions = { cause: err };
      let errParent = new LinkerError("Parent", "parent", opts);
      expect(errParent.cause).assertEqual(err);
      expect((errParent.cause as LinkerError).name).assertEqual("SelfRef");
    })

    /**
     * @tc.name testLinkerError077
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_7700
     * @tc.desc Verify Map as message is rejected by runtime as-cast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapMsg = new Map<string, string>();
      try {
        let err = new LinkerError("MapMsg", mapMsg as Object as string, {} as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e as Object)).assertEqual(true);
      }
    })

    /**
     * @tc.name testLinkerError078
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_7800
     * @tc.desc Verify Set as message is rejected by runtime as-cast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let setMsg = new Set<string>();
      try {
        let err = new LinkerError("SetMsg", setMsg as Object as string, {} as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e as Object)).assertEqual(true);
      }
    })

    /**
     * @tc.name testLinkerError079
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_7900
     * @tc.desc Verify Date as message is rejected by runtime as-cast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dateMsg = new Date();
      try {
        let err = new LinkerError("DateMsg", dateMsg as Object as string, {} as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e as Object)).assertEqual(true);
      }
    })

    /**
     * @tc.name testLinkerError080
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_8000
     * @tc.desc Verify RegExp as message is rejected by runtime as-cast
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testLinkerError080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let regMsg = new RegExp('test', 'gi');
      try {
        let err = new LinkerError("RegMsg", regMsg as Object as string, {} as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect(isErr(e as Object)).assertEqual(true);
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_8100
     * @tc.name testLinkerError081
     * @tc.desc Verify empty string message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('');
      expect(err.message).assertEqual('');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_8200
     * @tc.name testLinkerError082
     * @tc.desc Verify long string message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr = 'a'.repeat(100);
      let err = new LinkerError(longStr);
      expect(err.message).assertEqual(longStr);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_8300
     * @tc.name testLinkerError083
     * @tc.desc Verify Unicode string message is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let unicodeStr = '\u4e2d\u6587\u9519\u8bef';
      let err = new LinkerError(unicodeStr);
      expect(err.message).assertEqual(unicodeStr);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_8400
     * @tc.name testLinkerError084
     * @tc.desc Verify boolean true as name throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let err = new LinkerError(true as Object as String, 'msg', undefined);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_8500
     * @tc.name testLinkerError085
     * @tc.desc Verify cause as LinkerError preserves identity and name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = new LinkerError('inner');
      let err = new LinkerError('outer', { cause: inner } as ErrorOptions);
      expect(err.cause === inner).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_8600
     * @tc.name testLinkerError086
     * @tc.desc Verify LinkerError base class holds subclass instance as cause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let subCause = new LinkerVerificationError('verification failure');
      let err = new LinkerError('base', { cause: subCause } as ErrorOptions);
      expect(err.cause === subCause).assertTrue();
      expect((err.cause as LinkerVerificationError).name).assertEqual('LinkerVerificationError');
      expect((err.cause as LinkerVerificationError).message).assertEqual('verification failure');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_8700
     * @tc.name testLinkerError087
     * @tc.desc Verify string cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('msg', { cause: 'reason' } as ErrorOptions);
      expect(err.cause).assertEqual('reason');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_8800
     * @tc.name testLinkerError088
     * @tc.desc Verify number cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('msg', { cause: 42 } as ErrorOptions);
      expect(err.cause).assertEqual(42);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_8900
     * @tc.name testLinkerError089
     * @tc.desc Verify null as message throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let err = new LinkerError('NullMsg', null as Object as string, {} as ErrorOptions);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('ClassCastError');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_9000
     * @tc.name testLinkerError090
     * @tc.desc Verify undefined cause results in undefined cause property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('msg', { cause: undefined } as ErrorOptions);
      expect(err.cause === undefined).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_9100
     * @tc.name testLinkerError091
     * @tc.desc Verify boolean cause is stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('msg', { cause: false } as ErrorOptions);
      expect(err.cause).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LINKER_ERROR_9200
     * @tc.name testLinkerError092
     * @tc.desc Verify cause property can be assigned after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLinkerError092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err = new LinkerError('msg');
      expect(err.cause === undefined).assertTrue();
      let lateCause = new Error('late assigned');
      err.cause = lateCause;
      expect(err.cause === lateCause).assertTrue();
      expect((err.cause as Error).message).assertEqual('late assigned');
    })
  })
}
