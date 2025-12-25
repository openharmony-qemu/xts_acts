/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import Utils from '../Util.test';
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';


export default function bufferTest3() {
  describe("bufferTest3", (): void => {
    afterEach(() => {
      await Utils.msSleep(20);
    })
    /**
     * @tc.name   testBuffer3_001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_001
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf = buffer.from('this is a buffer');
      expect(buf.includes('this')).assertTrue;
      expect(buf.includes('be')).assertTrue;
    })
    /**
     * @tc.name   testBuffer3_002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_002
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf = buffer.from('this is a buffer');
      expect(buf.includes('this', 0)).assertTrue;
      expect(buf.includes('be', 0, "utf8" as buffer.BufferEncoding)).assertTrue;
    })
    /**
     * @tc.name   testBuffer3_003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_003
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf = buffer.from('this is a buffer');
      expect(buf.includes('this', 3)).assertTrue;
      expect(buf.includes('be', 0, "utf8" as buffer.BufferEncoding)).assertTrue;
    })

    /**
     * @tc.name   testBuffer3_004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_004
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf = buffer.from('this is a buffer');
      expect(buf.includes('this', 3)).assertTrue;
      expect(buf.includes(5, 0, "utf8" as buffer.BufferEncoding)).assertTrue;
    })

    /**
     * @tc.name   testBuffer3_005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_005
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf = buffer.from('this is a buffer');
      expect(buf.indexOf('this')).assertEqual(0);
      expect(buf.indexOf('is')).assertEqual(2);
    })

    /**
     * @tc.name   testBuffer3_006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_006
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf = buffer.from('this is a buffer');
      expect(buf.indexOf('this')).assertEqual(0);
      expect(buf.indexOf(3)).assertEqual(-1);
    })

    /**
     * @tc.name   testBuffer3_007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_007
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf = buffer.from('this is a buffer');
      expect(buf.indexOf('this', 0)).assertEqual(0);
      expect(buf.indexOf(3, 0, 'utf8' as buffer.BufferEncoding)).assertEqual(-1);
    })

    /**
     * @tc.name   testBuffer3_008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_008
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf = buffer.from('this is a buffer');
      let buf2 = buffer.from('nnnnnn');
      expect(buf.indexOf(buf2, 0)).assertEqual(-1);
      expect(buf.indexOf(3, 0, 'utf8' as buffer.BufferEncoding)).assertEqual(-1);
    })

    /**
     * @tc.name   testBuffer3_009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_009
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf = buffer.from('this buffer is a buffer');
      expect(buf.lastIndexOf('this')).assertEqual(0);
      expect(buf.lastIndexOf('buffer')).assertEqual(-1);
    })

    /**
     * @tc.name   testBuffer3_010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_010
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf = buffer.from('this buffer is a buffer');
      expect(buf.lastIndexOf('this', 0)).assertEqual(0);
      expect(buf.lastIndexOf('buffer', 0, 'utf8' as buffer.BufferEncoding)).assertEqual(17);

    })

    /**
     * @tc.name   testBuffer3_011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_011
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf1 = buffer.from([0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8]);
      expect(buf1.toString('hex')).assertEqual("0102030405060708");
      buf1.swap16();
      expect(buf1.toString('hex')).assertEqual("0201040306050807");
    })

    /**
     * @tc.name   testBuffer3_012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_012
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf1 = buffer.from([0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9]);
      expect(buf1.toString('hex')).assertEqual("010203040506070809");
      try {
        buf1.swap16();
      } catch (err : BusinessError) {
        expect(err.code).assertEqual(10200009);
      }
      catch(e) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffer3_013
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_013
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf1 = buffer.from([0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8]);
      expect(buf1.toString('hex')).assertEqual("0102030405060708");
      buf1.swap32();
      expect(buf1.toString('hex')).assertEqual("0403020108070605");
    })

    /**
     * @tc.name   testBuffer3_014
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_014
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf1 = buffer.from([0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9]);
      expect(buf1.toString('hex')).assertEqual("010203040506070809");
      try {
        buf1.swap32();
      } catch (err : BusinessError) {
        expect(err.code).assertEqual(10200009);
      }
      catch(e) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffer3_015
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_015
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf1 = buffer.from([0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8]);
      expect(buf1.toString('hex')).assertEqual("0102030405060708");
      buf1.swap64();
      expect(buf1.toString('hex')).assertEqual("0807060504030201");
    })

    /**
     * @tc.name   testBuffer3_016
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_016
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf1 = buffer.from([0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9]);
      expect(buf1.toString('hex')).assertEqual("010203040506070809");
      try {
        buf1.swap64();
      } catch (err : BusinessError) {
        expect(err.code).assertEqual(10200009);
      } catch (e) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffer3_017
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_017
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf1 = buffer.from([0x1, 0x2, 0x3, 0x4, 0x5]);
      let obj = buf1.toJSON();
      expect(JSON.stringify(obj)).assertEqual("{\"type\":\"Buffer\",\"data\":[1,2,3,4,5]}");
    })

    /**
     * @tc.name   testBuffer3_018
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER3_018
     * @tc.desc   Test the buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffer3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let buf1 = buffer.from("abcdefg");
      let obj = buf1.toJSON();
      expect(JSON.stringify(obj)).assertEqual("{\"type\":\"Buffer\",\"data\":[97,98,99,100,101,102,103]}");
    })
  })
}