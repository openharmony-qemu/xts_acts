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
import TEETEST from 'libclient_api_test3.so';
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


export default function ClientAPITest3() {
  describe('ClientAPITest3', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      console.info("test----------1");
      let ret: number = TEETEST.InitContext();
      console.info("test-------------ret:--" + ret.toString(16));
      expect(ret).assertEqual(TEEC_SUCCESS);
      ret = TEETEST.OpenSession();
      console.info("test--------opensession-----ret:--" + ret.toString(16));
      expect(ret).assertEqual(TEEC_SUCCESS);
      ret = TEETEST.AllocateSharedMemory();
      console.info("test-------allocate------ret:--" + ret.toString(16));
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
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      console.info("test-------------4");
      TEETEST.ReleaseSharedMemory();
      TEETEST.CloseSession();
      TEETEST.FinalizeContext();
    })

    /**
     * @testcase.name      : InvokeCommand_WithoutOperation
     * @testcase.desc      : call TEEC_InvokeCommand Without operation
     * @testcase.expect    : return TEEC_SUCCESS
     */
    it('InvokeCommand_WithoutOperation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: Array<number> = TEETEST.InvokeCommand_WithoutOperation();
      console.info("test-------------ret:--" + ret[0]);
      console.info("test-------------ret2:--" + ret[1]);
      expect(ret[0]).assertEqual(TEEC_SUCCESS);
      expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
      done();
    });

    /**
     * @testcase.name      : InvokeCommand_WithoutSession
     * @testcase.desc      : call TEEC_InvokeCommand Without session
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('InvokeCommand_WithoutSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithoutSession();
        console.info("test-------------ret:--" + ret[0]);
        console.info("test-------------ret2:--" + ret[1]);
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @testcase.name      : InvokeCommand_WithOperationIsValue
     * @testcase.desc      : call TEEC_InvokeCommand With paramtype is value
     * @testcase.expect    : return TEEC_SUCCESS, TA can modify input value and return to CA
     */
    it('InvokeCommand_WithOperationIsValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationIsValue();
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        expect(ret[2]).assertEqual(0x111);
        expect(ret[3]).assertEqual(0x222);
        expect(ret[4]).assertEqual(0x333 + 1);
        expect(ret[5]).assertEqual(0x444 + 1);
        expect(ret[6]).assertEqual(0x555 - 1);
        expect(ret[7]).assertEqual(0x666 - 1);
        expect(ret[8]).assertEqual(0x777 - 1);
        expect(ret[9]).assertEqual(0x888 - 1);
        done();
      });
    /**
     * @testcase.name      : InvokeCommand_WithOperationIsTempMem
     * @testcase.desc      : call TEEC_InvokeCommand With paramtype is TempMem
     * @testcase.expect    : return TEEC_SUCCESS, TA can modify input tempmem and return to CA
     */
    it('InvokeCommand_WithOperationIsTempMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationIsTempMem();
        console.info("test-------------ret2:--" + ret[2].toString(16));
        console.info("test-------------ret3:--" + ret[3].toString(16));
        console.info("test-------------ret4:--" + ret[4].toString(16));
        console.info("test-------------ret5:--" + ret[5].toString(16));
        console.info("test-------------ret6:--" + ret[6].toString());
        console.info("test-------------ret7:--" + ret[7].toString());
        console.info("test-------------ret8:--" + ret[8].toString());
        console.info("test-------------ret9:--" + ret[9].toString());
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        expect(ret[2]).assertEqual(256);
        expect(ret[3]).assertEqual(13);
        expect(ret[4]).assertEqual(25);
        expect(ret[5]).assertEqual(25);
        expect(ret[6]).assertEqual("Hello");
        expect(ret[7]).assertEqual("TEEMEM_OUTPUT");
        expect(ret[8]).assertEqual("the param is TEEMEM_INOUT");
        expect(ret[9]).assertEqual("the param is TEEMEM_INOUT");
        done();
      });

    /**
     * @testcase.name      : InvokeCommand_WithOperationIsPartialMem
     * @testcase.desc      : call TEEC_InvokeCommand With paramtype is PartialMem
     * @testcase.expect    : return TEEC_SUCCESS, TA can modify input PartialMem and return to CA
     */
    it('InvokeCommand_WithOperationIsPartialMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationIsPartialMem();
        console.info("test-------------ret2:--" + ret[2].toString(16));
        console.info("test-------------ret3:--" + ret[3].toString(16));
        console.info("test-------------ret4:--" + ret[4].toString(16));
        console.info("test-------------ret5:--" + ret[5].toString(16));
        console.info("test-------------ret6:--" + ret[6].toString());
        console.info("test-------------ret7:--" + ret[7].toString());
        console.info("test-------------ret8:--" + ret[8].toString());
        console.info("test-------------ret9:--" + ret[9].toString());
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        expect(ret[2]).assertEqual(256);
        expect(ret[3]).assertEqual(13);
        expect(ret[4]).assertEqual(25);
        expect(ret[5]).assertEqual(25);
        expect(ret[6]).assertEqual("Hello");
        expect(ret[7]).assertEqual("TEEMEM_OUTPUT");
        expect(ret[8]).assertEqual("the param is TEEMEM_INOUT");
        expect(ret[9]).assertEqual("the param is TEEMEM_INOUT");
        expect(ret[10]).assertEqual(TEEC_SUCCESS);
        done();
      });
    /**
     * @testcase.name      : InvokeCommand_WithOperationIsTempMemIsNULL
     * @testcase.desc      : call TEEC_InvokeCommand With tempMem is null
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('InvokeCommand_WithOperationIsTempMemIsNULL', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationIsTempMemIsNULL();
        console.info("test-------------ret:--" + ret[0]);
        console.info("test-------------ret2:--" + ret[1]);
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @testcase.name      : InvokeCommand_WithOperationNotStart
     * @testcase.desc      : call TEEC_InvokeCommand With Operation is Not Start
     * @testcase.expect    : return TEEC_ERROR_NOT_IMPLEMENTED
     */
    it('InvokeCommand_WithOperationNotStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationNotStart();
        console.info("test-------------ret:--" + ret[0]);
        console.info("test-------------ret2:--" + ret[1]);
        expect(ret[0]).assertEqual(TEEC_ERROR_NOT_IMPLEMENTED);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @testcase.name      : InvokeCommand_WithOperationTypePartialUseTemp
     * @testcase.desc      : call TEEC_InvokeCommand With ParamType is partial while operation is tmpref
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('InvokeCommand_WithOperationTypePartialUseTemp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationTypePartialUseTemp();
        console.info("test-------------ret:--" + ret[0]);
        console.info("test-------------ret2:--" + ret[1]);
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @testcase.name      : InvokeCommand_WithOperationTypePartialSizeIsExceed
     * @testcase.desc      : call TEEC_InvokeCommand With ParamType is partial while memref offset+size > sharedMem.size
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('InvokeCommand_WithOperationTypePartialSizeIsExceed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationTypePartialSizeIsExceed();
        console.info("test-------------ret:--" + ret[0]);
        console.info("test-------------ret2:--" + ret[1]);
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @testcase.name      : InvokeCommand_WithOperationTypePartialSizeIsZero
     * @testcase.desc      : call TEEC_InvokeCommand With ParamType is partial while memref.size = 0
     * @testcase.expect    : return TEEC_ERROR_BAD_PARAMETERS
     */
    it('InvokeCommand_WithOperationTypePartialSizeIsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationTypePartialSizeIsZero();
        console.info("test-------------ret:--" + ret[0]);
        console.info("test-------------ret2:--" + ret[1]);
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_COMMS);
        done();
      });
    /**
     * @testcase.name      : InvokeCommand_WithMemrefTempInoutExceed1024k
     * @testcase.desc      : call TEEC_InvokeCommand With paramType is TEMP_INOUT and size is 1024k + 1
     * @testcase.expect    : return TEEC_ERROR_ACCESS_DENIED
     */
    it('InvokeCommand_WithMemrefTempInoutExceed1024k', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithMemrefTempInoutExceed1024k();
        console.info("test-------------ret:--" + ret[0]);
        console.info("test-------------ret2:--" + ret[1]);
        expect(ret[0]).assertEqual(TEEC_ERROR_ACCESS_DENIED);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_COMMS);
        done();
      });
    /**
     * @testcase.name      : InvokeCommand_WithMemrefWholeExceed2048k
     * @testcase.desc      : call TEEC_InvokeCommand With paramType is WHOLE and sharedMem.size is 2048k + 1
     * @testcase.expect    : return TEEC_ERROR_OUT_OF_MEMORY
     */
    it('InvokeCommand_WithMemrefWholeExceed2048k', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithMemrefWholeExceed2048k();
        console.info("test-------------ret:--" + ret[0]);
        console.info("test-------------ret2:--" + ret[1]);
        expect(ret[0]).assertEqual(TEEC_ERROR_OUT_OF_MEMORY);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_COMMS);
        done();
      });


  })
}