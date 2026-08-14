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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_GET_HTTP_BODY_STREAM_0001
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_DESTROY_HTTP_BODY_STREAM_0002
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_HTTP_BODY_STREAM_SET_USER_DATA_0003
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_HTTP_BODY_STREAM_SET_READ_CALLBACK_0004
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_HTTP_BODY_STREAM_SET_ASYNC_READ_CALLBACK_0005
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_HTTP_BODY_STREAM_INIT_0006
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_HTTP_BODY_STREAM_READ_0007
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_HTTP_BODY_STREAM_GET_SIZE_0008
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_HTTP_BODY_STREAM_GET_POSITION_0009
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
