/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import TEETEST from 'libclient_api_test2.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'


const TEEC_SUCCESS = 0x0;
const TEEC_ERROR_SERVICE_NOT_EXIST = 0x2;
const TEEC_ERROR_GENERIC = 0xFFFF0000;
const TEEC_ERROR_ACCESS_DENIED = 0xFFFF0001;
const TEEC_ERROR_CANCEL = 0xFFFF0002;
const TEEC_ERROR_ACCESS_CONFLICT = 0xFFFF0003;
const TEEC_ERROR_EXCESS_DATA = 0xFFFF0004;
const TEEC_ERROR_BAD_FORMAT = 0xFFFF0005;
const TEEC_ERROR_BAD_PARAMETERS = 0xFFFF0006;
const TEEC_ERROR_BAD_STATE = 0xFFFF0007;
const TEEC_ERROR_ITEM_NOT_FOUND = 0xFFFF0008;
const TEEC_ERROR_NOT_IMPLEMENTED = 0xFFFF0009;
const TEEC_ERROR_NOT_SUPPORTED = 0xFFFF000A;
const TEEC_ERROR_NO_DATA = 0xFFFF000B;
const TEEC_ERROR_OUT_OF_MEMORY = 0xFFFF000C;
const TEEC_ERROR_BUSY = 0xFFFF000D;
const TEEC_ERROR_COMMUNICATION = 0xFFFF000E;
const TEEC_ERROR_SECURITY = 0xFFFF000F;
const TEEC_ERROR_SHORT_BUFFER = 0xFFFF0010;
const TEEC_ERROR_MAC_INVALID = 0xFFFF3071;
const TEEC_ERROR_TARGET_DEAD = 0xFFFF3024;
const TEEC_FAIL = 0xFFFF5002;

const TEEC_ORIGIN_API = 0x1;
const TEEC_ORIGIN_COMMS = 0x2;
const TEEC_ORIGIN_TEE = 0x3;
const TEEC_ORIGIN_TRUSTED_APP = 0x4;


