/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import wsAPI from 'libtestNetStackNdk.so'

const WEBSOCKET_OK = 0;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 4;
const CASE_INDEX_6 = 6;
const CASE_INDEX_7 = 7;
const CASE_INDEX_8 = 8;
const CASE_INDEX_9 = 9;
const CASE_INDEX_10 = 10;
const CASE_INDEX_11 = 11;
// 未指定的错误。
const ERROR_CODE_69 = 69;
// 未指定的错误。
const ERROR_CODE_2305001 = 2305001;
const ERROR_CODE_2305069 = 2305069;
// 其他错误码
const ERROR_CODE_2305002 = 2305002;
const ERROR_CODE_2305004 = 2305004;
const ERROR_CODE_2305006 = 2305006;
const ERROR_CODE_2305007 = 2305007;
const ERROR_CODE_2305009 = 2305009;
const ERROR_CODE_2305010 = 2305010;
const ERROR_CODE_2305024 = 2305024;
const ERROR_CODE_2305027 = 2305027;
const ERROR_CODE_2305062 = 2305062;

// websocket客户端为null。
const ERROR_CODE_1001 = 1001;
// 内存不足，无法在安装websocket连接期间创建上下文。
const ERROR_CODE_1006 = 1006;
// websocket客户端发送的数据为null。
const ERROR_CODE_1011 = 1011;
// websocket客户端发送的数据长度超过了限制。
const ERROR_CODE_1012 = 1012;
// 未连接websocket客户端。
const ERROR_CODE_1017 = 1017;
// websocket客户端没有连接上下文。
const ERROR_CODE_1018 = 1018;
// 参数错误。
const ERROR_CODE_401 = 401;

let pemPath : string = '';
let derPath : string = '';

function getRawFileContentWrapper(filePath: string) : Promise<Uint8Array> {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return new Promise<Uint8Array>((resolve, reject) => {
    context.resourceManager.getRawFileContent(filePath, (error, model_buffer) => {
      if (error) {
        reject(error);
      } else {
        resolve(model_buffer);
      }
    });
  });
}

