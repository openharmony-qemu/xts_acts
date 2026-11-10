'use static'
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';
import socket from '@ohos.net.socket';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `exportFail failed err: ${JSON.stringify(err)}`);
  }
}

let ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `exportTrue failed err: ${JSON.stringify(err)}`);
  }
}

let key = "-----BEGIN PRIVATE KEY-----\n" +
  "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCsdp9zb89pZXWA\n" +
  "xchWAR5mjyaC5aqJS+/guBsIgCxpDCfIJG0vKUwqoYHjb9ajaZ+9mbv0Feu1p4B7\n" +
  "JUZ769hsLeCLcmFYT6PTf9qrdkEz/lwq+/AeY22TPHyTxgxEbHll3uoA/pK+931O\n" +
  "x+gkiHzYsu7xqNPciRx+laaYG/XGvVPB/k8LnIkddOzUTyLmorc44XoathlNcUo+\n" +
  "frj2VeS6obkpSIRlgNO/InnSCK+ChinBzVfHqksOV4UVjAfcU5Ru+zoMh66VSvTP\n" +
  "dOr1TTnbCu1fJ3PHaXKlV7AHzIN1e1iu6PxhJazWZ47dG8RU03kTS/c/b599AxZU\n" +
  "rwYsMmQrAgMBAAECggEACIyLdDzIpUrYO5087wvN0VEAnGB8xvgyreBdHAYZLXk4\n" +
  "HPML+S3XjrgZfjK0YGlYonIVH7uucX9vc6tHW9aMZeBoTxaeaLLvRglXx5lsZgK9\n" +
  "LYxLkitk6nWHH17Oi4htBCBmrSHxbZygY4quoTulegB0rm9WATVIFPufbyQuV2ma\n" +
  "Va+hDwJa8moLZp6YH2Ouf4PXMVKODPxDw/+6qah7MdvfIb6gMuCDBQaYYMBbDMEQ\n" +
  "DhfGreiNozpO3BQU/qQW++jb9eymAoBbSYYAew4+nhESf73DSSyR6M3W6t7DDuCn\n" +
  "XqnOn5lXTco075egLPM3E26nFJI5ka3rxx+ZnuXCoQKBgQDVkBsdDGOAPN0llv3q\n" +
  "3dv2yN6eb2U6Z0471fBb49y9mjtlY0JE0pY8im4wYAAjDIarUSaRCPd0ydvmGVIj\n" +
  "7MEZ912QlP6J8iVrP0Af6uYlqZ7Z5PkzpaCDMkf1SJB66yPZ78WERaF5GFfx/Dly\n" +
  "bO5yffUmKGkS7bWC+0TwfBSFgwKBgQDOu8sF+bNJHmZ2jAOeopzJHdIaWysYaGW3\n" +
  "O63VAP6F3yxNwyd0W4qryIOHij8YUzYeUO8bnN/XmR67vl8a71RBNG/PSE/VUykS\n" +
  "5cnHwLE7C0EO8p8Q4dynyhQBt7HfpP/ZKNmcCQbxCitYpvJp69SHIvDOoSQCgcoS\n" +
  "gVZF7YaOOQKBgHdFMO9LMPK4iyVoK00VNLihvDqtqdIxSa7/L2qSWoCFd3CLO8Jl\n" +
  "/cO36AwaQVlRsJBTFP/hCxptdeMO9yHbIokW7mlF3NY7pww7Wdu5e2lDTtUQHODs\n" +
  "OjWrSibBrPcJBY+8agoSPTj9EHizzX2LOqw0jkoOPYh1u254WCsakPdzAoGAKPUb\n" +
  "q/tkgb/8HNBwhyVAWrgFwCL/zr4gKMUyE1k3E967MEzRrEPWnWIEbP3+shsKRcdT\n" +
  "F+1ki5pSdG+q9/MihiiVXkO9TU5EfPH5oBGVC1WXdharXPTienuWqyBxpRVTevqU\n" +
  "4k0HiwmwvMeWj1WhrYRGoSlbsQN1vWTSatg8KEECgYBxjybidxhtfetzOxwA/gHT\n" +
  "Yy28pKu36RU/hkIbCzTIEZvgkr5UBhFIwoLP5GnV36qkfnmsVQCxJPJf1mM+tUsO\n" +
  "O60gv9WasjrV3/I7hkfgYloIL95jtvDMC44QTi7AzltA0YsYW0T/rYY/pz1Occm/\n" +
  "4O3kZdWUbIIpjs2PV6rnMQ==\n" +
  "-----END PRIVATE KEY-----\n"

