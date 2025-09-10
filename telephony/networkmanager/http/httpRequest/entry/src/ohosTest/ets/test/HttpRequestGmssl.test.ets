import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';

const ExpectFail = () => {
    try {
      expect().assertFail();
    } catch (err) {
      console.info(`exportFail failed err: ${JSON.stringify(err)}`);
    }
  }
  
  const ExpectTrue = (n: boolean) => {
    try {
      expect(n).assertTrue();
    } catch (err) {
      console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
    }
  }

  export default function HttpRequestGmssl() {
    describe('HttpRequestGmssl', () => {
    /* *
    * @tc.number:  SUB_NetworkMgr_HttpRequestGmssl_HttpRequestOptions_0100
    * @tc.name:    testNetworkMgrHttpRequestGmsslHttpRequestOptions0100
    * @tc.desc:    test performanceTiming
    * @tc.size:    SmallTest
    * @tc.type:    Function
    * @tc.level:   level 2
    */
    it('testNetworkMgrHttpRequestGmsslHttpRequestOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        const caseName: string = "testNetworkMgrHttpRequestGmsslHttpRequestOptions0100";
        console.info(`${caseName} test Start`);
        let clientCert: http.ClientCert = {
            certPath: '',
            keyPath:'',
            certType: http.CertType.PEM,
            keyPassword: ''
          };
          let clientEncCert: http.ClientCert = {
            certPath: '',
            keyPath: '',
            certType: http.CertType.PEM,
            keyPassword: ''
          };
          let sslType: http.SslType = 'TLS';
          let options: http.HttpRequestOptions = {
            sslType,
            caPath: '',
            clientCert,
            clientEncCert,
          };
        try {
          let httpRequest: http.HttpRequest = http.createHttp();
          httpRequest.request("https://www.baidu.com", options, (err: BusinessError, res: http.HttpResponse) => {
            if (err) {
              console.info(`${caseName} request fail, error code: ${err.code}, msg: ${err.message}`);
              httpRequest.destroy();
              ExpectFail();
              done();
            } else {
              console.info(`${caseName} res.performanceTiming:${JSON.stringify(res.performanceTiming)}`);
              ExpectTrue(res.responseCode == 200);
              httpRequest.destroy();
              done();
            }
          });
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          console.info(`${caseName} catch ERROR-->:${JSON.stringify(err)}`);
          ExpectFail();
          done();
        }
        console.info(`${caseName} test End`);
      });   
    })
}
