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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import NetConnectionAuthTest from 'libnetconnectionauthtest.so'

const OH_HTTP_RESULT_OK = 0;
const OH_HTTP_OK = 0;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const CASE_INDEX_7 = 7;
const CASE_INDEX_8 = 8;
const CASE_INDEX_9 = 9;
const CASE_INDEX_10 = 10;
const CASE_INDEX_11 = 11;
const CASE_INDEX_12 = 12;
const CASE_INDEX_13 = 13;
const CASE_INDEX_14 = 14;

const WEBSOCKET_CONNECTION_ERROR = 1003
const WEBSOCKET_CONNECTION_PARSE_URL_ERROR = 1005
const WEBSOCKET_CONNECTION_NO_MEMORY = 1006
const WEBSOCKET_CONNECTION_CLOSED_BY_PEER = 1007
const WEBSOCKET_DESTROYED = 1008
const WEBSOCKET_PROTOCOL_ERROR = 1009
const WEBSOCKET_SEND_NO_MEMORY = 1010

const WEBSOCKET_DATA_LENGTH_EXCEEDED = 1012
const WEBSOCKET_QUEUE_LENGTH_EXCEEDED = 1013
const WEBSOCKET_NO_CLIENT_CONTEXT = 1014
const WEBSOCKET_NO_HEADER_CONTEXT = 1015

const WEBSOCKET_HEADER_EXCEEDED = 1016;
const WEBSOCKET_NO_CONNECTION = 1017;
const WEBSOCKET_NO_CONNECTION_CONTEXT = 1018;

const OH_HTTP_UNSUPPORTED_PROTOCOL = 2300001;
const OH_HTTP_INVALID_URL = 2300003;
const OH_HTTP_RESOLVE_PROXY_FAILED = 2300005;
const OH_HTTP_RESOLVE_HOST_FAILED = 2300006;
const OH_HTTP_CONNECT_SERVER_FAILED = 2300007;
const OH_HTTP_INVALID_SERVER_RESPONSE = 2300008;
const OH_HTTP_ACCESS_REMOTE_DENIED = 2300009;
const OH_HTTP_HTTP2_FRAMING_ERROR = 2300016;
const OH_HTTP_TRANSFER_PARTIAL_FILE = 2300018;
const OH_HTTP_WRITE_DATA_FAILED = 2300023;
const OH_HTTP_UPLOAD_FAILED = 2300025;
const OH_HTTP_OPEN_LOCAL_DATA_FAILED = 2300026;
const OH_HTTP_OUT_OF_MEMORY = 2300027;
const OH_HTTP_OPERATION_TIMEOUT = 2300028;
const OH_HTTP_FILE_TOO_LARGE = 2300063;
const OH_HTTP_REMOTE_DISK_FULL = 2300070;
const OH_HTTP_REMOTE_FILE_EXISTS = 2300073;
const OH_HTTP_REMOTE_FILE_NOT_FOUND = 2300078;
const OH_HTTP_REQUEST_INTERCEPTED = 2300996;
const OH_HTTP_PARAMETER_ERROR = 401;
const OH_HTTP_PERMISSION_DENIED = 201;