let certRight = "-----BEGIN CERTIFICATE-----\n" +
  "MIIDCTCCAfGgAwIBAgIUYDfxhcA83RQQNN/B9uldTXer+UQwDQYJKoZIhvcNAQEL\n" +
  "BQAwFDESMBAGA1UEAwwJbG9jYWxob3N0MB4XDTI1MDcyNzA5MTYzMVoXDTMzMTAx\n" +
  "MzA5MTYzMVowFDESMBAGA1UEAwwJbG9jYWxob3N0MIIBIjANBgkqhkiG9w0BAQEF\n" +
  "AAOCAQ8AMIIBCgKCAQEArHafc2/PaWV1gMXIVgEeZo8mguWqiUvv4LgbCIAsaQwn\n" +
  "yCRtLylMKqGB42/Wo2mfvZm79BXrtaeAeyVGe+vYbC3gi3JhWE+j03/aq3ZBM/5c\n" +
  "KvvwHmNtkzx8k8YMRGx5Zd7qAP6Svvd9TsfoJIh82LLu8ajT3IkcfpWmmBv1xr1T\n" +
  "wf5PC5yJHXTs1E8i5qK3OOF6GrYZTXFKPn649lXkuqG5KUiEZYDTvyJ50givgoYp\n" +
  "wc1Xx6pLDleFFYwH3FOUbvs6DIeulUr0z3Tq9U052wrtXydzx2lypVewB8yDdXtY\n" +
  "ruj8YSWs1meO3RvEVNN5E0v3P2+ffQMWVK8GLDJkKwIDAQABo1MwUTAdBgNVHQ4E\n" +
  "FgQUQVIvbnYEMsWDmLP0+xx8Y4/cYHEwHwYDVR0jBBgwFoAUQVIvbnYEMsWDmLP0\n" +
  "+xx8Y4/cYHEwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAjI2m\n" +
  "9gUdeGtEZxiXb1WmPdJ9N4b9by2OvVziMDKh1gxy27ytlQCVjGYaw3AN/fdhTeRI\n" +
  "LHXAQHUm+PmazPo8mGdN+9SRrop/j0WXx5jGI0POoeK24Jswi2whg/JI5hmE3IYc\n" +
  "PtXGfSJaP2bHm++MNczt7ZS6p+ZYGVLaTWzIxhSDhpTLyZkj3Yi9fSsZcdlqCpvL\n" +
  "Yrdzx0v/QzkWnZkjtQWXf80/jfdFvMCmTmsArgea/up1cbEauBp+me7yQTCHkVzf\n" +
  "EtC7b10L5egH8JCm7du+5s+QifHYTV0ELxHVzBkIynCA65EGV5eNojPmg8XRPWBf\n" +
  "YB/6QUsI42+FMzTnPQ==\n" +
  "-----END CERTIFICATE-----\n";

