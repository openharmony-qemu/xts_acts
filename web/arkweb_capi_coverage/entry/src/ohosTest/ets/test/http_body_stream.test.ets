import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function http_body_streamTest() {
  describe('http_body_streamTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestArkWebResourceRequest_GetHttpBodyStream
     * @tc.number SUB_ARkWEB_CAPI_TestArkWebResourceRequest_GetHttpBodyStream
     * @tc.desc Test OH_ArkWebResourceRequest_GetHttpBodyStream
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetHttpBodyStream', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetHttpBodyStream()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_DestroyHttpBodyStream
     * @tc.number SUB_ARkWEB_CAPI_TestArkWebResourceRequest_DestroyHttpBodyStream
     * @tc.desc Test OH_ArkWebResourceRequest_DestroyHttpBodyStream
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_DestroyHttpBodyStream', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_DestroyHttpBodyStream()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebHttpBodyStream_SetUserData
     * @tc.number SUB_ARkWEB_CAPI_TestArkWebHttpBodyStream_SetUserData
     * @tc.desc Test OH_ArkWebHttpBodyStream_SetUserData
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebHttpBodyStream_SetUserData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebHttpBodyStream_SetUserData()).assertEqual(17100100);
        done();
      });

    /**
     * @tc.name TestArkWebHttpBodyStream_SetReadCallback
     * @tc.number SUB_ARkWEB_CAPI_TestArkWebHttpBodyStream_SetReadCallback
     * @tc.desc Test OH_ArkWebHttpBodyStream_SetReadCallback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebHttpBodyStream_SetReadCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebHttpBodyStream_SetReadCallback()).assertEqual(17100100);
        done();
      });

    /**
     * @tc.name TestArkWebHttpBodyStream_SetAsyncReadCallback
     * @tc.number SUB_ARkWEB_CAPI_TestArkWebHttpBodyStream_SetAsyncReadCallback
     * @tc.desc Test OH_ArkWebHttpBodyStream_SetAsyncReadCallback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebHttpBodyStream_SetAsyncReadCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebHttpBodyStream_SetAsyncReadCallback()).assertEqual(17100100);
        done();
      });

    /**
     * @tc.name TestArkWebHttpBodyStream_Init
     * @tc.number SUB_ARkWEB_CAPI_TestArkWebHttpBodyStream_Init
     * @tc.desc Test OH_ArkWebHttpBodyStream_Init
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebHttpBodyStream_Init', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebHttpBodyStream_Init()).assertEqual(17100100);
        done();
      });

    /**
     * @tc.name TestArkWebHttpBodyStream_Read
     * @tc.number SUB_ARkWEB_CAPI_TestArkWebHttpBodyStream_Read
     * @tc.desc Test OH_ArkWebHttpBodyStream_Read
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebHttpBodyStream_Read', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebHttpBodyStream_Read()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebHttpBodyStream_GetSize
     * @tc.number SUB_ARkWEB_CAPI_TestArkWebHttpBodyStream_GetSize
     * @tc.desc Test OH_ArkWebHttpBodyStream_GetSize
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebHttpBodyStream_GetSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebHttpBodyStream_GetSize()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebHttpBodyStream_GetPosition
     * @tc.number SUB_ARkWEB_CAPI_TestArkWebHttpBodyStream_GetPosition
     * @tc.desc Test OH_ArkWebHttpBodyStream_GetPosition
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebHttpBodyStream_GetPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebHttpBodyStream_GetPosition()).assertEqual(0);
        done();
      });

  });
}
