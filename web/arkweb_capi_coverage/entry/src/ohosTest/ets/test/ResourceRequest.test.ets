import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

const RESOURCE_TYPE_MAIN_FRAME = 0;
const RESOURCE_TYPE_SUB_FRAME = 1;
const RESOURCE_TYPE_STYLE_SHEET = 2;
const RESOURCE_TYPE_SCRIPT = 3;
const RESOURCE_TYPE_IMAGE = 4;
const RESOURCE_TYPE_FONT_RESOURCE = 5;
const RESOURCE_TYPE_SUB_RESOURCE = 6;
const RESOURCE_TYPE_OBJECT = 7;
const RESOURCE_TYPE_MEDIA = 8;
const RESOURCE_TYPE_WORKER = 9;
const RESOURCE_TYPE_SHARED_WORKER = 10;
const RESOURCE_TYPE_PREFETCH = 11;
const RESOURCE_TYPE_FAVICON = 12;
const RESOURCE_TYPE_XHR = 13;
const RESOURCE_TYPE_PING = 14;
const RESOURCE_TYPE_SERVICE_WORKER = 15;
const RESOURCE_TYPE_CSP_REPORT = 16;
const RESOURCE_TYPE_PLUGIN_RESOURCE = 17;
const RESOURCE_TYPE_NAVIGATION_PRELOAD_MAIN_FRAME = 18;
const RESOURCE_TYPE_NAVIGATION_PRELOAD_SUB_FRAME = 19;

export default function resource_requestTest() {
  describe('resource_requestTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestArkWebResourceRequest_SetUserData
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_SET_USER_DATA_0500
     * @tc.desc Test OH_ArkWebResourceRequest_SetUserData
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_SetUserData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_SetUserData()).assertEqual(17100100);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetMethod
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_GET_METHOD_0600
     * @tc.desc Test OH_ArkWebResourceRequest_GetMethod
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetMethod()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetUrl
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_GET_URL_0700
     * @tc.desc Test OH_ArkWebResourceRequest_GetUrl
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetUrl()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_GET_RESOURCE_TYPE_0800
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType (nullptr returns -1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceType()).assertEqual(-1);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceTypeEnumCoverage
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_ENUM_0900
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType all enum coverage
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceTypeEnumCoverage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeEnumCoverage()).assertEqual(20);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_MAIN_FRAME
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_MAIN_FRAME_1000
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType MAIN_FRAME
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_MAIN_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(0)).assertEqual(RESOURCE_TYPE_MAIN_FRAME);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_SUB_FRAME
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_SUB_FRAME_1100
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType SUB_FRAME
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_SUB_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(1)).assertEqual(RESOURCE_TYPE_SUB_FRAME);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_STYLE_SHEET
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_STYLE_SHEET_1200
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType STYLE_SHEET
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_STYLE_SHEET', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(2)).assertEqual(RESOURCE_TYPE_STYLE_SHEET);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_SCRIPT
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_SCRIPT_1300
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType SCRIPT
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_SCRIPT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(3)).assertEqual(RESOURCE_TYPE_SCRIPT);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_IMAGE
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_IMAGE_1400
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType IMAGE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_IMAGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(4)).assertEqual(RESOURCE_TYPE_IMAGE);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_FONT_RESOURCE
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_FONT_RESOURCE_1500
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType FONT_RESOURCE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_FONT_RESOURCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(5)).assertEqual(RESOURCE_TYPE_FONT_RESOURCE);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_SUB_RESOURCE
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_SUB_RESOURCE_1600
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType SUB_RESOURCE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_SUB_RESOURCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(6)).assertEqual(RESOURCE_TYPE_SUB_RESOURCE);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_OBJECT
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_OBJECT_1700
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType OBJECT
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_OBJECT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(7)).assertEqual(RESOURCE_TYPE_OBJECT);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_MEDIA
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_MEDIA_1800
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType MEDIA
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_MEDIA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(8)).assertEqual(RESOURCE_TYPE_MEDIA);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_WORKER
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_WORKER_1900
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType WORKER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(9)).assertEqual(RESOURCE_TYPE_WORKER);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_SHARED_WORKER
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_SHARED_WORKER_2000
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType SHARED_WORKER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_SHARED_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(10)).assertEqual(RESOURCE_TYPE_SHARED_WORKER);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_PREFETCH
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_PREFETCH_2100
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType PREFETCH
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_PREFETCH', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(11)).assertEqual(RESOURCE_TYPE_PREFETCH);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_FAVICON
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_FAVICON_2200
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType FAVICON
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_FAVICON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(12)).assertEqual(RESOURCE_TYPE_FAVICON);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_XHR
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_XHR_2300
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType XHR
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_XHR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(13)).assertEqual(RESOURCE_TYPE_XHR);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_PING
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_PING_2400
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType PING
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_PING', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(14)).assertEqual(RESOURCE_TYPE_PING);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_SERVICE_WORKER
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_SERVICE_WORKER_2500
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType SERVICE_WORKER
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_SERVICE_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(15)).assertEqual(RESOURCE_TYPE_SERVICE_WORKER);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_CSP_REPORT
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_CSP_REPORT_2600
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType CSP_REPORT
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_CSP_REPORT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(16)).assertEqual(RESOURCE_TYPE_CSP_REPORT);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_PLUGIN_RESOURCE
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_PLUGIN_RESOURCE_2700
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType PLUGIN_RESOURCE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_PLUGIN_RESOURCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(17)).assertEqual(RESOURCE_TYPE_PLUGIN_RESOURCE);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_NAVIGATION_PRELOAD_MAIN_FRAME
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_NAV_PRELOAD_MAIN_2800
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType NAVIGATION_PRELOAD_MAIN_FRAME
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_NAVIGATION_PRELOAD_MAIN_FRAME',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(18))
          .assertEqual(RESOURCE_TYPE_NAVIGATION_PRELOAD_MAIN_FRAME);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType_NAVIGATION_PRELOAD_SUB_FRAME
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_GET_RESOURCE_TYPE_NAV_PRELOAD_SUB_2900
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType NAVIGATION_PRELOAD_SUB_FRAME
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType_NAVIGATION_PRELOAD_SUB_FRAME',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceTypeByEnum(19))
          .assertEqual(RESOURCE_TYPE_NAVIGATION_PRELOAD_SUB_FRAME);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetFrameUrl
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_GET_FRAME_URL_3000
     * @tc.desc Test OH_ArkWebResourceRequest_GetFrameUrl
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetFrameUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetFrameUrl()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_Destroy
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_DESTROY_3100
     * @tc.desc Test OH_ArkWebResourceRequest_Destroy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_Destroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_Destroy()).assertEqual(17100100);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetReferrer
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_GET_REFERRER_3200
     * @tc.desc Test OH_ArkWebResourceRequest_GetReferrer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetReferrer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetReferrer()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetRequestHeaders
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_GET_REQUEST_HEADERS_3300
     * @tc.desc Test OH_ArkWebResourceRequest_GetRequestHeaders
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetRequestHeaders', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetRequestHeaders()).assertEqual(0);
        done();
      });

  });
}
