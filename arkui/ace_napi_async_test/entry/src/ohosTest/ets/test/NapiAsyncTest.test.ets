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

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CALLBACKNESTED_0700
     * @tc.name testNapiCallbackNested0007
     * @tc.desc Test callback nested promise catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiCallbackNested0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiCallbackNested0007 begin');
      let result = await testNapi.testNapiCallbackNested_PromiseCatch();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CALLBACKNESTED_0800
     * @tc.name testNapiCallbackNested0008
     * @tc.desc Test callback nested promise finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiCallbackNested0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiCallbackNested0008 begin');
      let result = await testNapi.testNapiCallbackNested_PromiseFinally();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CALLBACKNESTED_0900
     * @tc.name testNapiCallbackNested0009
     * @tc.desc Test callback nested async finally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiCallbackNested0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info('testNapiCallbackNested0009 begin');
      let result = await testNapi.testNapiCallbackNested_AsyncFinally();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PERFORMANCE_0100
     * @tc.name testNapiPerformance0001
     * @tc.desc Test performance single task create queue delete
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it('testNapiPerformance0001', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiPerformance0001 begin');
      let result = await testNapi.testNapiPerformance_SingleTaskCreateQueueDelete();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PERFORMANCE_0200
     * @tc.name testNapiPerformance0002
     * @tc.desc Test performance single task create queue cancel
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it('testNapiPerformance0002', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiPerformance0002 begin');
      let result = await testNapi.testNapiPerformance_SingleTaskCreateQueueCancel();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PERFORMANCE_0300
     * @tc.name testNapiPerformance0003
     * @tc.desc Test performance single task wait complete
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it('testNapiPerformance0003', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiPerformance0003 begin');
      let result = await testNapi.testNapiPerformance_SingleTaskWaitComplete();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PERFORMANCE_0400
     * @tc.name testNapiPerformance0004
     * @tc.desc Test performance loop 10000 times
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it('testNapiPerformance0004', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiPerformance0004 begin');
      let result = await testNapi.testNapiPerformance_Loop10000Times();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PERFORMANCE_0500
     * @tc.name testNapiPerformance0005
     * @tc.desc Test performance loop 10000 times with cancel
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it('testNapiPerformance0005', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiPerformance0005 begin');
      let result = await testNapi.testNapiPerformance_Loop10000TimesWithCancel();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PERFORMANCE_0600
     * @tc.name testNapiPerformance0006
     * @tc.desc Test performance create multiple tasks and randomly cancel partial tasks
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it('testNapiPerformance0006', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, () => {
      console.info('testNapiPerformance0006 begin');
      let result = testNapi.testNapiPerformance_RandomCancelTasks();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PERFORMANCE_0700
     * @tc.name testNapiPerformance0007
     * @tc.desc Test performance create 10000 tasks and wait complete
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it('testNapiPerformance0007', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiPerformance0007 begin');
      let result = await testNapi.testNapiPerformance_Create10000TasksAndWaitComplete();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PERFORMANCE_0800
     * @tc.name testNapiPerformance0008
     * @tc.desc Test performance single task queue 10000 times
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it('testNapiPerformance0008', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiPerformance0008 begin');
      let result = await testNapi.testNapiPerformance_SingleTaskQueue10000Times();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PERFORMANCE_0900
     * @tc.name testNapiPerformance0009
     * @tc.desc Test performance large data 10M
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it('testNapiPerformance0009', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiPerformance0009 begin');
      let result = await testNapi.testNapiPerformance_LargeData10M();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PERFORMANCE_1000
     * @tc.name testNapiPerformance0010
     * @tc.desc Test performance large data memory leak
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it('testNapiPerformance0010', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiPerformance0010 begin');
      let result = await testNapi.testNapiPerformance_LargeDataMemoryLeak();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PERFORMANCE_1100
     * @tc.name testNapiPerformance0011
     * @tc.desc Test performance complete callback read data
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 1
     */
    it('testNapiPerformance0011', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiPerformance0011 begin');
      let result = await testNapi.testNapiPerformance_CompleteCbReadData();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_MULTITHREAD2_0100
     * @tc.name testNapiMultiThread20001
     * @tc.desc Test multi thread 100 threads 100 tasks each
     * @tc.size LargeTest
     * @tc.type Reliability
     * @tc.level Level 1
     */
    it('testNapiMultiThread20001', TestType.RELIABILITY | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiMultiThread20001 begin');
      let result = await testNapi.testNapiMultiThread_100Threads100TasksEach();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_MULTITHREAD2_0200
     * @tc.name testNapiMultiThread20002
     * @tc.desc Test multi thread 100 threads 100 tasks with cancel
     * @tc.size LargeTest
     * @tc.type Reliability
     * @tc.level Level 1
     */
    it('testNapiMultiThread20002', TestType.RELIABILITY | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiMultiThread20002 begin');
      let result = await testNapi.testNapiMultiThread_100Threads100TasksWithCancel();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_MULTITHREAD2_0300
     * @tc.name testNapiMultiThread20003
     * @tc.desc Test multi thread single task multi queue
     * @tc.size LargeTest
     * @tc.type Reliability
     * @tc.level Level 1
     */
    it('testNapiMultiThread20003', TestType.RELIABILITY | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiMultiThread20003 begin');
      let result = await testNapi.testNapiMultiThread_SingleTaskMultiQueue();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_MULTITHREAD2_0400
     * @tc.name testNapiMultiThread20004
     * @tc.desc Test multi thread single task multi queue with cancel
     * @tc.size LargeTest
     * @tc.type Reliability
     * @tc.level Level 1
     */
    it('testNapiMultiThread20004', TestType.RELIABILITY | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiMultiThread20004 begin');
      let result = await testNapi.testNapiMultiThread_SingleTaskMultiQueueWithCancel();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_MULTITHREAD2_0500
     * @tc.name testNapiMultiThread20005
     * @tc.desc Test multi thread data pointer counter
     * @tc.size LargeTest
     * @tc.type Reliability
     * @tc.level Level 1
     */
    it('testNapiMultiThread20005', TestType.RELIABILITY | Size.LARGETEST | Level.LEVEL1, async () => {
      console.info('testNapiMultiThread20005 begin');
      let result = await testNapi.testNapiMultiThread_DataPointerCounter();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISECREATE_0100
     * @tc.name testNapiPromiseCreate0001
     * @tc.desc Test promise creation native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiPromiseCreate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiPromiseCreate0001 begin');
      let result = testNapi.createPromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISECREATE_0200
     * @tc.name testNapiPromiseCreate0002
     * @tc.desc Test promise creation native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiPromiseCreate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNapiPromiseCreate0002 begin');
      let result = await testNapi.createPromiseAndResolve('resolved value from js');
      expect(`${result}`).assertEqual('resolved value from js');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISECREATE_0300
     * @tc.name testNapiPromiseCreate0003
     * @tc.desc Test promise creation native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiPromiseCreate0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNapiPromiseCreate0003 begin');
      let result = await testNapi.createPromiseAndReject(new Error('promise rejected from js'))
        .then(() => {
          return false;
        })
        .catch((err: Error) => {
          return err.message === 'promise rejected from js';
        });
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISE_0100
     * @tc.name testNapiIsPromise0001
     * @tc.desc Test promise type checking native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromise0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromise0001 begin');
      let result = testNapi.isPromise(Promise.resolve(true));
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISEDECISION_0100
     * @tc.name testNapiPromiseDecision0001
     * @tc.desc Test promise resolve and reject decision native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseDecision0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseDecision0001 begin');
      let result = testNapi.testDoubleResolve();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISEDECISION_0200
     * @tc.name testNapiPromiseDecision0002
     * @tc.desc Test promise resolve and reject decision native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseDecision0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseDecision0002 begin');
      let result = testNapi.testDoubleReject();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISEDECISION_0300
     * @tc.name testNapiPromiseDecision0003
     * @tc.desc Test promise resolve and reject decision native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseDecision0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseDecision0003 begin');
      let result = testNapi.testResolveThenReject();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISEDECISION_0400
     * @tc.name testNapiPromiseDecision0004
     * @tc.desc Test promise resolve and reject decision native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseDecision0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseDecision0004 begin');
      let result = testNapi.testRejectThenResolve();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISEMULTITHREAD_0100
     * @tc.name testNapiPromiseMultiThread0001
     * @tc.desc Test promise multithread native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseMultiThread0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseMultiThread0001 begin');
      let result = await testNapi.testMultiThreadCreatePromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISEMULTITHREAD_0200
     * @tc.name testNapiPromiseMultiThread0002
     * @tc.desc Test promise multithread native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseMultiThread0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseMultiThread0002 begin');
      let result = testNapi.testMultiThreadResolveSameDeferred();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISEMULTITHREAD_0300
     * @tc.name testNapiPromiseMultiThread0003
     * @tc.desc Test promise multithread native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseMultiThread0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseMultiThread0003 begin');
      let result = testNapi.testMultiThreadRejectSameDeferred();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISEMULTITHREAD_0400
     * @tc.name testNapiPromiseMultiThread0004
     * @tc.desc Test promise multithread native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseMultiThread0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseMultiThread0004 begin');
      let result = await testNapi.testThreadSafeResolve();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISEMULTITHREAD_0500
     * @tc.name testNapiPromiseMultiThread0005
     * @tc.desc Test promise multithread native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseMultiThread0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseMultiThread0005 begin');
      let result = await testNapi.testThreadSafeReject()
        .then(() => {
          return false;
        })
        .catch((err: string) => {
          return `${err}` === 'thread safe reject';
        });
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISEMULTITHREAD_0600
     * @tc.name testNapiPromiseMultiThread0006
     * @tc.desc Test promise multithread native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseMultiThread0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseMultiThread0006 begin');
      let result = testNapi.testThreadIsPromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISECREATE_TIMEOUT_0100
     * @tc.name testNapiPromiseCreateTimeOut0001
     * @tc.desc Test promise creation native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiPromiseCreateTimeOut0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNapiPromiseCreateTimeOut0001 begin');
      let result = await testNapi.createPromiseWithTimeout()
        .then(() => {
          return false;
        })
        .catch((err: Object) => {
          return `${err}` === 'Timeout error';
        })
        .finally(() => {
        });
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDRESOLVE_0100
     * @tc.name testNapiDeferredResolve0001
     * @tc.desc Test deferred resolve native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredResolve0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNapiDeferredResolve0001 begin');
      let value = 'resolve-from-js';
      let result = await testNapi.resolvePromiseWithValue(value);
      expect(`${result}`).assertEqual(value);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDREJECT_0100
     * @tc.name testNapiDeferredReject0001
     * @tc.desc Test deferred reject native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredReject0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNapiDeferredReject0001 begin');
      let result = await testNapi.rejectPromiseWithValue(new Error('reject-from-js'))
        .then(() => {
          return false;
        })
        .catch((err: Error) => {
          return err.message === 'reject-from-js';
        });
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTED_0100
     * @tc.name testNapiPromiseNested0001
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNested0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNested0001 begin');
      let chainedPromise = Promise.resolve('native-chain')
        .then((value: string) => {
          return `${value}-then`;
        })
        .finally(() => {
        });
      let result = await testNapi.createChainedPromise(chainedPromise)
        .then((value: Object) => {
          return `${value}` === 'inner value';
        })
        .finally(() => {
        });
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTED_0200
     * @tc.name testNapiPromiseNested0002
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNested0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNested0002 begin');
      let result = await testNapi.createChainedTimeoutPromise()
        .then((value: Object) => {
          return false;
        })
        .catch((err: Object) => {
          return `${err}` === 'Chained timeout error';
        })
        .finally(() => {
        });
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTED_0300
     * @tc.name testNapiPromiseNested0003
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNested0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNested0003 begin');
      let result = await testNapi.testPromiseNestedPromise();
      expect(`${result}`).assertEqual('nested value');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTED_0400
     * @tc.name testNapiPromiseNested0004
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNested0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseNested0004 begin');
      let result = testNapi.testPromiseCallbackNested();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTED_0500
     * @tc.name testNapiPromiseNested0005
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNested0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseNested0005 begin');
      let result = testNapi.testMultiLevelNestedPromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTED_0600
     * @tc.name testNapiPromiseNested0006
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNested0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseNested0006 begin');
      let result = testNapi.testPromiseInAsyncWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTED_0700
     * @tc.name testNapiPromiseNested0007
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNested0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNested0007 begin');
      let result = await testNapi.testRejectInNestedPromise()
        .then(() => {
          return false;
        })
        .catch((err: string) => {
          return `${err}` === 'inner error';
        });
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDRESOLVELOOP_0100
     * @tc.name testNapiDeferredResolveLoop0001
     * @tc.desc Test deferred resolve native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredResolveLoop0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiDeferredResolveLoop0001 begin');
      let result = testNapi.testLoopCreatePromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDRESOLVELOOP_0200
     * @tc.name testNapiDeferredResolveLoop0002
     * @tc.desc Test deferred resolve native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredResolveLoop0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiDeferredResolveLoop0002 begin');
      let result = testNapi.testLoopCreatePromiseAndCheck();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDRESOLVELOOP_0300
     * @tc.name testNapiDeferredResolveLoop0003
     * @tc.desc Test deferred resolve native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredResolveLoop0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiDeferredResolveLoop0003 begin');
      let result = testNapi.testResolveDeferredLoop();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDREJECTLOOP_0100
     * @tc.name testNapiDeferredRejectLoop0001
     * @tc.desc Test deferred reject native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredRejectLoop0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiDeferredRejectLoop0001 begin');
      let result = testNapi.testRejectDeferredLoop();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISESTABILITY_0100
     * @tc.name testNapiPromiseStability0001
     * @tc.desc Test promise stability native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseStability0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseStability0001 begin');
      let result = testNapi.testLargeStringResolve();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISESTABILITY_0200
     * @tc.name testNapiPromiseStability0002
     * @tc.desc Test promise stability native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseStability0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseStability0002 begin');
      let result = testNapi.testComplexObjectResolve();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISEMULTITHREADSAFE_0100
     * @tc.name testNapiPromiseMultiThreadSafe0001
     * @tc.desc Test promise multithread native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseMultiThreadSafe0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseMultiThreadSafe0001 begin');
      let result = testNapi.testLoopThreadSafePromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISENORMAL_0100
     * @tc.name testNapiIsPromiseNormal0001
     * @tc.desc Test promise type checking native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseNormal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseNormal0001 begin');
      let result = testNapi.testIsPromiseNormal();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISENORMAL_0200
     * @tc.name testNapiIsPromiseNormal0002
     * @tc.desc Test promise type checking native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseNormal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseNormal0002 begin');
      let result = testNapi.testIsPromiseWithNumber();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDRESOLVENORMAL_0100
     * @tc.name testNapiDeferredResolveNormal0001
     * @tc.desc Test deferred resolve native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredResolveNormal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiDeferredResolveNormal0001 begin');
      let result = testNapi.testResolveDeferredNormal();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDRESOLVENORMAL_0200
     * @tc.name testNapiDeferredResolveNormal0002
     * @tc.desc Test deferred resolve native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredResolveNormal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiDeferredResolveNormal0002 begin');
      let result = testNapi.testResolveDeferredNullDeferred();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDRESOLVENORMAL_0300
     * @tc.name testNapiDeferredResolveNormal0003
     * @tc.desc Test deferred resolve native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredResolveNormal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiDeferredResolveNormal0003 begin');
      let result = testNapi.testResolveDeferredTwice();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDREJECTNORMAL_0100
     * @tc.name testNapiDeferredRejectNormal0001
     * @tc.desc Test deferred reject native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredRejectNormal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiDeferredRejectNormal0001 begin');
      let result = testNapi.testRejectDeferredNormal();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDREJECTNORMAL_0200
     * @tc.name testNapiDeferredRejectNormal0002
     * @tc.desc Test deferred reject native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredRejectNormal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiDeferredRejectNormal0002 begin');
      let result = testNapi.testRejectDeferredNullDeferred();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDREJECTNORMAL_0300
     * @tc.name testNapiDeferredRejectNormal0003
     * @tc.desc Test deferred reject native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredRejectNormal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiDeferredRejectNormal0003 begin');
      let result = testNapi.testRejectDeferredTwice();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDREJECTNORMAL_0400
     * @tc.name testNapiDeferredRejectNormal0004
     * @tc.desc Test promise stability native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiDeferredRejectNormal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiDeferredRejectNormal0004 begin');
      let result = testNapi.testLargeBufferResolve();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_CIRCULAROBJECTRESOLVE_0100
     * @tc.name testNapiCircularObjectResolve0001
     * @tc.desc Test promise stability native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiCircularObjectResolve0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiCircularObjectResolve0001 begin');
      let result = testNapi.testCircularObjectResolve();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_UNRESOLVEDPROMISESTABILITY_0100
     * @tc.name testNapiUnresolvedPromiseStability0001
     * @tc.desc Test promise stability native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiUnresolvedPromiseStability0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiUnresolvedPromiseStability0001 begin');
      let result = testNapi.testUnresolvedPromisePressure();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISEFULFILL_0100
     * @tc.name testNapiIsPromiseFulFill0001
     * @tc.desc Test promise type checking native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseFulFill0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNapiIsPromiseFulFill0001 begin');
      let result = await testNapi.testIsPromiseWithFulfilled();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISEREJECTED_0100
     * @tc.name testNapiIsPromiseRejected0001
     * @tc.desc Test promise type checking native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseRejected0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseRejected0001 begin');
      let result = testNapi.testIsPromiseWithRejected();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISESTRING_0100
     * @tc.name testNapiIsPromiseString0001
     * @tc.desc Test promise type checking native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseString0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseString0001 begin');
      let result = testNapi.testIsPromiseWithString();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISEOBJECT_0100
     * @tc.name testNapiIsPromiseObject0001
     * @tc.desc Test promise type checking native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseObject0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseObject0001 begin');
      let result = testNapi.testIsPromiseWithObject();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISENULL_0100
     * @tc.name testNapiIsPromiseNull0001
     * @tc.desc Test promise type checking native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseNull0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseNull0001 begin');
      let result = testNapi.testIsPromiseWithNull();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISENULL_0200
     * @tc.name testNapiIsPromiseNull0002
     * @tc.desc Test deferred resolve native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseNull0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseNull0002 begin');
      let result = testNapi.testResolveDeferredNullResolution();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISENULL_0300
     * @tc.name testNapiIsPromiseNull0003
     * @tc.desc Test deferred reject native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseNull0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseNull0003 begin');
      let result = testNapi.testRejectDeferredNullRejection();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISENULL_0400
     * @tc.name testNapiIsPromiseNull0004
     * @tc.desc Test promise type checking native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseNull0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseNull0004 begin');
      let result = testNapi.testIsPromiseNullEnv();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISENULL_0500
     * @tc.name testNapiIsPromiseNull0005
     * @tc.desc Test promise type checking native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseNull0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseNull0005 begin');
      let result = testNapi.testIsPromiseNullValue();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISENULL_0600
     * @tc.name testNapiIsPromiseNull0006
     * @tc.desc Test promise type checking native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseNull0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseNull0006 begin');
      let result = testNapi.testIsPromiseNullResult();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISENULL_0700
     * @tc.name testNapiIsPromiseNull0007
     * @tc.desc Test deferred resolve native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseNull0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseNull0007 begin');
      let result = testNapi.testResolveDeferredNullEnv();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISENULL_0800
     * @tc.name testNapiIsPromiseNull0008
     * @tc.desc Test deferred resolve native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseNull0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseNull0008 begin');
      let result = testNapi.testResolveDeferredNullResolutionArg();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_ISPROMISENULL_0900
     * @tc.name testNapiIsPromiseNull0009
     * @tc.desc Test deferred resolve native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiIsPromiseNull0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiIsPromiseNull0009 begin');
      let result = testNapi.testResolveDeferredDestroyedDeferred();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_REJECTDEFERREDNULL_0100
     * @tc.name testNapiDeferredRejectNull0001
     * @tc.desc Test deferred reject native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredRejectNull0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiDeferredRejectNull0001 begin');
      let result = testNapi.testRejectDeferredNullEnv();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_REJECTDEFERREDNULL_0200
     * @tc.name testNapiDeferredRejectNull0002
     * @tc.desc Test deferred reject native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredRejectNull0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiDeferredRejectNull0002 begin');
      let result = testNapi.testRejectDeferredNullRejectionArg();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_REJECTDEFERREDNULL_0300
     * @tc.name testNapiDeferredRejectNull0003
     * @tc.desc Test deferred reject native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredRejectNull0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiDeferredRejectNull0003 begin');
      let result = testNapi.testRejectDeferredDestroyedDeferred();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDRES_0100
     * @tc.name testNapiPromiseNestedRes0001
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedRes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedRes0001 begin');
      let result = await testNapi.testNestedResolvedPromise();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDRES_0200
     * @tc.name testNapiPromiseNestedRes0002
     * @tc.desc Test promise resolve and reject decision native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedRes0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseNestedRes0002 begin');
      let result = testNapi.testCircularNestedPromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDRES_0300
     * @tc.name testNapiPromiseNestedRes0003
     * @tc.desc Test promise resolve and reject decision native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedRes0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseNestedRes0003 begin');
      let result = testNapi.testTimeoutAlreadyResolved();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDRES_0400
     * @tc.name testNapiPromiseNestedRes0004
     * @tc.desc Test promise resolve and reject decision native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedRes0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseNestedRes0004 begin');
      let result = testNapi.testTimeoutBoundaryValues();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDRES_0500
     * @tc.name testNapiPromiseNestedRes0005
     * @tc.desc Test promise multithread native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedRes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info('testNapiPromiseNestedRes0005 begin');
      let result = testNapi.testConcurrentResolveReject10000();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDRES_0600
     * @tc.name testNapiPromiseNestedRes0006
     * @tc.desc Test promise multithread native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedRes0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedRes0006 begin');
      let result = await testNapi.testThreadSafeLargeBuffer10000();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISEMULTITHREADCREATE_0100
     * @tc.name testNapiPromiseMultiThreadCreate0001
     * @tc.desc Test promise multithread native function returns expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseMultiThreadCreate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseMultiThreadCreate0001 begin');
      let result = await testNapi.testHundredThreadsCreateResolvePromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDTASK_0100
     * @tc.name testNapiPromiseNestedTask0001
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedTask0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedTask0001 begin');
      let result = await testNapi.testPromiseTaskNestAsyncWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDTASK_0200
     * @tc.name testNapiPromiseNestedTask0002
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedTask0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedTask0002 begin');
      let result = await testNapi.testPromiseTaskNestNativePromise();
      expect(result === undefined).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDTASK_0300
     * @tc.name testNapiPromiseNestedTask0003
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedTask0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedTask0003 begin');
      let jsPromise = Promise.resolve('js-promise-task');
      let result = await testNapi.testPromiseTaskNestJsPromise(jsPromise);
      expect(`${result}`).assertEqual('js-promise-task');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDTASK_0400
     * @tc.name testNapiPromiseNestedTask0004
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedTask0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedTask0004 begin');
      let result = await testNapi.testPromiseTaskNestAsyncTask();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDTASK_0500
     * @tc.name testNapiPromiseNestedTask0005
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedTask0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedTask0005 begin');
      let result = await testNapi.testAsyncTaskNestCreateRuntimeTask();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDTASK_0600
     * @tc.name testNapiPromiseNestedTask0006
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedTask0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedTask0006 begin');
      let result = await testNapi.testPromiseCallbackNestAsyncWork();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDTASK_0700
     * @tc.name testNapiPromiseNestedTask0007
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedTask0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedTask0007 begin');
      let result = await testNapi.testPromiseCallbackNestNativePromise();
      expect(result === undefined).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDTASK_0800
     * @tc.name testNapiPromiseNestedTask0008
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedTask0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedTask0008 begin');
      let jsPromise = new Promise<string>((resolve: (value: string) => void) => {
        resolve('js-promise-callback');
      });
      let result = await testNapi.testPromiseCallbackNestJsPromise(jsPromise);
      expect(`${result}`).assertEqual('js-promise-callback');
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDTASK_0900
     * @tc.name testNapiPromiseNestedTask0009
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedTask0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedTask0009 begin');
      let result = await testNapi.testPromiseCallbackNestAsyncTask();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDCALLBACK_0100
     * @tc.name testNapiPromiseNestedCallBack0001
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedCallBack0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedCallBack0001 begin');
      let result = await testNapi.testPromiseCallbackNestMixedAsync();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDOTHER_0100
     * @tc.name testNapiPromiseNestedOther0001
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedOther0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedOther0001 begin');
      let result = await testNapi.testOtherAsyncNestNativePromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISENESTEDOTHER_0200
     * @tc.name testNapiPromiseNestedOther0002
     * @tc.desc Test nested promise and async task native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testNapiPromiseNestedOther0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      console.info('testNapiPromiseNestedOther0002 begin');
      let result = await testNapi.testOtherAsyncCallbackNestPromise();
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_PROMISEJSINTEROP_0100
     * @tc.name testNapiPromiseJsInterop0001
     * @tc.desc Test JavaScript promise interoperation native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiPromiseJsInterop0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNapiPromiseJsInterop0001 begin');
      let promiseA = testNapi.createPromiseAndResolve('native value A');
      let promiseB = testNapi.createPromiseAndResolve('native value B');
      let promiseCombinations: Object[] = [
        Promise.all([promiseA, promiseB]),
        Promise.race([promiseA, promiseB]),
        Promise.any([promiseA, promiseB]),
        Promise.allSettled([promiseA, promiseB])
      ];
      let result = testNapi.testJsPromiseCombinationResolve(promiseCombinations);
      expect(result).assertTrue();
      let settledResults = await Promise.all(promiseCombinations);
      expect(settledResults.length).assertEqual(4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_DEFERREDREJECT_0200
     * @tc.name testNapiDeferredReject0002
     * @tc.desc Test deferred reject native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiDeferredReject0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNapiDeferredReject0002 begin');
      let catchFinallyPromise = Promise.reject(new Error('catch-finally-from-js'))
        .catch((err: Error) => {
          return err.message;
        })
        .finally(() => {
        });
      let result = await testNapi.testJsPromiseCatchFinallyReject(catchFinallyPromise)
        .then(() => {
          return false;
        })
        .catch((err: Object) => {
          return `${err}` === 'reject for catch finally';
        })
        .finally(() => {
        });
      expect(result).assertTrue();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_NAPI_JSISPROMISEVAR_0100
     * @tc.name testNapiJsIsPromiseVar0001
     * @tc.desc Test promise type checking native function returns expected result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNapiJsIsPromiseVar0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      console.info('testNapiJsIsPromiseVar0001 begin');
      let rejectedPromise = Promise.reject(new Error('reject-variant'));
      rejectedPromise.catch(() => {
      });
      let customPromise = new Promise<number>((resolve: (value: number) => void) => {
        resolve(7);
      });
      let promiseVariants: Object[] = [
        Promise.resolve(1),
        rejectedPromise,
        Promise.all([Promise.resolve(1), Promise.resolve(2)]),
        Promise.race([Promise.resolve(1), Promise.resolve(2)]),
        Promise.any([Promise.resolve(1), Promise.resolve(2)]),
        Promise.allSettled([Promise.resolve(1), Promise.resolve(2)]),
        customPromise
      ];
      let nonPromiseVariants: Object[] = [new PromiseThenableVariant(), new PlainObjectVariant()];
      let result = testNapi.testJsIsPromiseVariants(promiseVariants, nonPromiseVariants);
      expect(result).assertTrue();
    })
  })
}