let  certExpired = "-----BEGIN CERTIFICATE-----\n" +
  "MIIDCTCCAfGgAwIBAgIUOe7cN92vgoAS7z+6ySEQ1xq8k4owDQYJKoZIhvcNAQEL\n" +
  "BQAwFDESMBAGA1UEAwwJbG9jYWxob3N0MB4XDTI1MDcyNzA5Mzk0OFoXDTI1MDcy\n" +
  "ODA5Mzk0OFowFDESMBAGA1UEAwwJbG9jYWxob3N0MIIBIjANBgkqhkiG9w0BAQEF\n" +
  "AAOCAQ8AMIIBCgKCAQEArHafc2/PaWV1gMXIVgEeZo8mguWqiUvv4LgbCIAsaQwn\n" +
  "yCRtLylMKqGB42/Wo2mfvZm79BXrtaeAeyVGe+vYbC3gi3JhWE+j03/aq3ZBM/5c\n" +
  "KvvwHmNtkzx8k8YMRGx5Zd7qAP6Svvd9TsfoJIh82LLu8ajT3IkcfpWmmBv1xr1T\n" +
  "wf5PC5yJHXTs1E8i5qK3OOF6GrYZTXFKPn649lXkuqG5KUiEZYDTvyJ50givgoYp\n" +
  "wc1Xx6pLDleFFYwH3FOUbvs6DIeulUr0z3Tq9U052wrtXydzx2lypVewB8yDdXtY\n" +
  "ruj8YSWs1meO3RvEVNN5E0v3P2+ffQMWVK8GLDJkKwIDAQABo1MwUTAdBgNVHQ4E\n" +
  "FgQUQVIvbnYEMsWDmLP0+xx8Y4/cYHEwHwYDVR0jBBgwFoAUQVIvbnYEMsWDmLP0\n" +
  "+xx8Y4/cYHEwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAM3MA\n" +
  "rE9RvhdwwGvNs0C7NZBTxoMKumSLuSFFqj9TEDzkz07wPW3qMUlqfN/tpYCpEYaB\n" +
  "yNir63R8PFrX2avIaWDcXhvuIBs1/B9Jjwbuxx/klZyVH0iiopuyP/pBDIx8X8oS\n" +
  "a2qPqGKhOGHYt/ukbU3p2JoPcs4HOcV/jRPTZSwjkkdIvZI7knQDo7Foc9D4JfPm\n" +
  "iEluPOnF6/xkjI2F6GhEicLtMdbg3PDfCHdY9jj4B0WBldZbrqn7Jv6qW1KLDsej\n" +
  "d9vqB08JPKP5WtpNPXEiJyvddPtCaCtVkxIgGCjwT1Tb776QPsSPc+sAtAClCvNy\n" +
  "aEiPwjDyB+JP9Vri5A==\n" +
  "-----END CERTIFICATE-----\n"

function getTlsConnOptions(port:int, type: number): socket.TLSConnectOptions {
  let listenAddress: socket.NetAddress = { address: '127.0.0.1', port: port }
  let tlsSecOptions: socket.TLSSecureOptions = {
    cert: type == 0? certRight: certExpired,
    key: key,
    protocols: socket.Protocol.TLSv12,
  }
  return { address: listenAddress, secureOptions: tlsSecOptions }
}

