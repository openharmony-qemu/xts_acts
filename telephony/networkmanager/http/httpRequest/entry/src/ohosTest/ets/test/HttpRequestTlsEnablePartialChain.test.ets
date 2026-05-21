/*
 *  Copyright (c) 2026 Huawei Device Co., Ltd.
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { http, socket } from '@kit.NetworkKit';

let ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

let ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

let key = "-----BEGIN PRIVATE KEY-----\n" +
  "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCtHQwNGr7IlxFi\n" +
  "up64kx65Y3H7zWZugIM+0p2cbxFjmmKDCwosP3UTOgpo+g378m4H9mnVQvgpaRnP\n" +
  "syYWAypMM+bJn3/zDf9E07+TChVm1AX7ttOoZp9X75GedjyQVBo0tdJ2Fa7aqFAm\n" +
  "ccsOrbGzaFqBhXjOihqHe4Lxs4NKKB4y3m/VTcQmgKJHBy7vZ9FW7OSdsGRMM4bP\n" +
  "3nz2an2dnr6oCFpHLKe+WDWDJiobWbnNW/ZvmnHxexJ+moxi3eo0feA/D+X/WACk\n" +
  "KaaoqCn9m1n2oyKfcdPf/vCB9otVdd6CeKvteEB+0YjZmnNWXiF8Wsvt+PG/DjaW\n" +
  "OUuZ3sNVAgMBAAECggEAE3m6GltQ7WY5eX7/TkqW4Upzz11LUdE5cr7lJm1Eao06\n" +
  "2f1K9rFo7XHRLAA9xIOAp3qsa2auXpJJahmAhmdywcHxC+vazDBd8JNV8SfoQnpF\n" +
  "9gyagU6STKVSH56zr5UWoal29Pv5gPYAlmKk8pDN9h4eWIX4klvtIiLeF20Xrybm\n" +
  "3NjZndLzyz84qeLtnZVADOP3WZzOFkCGm+3L7z2LHQz5wH504jNjif+EkRB5031S\n" +
  "nBESk+4PbR3ce5chb5CQaE7eQeaf1uIZac0SZIeEAq7Crzf5kgeC/DXfh9ogvIRC\n" +
  "tAi+RGZ5EZZzmp1sLkGpdTMvSXuu4uEkkG5RbKpSvQKBgQDJYSywGaYHKbJCt4ZM\n" +
  "glM5XWVXMg+5Sbbo+h3XnZbcnE7iS9/HnV5cn3LoqhqIlOx4KP2EhVQJIuo58odI\n" +
  "u4nljDxucEI3stOAgslHwNXuxF9ahr2gXUKpgDLou0XyXlv/RgIAqqgVHk/diFkf\n" +
  "zbHWL+vWp9AXAE8OxXGCjYaq6wKBgQDcETWjldvVWt2VlUgHP2RTkaSSMR3rCKVZ\n" +
  "c/abhQKhFrJ538eVUGOannWvtr1E0gtojRT8si2SQgnu0pKn3qyGEWHR476WC7rU\n" +
  "OpE3gsAxN4p9aBiXVY5NI820u3yZbdAvkizFij5tjbrz4fAV6i0EDifmxag76RIo\n" +
  "oQINfAQ6vwKBgQCAYtmQs+lrq6OgcUzHvla8vdR8EMiBgoOAaOVZr3ic0XJhR6o1\n" +
  "oxijyGwD9V7RMNDJkqh+MlpvMLlPlFW3gwjZNdzZM+yjgfjhd4BHpKM/hCaemkSO\n" +
  "1qZHVhoe0jY33Pyd9M4WCrb6L8cPH3xikEsOmKKsyXQbFfFRI4PIjd4LXQKBgQDU\n" +
  "b0h4QZGUw8JjQ1fkpy0R/uX+uatH13DGiUrlleCT4HUpcPwZByEfgRfaJ21NofWh\n" +
  "V4+K3/Vd2qH8CQnJQwsH4H+tPUwdS/VuKZtFGtKssBDgPjx+2fgkPwu0C8ib04XE\n" +
  "ZjcR+gGJf+eYxeIdRZFu+LtL6kIck0EUN1jj63OpwQKBgCj3tMV4DIMbH9OXiK/9\n" +
  "bb9M7RjPaSO+gkjD6gkSjvsHHKTrdhHvsktmk4iQCJe55J3/msdjYkw3E5R7g3t8\n" +
  "AW+JS4E46cUryXhKtn8ap/sz+sSyPp63VATiLODn+PKp5MmBkPHrhdNSoVIKziXo\n" +
  "x+SaFl+MG4ZBprdJDG/IK6+w\n" +
  "-----END PRIVATE KEY-----\n"

let cert = "-----BEGIN CERTIFICATE-----\n" +
  "MIIFODCCAyCgAwIBAgIUNgVQzowRhsWjJJGn+y1LFohgSCUwDQYJKoZIhvcNAQEL\n" +
  "BQAwgZExCzAJBgNVBAYTAkNOMQ0wCwYDVQQIDARUZXN0MQ0wCwYDVQQHDARUZXN0\n" +
  "MRswGQYDVQQKDBJQYXJ0aWFsIENoYWluIFRlc3QxGDAWBgNVBAsMD0ludGVybWVk\n" +
  "aWF0ZSBDQTEtMCsGA1UEAwwkUGFydGlhbCBDaGFpbiBUZXN0IEludGVybWVkaWF0\n" +
  "ZSAyIENBMB4XDTI2MDQyOTA1NTM0OFoXDTI4MDgwMTA1NTM0OFowbTELMAkGA1UE\n" +
  "BhMCQ04xDTALBgNVBAgMBFRlc3QxDTALBgNVBAcMBFRlc3QxGzAZBgNVBAoMElBh\n" +
  "cnRpYWwgQ2hhaW4gVGVzdDEPMA0GA1UECwwGU2VydmVyMRIwEAYDVQQDDAlsb2Nh\n" +
  "bGhvc3QwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCtHQwNGr7IlxFi\n" +
  "up64kx65Y3H7zWZugIM+0p2cbxFjmmKDCwosP3UTOgpo+g378m4H9mnVQvgpaRnP\n" +
  "syYWAypMM+bJn3/zDf9E07+TChVm1AX7ttOoZp9X75GedjyQVBo0tdJ2Fa7aqFAm\n" +
  "ccsOrbGzaFqBhXjOihqHe4Lxs4NKKB4y3m/VTcQmgKJHBy7vZ9FW7OSdsGRMM4bP\n" +
  "3nz2an2dnr6oCFpHLKe+WDWDJiobWbnNW/ZvmnHxexJ+moxi3eo0feA/D+X/WACk\n" +
  "KaaoqCn9m1n2oyKfcdPf/vCB9otVdd6CeKvteEB+0YjZmnNWXiF8Wsvt+PG/DjaW\n" +
  "OUuZ3sNVAgMBAAGjgaowgacwHQYDVR0OBBYEFI3jcBYC50hhshLOd4hhLFOM0QIw\n" +
  "MB8GA1UdIwQYMBaAFBzMeFAy2iRxXTroSDZngPmMOeL2MAwGA1UdEwEB/wQCMAAw\n" +
  "DgYDVR0PAQH/BAQDAgWgMBMGA1UdJQQMMAoGCCsGAQUFBwMBMDIGA1UdEQQrMCmC\n" +
  "CWxvY2FsaG9zdIcEfwAAAYcQAAAAAAAAAAAAAAAAAAAAAYcEwKgBhDANBgkqhkiG\n" +
  "9w0BAQsFAAOCAgEAp9k3/qymRV6biUmbvHOaHuJ8y1uMrDb4RmM6sf9Bg1YiyDX3\n" +
  "RgcFwyEv1rXcGLtj5g8tPtq4vr572LDR8Fj/7rxyLMo8luguY7k/Y54AJwrfQhCE\n" +
  "K7oUD8L9e1J+HbiysXy77n6lwqhn1gENKM1GfuqFzfIpVh9do1+QfESwVlvll1Mu\n" +
  "i5dAdI9Jbg9x9Bbb0p75Axth6g9JITPx7d8kQvSToW8Tyah+b+x3fM7ea860MNMP\n" +
  "VfO2zdlqqgWCkSWRMR7QAa1MGPRm/HuelpvXISv6jAdkl9rW83GwMsllCssyoHml\n" +
  "o0Fn0TzNyOwaazPiDea2uBf/u56vTB2anifPfVCdbdZH0sVn1zTFlYiePQ1qpkuf\n" +
  "Z2lBIll2dsbMbr1TzxvwWuwzJusVGyNJYCWvbK90XhGK8/5+DD4ufKDV0ACWrHWc\n" +
  "nuxfKe1Zds6JAvaJObOsjC/YfzXc5ww1y99hzCY6q4lM4EllTCH1PYwxKkiysGQj\n" +
  "FP0L2uwXSd/BlluChLnwDemZtsaQdmOl3N1ppyp7YGJLmwvmHp2p9e5u3DA/Pb9g\n" +
  "tJpNt4ItVxeSiRs9ABboXuOuzAZ1wlZueTbAYWTqO/DmfAvGIMJnZMX2290Ixzvy\n" +
  "hnnKYJqu/Ev/Kp9ezA54GxzznK3oN8U3o3Tyy4VDnqMtvI+q8NNqlOEC6m8=\n" +
  "-----END CERTIFICATE-----\n";

let cert2 = "-----BEGIN CERTIFICATE-----\n" +
  "MIIGGDCCBACgAwIBAgIUL4uLoLo6p2FwgaDXXFKTaVFBaHQwDQYJKoZIhvcNAQEL\n" +
  "BQAwgZExCzAJBgNVBAYTAkNOMQ0wCwYDVQQIDARUZXN0MQ0wCwYDVQQHDARUZXN0\n" +
  "MRswGQYDVQQKDBJQYXJ0aWFsIENoYWluIFRlc3QxGDAWBgNVBAsMD0ludGVybWVk\n" +
  "aWF0ZSBDQTEtMCsGA1UEAwwkUGFydGlhbCBDaGFpbiBUZXN0IEludGVybWVkaWF0\n" +
  "ZSAxIENBMB4XDTI2MDQyOTA1NTM0OFoXDTMxMTAyMDA1NTM0OFowgZExCzAJBgNV\n" +
  "BAYTAkNOMQ0wCwYDVQQIDARUZXN0MQ0wCwYDVQQHDARUZXN0MRswGQYDVQQKDBJQ\n" +
  "YXJ0aWFsIENoYWluIFRlc3QxGDAWBgNVBAsMD0ludGVybWVkaWF0ZSBDQTEtMCsG\n" +
  "A1UEAwwkUGFydGlhbCBDaGFpbiBUZXN0IEludGVybWVkaWF0ZSAyIENBMIICIjAN\n" +
  "BgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA182ZFE53HXyG+ifnQRhSDCC8f0xc\n" +
  "i1ZodjBOATi9jK02VGmH57eKfDMBiIbcxJ9Np/QkLLZZJpWkFThrlhFM33U1XHMp\n" +
  "00ZOtN01lj3Rh0SI4FZM/NadwqCPWPmJkCubw4Uu5ynm2i7zFXpIXsESFjXZlTiY\n" +
  "DZZjumEL/4bOBQvBLpYx+jI2Hx68OxbiSIlZla3OLj5T0a39hVtjQJCt2qvKFfg/\n" +
  "MM8aTS0YxB6yGlngaK1eTA/EbWoAeTKyuUQ49ZdlA50mjEmFSE55wmJcbDDH+yPq\n" +
  "2UAcK3Oay8pNujC/1bI6mVuJ6VrFEhS2uhm0XIxUL2mu09DyuWdQx9fde8umIi4T\n" +
  "gEhjd+O2b2B9HQL3fOM1QGU1gDrNtexiLJ7IQjl175ufx/GY29EsAZD2MIP12Ydw\n" +
  "hCUV2UFprCHkIPGQGRpCL0VA2S+uAQ8/wzS5dwy7hC40htzIwKEQsA3Za8bd5K9r\n" +
  "nh6bxz/IvxGHiPTo8FcVA/oPn6kUXJ2QWA0sTD8AyJwQj6IEjI14mRt0GZSGgkSS\n" +
  "irCKxH8LTYY3aoe8ZzPiLYAIHxGWl2WEhpWPsQhzz6GMGOI0ioyNjqdCNTtQ46Gy\n" +
  "ygTYLwwk36m4p8igLkGgY2MT4Kli7305LRllKtQLpVUK0Wn6WxYurZNjO7DSLzGV\n" +
  "4ga/Uuf2KLFv6tMCAwEAAaNmMGQwHQYDVR0OBBYEFBzMeFAy2iRxXTroSDZngPmM\n" +
  "OeL2MB8GA1UdIwQYMBaAFCMJG1IrgiiD70SbS77LqKGiOqbNMBIGA1UdEwEB/wQI\n" +
  "MAYBAf8CAQAwDgYDVR0PAQH/BAQDAgEGMA0GCSqGSIb3DQEBCwUAA4ICAQCR7hkm\n" +
  "agYAopLfWtlrJF2RqsMtmUXXmD5gcVESuQW539W9QWbgz74wwNlsQl1KO99IHDKG\n" +
  "ntDt8cLO/Mmd79S8wYG74zKfUTbYBFrsy5h1jT0v2lvlAj4KgqDisYD4ImU7usVk\n" +
  "z3LcgH0fj0vCPHD0ch1Rj26xorYg/QXCM/R4fLefLI32sBUHdCFQ+B0nEezvzI2D\n" +
  "8GU7d9Y6+GfYG0IycAdFusBeeeD4qP5hbEoSH1m679Bfi5wQ7KPERHRrHV8oyeXf\n" +
  "7R+lE1lVd0fE/0RwiPHcp69iP+vYA2o2qmR3F8Ww0WnrQMS2Mx2YsqyIrKqLadGH\n" +
  "FPLpAi471nHwjBkfpo79sdn9kh8METF+jLqTQwN9gPctbYElS8JquoGiUjbGps4J\n" +
  "dzuxHCQRgQAO3iYTI9T2TdrjNq0faZkLKbalZsX7oz9IcScLj5Z4Mo0j3Bksuj26\n" +
  "kaedKUjNTVvTVJR0BDn0L7gOJSCSYtuMb+TnnsQWX85am7n3eK7BrVG8JiRXwBDM\n" +
  "AlW4BS1N8u4IlviWZgm4uZORmg3GxdtV8BTTl787u2zzoY3wyfqskcXJmItcgn8I\n" +
  "ipmaeZGH75HM0NU2V3KwtrC4hTjw/j95qe4rvoZyfZOi0KEmZgg9wZSN9q+sjUsK\n" +
  "ZKTss1dPXQ1aEp+svuIIbAGLwt3qzGnzICKrng==\n" +
  "-----END CERTIFICATE-----\n";

interface HttpRequestOptionsWithNullEnablePartialChain {
  method: http.RequestMethod;
  expectDataType: http.HttpDataType;
  readTimeout: number;
  usingProtocol: http.HttpProtocol;
  priority: number;
  caData: string;
  enablePartialChain: null;
}

let optionsNull: HttpRequestOptionsWithNullEnablePartialChain = {
  method: http.RequestMethod.POST,
  expectDataType: http.HttpDataType.STRING,
  readTimeout: 200000,
  usingProtocol: http.HttpProtocol.HTTP2,
  priority: 1,
  caData: cert2,
  enablePartialChain: null
};

function getTlsConnOptions(port:number, type: number): socket.TLSConnectOptions {
  let listenAddress: socket.NetAddress = { address: '127.0.0.1', port: port }
  let tlsSecOptions: socket.TLSSecureOptions = {
    cert: cert,
    key: key,
    protocols: socket.Protocol.TLSv12,
  }
  return { address: listenAddress, secureOptions: tlsSecOptions }
}

export default function HttpRequestTlsEnablePartialChainTest() {
  describe('HttpRequestTlsEnablePartialChainTest', () => {

    /**
     * @tc.name   testNetworkMgrHttpRequestTlsEnablePartialChain0100
     * @tc.number SUB_NetworkMgr_Http_RequestTls_EnablePartialChain_0100
     * @tc.desc   Verify that the request succeeds when TLS enablePartialChain is true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpRequestTlsEnablePartialChain0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testNetworkMgrHttpRequestTlsEnablePartialChain0100";
      console.info(`${caseName}---Start`);
      let port = 9000+Math.round(Math.random()*5000);
      let tlsSocketServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      try{
        let tlsConnOptions = getTlsConnOptions(port, 0);
        await tlsSocketServer.listen(tlsConnOptions).then( async ()=> {
          let listenAddr: socket.NetAddress =  await tlsSocketServer.getLocalAddress();
          console.info(`${caseName} tlsSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
        }).catch((err: BusinessError) => {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        })
        tlsSocketServer.off('connect');
        tlsSocketServer.on('connect', async (clientSocket: socket.TLSSocketConnection)=>{
          console.info(`${caseName}-----tlsSocketServer on connect`);
          let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();
          console.info(`${caseName}----------`+JSON.stringify(clientAddr));
          clientSocket.on('message',async  (msgInfo: socket.SocketMessageInfo) => {
            let data: string = "HTTP/1.1 200 OK\n" +
              "Server: Tengine\n" +
              "Date: Sun\n" +
              "Content-Type: application/json;charset=UTF-8\n" +
              "Content-Length: 0\n" +
              "X-Powered-By: ring/1.0.0\n" +
              "sc: 0.013\n" +
              "\n" +
              "{\"status\":\"1\",\"count\":\"2\",\"info\":\"OK\",\"infocode\":\"10000\",\"lives\":[]}"
            clientSocket.send(data);
          });
        });
        let httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          expectDataType: http.HttpDataType.STRING,
          readTimeout: 200000,
          usingProtocol: http.HttpProtocol.HTTP2,
          priority: 1,
          caData: cert2,
          enablePartialChain:true
        };
        httpRequest.request("https://localhost:"+ port, options, (err: Error, data: http.HttpResponse) => {
          if (!err) {
            console.info(`${caseName} request success data is `+JSON.stringify(data));
            ExpectTrue(data.responseCode === 200);
            console.info(`${caseName} options.enablePartialChain:${JSON.stringify(options.enablePartialChain)}`);
            ExpectTrue(options.enablePartialChain === true);
            done();
          } else {
            console.error(`${caseName} request err is `+JSON.stringify(err));
            ExpectFail();
            done();
          }
        });
      }catch (err) {
        console.error(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHttpRequestTlsEnablePartialChain0200
     * @tc.number SUB_NetworkMgr_Http_RequestTls_EnablePartialChain_0200
     * @tc.desc   Verify that the request fails when TLS enablePartialChain is false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpRequestTlsEnablePartialChain0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testNetworkMgrHttpRequestTlsEnablePartialChain0200";
      console.info(`${caseName}---Start`);
      let port = 9000+Math.round(Math.random()*5000);
      let tlsSocketServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      try{
        let tlsConnOptions = getTlsConnOptions(port, 0);
        await tlsSocketServer.listen(tlsConnOptions).then( async ()=> {
          let listenAddr: socket.NetAddress =  await tlsSocketServer.getLocalAddress();
          console.info(`${caseName} tlsSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
        }).catch((err: BusinessError) => {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        })
        tlsSocketServer.off('connect');
        tlsSocketServer.on('connect', async (clientSocket: socket.TLSSocketConnection)=>{
          console.info(`${caseName}-----tlsSocketServer on connect`);
          let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();
          console.info(`${caseName}----------`+JSON.stringify(clientAddr));
          clientSocket.on('message',async  (msgInfo: socket.SocketMessageInfo) => {
            let data: string = "HTTP/1.1 200 OK\n" +
              "Server: Tengine\n" +
              "Date: Sun\n" +
              "Content-Type: application/json;charset=UTF-8\n" +
              "Content-Length: 0\n" +
              "X-Powered-By: ring/1.0.0\n" +
              "sc: 0.013\n" +
              "\n" +
              "{\"status\":\"1\",\"count\":\"2\",\"info\":\"OK\",\"infocode\":\"10000\",\"lives\":[]}"
            clientSocket.send(data);
          });
        });
        let httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          expectDataType: http.HttpDataType.STRING,
          readTimeout: 200000,
          usingProtocol: http.HttpProtocol.HTTP2,
          priority: 1,
          caData: cert2,
          enablePartialChain:false
        };
        httpRequest.request("https://localhost:"+ port, options, (err: BusinessError, data: http.HttpResponse) => {
          if (!err) {
            console.info(`${caseName} request success data is `+JSON.stringify(data));
            ExpectFail();
            done();
          } else {
            console.error(`${caseName} request err is `+JSON.stringify(err));
            ExpectTrue(err.code === 2300060);
            console.info(`${caseName} options.enablePartialChain:${JSON.stringify(options.enablePartialChain)}`);
            ExpectTrue(options.enablePartialChain === false);
            done();
          }
        });
      }catch (err) {
        console.error(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHttpRequestTlsEnablePartialChain0300
     * @tc.number SUB_NetworkMgr_Http_RequestTls_EnablePartialChain_0300
     * @tc.desc   Verify that the request succeeds when TLS enablePartialChain is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrHttpRequestTlsEnablePartialChain0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testNetworkMgrHttpRequestTlsEnablePartialChain0300";
      console.info(`${caseName}---Start`);
      let port = 9000+Math.round(Math.random()*5000);
      let tlsSocketServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      try{
        let tlsConnOptions = getTlsConnOptions(port, 0);
        await tlsSocketServer.listen(tlsConnOptions).then( async ()=> {
          let listenAddr: socket.NetAddress =  await tlsSocketServer.getLocalAddress();
          console.info(`${caseName} tlsSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
        }).catch((err: BusinessError) => {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        })
        tlsSocketServer.off('connect');
        tlsSocketServer.on('connect', async (clientSocket: socket.TLSSocketConnection)=>{
          console.info(`${caseName}-----tlsSocketServer on connect`);
          let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();
          console.info(`${caseName}----------`+JSON.stringify(clientAddr));
          clientSocket.on('message',async  (msgInfo: socket.SocketMessageInfo) => {
            let data: string = "HTTP/1.1 200 OK\n" +
              "Server: Tengine\n" +
              "Date: Sun\n" +
              "Content-Type: application/json;charset=UTF-8\n" +
              "Content-Length: 0\n" +
              "X-Powered-By: ring/1.0.0\n" +
              "sc: 0.013\n" +
              "\n" +
              "{\"status\":\"1\",\"count\":\"2\",\"info\":\"OK\",\"infocode\":\"10000\",\"lives\":[]}"
            clientSocket.send(data);
          });
        });
        let httpRequest = http.createHttp();
        httpRequest.request("https://localhost:"+ port, optionsNull, (err: BusinessError, data: http.HttpResponse) => {
          if (!err) {
            console.info(`${caseName} request success data is `+JSON.stringify(data));
            ExpectTrue(data.responseCode === 200);
            console.info(`${caseName} optionsNull.enablePartialChain:${JSON.stringify(optionsNull.enablePartialChain)}`);
            ExpectTrue(optionsNull.enablePartialChain === null);
            done();
          } else {
            console.error(`${caseName} request err is `+JSON.stringify(err));
            ExpectFail();
            done();
          }
        });
      }catch (err) {
        console.error(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHttpRequestTlsEnablePartialChain0400
     * @tc.number SUB_NetworkMgr_Http_RequestTls_EnablePartialChain_0400
     * @tc.desc   Verify that the request succeeds when TLS enablePartialChain is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetworkMgrHttpRequestTlsEnablePartialChain0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testNetworkMgrHttpRequestTlsEnablePartialChain0400";
      console.info(`${caseName}---Start`);
      let port = 9000+Math.round(Math.random()*5000);
      let tlsSocketServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      try{
        let tlsConnOptions = getTlsConnOptions(port, 0);
        await tlsSocketServer.listen(tlsConnOptions).then( async ()=> {
          let listenAddr: socket.NetAddress =  await tlsSocketServer.getLocalAddress();
          console.info(`${caseName} tlsSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
        }).catch((err: BusinessError) => {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        })
        tlsSocketServer.off('connect');
        tlsSocketServer.on('connect', async (clientSocket: socket.TLSSocketConnection)=>{
          console.info(`${caseName}-----tlsSocketServer on connect`);
          let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();
          console.info(`${caseName}----------`+JSON.stringify(clientAddr));
          clientSocket.on('message',async  (msgInfo: socket.SocketMessageInfo) => {
            let data: string = "HTTP/1.1 200 OK\n" +
              "Server: Tengine\n" +
              "Date: Sun\n" +
              "Content-Type: application/json;charset=UTF-8\n" +
              "Content-Length: 0\n" +
              "X-Powered-By: ring/1.0.0\n" +
              "sc: 0.013\n" +
              "\n" +
              "{\"status\":\"1\",\"count\":\"2\",\"info\":\"OK\",\"infocode\":\"10000\",\"lives\":[]}"
            clientSocket.send(data);
          });
        });
        let httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          expectDataType: http.HttpDataType.STRING,
          readTimeout: 200000,
          usingProtocol: http.HttpProtocol.HTTP2,
          priority: 1,
          caData: cert2,
          enablePartialChain:undefined
        };
        httpRequest.request("https://localhost:"+ port, options, (err: BusinessError, data: http.HttpResponse) => {
          if (!err) {
            console.info(`${caseName} request success data is `+JSON.stringify(data));
            ExpectTrue(data.responseCode === 200);
            console.info(`${caseName} options.enablePartialChain:${JSON.stringify(options.enablePartialChain)}`);
            ExpectTrue(options.enablePartialChain === undefined);
            done();
          } else {
            console.error(`${caseName} request err is `+JSON.stringify(err));
            ExpectFail();
            done();
          }
        });
      }catch (err) {
        console.error(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrHttpRequestTlsEnablePartialChain0500
     * @tc.number SUB_NetworkMgr_Http_RequestTls_EnablePartialChain_0500
     * @tc.desc   Verify that the request succeeds when TLS enablePartialChain is not set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetworkMgrHttpRequestTlsEnablePartialChain0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = "testNetworkMgrHttpRequestTlsEnablePartialChain0500";
      console.info(`${caseName}---Start`);
      let port = 9000+Math.round(Math.random()*5000);
      let tlsSocketServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      try{
        let tlsConnOptions = getTlsConnOptions(port, 0);
        await tlsSocketServer.listen(tlsConnOptions).then( async ()=> {
          let listenAddr: socket.NetAddress =  await tlsSocketServer.getLocalAddress();
          console.info(`${caseName} tlsSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
        }).catch((err: BusinessError) => {
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        })
        tlsSocketServer.off('connect');
        tlsSocketServer.on('connect', async (clientSocket: socket.TLSSocketConnection)=>{
          console.info(`${caseName}-----tlsSocketServer on connect`);
          let clientAddr: socket.NetAddress = await clientSocket.getRemoteAddress();
          console.info(`${caseName}----------`+JSON.stringify(clientAddr));
          clientSocket.on('message',async  (msgInfo: socket.SocketMessageInfo) => {
            let data: string = "HTTP/1.1 200 OK\n" +
              "Server: Tengine\n" +
              "Date: Sun\n" +
              "Content-Type: application/json;charset=UTF-8\n" +
              "Content-Length: 0\n" +
              "X-Powered-By: ring/1.0.0\n" +
              "sc: 0.013\n" +
              "\n" +
              "{\"status\":\"1\",\"count\":\"2\",\"info\":\"OK\",\"infocode\":\"10000\",\"lives\":[]}"
            clientSocket.send(data);
          });
        });
        let httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.POST,
          expectDataType: http.HttpDataType.STRING,
          readTimeout: 200000,
          usingProtocol: http.HttpProtocol.HTTP2,
          priority: 1,
          caData: cert2,
        };
        httpRequest.request("https://localhost:"+ port, options, (err: BusinessError, data: http.HttpResponse) => {
          if (!err) {
            console.info(`${caseName} request success data is `+JSON.stringify(data));
            ExpectTrue(data.responseCode === 200);
            done();
          } else {
            console.error(`${caseName} request err is `+JSON.stringify(err));
            ExpectFail();
            done();
          }
        });
      }catch (err) {
        console.error(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });
  });
}

