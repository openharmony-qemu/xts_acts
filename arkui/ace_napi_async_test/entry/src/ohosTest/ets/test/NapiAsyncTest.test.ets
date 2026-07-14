import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';

class PromiseThenableVariant {
  then(resolve: (value: number) => void): void {
    resolve(1);
  }
}

class PlainObjectVariant {
  value: string = 'plain-object';
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CREATEPROMISE_0100
     * @tc.name testNapiCreatePromise0001
     * @tc.desc Test napi_create_promise with normal parameters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiCreatePromise0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiCreatePromise0001 begin');
      let result = testNapi.testNapiCreatePromise_NormalParams();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CREATEPROMISE_0200
     * @tc.name testNapiCreatePromise0002
     * @tc.desc Test napi_create_promise with null env
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiCreatePromise0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      console.info('testNapiCreatePromise0002 begin');
      let result = testNapi.testNapiCreatePromise_NullEnv();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CREATEPROMISE_0300
     * @tc.name testNapiCreatePromise0003
     * @tc.desc Test napi_create_promise with null deferred
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiCreatePromise0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      console.info('testNapiCreatePromise0003 begin');
      let result = testNapi.testNapiCreatePromise_NullDeferred();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CREATEPROMISE_0400
     * @tc.name testNapiCreatePromise0004
     * @tc.desc Test napi_create_promise with null promise
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiCreatePromise0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      console.info('testNapiCreatePromise0004 begin');
      let result = testNapi.testNapiCreatePromise_NullPromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CREATEASYNCWORK_0100
     * @tc.name testNapiCreateAsyncWork0001
     * @tc.desc Test napi_create_async_work with normal parameters (string resource name)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiCreateAsyncWork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info('testNapiCreateAsyncWork0001 begin');
      let result = testNapi.testNapiCreateAsyncWork_NormalParams();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CREATEASYNCWORK_0200
     * @tc.name testNapiCreateAsyncWork0002
     * @tc.desc Test napi_create_async_work with non-string async_resource_name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiCreateAsyncWork0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiCreateAsyncWork0002 begin');
      let result = testNapi.testNapiCreateAsyncWork_AsyncResourceNameNonString();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CREATEASYNCWORK_0300
     * @tc.name testNapiCreateAsyncWork0003
     * @tc.desc Test napi_create_async_work with null execute and complete
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiCreateAsyncWork0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      console.info('testNapiCreateAsyncWork0003 begin');
      let result = testNapi.testNapiCreateAsyncWork_NullExecuteAndComplete();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CREATEASYNCWORK_0400
     * @tc.name testNapiCreateAsyncWork0004
     * @tc.desc Test napi_create_async_work with null execute
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiCreateAsyncWork0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      console.info('testNapiCreateAsyncWork0004 begin');
      let result = testNapi.testNapiCreateAsyncWork_NullExecute();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CREATEASYNCWORK_0500
     * @tc.name testNapiCreateAsyncWork0005
     * @tc.desc Test napi_create_async_work with null env
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiCreateAsyncWork0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      console.info('testNapiCreateAsyncWork0005 begin');
      let result = testNapi.testNapiCreateAsyncWork_NullEnv();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CREATEASYNCWORK_0600
     * @tc.name testNapiCreateAsyncWork0006
     * @tc.desc Test napi_create_async_work with null result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiCreateAsyncWork0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      console.info('testNapiCreateAsyncWork0006 begin');
      let result = testNapi.testNapiCreateAsyncWork_NullResult();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CREATEASYNCWORK_0700
     * @tc.name testNapiCreateAsyncWork0007
     * @tc.desc Test napi_create_async_work with null data (execute/complete have params)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiCreateAsyncWork0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      console.info('testNapiCreateAsyncWork0007 begin');
      let result = testNapi.testNapiCreateAsyncWork_NullData();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_QUEUEASYNCWORK_0100
     * @tc.name testNapiQueueAsyncWork0001
     * @tc.desc Test napi_queue_async_work with normal parameters (callback triggered)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiQueueAsyncWork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiQueueAsyncWork0001 begin');
      let result = await testNapi.testNapiQueueAsyncWork_NormalParams();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_QUEUEASYNCWORK_0200
     * @tc.name testNapiQueueAsyncWork0002
     * @tc.desc Test napi_queue_async_work thread validation (execute thread != callback thread, create thread == complete thread)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiQueueAsyncWork0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiQueueAsyncWork0002 begin');
      let result = await testNapi.testNapiQueueAsyncWork_ThreadValidation();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_QUEUEASYNCWORK_0300
     * @tc.name testNapiQueueAsyncWork0003
     * @tc.desc Test napi_queue_async_work with null env
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiQueueAsyncWork0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testNapiQueueAsyncWork0003 begin');
      let result = testNapi.testNapiQueueAsyncWork_NullEnv();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_QUEUEASYNCWORK_0400
     * @tc.name testNapiQueueAsyncWork0004
     * @tc.desc Test napi_queue_async_work with null work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiQueueAsyncWork0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testNapiQueueAsyncWork0004 begin');
      let result = testNapi.testNapiQueueAsyncWork_NullWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_QUEUEASYNCWORK_0500
     * @tc.name testNapiQueueAsyncWork0005
     * @tc.desc Test napi_queue_async_work with null env and work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiQueueAsyncWork0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testNapiQueueAsyncWork0005 begin');
      let result = testNapi.testNapiQueueAsyncWork_NullEnvAndWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_QUEUEASYNCWORK_0600
     * @tc.name testNapiQueueAsyncWork0006
     * @tc.desc Test napi_queue_async_work with queued work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiQueueAsyncWork0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiQueueAsyncWork0006 begin');
      let result = testNapi.testNapiQueueAsyncWork_QueuedWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_QUEUEASYNCWORK_0700
     * @tc.name testNapiQueueAsyncWork0007
     * @tc.desc Test napi_queue_async_work with executed work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiQueueAsyncWork0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('testNapiQueueAsyncWork0007 begin');
      let result = await testNapi.testNapiQueueAsyncWork_ExecutedWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_QUEUEASYNCWORK_0800
     * @tc.name testNapiQueueAsyncWork0008
     * @tc.desc Test napi_queue_async_work with canceled work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiQueueAsyncWork0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('testNapiQueueAsyncWork0008 begin');
      let result = await testNapi.testNapiQueueAsyncWork_CanceledWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_QUEUEASYNCWORK_0900
     * @tc.name testNapiQueueAsyncWork0009
     * @tc.desc Test napi_queue_async_work with deleted work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiQueueAsyncWork0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiQueueAsyncWork0009 begin');
      let result = testNapi.testNapiQueueAsyncWork_DeletedWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CANCELASYNCWORK_0100
     * @tc.name testNapiCancelAsyncWork0001
     * @tc.desc Test napi_cancel_async_work with queued work (returns napi_ok regardless of uv result, status passed to complete callback)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiCancelAsyncWork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiCancelAsyncWork0001 begin');
      let result = await testNapi.testNapiCancelAsyncWork_QueuedWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CANCELASYNCWORK_0200
     * @tc.name testNapiCancelAsyncWork0002
     * @tc.desc Test napi_cancel_async_work with not queued work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiCancelAsyncWork0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiCancelAsyncWork0002 begin');
      let result = testNapi.testNapiCancelAsyncWork_NotQueuedWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CANCELASYNCWORK_0300
     * @tc.name testNapiCancelAsyncWork0003
     * @tc.desc Test napi_cancel_async_work with null work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiCancelAsyncWork0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testNapiCancelAsyncWork0003 begin');
      let result = testNapi.testNapiCancelAsyncWork_NullWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CANCELASYNCWORK_0400
     * @tc.name testNapiCancelAsyncWork0004
     * @tc.desc Test napi_cancel_async_work with null env
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiCancelAsyncWork0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testNapiCancelAsyncWork0004 begin');
      let result = testNapi.testNapiCancelAsyncWork_NullEnv();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CANCELASYNCWORK_0500
     * @tc.name testNapiCancelAsyncWork0005
     * @tc.desc Test napi_cancel_async_work with executing work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiCancelAsyncWork0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiCancelAsyncWork0005 begin');
      let result = testNapi.testNapiCancelAsyncWork_ExecutingWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CANCELASYNCWORK_0600
     * @tc.name testNapiCancelAsyncWork0006
     * @tc.desc Test napi_cancel_async_work with completed work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiCancelAsyncWork0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('testNapiCancelAsyncWork0006 begin');
      let result = await testNapi.testNapiCancelAsyncWork_CompletedWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CANCELASYNCWORK_0700
     * @tc.name testNapiCancelAsyncWork0007
     * @tc.desc Test napi_cancel_async_work with deleted work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiCancelAsyncWork0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiCancelAsyncWork0007 begin');
      let result = testNapi.testNapiCancelAsyncWork_DeletedWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CANCELASYNCWORK_0800
     * @tc.name testNapiCancelAsyncWork0008
     * @tc.desc Test napi_cancel_async_work with canceled work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiCancelAsyncWork0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('testNapiCancelAsyncWork0008 begin');
      let result = await testNapi.testNapiCancelAsyncWork_CanceledWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DELETEASYNCWORK_0100
     * @tc.name testNapiDeleteAsyncWork0001
     * @tc.desc Test napi_delete_async_work with normal parameters (async_work should be deleted once only)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeleteAsyncWork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info('testNapiDeleteAsyncWork0001 begin');
      let result = testNapi.testNapiDeleteAsyncWork_NormalParams();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DELETEASYNCWORK_0200
     * @tc.name testNapiDeleteAsyncWork0002
     * @tc.desc Test napi_delete_async_work with not queued work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiDeleteAsyncWork0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiDeleteAsyncWork0002 begin');
      let result = testNapi.testNapiDeleteAsyncWork_NotQueued();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DELETEASYNCWORK_0300
     * @tc.name testNapiDeleteAsyncWork0003
     * @tc.desc Test napi_delete_async_work with queued not executed work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiDeleteAsyncWork0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('testNapiDeleteAsyncWork0003 begin');
      let result = await testNapi.testNapiDeleteAsyncWork_QueuedNotExecuted();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DELETEASYNCWORK_0400
     * @tc.name testNapiDeleteAsyncWork0004
     * @tc.desc Test napi_delete_async_work with executing work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiDeleteAsyncWork0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('testNapiDeleteAsyncWork0004 begin');
      let result = await testNapi.testNapiDeleteAsyncWork_Executing();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DELETEASYNCWORK_0500
     * @tc.name testNapiDeleteAsyncWork0005
     * @tc.desc Test napi_delete_async_work with canceled work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiDeleteAsyncWork0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('testNapiDeleteAsyncWork0005 begin');
      let result = await testNapi.testNapiDeleteAsyncWork_Canceled();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DELETEASYNCWORK_0600
     * @tc.name testNapiDeleteAsyncWork0006
     * @tc.desc Test napi_delete_async_work with completed work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiDeleteAsyncWork0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('testNapiDeleteAsyncWork0006 begin');
      let result = await testNapi.testNapiDeleteAsyncWork_Completed();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DELETEASYNCWORK_0700
     * @tc.name testNapiDeleteAsyncWork0007
     * @tc.desc Test napi_delete_async_work with null work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiDeleteAsyncWork0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testNapiDeleteAsyncWork0007 begin');
      let result = testNapi.testNapiDeleteAsyncWork_NullWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DELETEASYNCWORK_0800
     * @tc.name testNapiDeleteAsyncWork0008
     * @tc.desc Test napi_delete_async_work with null env
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNapiDeleteAsyncWork0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('testNapiDeleteAsyncWork0008 begin');
      let result = testNapi.testNapiDeleteAsyncWork_NullEnv();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DELETEASYNCWORK_0900
     * @tc.name testNapiDeleteAsyncWork0009
     * @tc.desc Test napi_delete_async_work with deleted work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeleteAsyncWork0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      console.info('testNapiDeleteAsyncWork0009 begin');
      let result = testNapi.testNapiDeleteAsyncWork_DeletedWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCWORK_0100
     * @tc.name testNapiAsyncWork0001
     * @tc.desc Test async work with normal function no arg no return (execute runs in worker thread, complete runs after execute)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncWork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncWork0001 begin');
      let result = await testNapi.testNapiAsyncWork_NormalFunctionNoArgNoReturn();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCWORK_0200
     * @tc.name testNapiAsyncWork0002
     * @tc.desc Test async work with sync function with arg no return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncWork0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncWork0002 begin');
      let result = await testNapi.testNapiAsyncWork_SyncFunctionWithArgNoReturn();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCWORK_0300
     * @tc.name testNapiAsyncWork0003
     * @tc.desc Test async work with normal function no arg with return container
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncWork0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncWork0003 begin');
      let result = await testNapi.testNapiAsyncWork_NormalFunctionNoArgWithReturnContainer();
      expect(result).assertTrue();
    })


    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCWORK_0400
     * @tc.name testNapiAsyncWork0004
     * @tc.desc Test async work with class method with arg string return function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncWork0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncWork0004 begin');
      let result = await testNapi.testNapiAsyncWork_ClassMethodWithArgStringReturnFunction();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCWORK_0500
     * @tc.name testNapiAsyncWork0005
     * @tc.desc Test async work with class static with arg return promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncWork0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncWork0005 begin');
      let result = await testNapi.testNapiAsyncWork_ClassStaticWithArgReturnPromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCWORK_0600
     * @tc.name testNapiAsyncWork0006
     * @tc.desc Test async work with ets normal function no arg no return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncWork0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncWork0006 begin');
      let result = await testNapi.testNapiAsyncWork_EtsNormalFunctionNoArgNoReturn();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCWORK_0700
     * @tc.name testNapiAsyncWork0007
     * @tc.desc Test async work with ets normal function with arg no return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncWork0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncWork0007 begin');
      let result = await testNapi.testNapiAsyncWork_EtsNormalFunctionWithArgNoReturn();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCWORK_0800
     * @tc.name testNapiAsyncWork0008
     * @tc.desc Test async work with ets normal function no arg with return container
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncWork0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncWork0008 begin');
      let result = await testNapi.testNapiAsyncWork_EtsNormalFunctionNoArgWithReturnContainer();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCWORK_0900
     * @tc.name testNapiAsyncWork0009
     * @tc.desc Test async work with ets class method with arg string return function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncWork0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncWork0009 begin');
      let result = await testNapi.testNapiAsyncWork_EtsClassMethodWithArgStringReturnFunction();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCWORK_1000
     * @tc.name testNapiAsyncWork0010
     * @tc.desc Test async work with ets class static with arg return promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncWork0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncWork0010 begin');
      let result = await testNapi.testNapiAsyncWork_EtsClassStaticWithArgReturnPromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCWORK_1100
     * @tc.name testNapiAsyncWork0011
     * @tc.desc Test async work with ets class constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncWork0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncWork0011 begin');
      let result = await testNapi.testNapiAsyncWork_EtsClassConstructor();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCCOMPLETE_0100
     * @tc.name testNapiAsyncComplete0001
     * @tc.desc Test async complete with normal function no arg no return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncComplete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncComplete0001 begin');
      let result = await testNapi.testNapiAsyncComplete_NormalFunctionNoArgNoReturn();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCCOMPLETE_0200
     * @tc.name testNapiAsyncComplete0002
     * @tc.desc Test async complete with sync function with arg return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncComplete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncComplete0002 begin');
      let result = await testNapi.testNapiAsyncComplete_SyncFunctionWithArgReturn();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCCOMPLETE_0300
     * @tc.name testNapiAsyncComplete0003
     * @tc.desc Test async complete with normal function no arg return container
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncComplete0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncComplete0003 begin');
      let result = await testNapi.testNapiAsyncComplete_NormalFunctionNoArgReturnContainer();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCCOMPLETE_0400
     * @tc.name testNapiAsyncComplete0004
     * @tc.desc Test async complete with sync function with arg return container
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncComplete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncComplete0004 begin');
      let result = await testNapi.testNapiAsyncComplete_SyncFunctionWithArgReturnContainer();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCCOMPLETE_0500
     * @tc.name testNapiAsyncComplete0005
     * @tc.desc Test async complete with normal function no arg return string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncComplete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncComplete0005 begin');
      let result = await testNapi.testNapiAsyncComplete_NormalFunctionNoArgReturnString();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCCOMPLETE_0600
     * @tc.name testNapiAsyncComplete0006
     * @tc.desc Test async complete with class method with arg string return function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncComplete0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncComplete0006 begin');
      let result = await testNapi.testNapiAsyncComplete_ClassMethodWithArgStringReturnFunction();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCCOMPLETE_0700
     * @tc.name testNapiAsyncComplete0007
     * @tc.desc Test async complete with class static with arg return promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncComplete0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncComplete0007 begin');
      let result = await testNapi.testNapiAsyncComplete_ClassStaticWithArgReturnPromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCCOMPLETE_0800
     * @tc.name testNapiAsyncComplete0008
     * @tc.desc Test async complete with ets normal function no arg no return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncComplete0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncComplete0008 begin');
      let result = await testNapi.testNapiAsyncComplete_EtsNormalFunctionNoArgNoReturn();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCCOMPLETE_0900
     * @tc.name testNapiAsyncComplete0009
     * @tc.desc Test async complete with ets normal function with arg no return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncComplete0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncComplete0009 begin');
      let result = await testNapi.testNapiAsyncComplete_EtsNormalFunctionWithArgNoReturn();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCCOMPLETE_1000
     * @tc.name testNapiAsyncComplete0010
     * @tc.desc Test async complete with ets normal function no arg return container
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncComplete0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncComplete0010 begin');
      let result = await testNapi.testNapiAsyncComplete_EtsNormalFunctionNoArgReturnContainer();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCCOMPLETE_1100
     * @tc.name testNapiAsyncComplete0011
     * @tc.desc Test async complete with ets class method with arg string return function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncComplete0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncComplete0011 begin');
      let result = await testNapi.testNapiAsyncComplete_EtsClassMethodWithArgStringReturnFunction();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCCOMPLETE_1200
     * @tc.name testNapiAsyncComplete0012
     * @tc.desc Test async complete with ets class static with arg return promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncComplete0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncComplete0012 begin');
      let result = await testNapi.testNapiAsyncComplete_EtsClassStaticWithArgReturnPromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ASYNCCOMPLETE_1300
     * @tc.name testNapiAsyncComplete0013
     * @tc.desc Test async complete with ets class constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiAsyncComplete0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiAsyncComplete0013 begin');
      let result = await testNapi.testNapiAsyncComplete_EtsClassConstructor();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_0100
     * @tc.name testNapiTaskContent0001
     * @tc.desc Test task content with execute throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0001 begin');
      let result = await testNapi.testNapiTaskContent_ExecuteThrowException();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_0200
     * @tc.name testNapiTaskContent0002
     * @tc.desc Test task content with complete throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0002 begin');
      let result = await testNapi.testNapiTaskContent_CompleteThrowException();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_0300
     * @tc.name testNapiTaskContent0003
     * @tc.desc Test task content with execute using lock operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0003 begin');
      let result = await testNapi.testNapiTaskContent_ExecuteWithLock();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_0400
     * @tc.name testNapiTaskContent0004
     * @tc.desc Test task content with execute long time 10s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0004 begin');
      let result = await testNapi.testNapiTaskContent_ExecuteLongTime10s();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_0500
     * @tc.name testNapiTaskContent0005
     * @tc.desc Test task content with execute long time 3min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0005 begin');
      let result = await testNapi.testNapiTaskContent_ExecuteLongTime3min();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_0600
     * @tc.name testNapiTaskContent0006
     * @tc.desc Test task content with execute long time 10min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0006 begin');
      let result = await testNapi.testNapiTaskContent_ExecuteLongTime10min();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_0700
     * @tc.name testNapiTaskContent0007
     * @tc.desc Test task content with complete long time 10s
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0007 begin');
      let result = await testNapi.testNapiTaskContent_CompleteLongTime10s();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_0800
     * @tc.name testNapiTaskContent0008
     * @tc.desc Test task content with complete long time 3min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0008 begin');
      let result = await testNapi.testNapiTaskContent_CompleteLongTime3min();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_0900
     * @tc.name testNapiTaskContent0009
     * @tc.desc Test task content with complete long time 10min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0009 begin');
      let result = await testNapi.testNapiTaskContent_CompleteLongTime10min();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_1000
     * @tc.name testNapiTaskContent0010
     * @tc.desc Test task content with execute infinite loop (kill thread)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0010 begin');
      let result = await testNapi.testNapiTaskContent_ExecuteInfiniteLoop();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_1100
     * @tc.name testNapiTaskContent0011
     * @tc.desc Test task content with two tasks using same data pointer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0011 begin');
      let result = await testNapi.testNapiTaskContent_SameDataPointer();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_1200
     * @tc.name testNapiTaskContent0012
     * @tc.desc Test task content with execute empty operation (<1ms)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0012 begin');
      let result = await testNapi.testNapiTaskContent_ExecuteEmptyOperation();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_1300
     * @tc.name testNapiTaskContent0013
     * @tc.desc Test task content with complete delete async work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0013 begin');
      let result = await testNapi.testNapiTaskContent_CompleteDeleteWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_TASKCONTENT_1400
     * @tc.name testNapiTaskContent0014
     * @tc.desc Test task content with cancel and requeue async work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiTaskContent0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiTaskContent0014 begin');
      let result = await testNapi.testNapiTaskContent_CancelAndRequeue();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_MULTITHREAD_0100
     * @tc.name testNapiMultiThread0001
     * @tc.desc Test multi thread create and queue concurrent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiMultiThread0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiMultiThread0001 begin');
      let result = await testNapi.testNapiMultiThread_CreateAndQueueConcurrent();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_MULTITHREAD_0200
     * @tc.name testNapiMultiThread0002
     * @tc.desc Test multi thread main thread create and queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiMultiThread0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiMultiThread0002 begin');
      let result = await testNapi.testNapiMultiThread_MainThreadCreateAndQueue();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_MULTITHREAD_0300
     * @tc.name testNapiMultiThread0003
     * @tc.desc Test multi thread main cancel other thread executing task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiMultiThread0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiMultiThread0003 begin');
      let result = await testNapi.testNapiMultiThread_MainCancelOtherThreadTask();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_MULTITHREAD_0400
     * @tc.name testNapiMultiThread0004
     * @tc.desc Test multi thread cancel same task concurrently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiMultiThread0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiMultiThread0004 begin');
      let result = await testNapi.testNapiMultiThread_MultiThreadCancelSameTask();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_MULTITHREAD_0500
     * @tc.name testNapiMultiThread0005
     * @tc.desc Test multi thread queue and cancel race condition 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiMultiThread0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiMultiThread0005 begin');
      let result = await testNapi.testNapiMultiThread_QueueAndCancelRaceCondition1();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_MULTITHREAD_0600
     * @tc.name testNapiMultiThread0006
     * @tc.desc Test multi thread queue and cancel race condition 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiMultiThread0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiMultiThread0006 begin');
      let result = await testNapi.testNapiMultiThread_QueueAndCancelRaceCondition2();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_MULTITHREAD_0700
     * @tc.name testNapiMultiThread0007
     * @tc.desc Test multi thread cross thread delete task handle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiMultiThread0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiMultiThread0007 begin');
      let result = await testNapi.testNapiMultiThread_CrossThreadDeleteHandle();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_MULTITHREAD_0800
     * @tc.name testNapiMultiThread0008
     * @tc.desc Test multi thread main create child queue main cancel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiMultiThread0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiMultiThread0008 begin');
      let result = await testNapi.testNapiMultiThread_MainCreateChildQueueMainCancel();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NESTEDCOMPLETE_0100
     * @tc.name testNapiNestedComplete0001
     * @tc.desc Test nested complete create and queue task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiNestedComplete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiNestedComplete0001 begin');
      let result = await testNapi.testNapiNestedComplete_NestCreateAndQueue();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NESTEDCOMPLETE_0200
     * @tc.name testNapiNestedComplete0002
     * @tc.desc Test nested complete create multiple tasks and cancel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiNestedComplete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiNestedComplete0002 begin');
      let result = await testNapi.testNapiNestedComplete_NestCreateMultipleAndCancel();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NESTEDCOMPLETE_0300
     * @tc.name testNapiNestedComplete0003
     * @tc.desc Test nested complete create promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiNestedComplete0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiNestedComplete0003 begin');
      let result = await testNapi.testNapiNestedComplete_NestCreatePromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NESTEDCOMPLETE_0400
     * @tc.name testNapiNestedComplete0004
     * @tc.desc Test nested complete create async task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiNestedComplete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiNestedComplete0004 begin');
      let result = await testNapi.testNapiNestedComplete_NestCreateAsyncTask();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NESTEDCOMPLETE_0500
     * @tc.name testNapiNestedComplete0005
     * @tc.desc Test nested complete create taskpool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiNestedComplete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiNestedComplete0005 begin');
      let result = await testNapi.testNapiNestedComplete_NestCreateTaskpool();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NESTEDCOMPLETE_1000
     * @tc.name testNapiNestedComplete0010
     * @tc.desc Test nested complete create launch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiNestedComplete0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiNestedComplete0010 begin');
      let result = await testNapi.testNapiNestedComplete_NestCreateLaunch();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_NESTEDCOMPLETE_1100
     * @tc.name testNapiNestedComplete0011
     * @tc.desc Test nested complete create timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiNestedComplete0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiNestedComplete0011 begin');
      let result = await testNapi.testNapiNestedComplete_NestCreateTimer();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_OTHERNESTED_0400
     * @tc.name testNapiOtherNested0004
     * @tc.desc Test other nested taskpool nest create async
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiOtherNested0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiOtherNested0004 begin');
      let result = await testNapi.testNapiOtherNested_TaskpoolNestCreateAsync();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_OTHERNESTED_0500
     * @tc.name testNapiOtherNested0005
     * @tc.desc Test other nested promise nest create async
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiOtherNested0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiOtherNested0005 begin');
      let result = await testNapi.testNapiOtherNested_PromiseNestCreateAsync();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_OTHERNESTED_0600
     * @tc.name testNapiOtherNested0006
     * @tc.desc Test other nested async nest create async
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiOtherNested0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiOtherNested0006 begin');
      let result = await testNapi.testNapiOtherNested_AsyncNestCreateAsync();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_OTHERNESTED_0800
     * @tc.name testNapiOtherNested0008
     * @tc.desc Test other nested timer nest create async
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiOtherNested0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiOtherNested0008 begin');
      let result = await testNapi.testNapiOtherNested_TimerNestCreateAsync();
      expect(result).assertTrue();
    })


    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CALLBACKNESTED_0100
     * @tc.name testNapiCallbackNested0001
     * @tc.desc Test callback nested EAWorker nest create async
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiCallbackNested0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiCallbackNested0001 begin');
      let result = await testNapi.testNapiCallbackNested_EAWorkerNestCreateAsync();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CALLBACKNESTED_0300
     * @tc.name testNapiCallbackNested0003
     * @tc.desc Test callback nested taskpool onReceiveData 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiCallbackNested0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiCallbackNested0003 begin');
      let result = await testNapi.testNapiCallbackNested_TaskpoolOnReceiveData1();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CALLBACKNESTED_0400
     * @tc.name testNapiCallbackNested0004
     * @tc.desc Test callback nested taskpool onReceiveData 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiCallbackNested0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiCallbackNested0004 begin');
      let result = await testNapi.testNapiCallbackNested_TaskpoolOnReceiveData2();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CALLBACKNESTED_0500
     * @tc.name testNapiCallbackNested0005
     * @tc.desc Test callback nested taskpool onStartExecution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiCallbackNested0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiCallbackNested0005 begin');
      let result = await testNapi.testNapiCallbackNested_TaskpoolOnStartExecution();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CALLBACKNESTED_0600
     * @tc.name testNapiCallbackNested0006
     * @tc.desc Test callback nested taskpool then
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiCallbackNested0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiCallbackNested0006 begin');
      let result = await testNapi.testNapiCallbackNested_TaskpoolThen();
      expect(result).assertTrue();
    })

