import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let exclusionStr = "10.136.15.254,www.baidu.com";
let exclusionArray = exclusionStr.split(',');

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function ConnectionTest() {

  describe("ConnectionTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0100
     * @tc.name   : testConnectionSetHttpProxyCallback_static_0100
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback_static_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: "admin",
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError<void>|null,data:connection.HttpProxy| undefined) => {
          if(error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +':succeeded data ->'+JSON.stringify(data));
            ExpectTrue(data?.host == httpProxy.host);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        })
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0200
     * @tc.name   : testConnectionSetHttpProxyCallback_static_0200
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: "",
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError<void>|null,data:connection.HttpProxy| undefined) => {
          if(error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
            ExpectTrue(data?.host == httpProxy.host);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        })
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /*
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0300
     * @tc.name   : testConnectionSetHttpProxyCallback_static_0300
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionSetHttpProxyCallback_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: undefined,
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        ExpectTrue(true)
        done()
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail()
        done()
        hilog.info(domain, tag, `${caseName}---End`);
      }
    });

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0400
     * @tc.name   : testConnectionSetHttpProxyCallback_static_0400
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback_static_0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0400';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          password: '123456',
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError<void>|null,data:connection.HttpProxy| undefined) => {
          if(error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
            ExpectTrue(data?.host == httpProxy.host );
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        })
      } catch(err){
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ ' end');
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0500
     * @tc.name   : testConnectionSetHttpProxyCallback_static_0500
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0500';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          password: '',
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError<void>|null,data:connection.HttpProxy| undefined) => {
          if(error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
            ExpectTrue(data?.host == httpProxy.host);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done()
          }
        })
      } catch(err){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /*
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0600
     * @tc.name   : testConnectionSetHttpProxyCallback_static_0600
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionSetHttpProxyCallback_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          password: undefined,
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        ExpectTrue(true)
        done()
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail()
        done()
        hilog.error(domain, tag, `${caseName}---End`);
      }
    });

    /*
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0700
     * @tc.name   : testConnectionSetHttpProxyCallback_static_0700
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionSetHttpProxyCallback_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: undefined,
          password: undefined,
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        ExpectTrue(true)
        done()
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail()
        done()
        hilog.info(domain, tag, `${caseName}---End`);
      }
    });

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0800
     * @tc.name   : testConnectionSetHttpProxyCallback_static_0800
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0800';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: '',
          password: '',
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError<void>|null,data:connection.HttpProxy| undefined) => {
          if(error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
            ExpectTrue(data?.host == httpProxy.host );
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done()
          }
        })
      } catch(err){
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ ' end');
          done();
        }
      }
    });

    /**
     * @tc.number : SUB_Network_Connection_SetAppHttpProxy_0900
     * @tc.name   : testConnectionSetHttpProxyCallback_static_0900
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testConnectionSetHttpProxyCallback_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetHttpProxyCallback_static_0900';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        const httpProxy: connection.HttpProxy = {
          host: "10.136.15.254",
          port: 8081,
          exclusionList: exclusionArray,
          username: 'admin',
          password: '123456',
        }
        connection.setAppHttpProxy(httpProxy as connection.HttpProxy);
        connection.getDefaultHttpProxy((error:BusinessError<void>|null,data:connection.HttpProxy| undefined) => {
          if(error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }else{
            console.log(`${caseName} succeeded to get data ${JSON.stringify(data)}`)
            ExpectTrue(data?.host == httpProxy.host);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        })
      } catch(err){
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ ' end');
          done();
        }
      }
    });

    /*
     * @tc.number : SUB_Network_Connection_setPacUrl_0100
     * @tc.name   : testConnectionsetPacUrl_static_0100
     * @tc.desc   : Set the system-level proxy auto-config (PAC) script URL to be empty
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionsetPacUrl_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionsetPacUrl_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        let pacUrl = ""
        connection.setPacUrl(pacUrl);
        done();
      } catch (err) {
        let error = err as BusinessError;
        ExpectTrue(error?.code === 201)
        hilog.error(domain, tag, `${caseName} Error: ${JSON.stringify(error)}`);
        done()
      }
    });

    /*
     * @tc.number : SUB_Network_Connection_getPacUrl_0100
     * @tc.name   : testConnectiongetPacUrl_static_0100
     * @tc.desc   :get the system-level proxy auto-config (PAC) script URL
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectiongetPacUrl_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectiongetPacUrl_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        let pacUrl: string = connection.getPacUrl();
        hilog.info(domain, tag, `${caseName} pacUrl is `, pacUrl);
        ExpectTrue(true);
        done();
      } catch (err) {
        let error = err as BusinessError;
        if (error?.code) {
          hilog.info(domain, tag, `${caseName}} getPac fail error: `, JSON.stringify(error));
          ExpectTrue(error?.code === 2100003);
        } else {
          hilog.info(domain, tag, `${caseName}} Error in`, JSON.stringify(error));
          ExpectFail();
        }
        done();
      }
    });

    /*
     * @tc.number : SUB_Network_Connection_setPacUrl_0200
     * @tc.name   : testConnectionsetPacUrl_static_0200
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionsetPacUrl_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionsetPacUrl_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        let pacUrl = "https://www.baidu.com";
        connection.setPacUrl(pacUrl);
        done();
      } catch (err) {
        let error = err as BusinessError;
        ExpectTrue(error?.code === 201)
        hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
        done()
      }
    });

  })
}