export default function HttpRequestPatchTest(): void {
  describe('HttpRequestPatchTest', () => {

    /**
     * @tc.name   testHttpRequestPatch_static_0100
     * @tc.number SUB_NetworkMgr_Http_Patch_0100
     * @tc.desc   Write a PATCH request method for callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpRequestPatch_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = "testHttpRequestPatch_static_0100";
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let port = (9000+Math.round(Math.random()*5000)).toInt();
      let tlsSocketServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      try{
        let tlsConnOptions = getTlsConnOptions(port, 0);
        tlsSocketServer.listen(tlsConnOptions).then(()=> {
          tlsSocketServer.getLocalAddress().then((listenAddr: socket.NetAddress) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} tlsSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName}----------`+JSON.stringify(err));
          });
        }).catch((error) => {
              let err = error as BusinessError;
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        })
        tlsSocketServer.offTlsServerConnect();
        tlsSocketServer.onTlsServerConnect((clientSocket: socket.TLSSocketConnection)=>{
          hilog.info(domain, tag, '%{public}s', `${caseName}-----tlsSocketServer on connect`);
          clientSocket.getRemoteAddress().then((clientAddr: socket.NetAddress) => {
            hilog.info(domain, tag, '%{public}s', `${caseName}----------`+JSON.stringify(clientAddr));
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName}----------`+JSON.stringify(err));
          });
          clientSocket.onTlsConnMessage((msgInfo: socket.SocketMessageInfo) => {
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
          method: http.RequestMethod.PATCH,
          expectDataType: http.HttpDataType.STRING,
          inactivityMs: 200,
          readTimeout: 200000,
          usingProtocol: http.HttpProtocol.HTTP2,
          priority: 1,
          caData: certRight
        };
        httpRequest.request("https://localhost:"+ port, options, (err: BusinessError<void> | null, data: http.HttpResponse | undefined) => {
          if (!err?.code) {
            hilog.info(domain, tag, '%{public}s', `${caseName} options is `+JSON.stringify(options));
            ExpectTrue(options.method == http.RequestMethod.PATCH);
            hilog.info(domain, tag, '%{public}s', `${caseName} request success data is `+JSON.stringify(data));
            ExpectTrue(data?.responseCode == 200);
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
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
        done();
      }
    });
    /**
     * @tc.name   testHttpRequestPatch_static_0200
     * @tc.number SUB_NetworkMgr_Http_Patch_0200
     * @tc.desc   Write a PATCH request method for promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHttpRequestPatch_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = "testHttpRequestPatch_static_0200";
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      let port = (9000+Math.round(Math.random()*5000)).toInt();
      let tlsSocketServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
      try{
        let tlsConnOptions = getTlsConnOptions(port, 0);
        tlsSocketServer.listen(tlsConnOptions).then(()=> {
          tlsSocketServer.getLocalAddress().then((listenAddr: socket.NetAddress) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} tlsSocketServer listen address: `+JSON.stringify(listenAddr.address) +' port: '+JSON.stringify(listenAddr.port));
          }).catch((error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, '%{public}s', `${caseName} get err is `+JSON.stringify(err));
          });
        }).catch((error) => {
          let err = error as BusinessError;
          console.error(`${caseName} get err is `+JSON.stringify(err));
          ExpectFail();
          done();
        })
        tlsSocketServer.onTlsServerConnect((clientSocket: socket.TLSSocketConnection)=>{
          hilog.info(domain, tag, '%{public}s', `${caseName}-----tlsSocketServer on connect `);
          clientSocket.getRemoteAddress().then((clientAddr: socket.NetAddress) => {
            hilog.info(domain, tag, '%{public}s', `${caseName}----------`+JSON.stringify(clientAddr));
          }).catch((error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, '%{public}s', `${caseName} get err is `+JSON.stringify(err));
          });
          clientSocket.onTlsConnMessage((msgInfo: socket.SocketMessageInfo) => {
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
          })
        });
        let httpRequest = http.createHttp();
        let options: http.HttpRequestOptions = {
          method: http.RequestMethod.PATCH,
          expectDataType: http.HttpDataType.STRING,
          inactivityMs: 300,
          readTimeout: 200000,
          usingProtocol: http.HttpProtocol.HTTP2,
          priority: 1,
          caData: certRight
        };
        httpRequest.request("https://localhost:"+ port, options).then((data) => {
          hilog.info(domain, tag, '%{public}s', `${caseName} options is `+JSON.stringify(options));
          ExpectTrue(options.method == http.RequestMethod.PATCH);
          hilog.info(domain, tag, '%{public}s', `${caseName} request success data is`+JSON.stringify(data));
          console.error(`${caseName} Unexpected success: should have failed due to missing caData`);
          done();
        }).catch((error) => {
          let err = error as BusinessError;
          console.log(`${caseName} request failed,err: ${JSON.stringify(err)}`);
          if (err.code === 2300060) {
            hilog.info(domain, tag, '%{public}s', `${caseName} request failed with expected err code 2300060`);
            done();
          } else {
            console.error(`${caseName} request failed with unexpected error code: ${err.code}`);
            ExpectFail();
            done();
          }
        })
      }catch(error) {
        console.log(`${caseName} request failed,error: ${JSON.stringify(error)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
        done();
      }
    });
  });
}