const OH_HTTP_CREATED = 201;
const OH_HTTP_ACCEPTED = 202;
const OH_HTTP_NOT_AUTHORITATIVE = 203;
const OH_HTTP_NO_CONTENT = 204;
const OH_HTTP_RESET = 205;
const OH_HTTP_PARTIAL = 206;
const OH_HTTP_MULT_CHOICE = 300;
const OH_HTTP_MOVED_PERM = 301;
const OH_HTTP_MOVED_TEMP = 302;
const OH_HTTP_SEE_OTHER = 303;
const OH_HTTP_NOT_MODIFIED = 304;
const OH_HTTP_USE_PROXY = 305;
const OH_HTTP_BAD_REQUEST = 400;
const OH_HTTP_UNAUTHORIZED = 401;
const OH_HTTP_PAYMENT_REQUIRED = 402;
const OH_HTTP_FORBIDDEN = 403;
const OH_HTTP_NOT_FOUND = 404;
const OH_HTTP_BAD_METHOD = 405;
const OH_HTTP_NOT_ACCEPTABLE = 406;
const OH_HTTP_PROXY_AUTH = 407;
const OH_HTTP_CLIENT_TIMEOUT = 408;
const OH_HTTP_CONFLICT = 409;
const OH_HTTP_GONE = 410;
const OH_HTTP_LENGTH_REQUIRED = 411;
const OH_HTTP_PRECON_FAILED = 412;
const OH_HTTP_ENTITY_TOO_LARGE = 413;
const OH_HTTP_REQ_TOO_LONG = 414;
const OH_HTTP_UNSUPPORTED_TYPE = 415;
const OH_HTTP_RANGE_NOT_SATISFIABLE = 416;
const OH_HTTP_INTERNAL_ERROR = 500;
const OH_HTTP_NOT_IMPLEMENTED = 501;
const OH_HTTP_BAD_GATEWAY = 502;
const OH_HTTP_UNAVAILABLE = 503;
const OH_HTTP_GATEWAY_TIMEOUT = 504;
const OH_HTTP_VERSION = 505;



