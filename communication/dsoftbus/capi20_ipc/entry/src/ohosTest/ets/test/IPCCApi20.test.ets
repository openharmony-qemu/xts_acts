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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import iPCCApi from 'libIPC20CApi.so'

const Success = 0;

export default function iPCCCApi20Test() {
  describe('iPCCCApi20Test', () => {

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelRewindReadPositionParamError_0100
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelRewindReadPositionParamError_0100
     * @tc.desc       : test OHIPCParcelRewindReadPositionParamError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelRewindReadPositionParamError_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelRewindReadPositionParamError_0100 start====");
          let result: number = iPCCApi.OHIPCParcelRewindReadPositionParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelRewindReadPositionParamError_0100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelRewindReadPositionParamError_0100 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelRewindWritePositionParamError_0200
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelRewindWritePositionParamError_0200
     * @tc.desc       : test OHIPCParcelRewindWritePositionParamError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelRewindWritePositionParamError_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelRewindWritePositionParamError_0200 start====");
          let result: number = iPCCApi.OHIPCParcelRewindWritePositionParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelRewindWritePositionParamError_0200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelRewindWritePositionParamError_0200 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelWriteInt8WriteError_0300
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelWriteInt8WriteError_0300
     * @tc.desc       : test OHIPCParcelWriteInt8WriteError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt8WriteError_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt8WriteError_0300 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt8WriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt8WriteError_0300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt8WriteError_0300 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelWriteInt8ParamError_0400
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelWriteInt8ParamError_0400
     * @tc.desc       : test OHIPCParcelWriteInt8ParamError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt8ParamError_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt8ParamError_0400 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt8ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt8ParamError_0400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt8ParamError_0400 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelReadInt8ReadError_0500
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelReadInt8ReadError_0500
     * @tc.desc       : test OHIPCParcelReadInt8ReadError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt8ReadError_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt8ReadError_0500 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt8ReadError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt8ReadError_0500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt8ReadError_0500 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelReadInt8ParamError_0600
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelReadInt8ParamError_0600
     * @tc.desc       : test OHIPCParcelReadInt8ParamError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt8ParamError_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt8ParamError_0600 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt8ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt8ParamError_0600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt8ParamError_0600 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelWriteInt16WriteError_0700
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelWriteInt16WriteError_0700
     * @tc.desc       : test OHIPCParcelWriteInt16WriteError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt16WriteError_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt16WriteError_0700 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt16WriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt16WriteError_0700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt16WriteError_0700 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelWriteInt16ParamError_0800
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelWriteInt16ParamError_0800
     * @tc.desc       : test OHIPCParcelWriteInt16ParamError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt16ParamError_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt16ParamError_0800 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt16ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt16ParamError_0800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt16ParamError_0800 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelReadInt16ReadError_0900
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelReadInt16ReadError_0900
     * @tc.desc       : test OHIPCParcelReadInt16ReadError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt16ReadError_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt16ReadError_0900 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt16ReadError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt16ReadError_0900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt16ReadError_0900 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelReadInt16ParamError_1000
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelReadInt16ParamError_1000
     * @tc.desc       : test OHIPCParcelReadInt16ParamError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt16ParamError_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt16ParamError_1000 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt16ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt16ParamError_1000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt16ParamError_1000 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelWriteInt32WriteError_1100
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelWriteInt32WriteError_1100
     * @tc.desc       : test OHIPCParcelWriteInt32WriteError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt32WriteError_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt32WriteError_1100 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt32WriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt32WriteError_1100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt32WriteError_1100 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelWriteInt32ParamError_1200
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelWriteInt32ParamError_1200
     * @tc.desc       : test OHIPCParcelWriteInt32ParamError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt32ParamError_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt32ParamError_1200 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt32ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt32ParamError_1200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt32ParamError_1200 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelReadInt32ReadError_1300
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelReadInt32ReadError_1300
     * @tc.desc       : test OHIPCParcelReadInt32ReadError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt32ReadError_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt32ReadError_1300 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt32ReadError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt32ReadError_1300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt32ReadError_1300 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelReadInt32ParamError_1400
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelReadInt32ParamError_1400
     * @tc.desc       : test OHIPCParcelReadInt32ParamError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt32ParamError_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt32ParamError_1400 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt32ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt32ParamError_1400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt32ParamError_1400 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelWriteInt64WriteError_1500
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelWriteInt64WriteError_1500
     * @tc.desc       : test OHIPCParcelWriteInt64WriteError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt64WriteError_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt64WriteError_1500 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt64WriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt64WriteError_1500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt64WriteError_1500 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelWriteInt64ParamError_1600
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelWriteInt64ParamError_1600
     * @tc.desc       : test OHIPCParcelWriteInt64ParamError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt64ParamError_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt64ParamError_1600 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt64ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt64ParamError_1600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt64ParamError_1600 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelReadInt64ReadError_1700
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelReadInt64ReadError_1700
     * @tc.desc       : test OHIPCParcelReadInt64ReadError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt64ReadError_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt64ReadError_1700 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt64ReadError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt64ReadError_1700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt64ReadError_1700 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelReadInt64ParamError_1800
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelReadInt64ParamError_1800
     * @tc.desc       : test OHIPCParcelReadInt64ParamError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt64ParamError_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt64ParamError_1800 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt64ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt64ParamError_1800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt64ParamError_1800 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelWriteFloatWriteError_1900
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelWriteFloatWriteError_1900
     * @tc.desc       : test OHIPCParcelWriteFloatWriteError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteFloatWriteError_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFloatWriteError_1900 start====");
          let result: number = iPCCApi.OHIPCParcelWriteFloatWriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFloatWriteError_1900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFloatWriteError_1900 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.number     : SUB_DSoftbus_IPC_OHIPCParcelWriteFloatParamError_2000
     * @tc.name       : SUB_DSoftbus_IPC_OHIPCParcelWriteFloatParamError_2000
     * @tc.desc       : test OHIPCParcelWriteFloatParamError
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteFloatParamError_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFloatParamError_2000 start====");
          let result: number = iPCCApi.OHIPCParcelWriteFloatParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFloatParamError_2000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFloatParamError_2000 catch err: " + err);
          expect().assertFail();
        }
      });

  })
}