export default function ClientAPITest2() {
  describe('ClientAPITest2', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      console.info("test----------1");
      let ret: number = TEETEST.InitContext();
      console.info("test-------------ret:--" + ret.toString(16));
      expect(ret).assertEqual(TEEC_SUCCESS);
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      console.info("test-------------2");
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      console.info("test-------------3");
      TEETEST.CloseSession();
      TEETEST.ReleaseSharedMemory();
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      console.info("test-------------4");
      TEETEST.FinalizeContext();
    })

    /**
     * @testcase.name      : Opensession_WithoutContext
     * @testcase.desc      : call TEEC_OpenSession Without Context,
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('Opensession_WithoutContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: Array<number> = TEETEST.Opensession_WithoutContext();
      console.info("test-------------ret:--" + ret[0]);
      console.info("test-------------ret2:--" + ret[1]);
      expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
      expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
      done();
    });

    /**
     * @testcase.name      : Opensession_WithoutSession
     * @testcase.desc      : call TEEC_OpenSession Without session,
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('Opensession_WithoutSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: Array<number> = TEETEST.Opensession_WithoutSession();
      console.info("test-------------ret:--" + ret[0]);
      console.info("test-------------ret2:--" + ret[1]);
      expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
      expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
      done();
    });
    /**
     * @testcase.name      : Opensession_WithoutDestination
     * @testcase.desc      : call TEEC_OpenSession Without Destination,
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('Opensession_WithoutDestination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: Array<number> = TEETEST.Opensession_WithoutDestination();
      console.info("test-------------ret:--" + ret[0]);
      console.info("test-------------ret2:--" + ret[1]);
      expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
      expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
      done();
    });
    /**
     * @testcase.name      : Opensession_WithoutConnectionMethod
     * @testcase.desc      : call TEEC_OpenSession Without ConnectionMethod,
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('Opensession_WithoutConnectionMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithoutConnectionMethod();
        console.info("test-------------ret:--" + ret[0]);
        console.info("test-------------ret2:--" + ret[1]);
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @testcase.name      : Opensession_WithNotSupportConnectionMethod
     * @testcase.desc      : call TEEC_OpenSession With Not Support ConnectionMethod,
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('Opensession_WithNotSupportConnectionMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithNotSupportConnectionMethod();
        console.info("test-------------ret:--" + ret[0]);
        console.info("test-------------ret2:--" + ret[1]);
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[2]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[3]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[4]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[5]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[6]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[7]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[8]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[9]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[10]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[11]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[12]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[13]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[14]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[15]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @testcase.name      : Opensession_ContextIsNotInit
     * @testcase.desc      : call TEEC_OpenSession With Context is Not Init,
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('Opensession_ContextIsNotInit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_ContextIsNotInit();
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[2]).assertEqual(TEEC_SUCCESS);
        done();
      });

    /**
     * @testcase.name      : Opensession_ParamValueIsInvalid
     * @testcase.desc      : call TEEC_OpenSession With Param value is invalid
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('Opensession_ParamValueIsInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_ParamValueIsInvalid();
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });

    /**
     * @testcase.name      : Opensession_WithoutOperation
     * @testcase.desc      : call TEEC_OpenSession Without Operation,
     * @testcase.expect    : return TEEC_SUCCESS
     */
    it('Opensession_WithoutOperation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: Array<number> = TEETEST.Opensession_WithoutOperation();
      console.info("test-------------ret:--" + ret[0].toString(16));
      console.info("test-------------ret2:--" + ret[1].toString(16));
      expect(ret[0]).assertEqual(TEEC_SUCCESS);
      expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
      done();
    });

    /**
     * @testcase.name      : Opensession_WithoutOrigin
     * @testcase.desc      : call TEEC_OpenSession Without Origin,
     * @testcase.expect    : return TEEC_SUCCESS
     */
    it('Opensession_WithoutOrigin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = TEETEST.Opensession_WithoutOrigin();
      expect(ret).assertEqual(TEEC_SUCCESS);
      done();
    });

    /**
     * @testcase.name      : Opensession_WithOperationIsNone
     * @testcase.desc      : call TEEC_OpenSession With Operation is none
     * @testcase.expect    : return TEEC_SUCCESS
     */
    it('Opensession_WithOperationIsNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithOperationIsNone();
        console.info("test-------------ret:--" + ret[0].toString(16));
        console.info("test-------------ret2:--" + ret[1].toString(16));
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        done();
      });
    /**
     * @testcase.name      : Opensession_WithOperationIsValue
     * @testcase.desc      : call TEEC_OpenSession With Operation paramtype is value
     * @testcase.expect    : return TEEC_SUCCESS
     */
    it('Opensession_WithOperationIsValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithOperationIsValue();
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        expect(ret[2]).assertEqual(0x111);
        expect(ret[3]).assertEqual(0x222);
        expect(ret[4]).assertEqual(0x333);
        expect(ret[5]).assertEqual(0x444);
        expect(ret[6]).assertEqual(0x555);
        expect(ret[7]).assertEqual(0x666);
        expect(ret[8]).assertEqual(0x777);
        expect(ret[9]).assertEqual(0x888);
        done();
      });
    /**
     * @testcase.name      : Opensession_WithOperationIsTempMem
     * @testcase.desc      : call TEEC_OpenSession With Operation paramtype is tempmem
     * @testcase.expect    : return TEEC_SUCCESS
     */
    it('Opensession_WithOperationIsTempMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithOperationIsTempMem();
        console.info("test-------------ret2:--" + ret[2].toString(16));
        console.info("test-------------ret3:--" + ret[3].toString(16));
        console.info("test-------------ret4:--" + ret[4].toString(16));
        console.info("test-------------ret5:--" + ret[5].toString(16));
        console.info("test-------------ret6:--" + ret[6].toString(16));
        console.info("test-------------ret7:--" + ret[7].toString());
        console.info("test-------------ret8:--" + ret[8].toString());
        console.info("test-------------ret9:--" + ret[9].toString());
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        expect(ret[2]).assertEqual(5);
        expect(ret[3]).assertEqual(8);
        expect(ret[4]).assertEqual(10);
        expect(ret[5]).assertEqual(19);
        expect(ret[6]).assertEqual(TEEC_SUCCESS);
        expect(ret[7]).assertEqual("Hello");
        expect(ret[8]).assertEqual("qwertyuiop");
        expect(ret[9]).assertEqual("this is test string");
        done();
      });
    /**
     * @testcase.name      : Opensession_WithNotExistUUID
     * @testcase.desc      : call TEEC_OpenSession With uuid is not exist
     * @testcase.expect    : return TEEC_ERROR_GENERIC
     */
    it('Opensession_WithNotExistUUID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithNotExistUUID();
        console.info("test-------------ret:--" + ret[0].toString(16));
        console.info("test-------------ret2:--" + ret[1].toString(16));
        expect(ret[0]).assertEqual(TEEC_ERROR_GENERIC);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_COMMS);
        done();
      });
    /**
     * @testcase.name      : Opensession_ReturnErrorFromTA
     * @testcase.desc      : call TEEC_OpenSession With TA return error
     * @testcase.expect    : return TEEC_ERROR_GENERIC
     */
    it('Opensession_ReturnErrorFromTA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_ReturnErrorFromTA();
        expect(ret[0]).assertEqual(TEEC_ERROR_GENERIC);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        done();
      });
    /**
     * @testcase.name      : Opensession_WithParamTypesIsInvalid
     * @testcase.desc      : call TEEC_OpenSession With paramtype is invalid
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('Opensession_WithParamTypesIsInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithParamTypesIsInvalid();
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @testcase.name      : RequestCancellationTest
     * @testcase.desc      : call TEEC_RequestCancellation after TEEC_InvokeCommand
     * @testcase.expect    : no error occur,in log can see not support this api
     */
    it('RequestCancellationTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RequestCancellationTest();
        expect(ret).assertEqual(TEEC_SUCCESS);
        done();
      });
    
    /**
     * @testcase.name      : Closesession_WithCreatedSession
     * @testcase.desc      : call TEEC_CloseSession With created session
     * @testcase.expect    : session_id is 0
     */
    it('Closesession_WithCreatedSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Closesession_WithCreatedSession();
        expect(ret[0]).assertEqual(0);
        expect(ret[1]).assertEqual(0);
        done();
      });

    /**
     * @testcase.name      : Closesession_WithoutSession
     * @testcase.desc      : call TEEC_CloseSession WithoutSession
     * @testcase.expect    : no error occur
     */
    it('Closesession_WithoutSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Closesession_WithoutSession();
        expect(ret[0]).assertEqual(0);
        expect(ret[1]).assertEqual(0);
        expect(ret[2]).assertEqual(0);
        done();
      });
    /**
     * @testcase.name      : Closesession_WithNotOpenedSession
     * @testcase.desc      : call TEEC_CloseSession with Not Opened Session
     * @testcase.expect    : no error occur
     */
    it('Closesession_WithNotOpenedSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Closesession_WithNotOpenedSession();
        expect(ret[0]).assertEqual(0);
        expect(ret[1]).assertEqual(0);
        expect(ret[2]).assertEqual(0);
        done();
      });

    /**
     * @testcase.name      : AllocateSharedMemory_WithAllocatedMem
     * @testcase.desc      : call TEEC_AllocateSharedMemory normal test
     * @testcase.expect    : return TEEC_SUCCESS
     */
    it('AllocateSharedMemory_WithAllocatedMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithAllocatedMem();
        expect(ret).assertEqual(TEEC_SUCCESS);
        done();
      });
    /**
     * @testcase.name      : AllocateSharedMemory_WithoutContext
     * @testcase.desc      : call TEEC_AllocateSharedMemory Without Context
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('AllocateSharedMemory_WithoutContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithoutContext();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @testcase.name      : AllocateSharedMemory_WithoutSharedMem
     * @testcase.desc      : call TEEC_AllocateSharedMemory Without SharedMem
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('AllocateSharedMemory_WithoutSharedMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithoutSharedMem();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @testcase.name      : AllocateSharedMemory_WithSharedMemHasReleased
     * @testcase.desc      : call TEEC_AllocateSharedMemory With SharedMem has Released
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('AllocateSharedMemory_WithSharedMemHasReleased', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithSharedMemHasReleased();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @testcase.name      : AllocateSharedMemory_WithSharedMemFlagIsZero
     * @testcase.desc      : call TEEC_AllocateSharedMemory With SharedMem flag is 0
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('AllocateSharedMemory_WithSharedMemFlagIsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithSharedMemFlagIsZero();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @testcase.name      : AllocateSharedMemory_WithSharedMemFlagIsInvalid
     * @testcase.desc      : call TEEC_AllocateSharedMemory With SharedMem flag is invalid
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('AllocateSharedMemory_WithSharedMemFlagIsInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithSharedMemFlagIsInvalid();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @testcase.name      : AllocateSharedMemory_WithSizeExceed
     * @testcase.desc      : call TEEC_AllocateSharedMemory With SharedMem size exceed 4M
     * @testcase.expect    : return TEEC_ERROR_OUT_OF_MEMORY
     */
    it('AllocateSharedMemory_WithSizeExceed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithSizeExceed();
        expect(ret).assertEqual(TEEC_ERROR_OUT_OF_MEMORY);
        done();
      });

    /**
     * @testcase.name      : AllocateSharedMemory_ReachSharememNumLimit
     * @testcase.desc      : call TEEC_AllocateSharedMemory With same Context 65 times,
     * This case will generate wild pointers, but these pointers are all hung on the same context.
     * The teardown function at the end of the use case will recycle the context to ensure the
     * recycling of these wild pointers.
     * @testcase.expect    : alloc 65 times should return TEEC_ERROR_BAD_PARAMETERS
     */
    it('AllocateSharedMemory_ReachSharememNumLimit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.AllocateSharedMemory_ReachSharememNumLimit();
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @testcase.name      : RegisterSharedMemory_WithRegisterMem
     * @testcase.desc      : call TEEC_RegisterSharedMemory With RegisterMem
     * @testcase.expect    : return TEEC_SUCCESS
     */
    it('RegisterSharedMemory_WithRegisterMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RegisterSharedMemory_WithRegisterMem();
        expect(ret).assertEqual(TEEC_SUCCESS);
        done();
      });

    /**
     * @testcase.name      : RegisterSharedMemory_WithoutContext
     * @testcase.desc      : call TEEC_RegisterSharedMemory Without Context
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('RegisterSharedMemory_WithoutContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RegisterSharedMemory_WithoutContext();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @testcase.name      : RegisterSharedMemory_WithoutSharedMem
     * @testcase.desc      : call TEEC_RegisterSharedMemory Without SharedMem
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('RegisterSharedMemory_WithoutSharedMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RegisterSharedMemory_WithoutSharedMem();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @testcase.name      : RegisterSharedMemory_WithSharedMemFlagIsZero
     * @testcase.desc      : call TEEC_RegisterSharedMemory With SharedMem flag is 0
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('RegisterSharedMemory_WithSharedMemFlagIsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RegisterSharedMemory_WithSharedMemFlagIsZero();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });
    /**
     * @testcase.name      : RegisterSharedMemory_WithSharedMemFlagIsInvalid
     * @testcase.desc      : call TEEC_RegisterSharedMemory With SharedMem flag is invalid
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('RegisterSharedMemory_WithSharedMemFlagIsInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RegisterSharedMemory_WithSharedMemFlagIsInvalid();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });
    /**
     * @testcase.name      : RegisterSharedMemory_WithSharedMemBufferIsNull
     * @testcase.desc      : call TEEC_RegisterSharedMemory With SharedMem buffer is null
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('RegisterSharedMemory_WithSharedMemBufferIsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RegisterSharedMemory_WithSharedMemBufferIsNull();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

  })
}