export default function ActsNetConnectionAuth() {
  describe('ActsNetConnectionAuth', () => {
    /**
     * @tc.name   testNetworkManagerHttpRequestAuth0900
     * @tc.number SUB_NetworkManager_Http_Request_Auth_0900
     * @tc.desc   test Http_Request error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth0900';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_CREATED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_CREATED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth1000
     * @tc.number SUB_NetworkManager_Http_Request_Auth_1000
     * @tc.desc   test Http_Request error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1000';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_ACCEPTED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_ACCEPTED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth1100
     * @tc.number SUB_NetworkManager_Http_Request_Auth_1100
     * @tc.desc   test Http_Request error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_NOT_AUTHORITATIVE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_NOT_AUTHORITATIVE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth1200
     * @tc.number SUB_NetworkManager_Http_Request_Auth_1200
     * @tc.desc   test Http_Request error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_NO_CONTENT, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_NO_CONTENT);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth1300
     * @tc.number SUB_NetworkManager_Http_Request_Auth_1300
     * @tc.desc   test Http_Request error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_RESET, "http://www.baidu.com");

        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_RESET);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth1400
     * @tc.number SUB_NetworkManager_Http_Request_Auth_1400
     * @tc.desc   test Http_Request error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1400';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_PARTIAL, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PARTIAL);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth1500
     * @tc.number SUB_NetworkManager_Http_Request_Auth_1500
     * @tc.desc   test Http_Request error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1500';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_MULT_CHOICE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_MULT_CHOICE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth1600
     * @tc.number SUB_NetworkManager_Http_Request_Auth_1600
     * @tc.desc   test Http_Request error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1600';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_MOVED_PERM, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_MOVED_PERM);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth1700
     * @tc.number SUB_NetworkManager_Http_Request_Auth_1700
     * @tc.desc   test Http_Request error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1700';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_MOVED_TEMP, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_MOVED_TEMP);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth1800
     * @tc.number SUB_NetworkManager_Http_Request_Auth_1800
     * @tc.desc   test Http_Request error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1800';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_SEE_OTHER, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_SEE_OTHER);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })


    /**
     * @tc.name   testNetworkManagerHttpRequestAuth1900
     * @tc.number testNetworkManagerHttpRequestAuth1900
     * @tc.desc   testNetworkManagerHttpRequestAuth1900
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth1900';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_NOT_MODIFIED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_NOT_MODIFIED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth2000
     * @tc.number SUB_NetworkManager_Http_Request_Auth_2000
     * @tc.desc   test Http_Request error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2000';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_USE_PROXY, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_USE_PROXY);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })



      /**
       * @tc.name   testNetworkManagerHttpRequestAuth2100
       * @tc.number SUB_NetworkManager_Http_Request_Auth_2100
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_BAD_REQUEST, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_BAD_REQUEST);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth2200
       * @tc.number SUB_NetworkManager_Http_Request_Auth_2200
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_UNAUTHORIZED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_UNAUTHORIZED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth2300
       * @tc.number SUB_NetworkManager_Http_Request_Auth_2300
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_PAYMENT_REQUIRED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PAYMENT_REQUIRED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth2400
       * @tc.number SUB_NetworkManager_Http_Request_Auth_2400
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2400';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_FORBIDDEN, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_FORBIDDEN);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })


      /**
       * @tc.name   testNetworkManagerHttpRequestAuth2500
       * @tc.number SUB_NetworkManager_Http_Request_Auth_2500
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2500';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_NOT_FOUND, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_NOT_FOUND);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth2600
       * @tc.number SUB_NetworkManager_Http_Request_Auth_2600
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2600';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_BAD_METHOD, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_BAD_METHOD);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth2700
       * @tc.number SUB_NetworkManager_Http_Request_Auth_2700
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2700';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_NOT_ACCEPTABLE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_NOT_ACCEPTABLE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth2800
       * @tc.number SUB_NetworkManager_Http_Request_Auth_2800
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2800';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_PROXY_AUTH, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PROXY_AUTH);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth2900
       * @tc.number SUB_NetworkManager_Http_Request_Auth_2900
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth2900';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_CLIENT_TIMEOUT, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_CLIENT_TIMEOUT);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth3000
       * @tc.number SUB_NetworkManager_Http_Request_Auth_3000
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3000';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_CONFLICT, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_CONFLICT);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })
  
      /**
       * @tc.name   testNetworkManagerHttpRequestAuth3100
       * @tc.number SUB_NetworkManager_Http_Request_Auth_3100
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_GONE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_GONE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth3200
       * @tc.number SUB_NetworkManager_Http_Request_Auth_3200
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_LENGTH_REQUIRED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_LENGTH_REQUIRED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth3300
       * @tc.number SUB_NetworkManager_Http_Request_Auth_3300
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_PRECON_FAILED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_PRECON_FAILED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth3400
       * @tc.number SUB_NetworkManager_Http_Request_Auth_3400
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3400';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_ENTITY_TOO_LARGE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_ENTITY_TOO_LARGE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth3500
       * @tc.number SUB_NetworkManager_Http_Request_Auth_3500
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3500';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_REQ_TOO_LONG, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_REQ_TOO_LONG);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth3600
       * @tc.number SUB_NetworkManager_Http_Request_Auth_3600
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3600';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_UNSUPPORTED_TYPE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_UNSUPPORTED_TYPE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth3700
       * @tc.number SUB_NetworkManager_Http_Request_Auth_3700
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3700';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_RANGE_NOT_SATISFIABLE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_RANGE_NOT_SATISFIABLE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth3800
       * @tc.number SUB_NetworkManager_Http_Request_Auth_3800
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3800';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_INTERNAL_ERROR, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_INTERNAL_ERROR);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth3900
       * @tc.number SUB_NetworkManager_Http_Request_Auth_3900
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth3900';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_NOT_IMPLEMENTED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_NOT_IMPLEMENTED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth4000
       * @tc.number SUB_NetworkManager_Http_Request_Auth_4000
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4000';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_BAD_GATEWAY, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_BAD_GATEWAY);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth4100
       * @tc.number SUB_NetworkManager_Http_Request_Auth_4100
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_UNAVAILABLE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_UNAVAILABLE);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth4200
       * @tc.number SUB_NetworkManager_Http_Request_Auth_4200
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_GATEWAY_TIMEOUT, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_GATEWAY_TIMEOUT);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

      /**
       * @tc.name   testNetworkManagerHttpRequestAuth4300
       * @tc.number SUB_NetworkManager_Http_Request_Auth_4300
       * @tc.desc   test Http_Request error code
       * @tc.type   FUNCTION
       * @tc.size   SMALLTEST
       * @tc.level  LEVEL2
       */
      it('testNetworkManagerHttpRequestAuth4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_VERSION, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_VERSION);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth4400
     * @tc.number SUB_NetworkManager_Http_Request_Auth_4400
     * @tc.desc   test Http_Request error code OH_HTTP_CONNECT_SERVER_FAILED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4400';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_CONNECT_SERVER_FAILED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_CONNECT_SERVER_FAILED || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth4500
     * @tc.number SUB_NetworkManager_Http_Request_Auth_4500
     * @tc.desc   test Http_Request error code OH_HTTP_FILE_TOO_LARGE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4500';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_FILE_TOO_LARGE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_FILE_TOO_LARGE || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth4600
     * @tc.number SUB_NetworkManager_Http_Request_Auth_4600
     * @tc.desc   test Http_Request error code OH_HTTP_OPEN_LOCAL_DATA_FAILED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4600';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_OPEN_LOCAL_DATA_FAILED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_OPEN_LOCAL_DATA_FAILED || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth4700
     * @tc.number SUB_NetworkManager_Http_Request_Auth_4700
     * @tc.desc   test Http_Request error code OH_HTTP_OPERATION_TIMEOUT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4700';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_OPERATION_TIMEOUT, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_OPERATION_TIMEOUT || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth4800
     * @tc.number SUB_NetworkManager_Http_Request_Auth_4800
     * @tc.desc   test Http_Request error code OH_HTTP_OUT_OF_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4800';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_OUT_OF_MEMORY, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_OUT_OF_MEMORY || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth4900
     * @tc.number SUB_NetworkManager_Http_Request_Auth_4900
     * @tc.desc   test Http_Request error code OH_HTTP_PARAMETER_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth4900';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_PARAMETER_ERROR, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_PARAMETER_ERROR || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth5000
     * @tc.number SUB_NetworkManager_Http_Request_Auth_5000
     * @tc.desc   test Http_Request error code OH_HTTP_PERMISSION_DENIED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth5000';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_PERMISSION_DENIED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_PERMISSION_DENIED || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth5100
     * @tc.number SUB_NetworkManager_Http_Request_Auth_5100
     * @tc.desc   test Http_Request error code OH_HTTP_REMOTE_DISK_FULL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth5100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_REMOTE_DISK_FULL, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_REMOTE_DISK_FULL || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth5200
     * @tc.number SUB_NetworkManager_Http_Request_Auth_5200
     * @tc.desc   test Http_Request error code OH_HTTP_REMOTE_FILE_EXISTS
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth5200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_REMOTE_FILE_EXISTS, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_REMOTE_FILE_EXISTS || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth5300
     * @tc.number SUB_NetworkManager_Http_Request_Auth_5300
     * @tc.desc   test Http_Request error code OH_HTTP_REMOTE_FILE_NOT_FOUND
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth5300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_REMOTE_FILE_NOT_FOUND, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_REMOTE_FILE_NOT_FOUND || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth5400
     * @tc.number SUB_NetworkManager_Http_Request_Auth_5400
     * @tc.desc   test Http_Request error code OH_HTTP_REQUEST_INTERCEPTED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth5400';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_REQUEST_INTERCEPTED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_REQUEST_INTERCEPTED || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth5500
     * @tc.number SUB_NetworkManager_Http_Request_Auth_5500
     * @tc.desc   test Http_Request error code OH_HTTP_RESOLVE_HOST_FAILED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth5500';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_RESOLVE_HOST_FAILED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_RESOLVE_HOST_FAILED || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth5600
     * @tc.number SUB_NetworkManager_Http_Request_Auth_5600
     * @tc.desc   test Http_Request error code OH_HTTP_RESOLVE_PROXY_FAILED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth5600';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_RESOLVE_PROXY_FAILED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_RESOLVE_PROXY_FAILED || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth5700
     * @tc.number SUB_NetworkManager_Http_Request_Auth_5700
     * @tc.desc   test Http_Request error code OH_HTTP_RESULT_OK
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth5700';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_RESULT_OK, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_RESULT_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth5800
     * @tc.number SUB_NetworkManager_Http_Request_Auth_5800
     * @tc.desc   test Http_Request error code OH_HTTP_UPLOAD_FAILED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth5800';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_UPLOAD_FAILED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_UPLOAD_FAILED || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth5900
     * @tc.number SUB_NetworkManager_Http_Request_Auth_5900
     * @tc.desc   test Http_Request error code OH_HTTP_UNSUPPORTED_PROTOCOL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth5900';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_UNSUPPORTED_PROTOCOL, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_UNSUPPORTED_PROTOCOL || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth6000
     * @tc.number SUB_NetworkManager_Http_Request_Auth_6000
     * @tc.desc   test Http_Request error code OH_HTTP_INVALID_URL
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth6000';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_INVALID_URL, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_INVALID_URL || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth6100
     * @tc.number SUB_NetworkManager_Http_Request_Auth_6100
     * @tc.desc   test Http_Request error code OH_HTTP_INVALID_SERVER_RESPONSE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth6100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_INVALID_SERVER_RESPONSE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_INVALID_SERVER_RESPONSE || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth6200
     * @tc.number SUB_NetworkManager_Http_Request_Auth_6200
     * @tc.desc   test Http_Request error code OH_HTTP_ACCESS_REMOTE_DENIED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth6200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_ACCESS_REMOTE_DENIED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_ACCESS_REMOTE_DENIED || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth6300
     * @tc.number SUB_NetworkManager_Http_Request_Auth_6300
     * @tc.desc   test Http_Request error code OH_HTTP_HTTP2_FRAMING_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth6300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_HTTP2_FRAMING_ERROR, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_HTTP2_FRAMING_ERROR || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth6400
     * @tc.number SUB_NetworkManager_Http_Request_Auth_6400
     * @tc.desc   test Http_Request error code OH_HTTP_TRANSFER_PARTIAL_FILE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth6400';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_TRANSFER_PARTIAL_FILE, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_TRANSFER_PARTIAL_FILE || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth6500
     * @tc.number SUB_NetworkManager_Http_Request_Auth_6500
     * @tc.desc   test Http_Request error code OH_HTTP_WRITE_DATA_FAILED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth6500';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_WRITE_DATA_FAILED, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === OH_HTTP_WRITE_DATA_FAILED || result === OH_HTTP_RESULT_OK).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerHttpRequestAuth6600
     * @tc.number SUB_NetworkManager_Http_Request_Auth_6600
     * @tc.desc   test Http_Request error code OH_HTTP_OK
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerHttpRequestAuth6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerHttpRequestAuth6600';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Http_RequestRequest(OH_HTTP_OK, "http://www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(OH_HTTP_OK);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerWebSocket0100
     * @tc.number SUB_NetworkManager_Web_Socket_0100
     * @tc.desc   test Web_Socket error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_1, "www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(WEBSOCKET_NO_CONNECTION);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerWebSocket0200
     * @tc.number SUB_NetworkManager_Web_Socket_0200
     * @tc.desc   test Web_Socket error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_2, "www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(WEBSOCKET_NO_CONNECTION_CONTEXT);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerWebSocket0300
     * @tc.number SUB_NetworkManager_Web_Socket_0300
     * @tc.desc   test Web_Socket error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_3, "www.baidu.com");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result).assertEqual(WEBSOCKET_HEADER_EXCEEDED);
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
      })

    /**
     * @tc.name   testNetworkManagerWebSocket0400
     * @tc.number SUB_NetworkManager_Web_Socket_0400
     * @tc.desc   test Web_Socket error code WEBSOCKET_CONNECTION_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0400';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_4, "wss://whale.tooly.top/ws");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === WEBSOCKET_CONNECTION_ERROR || result === 0).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerWebSocket0500
     * @tc.number SUB_NetworkManager_Web_Socket_0500
     * @tc.desc   test Web_Socket error code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0500';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_5, "wss://whale.tooly.top/ws");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === WEBSOCKET_DATA_LENGTH_EXCEEDED || result === 0).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerWebSocket0600
     * @tc.number SUB_NetworkManager_Web_Socket_0600
     * @tc.desc   test Web_Socket error code WEBSOCKET_CONNECTION_PARSE_URL_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0600';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_6, "wss://whale.tooly.top/ws");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === WEBSOCKET_CONNECTION_PARSE_URL_ERROR || result === 0).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerWebSocket0700
     * @tc.number SUB_NetworkManager_Web_Socket_0700
     * @tc.desc   test Web_Socket error code WEBSOCKET_CONNECTION_NO_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0700';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_7, "wss://whale.tooly.top/ws");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === WEBSOCKET_CONNECTION_NO_MEMORY || result === 0).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerWebSocket0800
     * @tc.number SUB_NetworkManager_Web_Socket_0800
     * @tc.desc   test Web_Socket error code WEBSOCKET_CONNECTION_CLOSED_BY_PEER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0800';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_8, "wss://whale.tooly.top/ws");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === WEBSOCKET_CONNECTION_CLOSED_BY_PEER || result === 0).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerWebSocket0900
     * @tc.number SUB_NetworkManager_Web_Socket_0900
     * @tc.desc   test Web_Socket error code WEBSOCKET_DESTROYED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket0900';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_9, "wss://whale.tooly.top/ws");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === WEBSOCKET_DESTROYED || result === 0).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerWebSocket1000
     * @tc.number SUB_NetworkManager_Web_Socket_1000
     * @tc.desc   test Web_Socket error code WEBSOCKET_PROTOCOL_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket1000';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_10, "wss://whale.tooly.top/ws");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === WEBSOCKET_PROTOCOL_ERROR || result === 0).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerWebSocket1100
     * @tc.number SUB_NetworkManager_Web_Socket_1100
     * @tc.desc   test Web_Socket error code WEBSOCKET_SEND_NO_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket1100';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_11, "wss://whale.tooly.top/ws");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === WEBSOCKET_SEND_NO_MEMORY || result === 0).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerWebSocket1200
     * @tc.number SUB_NetworkManager_Web_Socket_1200
     * @tc.desc   test Web_Socket error code WEBSOCKET_QUEUE_LENGTH_EXCEEDED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket1200';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_12, "wss://whale.tooly.top/ws");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === WEBSOCKET_QUEUE_LENGTH_EXCEEDED || result === 0).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerWebSocket1300
     * @tc.number SUB_NetworkManager_Web_Socket_1300
     * @tc.desc   test Web_Socket error code WEBSOCKET_NO_CLIENT_CONTEXT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket1300';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_13, "wss://whale.tooly.top/ws");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === WEBSOCKET_NO_CLIENT_CONTEXT || result === 0).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })

    /**
     * @tc.name   testNetworkManagerWebSocket1400
     * @tc.number SUB_NetworkManager_Web_Socket_1400
     * @tc.desc   test Web_Socket error code WEBSOCKET_NO_HEADER_CONTEXT
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkManagerWebSocket1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testNetworkManagerWebSocket1400';
      try {
        console.info(`${caseName} ---start`);
        let result : number = NetConnectionAuthTest.Web_Socket(CASE_INDEX_14, "wss://whale.tooly.top/ws");
        console.info(`${caseName} result is: ` + JSON.stringify(result));
        expect(result === WEBSOCKET_NO_HEADER_CONTEXT || result === 0).assertTrue();
        done();
      } catch (err) {
        console.error(`${caseName} catch err: ` + JSON.stringify(err));
        expect(false).assertEqual(true);
      }
    })
  })
}
