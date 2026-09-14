/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import hilog from '@ohos.hilog'
import napitestex from 'libnapitestex.so'
import worker, { MessageEvents } from '@ohos.worker';
import { taskpool } from '@kit.ArkTS';

const DOMAIN = 0x0000;
declare class ArkTools {
  static forceFullGC():void;
}

async function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

@Concurrent
function getGhcCountInTaskpool(): number {
  return napitestex.getGlobalHandleCountValue();
}

export default function napiRefTest() {
  describe('napiRefTest', () => {
    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[napiRefTest] after each called')
    });
    
    /**
     * @tc.name   napiCreateStrongRefCheckArg
     * @tc.number SUB_NAPI_STRONGREF_0100
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiCreateStrongRefCheckArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiCreateStrongRefCheckArg";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.createStrongRefCheckArg();
        console.info('napiCreateStrongRefCheckArg value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiCreateStrongRefSingle
     * @tc.number SUB_NAPI_STRONGREF_0200
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiCreateStrongRefSingle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiCreateStrongRefSingle";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.createStrongRefSingle(ArkTools.forceFullGC);
        console.info('napiCreateStrongRefSingle value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiCreateStrongRef2Ref
     * @tc.number SUB_NAPI_STRONGREF_0300
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiCreateStrongRef2Ref', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiCreateStrongRef2Ref";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.createStrongRef2Ref(ArkTools.forceFullGC);
        console.info('napiCreateStrongRef2Ref value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiCreateStrongRef2Obj
     * @tc.number SUB_NAPI_STRONGREF_0400
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiCreateStrongRef2Obj', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiCreateStrongRef2Obj";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.createStrongRef2Obj(ArkTools.forceFullGC);
        console.info('napiCreateStrongRef2Obj value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetStrongRefCheckArg
     * @tc.number SUB_NAPI_STRONGREF_0500
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiGetStrongRefCheckArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiGetStrongRefCheckArg";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.getStrongRefCheckArg();
        console.info('napiGetStrongRefCheckArg value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetStrongRef
     * @tc.number SUB_NAPI_STRONGREF_0600
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiGetStrongRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiGetStrongRef";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.getStrongRef();
        console.info('napiGetStrongRef value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiDeleteStrongRefCheckArg
     * @tc.number SUB_NAPI_STRONGREF_0700
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiDeleteStrongRefCheckArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiDeleteStrongRefCheckArg";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.deleteStrongRefCheckArg();
        console.info('napiDeleteStrongRefCheckArg value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiDeleteStrongRef
     * @tc.number SUB_NAPI_STRONGREF_0800
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiDeleteStrongRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiDeleteStrongRef";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.deleteStrongRef(ArkTools.forceFullGC);
        console.info('napiDeleteStrongRef value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiDeleteStrongRef2Ref
     * @tc.number SUB_NAPI_STRONGREF_0900
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiDeleteStrongRef2Ref', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiDeleteStrongRef2Ref";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.deleteStrongRef2Ref(ArkTools.forceFullGC);
        console.info('napiDeleteStrongRef2Ref value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiDeleteStrongRefDouble
     * @tc.number SUB_NAPI_STRONGREF_1000
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiDeleteStrongRefDouble', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiDeleteStrongRefDouble";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.deleteStrongRefDouble(ArkTools.forceFullGC);
        console.info('napiDeleteStrongRefDouble value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiRepeateCreateDeleteStrongRef
     * @tc.number SUB_NAPI_STRONGREF_1100
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiRepeateCreateDeleteStrongRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiRepeateCreateDeleteStrongRef";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.repeateCreateDeleteStrongRef();
        console.info('napiRepeateCreateDeleteStrongRef value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiDeleteUndefindAndCreateRef
     * @tc.number SUB_NAPI_STRONGREF_1200
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiDeleteUndefindAndCreateRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiDeleteUndefindAndCreateRef";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.deleteUndefindAndCreateRef();
        console.info('napiDeleteUndefindAndCreateRef value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiOptStrongRefInErrorEnvTest
     * @tc.number SUB_NAPI_STRONGREF_1300
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiOptStrongRefInErrorEnvTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiOptStrongRefInErrorEnvTest";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.optStrongRefInErrorEnvTest(ArkTools.forceFullGC);
        console.info('napiOptStrongRefInErrorEnvTest value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiOptStrongRefInContextEnvTest
     * @tc.number SUB_NAPI_STRONGREF_1400
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiOptStrongRefInContextEnvTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiOptStrongRefInContextEnvTest";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.optStrongRefInContextEnvTest();
        console.info('napiOptStrongRefInContextEnvTest value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiOptStrongRefInArkRuntimeTest
     * @tc.number SUB_NAPI_STRONGREF_1500
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiOptStrongRefInArkRuntimeTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiOptStrongRefInArkRuntimeTest";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.optStrongRefInArkRuntimeTest();
        console.info('napiOptStrongRefInArkRuntimeTest value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiOptStrongRefStress
     * @tc.number SUB_NAPI_STRONGREF_1600
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiOptStrongRefStress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiOptStrongRefStress";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.optStrongRefStress();
        console.info('napiOptStrongRefStress value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiSameObjMutilStrongRef
     * @tc.number SUB_NAPI_STRONGREF_1700
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiSameObjMutilStrongRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiSameObjMutilStrongRef";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.sameObjMutilStrongRef(ArkTools.forceFullGC);
        console.info('napiSameObjMutilStrongRef value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGradualReferenceRelease
     * @tc.number SUB_NAPI_STRONGREF_1800
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiGradualReferenceRelease', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiGradualReferenceRelease";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.gradualReferenceRelease(ArkTools.forceFullGC);
        console.info('napiGradualReferenceRelease value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiStrongRefVariousTypes
     * @tc.number SUB_NAPI_STRONGREF_1900
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiStrongRefVariousTypes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiStrongRefVariousTypes";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.strongRefVariousTypes();
        console.info('napiStrongRefVariousTypes value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiPostDeleteBehavior
     * @tc.number SUB_NAPI_STRONGREF_2000
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiPostDeleteBehavior', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiPostDeleteBehavior";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.postDeleteBehavior();
        console.info('napiPostDeleteBehavior value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiCrossScopeStrongRef
     * @tc.number SUB_NAPI_STRONGREF_2100
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiCrossScopeStrongRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiCrossScopeStrongRef";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.crossScopeStrongRef();
        console.info('napiCrossScopeStrongRef value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiManyStrongReferences
     * @tc.number SUB_NAPI_STRONGREF_2200
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiManyStrongReferences', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiManyStrongReferences";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.manyStrongReferences();
        console.info('napiManyStrongReferences value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });    

    /**
     * @tc.name   napiGetGlobalHandleCountBasic
     * @tc.number SUB_ARKUI_NAPI_GLOBALHANDLE_0100
     * @tc.desc   传入有效env和count指针，验证返回napi_ok且count写入global_handle数量
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiGetGlobalHandleCountBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiGetGlobalHandleCountBasic";
      console.info(`${TAG} START`);
      try {
        let value: boolean = napitestex.getGlobalHandleCountBasic();
        console.info('napiGetGlobalHandleCountBasic value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetGlobalHandleCountAfterCreate
     * @tc.number SUB_ARKUI_NAPI_GLOBALHANDLE_0200
     * @tc.desc   创建strong_reference后查询，验证count增长
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiGetGlobalHandleCountAfterCreate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiGetGlobalHandleCountAfterCreate";
      console.info(`${TAG} START`);
      try {
        let base: number = napitestex.getGlobalHandleCountValue();
        console.info(`${TAG} base count: ${base}`);
        let created: boolean = napitestex.createStrongRefGhc();
        expect(created).assertTrue();
        let after: number = napitestex.getGlobalHandleCountValue();
        console.info(`${TAG} after create count: ${after}`);
        expect(after > base).assertTrue();
        napitestex.deleteStrongRefGhc();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetGlobalHandleCountAfterDelete
     * @tc.number SUB_ARKUI_NAPI_GLOBALHANDLE_0300
     * @tc.desc   删除strong_reference后查询，验证count回落
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiGetGlobalHandleCountAfterDelete', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiGetGlobalHandleCountAfterDelete";
      console.info(`${TAG} START`);
      try {
        let created: boolean = napitestex.createStrongRefGhc();
        expect(created).assertTrue();
        let afterCreate: number = napitestex.getGlobalHandleCountValue();
        console.info(`${TAG} after create count: ${afterCreate}`);
        let deleted: boolean = napitestex.deleteStrongRefGhc();
        expect(deleted).assertTrue();
        let afterDelete: number = napitestex.getGlobalHandleCountValue();
        console.info(`${TAG} after delete count: ${afterDelete}`);
        expect(afterDelete < afterCreate).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetGlobalHandleCountEnvNull
     * @tc.number SUB_ARKUI_NAPI_GLOBALHANDLE_0400
     * @tc.desc   env为nullptr验证返回napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiGetGlobalHandleCountEnvNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiGetGlobalHandleCountEnvNull";
      console.info(`${TAG} START`);
      try {
        let value: boolean = napitestex.getGlobalHandleCountEnvNull();
        console.info('napiGetGlobalHandleCountEnvNull value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetGlobalHandleCountCountNull
     * @tc.number SUB_ARKUI_NAPI_GLOBALHANDLE_0500
     * @tc.desc   count为nullptr验证返回napi_invalid_arg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiGetGlobalHandleCountCountNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiGetGlobalHandleCountCountNull";
      console.info(`${TAG} START`);
      try {
        let value: boolean = napitestex.getGlobalHandleCountCountNull();
        console.info('napiGetGlobalHandleCountCountNull value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetGlobalHandleCountPendingException
     * @tc.number SUB_ARKUI_NAPI_GLOBALHANDLE_0600
     * @tc.desc   存在未捕获ArkTS_Error验证返回napi_pending_exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('napiGetGlobalHandleCountPendingException', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = "napiGetGlobalHandleCountPendingException";
      console.info(`${TAG} START`);
      try {
        let value: boolean = napitestex.getGlobalHandleCountPendingException();
        console.info('napiGetGlobalHandleCountPendingException value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetGlobalHandleCountInWorker
     * @tc.number SUB_ARKUI_NAPI_GLOBALHANDLE_0700
     * @tc.desc   Worker线程env调用，验证count独立于主线程强引用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiGetGlobalHandleCountInWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiGetGlobalHandleCountInWorker";
      console.info(`${TAG} START`);
      let ghcWorker: worker.ThreadWorker | undefined;
      try {
        ghcWorker = new worker.ThreadWorker('../workers/GlobalHandleWorker.ets');
        const getWorkerCount = (): Promise<number> => {
          return new Promise<number>((resolve, reject) => {
            let resolved = false;
            ghcWorker!.onmessage = (e: MessageEvents) => {
              resolved = true;
              resolve(e.data as number);
            };
            ghcWorker!.onexit = () => {
              if (!resolved) {
                reject(new Error(`${TAG}: Worker exited without sending result`));
              }
            };
            ghcWorker!.onerror = (e) => {
              ghcWorker!.terminate();
              reject(e);
            };
            ghcWorker!.postMessage('getCount');
          });
        };
        let w1: number = await getWorkerCount();
        let mainBefore: number = napitestex.getGlobalHandleCountValue();
        console.info(`${TAG} main before: ${mainBefore}, worker count1: ${w1}`);
        let created: boolean = napitestex.createStrongRefGhc();
        expect(created).assertTrue();
        let mainAfter: number = napitestex.getGlobalHandleCountValue();
        console.info(`${TAG} main count after create: ${mainAfter}`);
        expect(mainAfter > mainBefore).assertTrue();
        let w2: number = await getWorkerCount();
        console.info(`${TAG} worker count2: ${w2}`);
        expect(w1 === w2).assertTrue();
        napitestex.deleteStrongRefGhc();
        ghcWorker.terminate();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        if (ghcWorker) {
          ghcWorker.terminate();
        }
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetGlobalHandleCountInTaskpool
     * @tc.number SUB_ARKUI_NAPI_GLOBALHANDLE_0800
     * @tc.desc   TaskPool线程env调用，验证count独立于主线程强引用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiGetGlobalHandleCountInTaskpool', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiGetGlobalHandleCountInTaskpool";
      console.info(`${TAG} START`);
      try {
        let mainBefore: number = napitestex.getGlobalHandleCountValue();
        let t1: number = await taskpool.execute(getGhcCountInTaskpool) as number;
        console.info(`${TAG} main before: ${mainBefore}, taskpool count1: ${t1}`);
        let created: boolean = napitestex.createStrongRefGhc();
        expect(created).assertTrue();
        let mainAfter: number = napitestex.getGlobalHandleCountValue();
        console.info(`${TAG} main count after create: ${mainAfter}`);
        expect(mainAfter > mainBefore).assertTrue();
        let t2: number = await taskpool.execute(getGhcCountInTaskpool) as number;
        console.info(`${TAG} taskpool count2: ${t2}`);
        expect(t1 === t2).assertTrue();
        napitestex.deleteStrongRefGhc();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetGlobalHandleCountMultiContext
     * @tc.number SUB_ARKUI_NAPI_GLOBALHANDLE_0900
     * @tc.desc   多context与主env共享vm，主env强引用使子env的count同步变化
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiGetGlobalHandleCountMultiContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiGetGlobalHandleCountMultiContext";
      console.info(`${TAG} START`);
      try {
        let value: boolean = napitestex.getGlobalHandleCountMultiContext();
        console.info('napiGetGlobalHandleCountMultiContext value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetGlobalHandleCountCombo
     * @tc.number SUB_ARKUI_NAPI_GLOBALHANDLE_1000
     * @tc.desc   创建删除strong_reference组合，验证count精确变化
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiGetGlobalHandleCountCombo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiGetGlobalHandleCountCombo";
      console.info(`${TAG} START`);
      try {
        let value: boolean = napitestex.getGlobalHandleCountCombo();
        console.info('napiGetGlobalHandleCountCombo value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetGlobalHandleCountSendable
     * @tc.number SUB_ARKUI_NAPI_GLOBALHANDLE_1100
     * @tc.desc   Sendable强引用不影响global_handle_count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiGetGlobalHandleCountSendable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiGetGlobalHandleCountSendable";
      console.info(`${TAG} START`);
      try {
        let value: boolean = napitestex.getGlobalHandleCountSendable();
        console.info('napiGetGlobalHandleCountSendable value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetGlobalHandleCountGetStrongRefValue
     * @tc.number SUB_ARKUI_NAPI_GLOBALHANDLE_1200
     * @tc.desc   get_strong_reference_value获取对象后count不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiGetGlobalHandleCountGetStrongRefValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiGetGlobalHandleCountGetStrongRefValue";
      console.info(`${TAG} START`);
      try {
        let value: boolean = napitestex.getGlobalHandleCountGetStrongRefValue();
        console.info('napiGetGlobalHandleCountGetStrongRefValue value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });
  });
}