async function writeFile() {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  pemPath = context.filesDir + '/cacert.pem';
  try {
    const model_buffer = await getRawFileContentWrapper('cacert.pem');
    let file = fs.openSync(pemPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.writeSync(file.fd, model_buffer.buffer);
    fs.closeSync(file);
    console.log(`[rawfile_copy_to_sandbox] ${pemPath} is copy success`);
  } catch (error) {
    console.log(`[rawfile_copy_to_sandbox] ${pemPath} is copy failed:${error.code}, message: ${error.message}.`);
  }

  derPath = context.filesDir + '/der_cacert.der';
  try {
    const model_buffer = await getRawFileContentWrapper('der_cacert.der');
    let file = fs.openSync(derPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.writeSync(file.fd, model_buffer.buffer);
    fs.closeSync(file);
    console.log(`[rawfile_copy_to_sandbox] ${derPath} is copy success`);
  } catch (error) {
    console.log(`[rawfile_copy_to_sandbox] ${derPath} is copy failed:${error.code}, message: ${error.message}.`);
  }

}

export default function NetStackNDKTest() {

  describe('NetStackNDKWebSocketClientTest', () => {

    beforeAll(async (done: Function) => {
      await writeFile();
      done();
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   testOHNetStackCertVerification_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0100
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackCertVerification_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_1, pemPath, derPath);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHNetStackCertVerification_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0200
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCertVerification_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_2, pemPath, derPath);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHNetStackCertVerification_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0300
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackCertVerification_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_3, pemPath, derPath);
      expect(result).assertEqual(ERROR_CODE_69);
    });

    /**
     * @tc.name   testOHNetStackCertVerification_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0400
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackCertVerification_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_4, pemPath, derPath);
      expect(result).assertEqual(ERROR_CODE_69);
    });

    /**
     * @tc.name   testOHNetStackCertVerification_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0500
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackCertVerification_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_5, pemPath, derPath);
      expect(result).assertEqual(ERROR_CODE_69);
    });

    /**
     * @tc.name   testOHNetStackCertVerification_0600
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0600
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackCertVerification_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_6, pemPath, derPath);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHNetStackCertVerification_0700
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0700
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackCertVerification_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_7, pemPath, derPath);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHNetStackCertVerification_0800
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0800
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackCertVerification_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_8, pemPath, derPath);
      expect(result).assertEqual(ERROR_CODE_69);
    });

    /**
     * @tc.name   testOHNetStackCertVerification_0900
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_0900
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackCertVerification_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_9, pemPath, derPath);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHNetStackCertVerification_1000
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_1000
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackCertVerification_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_10, pemPath, derPath);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHNetStackCertVerification_1100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCERTVERIFICATION_1100
     * @tc.desc   ：Certificate chain verification interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackCertVerification_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackCertVerification(CASE_INDEX_11, pemPath, derPath);
      expect(result === ERROR_CODE_2305001 || result === ERROR_CODE_2305069 ).assertTrue();
    });

    /**
     * @tc.name   testOHNetStackGetPinSetForHostName_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0100
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackGetPinSetForHostName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackGetPinSetForHostName(CASE_INDEX_1, "www.example.com".toString());
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHNetStackGetPinSetForHostName_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0200
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackGetPinSetForHostName_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackGetPinSetForHostName(CASE_INDEX_2, "www.example.com".toString());
      expect(result).assertEqual(ERROR_CODE_401);
    });

    /**
     * @tc.name   testOHNetStackGetPinSetForHostName_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0300
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackGetPinSetForHostName_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackGetPinSetForHostName(CASE_INDEX_3, "www.example.com".toString());
      expect(result).assertEqual(ERROR_CODE_401);
    });

    /**
     * @tc.name   testOHNetStackGetPinSetForHostName_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0400
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackGetPinSetForHostName_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackGetPinSetForHostName(CASE_INDEX_4, "www.example.com".toString());
      expect(result).assertEqual(ERROR_CODE_401);
    });

    /**
     * @tc.name   testOHNetStackGetPinSetForHostName_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0500
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackGetPinSetForHostName_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : string = wsAPI.OHNetStackGetPinSetForHostName2("notexit.com".toString());
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   testOHNetStackGetPinSetForHostName_0600
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0600
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackGetPinSetForHostName_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : string = wsAPI.OHNetStackGetPinSetForHostName2("getonepin.com".toString());
      expect(result).assertEqual("sha256//FEDCBA987654321");
    });

    /**
     * @tc.name   testOHNetStackGetPinSetForHostName_0700
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0700
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackGetPinSetForHostName_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : string = wsAPI.OHNetStackGetPinSetForHostName2("getmultipin.com".toString());
      expect(result).assertEqual("sha256//FEDCBA987654321;sha256//ABCDEF987654321;sha256//FEDCBA123456789");
    });

    /**
     * @tc.name   testOHNetStackGetPinSetForHostName_0800
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETPINSETFORHOSTNAME_0800
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackGetPinSetForHostName_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : string = wsAPI.OHNetStackGetPinSetForHostName2("getoverduepin.com".toString());
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   testOHNetStackGetCertificatesForHostName_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0100
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackGetCertificatesForHostName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackGetCertificatesForHostName(CASE_INDEX_1, "www.example.com".toString());
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHNetStackGetCertificatesForHostName_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0200
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackGetCertificatesForHostName_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackGetCertificatesForHostName(CASE_INDEX_2, "www.example.com".toString());
      expect(result).assertEqual(ERROR_CODE_401);
    });

    /**
     * @tc.name   testOHNetStackGetCertificatesForHostName_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0300
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackGetCertificatesForHostName_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackGetCertificatesForHostName(CASE_INDEX_3, "www.example.com".toString());
      expect(result).assertEqual(ERROR_CODE_401);
    });

    /**
     * @tc.name   testOHNetStackGetCertificatesForHostName_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0400
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackGetCertificatesForHostName_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHNetStackGetCertificatesForHostName(CASE_INDEX_4, "www.example.com".toString());
      expect(result).assertEqual(ERROR_CODE_401);
    });

    /**
     * @tc.name   testOHNetStackGetCertificatesForHostName_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0500
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackGetCertificatesForHostName_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : Array<string> = wsAPI.OHNetStackGetCertificatesForHostName2("notexit.com".toString());
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   testOHNetStackGetCertificatesForHostName_0600
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0600
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackGetCertificatesForHostName_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : Array<string> = wsAPI.OHNetStackGetCertificatesForHostName2("getonecert.com".toString());
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   testOHNetStackGetCertificatesForHostName_0700
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKGETCERTIFICATESFORHOSTNAME_0700
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackGetCertificatesForHostName_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : Array<string> = wsAPI.OHNetStackGetCertificatesForHostName2("getmulticert.com".toString());
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   testOHNetStackDestroyCertificatesContent_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKDESTROYCERTIFICATESCONTENT_0100
     * @tc.desc   ：Get certificate interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHNetStackDestroyCertificatesContent_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      wsAPI.OHNetStackDestroyCertificatesContent();
    });

    /**
     * @tc.name   testOHWebSocketClientConstruct_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONSTRUCT_0100
     * @tc.desc   ：The constructor for the Websocket client.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientConstruct_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConstruct(CASE_INDEX_1);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHWebSocketClientConstruct_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONSTRUCT_0200
     * @tc.desc   ：The constructor for the Websocket client.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientConstruct_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConstruct(CASE_INDEX_2);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHWebSocketClientConstruct_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONSTRUCT_0300
     * @tc.desc   ：The constructor for the Websocket client.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientConstruct_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConstruct(CASE_INDEX_3);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHWebSocketClientConstruct_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONSTRUCT_0400
     * @tc.desc   ：The constructor for the Websocket client.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientConstruct_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConstruct(CASE_INDEX_4);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHWebSocketClientConstruct_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONSTRUCT_0500
     * @tc.desc   ：The constructor for the Websocket client.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientConstruct_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConstruct(CASE_INDEX_5);
      expect(result).assertEqual(WEBSOCKET_OK);
    });


    /**
     * @tc.name   testOHWebSocketClientAddHeader_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTADDHEADER_0100
     * @tc.desc   ：Add the header information to the client client request.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientAddHeader_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number  = wsAPI.OHWebSocketClientAddHeader(CASE_INDEX_1);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHWebSocketClientAddHeader_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTADDHEADER_0200
     * @tc.desc   ：Add the header information to the client client request.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientAddHeader_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number  = wsAPI.OHWebSocketClientAddHeader(CASE_INDEX_2);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHWebSocketClientAddHeader_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTADDHEADER_0300
     * @tc.desc   ：Add the header information to the client client request.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientAddHeader_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number  = wsAPI.OHWebSocketClientAddHeader(CASE_INDEX_3);
      expect(result).assertEqual(ERROR_CODE_1001);
    });


    /**
     * @tc.name   testOHWebSocketClientConnect_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONNECT_0100
     * @tc.desc   ：Connect the client to the server.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientConnect_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConnect(CASE_INDEX_1);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHWebSocketClientConnect_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONNECT_0200
     * @tc.desc   ：Connect the client to the server.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientConnect_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConnect(CASE_INDEX_2);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHWebSocketClientConnect_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONNECT_0300
     * @tc.desc   ：Connect the client to the server.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientConnect_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConnect(CASE_INDEX_3);
      expect(result).assertEqual(ERROR_CODE_1001);
    });

    /**
     * @tc.name   testOHWebSocketClientConnect_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCONNECT_0400
     * @tc.desc   ：Connect the client to the server.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientConnect_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientConnect(CASE_INDEX_4);
      expect(result).assertEqual(ERROR_CODE_1006);
    });


    /**
     * @tc.name   testOHWebSocketClientSend_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTSEND_0100
     * @tc.desc   ：The client sends data to the server.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientSend_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientSend(CASE_INDEX_1);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHWebSocketClientSend_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTSEND_0200
     * @tc.desc   ：The client sends data to the server.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientSend_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientSend(CASE_INDEX_2);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHWebSocketClientSend_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTSEND_0300
     * @tc.desc   ：The client sends data to the server.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientSend_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientSend(CASE_INDEX_3);
      expect(result).assertEqual(ERROR_CODE_1011);
    });

    /**
     * @tc.name   testOHWebSocketClientSend_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTSEND_0400
     * @tc.desc   ：The client sends data to the server.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientSend_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientSend(CASE_INDEX_4);
      expect(result).assertEqual(ERROR_CODE_1012);
    });


    /**
     * @tc.name   testOHWebSocketClientClose_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCLOSE_0100
     * @tc.desc   ：The client actively closes the websocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientClose_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientClose(CASE_INDEX_1);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHWebSocketClientClose_0200
     * @tc.number testOHWebSocketClientClose_0200
     * @tc.desc   testOHWebSocketClientClose_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientClose_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientClose(CASE_INDEX_2);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHWebSocketClientClose_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCLOSE_0300
     * @tc.desc   ：The client actively closes the websocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientClose_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientClose(CASE_INDEX_3);
      expect(result).assertEqual(ERROR_CODE_1017);
    });

    /**
     * @tc.name   testOHWebSocketClientClose_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCLOSE_0400
     * @tc.desc   ：The client actively closes the websocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientClose_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientClose(CASE_INDEX_4);
      expect(result).assertEqual(ERROR_CODE_1017);
    });

    /**
     * @tc.name   testOHWebSocketClientClose_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTCLOSE_0500
     * @tc.desc   ：The client actively closes the websocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHWebSocketClientClose_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHWebSocketClientClose(CASE_INDEX_5);
      expect(result).assertEqual(ERROR_CODE_1017);
    });


    /**
     * @tc.name   testOHWebSocketClientDestroy_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTDESTROY_0100
     * @tc.desc   ：Release websocket connection context and resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientDestroy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientDestroy(CASE_INDEX_1);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHWebSocketClientDestroy_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTDESTROY_0200
     * @tc.desc   ：Release websocket connection context and resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientDestroy_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientDestroy(CASE_INDEX_2);
      expect(result).assertEqual(ERROR_CODE_1018);
    });

    /**
     * @tc.name   testOHWebSocketClientDestroy_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTDESTROY_0300
     * @tc.desc   ：Release websocket connection context and resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientDestroy_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientDestroy(CASE_INDEX_3);
      expect(result).assertEqual(ERROR_CODE_1018);
    });

    /**
     * @tc.name   testOHWebSocketClientDestroy_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHWEBSOCKETCLIENTDESTROY_0400
     * @tc.desc   ：Release websocket connection context and resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHWebSocketClientDestroy_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result : number = wsAPI.OHWebSocketClientDestroy(CASE_INDEX_4);
      expect(result).assertEqual(WEBSOCKET_OK);
    });


    /**
     * @tc.name   testNetStackIsCleartextPermitted_0100
     * @tc.number testNetStackIsCleartextPermitted_0100
     * @tc.desc   testNetStackIsCleartextPermitted_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetStackIsCleartextPermitted_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(`testNetStackIsCleartextPermitted_0100 start`);
      let re: number = wsAPI.OHNetStackIsCleartextPermitted();
      expect(re).assertEqual(WEBSOCKET_OK);
      done();
    });

    /**
     * @tc.name   testNetStackIsCleartextPermittedByHostName_0100
     * @tc.number SUB_NetStack_IsCleartextPermittedByHostName_0100
     * @tc.desc   ：test NetStackIsCleartextPermittedByHostName is true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetStackIsCleartextPermittedByHostName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const hostname: string = "test.com";
      console.info(`testNetStackIsCleartextPermitted_0200 start`);
      let re: number = wsAPI.OHNetStackIsCleartextPermittedByHostName(hostname);
      expect(re).assertEqual(WEBSOCKET_OK);
      done();
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChain_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_0100
     * @tc.desc   ：Create and verify sorted cert chain with valid PEM cert and caCert.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChain_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain(pemPath);
      expect(result).assertEqual(WEBSOCKET_OK);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChain_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_0100
     * @tc.desc   ：Free cert chain allocated by CreateAndVerifySortedCertChain.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChain_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackFreeCertChain();
      expect(result).assertEqual(WEBSOCKET_OK);
    });
    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChain_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_0200
     * @tc.desc   ：Create and verify sorted cert chain with error code 2305001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChain_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("ERROR_2305001");
      expect(result).assertEqual(ERROR_CODE_2305001);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChain_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_0300
     * @tc.desc   ：Create and verify sorted cert chain with error code 2305002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChain_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("ERROR_2305002");
      expect(result).assertEqual(ERROR_CODE_2305002);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChain_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_0400
     * @tc.desc   ：Create and verify sorted cert chain with error code 2305004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChain_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("ERROR_2305004");
      expect(result).assertEqual(ERROR_CODE_2305004);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChain_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_0500
     * @tc.desc   ：Create and verify sorted cert chain with error code 2305006.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChain_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("ERROR_2305006");
      expect(result).assertEqual(ERROR_CODE_2305006);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChain_0600
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_0600
     * @tc.desc   ：Create and verify sorted cert chain with error code 2305007.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChain_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("ERROR_2305007");
      expect(result).assertEqual(ERROR_CODE_2305007);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChain_0700
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_0700
     * @tc.desc   ：Create and verify sorted cert chain with error code 2305009.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChain_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("ERROR_2305009");
      expect(result).assertEqual(ERROR_CODE_2305009);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChain_0800
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_0800
     * @tc.desc   ：Create and verify sorted cert chain with error code 2305010.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChain_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("ERROR_2305010");
      expect(result).assertEqual(ERROR_CODE_2305010);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChain_0900
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_0900
     * @tc.desc   ：Create and verify sorted cert chain with error code 2305024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChain_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("ERROR_2305024");
      expect(result).assertEqual(ERROR_CODE_2305024);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChain_1000
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_1000
     * @tc.desc   ：Create and verify sorted cert chain with error code 2305027.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChain_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("ERROR_2305027");
      expect(result).assertEqual(ERROR_CODE_2305027);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChain_1100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_1100
     * @tc.desc   ：Create and verify sorted cert chain with error code 2305062.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChain_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("ERROR_2305062");
      expect(result).assertEqual(ERROR_CODE_2305062);
    });
    /**
     * @tc.name   testOHNetStackFreeCertChain_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_0200
     * @tc.desc   ：Free cert chain with error code 2305001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChain_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackFreeCertChain("ERROR_2305001");
      expect(result).assertEqual(ERROR_CODE_2305001);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChain_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_0300
     * @tc.desc   ：Free cert chain with error code 2305002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChain_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackFreeCertChain("ERROR_2305002");
      expect(result).assertEqual(ERROR_CODE_2305002);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChain_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_0400
     * @tc.desc   ：Free cert chain with error code 2305004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChain_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackFreeCertChain("ERROR_2305004");
      expect(result).assertEqual(ERROR_CODE_2305004);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChain_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_0500
     * @tc.desc   ：Free cert chain with error code 2305006.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChain_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackFreeCertChain("ERROR_2305006");
      expect(result).assertEqual(ERROR_CODE_2305006);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChain_0600
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_0600
     * @tc.desc   ：Free cert chain with error code 2305007.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChain_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackFreeCertChain("ERROR_2305007");
      expect(result).assertEqual(ERROR_CODE_2305007);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChain_0700
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_0700
     * @tc.desc   ：Free cert chain with error code 2305009.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChain_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackFreeCertChain("ERROR_2305009");
      expect(result).assertEqual(ERROR_CODE_2305009);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChain_0800
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_0800
     * @tc.desc   ：Free cert chain with error code 2305010.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChain_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackFreeCertChain("ERROR_2305010");
      expect(result).assertEqual(ERROR_CODE_2305010);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChain_0900
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_0900
     * @tc.desc   ：Free cert chain with error code 2305024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChain_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackFreeCertChain("ERROR_2305024");
      expect(result).assertEqual(ERROR_CODE_2305024);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChain_1000
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_1000
     * @tc.desc   ：Free cert chain with error code 2305027.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChain_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackFreeCertChain("ERROR_2305027");
      expect(result).assertEqual(ERROR_CODE_2305027);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChain_1100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_1100
     * @tc.desc   ：Free cert chain with error code 2305062.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChain_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackFreeCertChain("ERROR_2305062");
      expect(result).assertEqual(ERROR_CODE_2305062);
    });
    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChainParam_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_NULL_CERT
     * @tc.desc   ：Test CreateAndVerifySortedCertChain with NULL cert parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChainParam_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("TEST_NULL_cert");
      expect(result).assertEqual(ERROR_CODE_2305001);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChainParam_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_ZERO_CERTCOUNT
     * @tc.desc   ：Test CreateAndVerifySortedCertChain with zero certCount parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChainParam_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("TEST_zero_certCount");
      expect(result).assertEqual(ERROR_CODE_2305002);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChainParam_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_NULL_CACERT
     * @tc.desc   ：Test CreateAndVerifySortedCertChain with NULL caCert parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChainParam_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("TEST_NULL_caCert");
      expect(result).assertEqual(ERROR_CODE_2305004);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChainParam_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_NULL_HOSTNAME
     * @tc.desc   ：Test CreateAndVerifySortedCertChain with NULL hostname parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChainParam_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("TEST_NULL_hostname");
      expect(result).assertEqual(ERROR_CODE_2305062);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChainParam_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_NULL_OUTSORTEDCHAIN
     * @tc.desc   ：Test CreateAndVerifySortedCertChain with NULL outSortedChain parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChainParam_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("TEST_NULL_outSortedChain");
      expect(result).assertEqual(ERROR_CODE_2305006);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChainParam_0600
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_NULL_OUTSORTEDCOUNT
     * @tc.desc   ：Test CreateAndVerifySortedCertChain with NULL outSortedCount parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChainParam_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("TEST_NULL_outSortedCount");
      expect(result).assertEqual(ERROR_CODE_2305007);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChainParam_0700
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_INVALID_CERT
     * @tc.desc   ：Test CreateAndVerifySortedCertChain with invalid certificate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChainParam_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("TEST_invalid_cert");
      expect(result).assertEqual(ERROR_CODE_2305009);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChainParam_0800
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_EXPIRED_CERT
     * @tc.desc   ：Test CreateAndVerifySortedCertChain with expired certificate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChainParam_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("TEST_expired_cert");
      expect(result).assertEqual(ERROR_CODE_2305010);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChainParam_0900
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_INVALID_CA
     * @tc.desc   ：Test CreateAndVerifySortedCertChain with invalid CA certificate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChainParam_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("TEST_invalid_ca");
      expect(result).assertEqual(ERROR_CODE_2305024);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChainParam_1000
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_UNTRUSTED_CERT
     * @tc.desc   ：Test CreateAndVerifySortedCertChain with untrusted certificate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChainParam_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("TEST_untrusted_cert");
      expect(result).assertEqual(ERROR_CODE_2305027);
    });

    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChainParam_1100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKCREATEANDVERIFYSORTEDCERTCHAIN_HOSTNAME_MISMATCH
     * @tc.desc   ：Test CreateAndVerifySortedCertChain with hostname mismatch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackCreateAndVerifySortedCertChainParam_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result : number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("TEST_hostname_mismatch");
      expect(result).assertEqual(ERROR_CODE_2305062);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChainParam_0100
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_NULL_CERTCHAIN
     * @tc.desc   ：Test FreeCertChain with NULL certChain parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChainParam_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const testParam = "TEST_NULL_certChain";
      let result : number = wsAPI.OHNetStackFreeCertChain(testParam);
      expect(testParam).assertEqual("TEST_NULL_certChain");
      expect(result).assertEqual(ERROR_CODE_2305001);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChainParam_0200
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_ZERO_CERTCOUNT
     * @tc.desc   ：Test FreeCertChain with zero certCount parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChainParam_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const testParam = "TEST_zero_certCount";
      let result : number = wsAPI.OHNetStackFreeCertChain(testParam);
      expect(testParam).assertEqual("TEST_zero_certCount");
      expect(result).assertEqual(ERROR_CODE_2305002);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChainParam_0300
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_INVALID_CERTCHAIN
     * @tc.desc   ：Test FreeCertChain with invalid certificate chain.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChainParam_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const testParam = "TEST_invalid_certChain";
      let result : number = wsAPI.OHNetStackFreeCertChain(testParam);
      expect(testParam).assertEqual("TEST_invalid_certChain");
      expect(result).assertEqual(ERROR_CODE_2305004);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChainParam_0400
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_NULL_DATA
     * @tc.desc   ：Test FreeCertChain with NULL certificate data.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChainParam_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const testParam = "TEST_NULL_data";
      let result : number = wsAPI.OHNetStackFreeCertChain(testParam);
      expect(testParam).assertEqual("TEST_NULL_data");
      expect(result).assertEqual(ERROR_CODE_2305006);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChainParam_0500
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_ZERO_SIZE
     * @tc.desc   ：Test FreeCertChain with zero certificate size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChainParam_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const testParam = "TEST_zero_size";
      let result : number = wsAPI.OHNetStackFreeCertChain(testParam);
      expect(testParam).assertEqual("TEST_zero_size");
      expect(result).assertEqual(ERROR_CODE_2305007);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChainParam_0600
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_INVALID_TYPE
     * @tc.desc   ：Test FreeCertChain with invalid certificate type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChainParam_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const testParam = "TEST_invalid_type";
      let result : number = wsAPI.OHNetStackFreeCertChain(testParam);
      expect(testParam).assertEqual("TEST_invalid_type");
      expect(result).assertEqual(ERROR_CODE_2305009);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChainParam_0700
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_DOUBLE_FREE
     * @tc.desc   ：Test FreeCertChain with double free scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChainParam_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const testParam = "TEST_double_free";
      let result : number = wsAPI.OHNetStackFreeCertChain(testParam);
      expect(testParam).assertEqual("TEST_double_free");
      expect(result).assertEqual(ERROR_CODE_2305010);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChainParam_0800
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_LARGE_CERTCOUNT
     * @tc.desc   ：Test FreeCertChain with large certificate count.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChainParam_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const testParam = "TEST_large_certCount";
      let result : number = wsAPI.OHNetStackFreeCertChain(testParam);
      expect(testParam).assertEqual("TEST_large_certCount");
      expect(result).assertEqual(ERROR_CODE_2305024);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChainParam_0900
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_INVALID_CERTCHAIN_PTR
     * @tc.desc   ：Test FreeCertChain with invalid certificate chain pointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChainParam_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const testParam = "TEST_invalid_certChain_ptr";
      let result : number = wsAPI.OHNetStackFreeCertChain(testParam);
      expect(testParam).assertEqual("TEST_invalid_certChain_ptr");
      expect(result).assertEqual(ERROR_CODE_2305027);
    });

    /**
     * @tc.name   testOHNetStackFreeCertChainParam_1000
     * @tc.number SUB_NETWORK_WEBSOCKET_OHNETSTACKFREECERTCHAIN_MEMORY_ERROR
     * @tc.desc   ：Test FreeCertChain with memory error scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNetStackFreeCertChainParam_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const testParam = "TEST_memory_error";
      let result : number = wsAPI.OHNetStackFreeCertChain(testParam);
      expect(testParam).assertEqual("TEST_memory_error");
      expect(result).assertEqual(ERROR_CODE_2305062);
    });
  });
}
