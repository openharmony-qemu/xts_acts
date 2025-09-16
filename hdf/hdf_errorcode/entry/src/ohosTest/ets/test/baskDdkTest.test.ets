/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium'
import baskddkerror from 'libbaskddkerrorcode.so'
const Success = 0;
export default function ActsBaseDDkTest() {
  describe('ActsBaseDDkTest', () => {
    /**
     * @tc.number  : SUB_Driver_Ext_DdkMapAshmemAshmemFd_0100
     * @tc.name    : SUB_Driver_Ext_DdkMapAshmemAshmemFd_0100
     * @tc.desc    : Test DdkMapAshmemAshmemFd.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_DdkMapAshmemAshmemFd_0100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_DdkMapAshmemAshmemFd_0100 start====");
        let result:number = baskddkerror.DdkMapAshmemAshmemFd();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_DdkMapAshmemAshmemFd_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_DdkMapAshmemAshmemFd_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_DdkMapAshmemAddress_0200
     * @tc.name    : SUB_Driver_Ext_DdkMapAshmemAddress_0200
     * @tc.desc    : Test DdkMapAshmemAddress.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_DdkMapAshmemAddress_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_DdkMapAshmemAddress_0200 sta`rt====");
        let result:number = baskddkerror.DdkMapAshmemAddress();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_DdkMapAshmemAddress_0200 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_DdkMapAshmemAddress_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_DdkMapAshmemSize_0300
     * @tc.name    : SUB_Driver_Ext_DdkMapAshmemSize_0300
     * @tc.desc    : Test DdkMapAshmemSize.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_DdkMapAshmemSize_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_DdkMapAshmemSize_0300 start====");
        let result:number = baskddkerror.DdkMapAshmemSize();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_DdkMapAshmemSize_0300 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_DdkMapAshmemSize_0300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_DdkMapAshmemOffset_0400
     * @tc.name    : SUB_Driver_Ext_DdkMapAshmemOffset_0400
     * @tc.desc    : Test DdkMapAshmemOffset.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_DdkMapAshmemOffset_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_DdkMapAshmemOffset_0400 start====");
        let result:number = baskddkerror.DdkMapAshmemOffset();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_DdkMapAshmemOffset_0400 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_DdkMapAshmemOffset_0400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_DdkMapAshmemBufferLength_0500
     * @tc.name    : SUB_Driver_Ext_DdkMapAshmemBufferLength_0500
     * @tc.desc    : Test DdkMapAshmemBufferLength.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_DdkMapAshmemBufferLength_0500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_DdkMapAshmemBufferLength_0500 start====");
        let result:number = baskddkerror.DdkMapAshmemBufferLength();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_DdkMapAshmemBufferLength_0500 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_DdkMapAshmemBufferLength_0500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_DdkMapAshmemTransferredLength_0600
     * @tc.name    : SUB_Driver_Ext_DdkMapAshmemTransferredLength_0600
     * @tc.desc    : Test DdkMapAshmemTransferredLength.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_DdkMapAshmemTransferredLength_0600', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_DdkMapAshmemTransferredLength_0600 start====");
        let result:number = baskddkerror.DdkMapAshmemTransferredLength();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_DdkMapAshmemTransferredLength_0600 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_DdkMapAshmemTransferredLength_0600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_DdkMapAshmemFailure_0700
     * @tc.name    : SUB_Driver_Ext_DdkMapAshmemFailure_0700
     * @tc.desc    : Test DdkMapAshmemFailure.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_DdkMapAshmemFailure_0700', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_DdkMapAshmemFailure_0700 start====");
        let result:number = baskddkerror.DdkMapAshmemFailure();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_DdkMapAshmemFailure_0700 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_DdkMapAshmemFailure_0700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_DdkMapAshmemInvalidParameter_0800
     * @tc.name    : SUB_Driver_Ext_DdkMapAshmemInvalidParameter_0800
     * @tc.desc    : Test DdkMapAshmemInvalidParameter.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_DdkMapAshmemInvalidParameter_0800', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_DdkMapAshmemInvalidParameter_0800 start====");
        let result:number = baskddkerror.DdkMapAshmemInvalidParameter();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_DdkMapAshmemInvalidParameter_0800 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_DdkMapAshmemInvalidParameter_0800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_DdkMapAshmemInvalidOperation_0900
     * @tc.name    : SUB_Driver_Ext_DdkMapAshmemInvalidOperation_0900
     * @tc.desc    : Test DdkMapAshmemInvalidOperation.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_DdkMapAshmemInvalidOperation_0900', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_DdkMapAshmemInvalidOperation_0900 start====");
        let result:number = baskddkerror.DdkMapAshmemInvalidOperation();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_DdkMapAshmemInvalidOperation_0900 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_DdkMapAshmemInvalidOperation_0900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_DdkMapAshmemNullPTR_1000
     * @tc.name    : SUB_Driver_Ext_DdkMapAshmemNullPTR_1000
     * @tc.desc    : Test DdkMapAshmemNullPTR.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_DdkMapAshmemNullPTR_1000', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_DdkMapAshmemNullPTR_1000 start====");
        let result:number = baskddkerror.DdkMapAshmemNullPTR();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_DdkMapAshmemNullPTR_1000 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_DdkMapAshmemNullPTR_1000 catch err: " + err);
        expect().assertFail();
      }
    })

  })
}
