import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ConnectionTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err:BusinessError) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err:BusinessError) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function ConnectionPublicTest() {
  describe("ConnectionPublicTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNet_0100
     * @tc.name       : testNetworkMgrConnectionHasDefaultNet_static_0100
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionHasDefaultNet_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionHasDefaultNet_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.hasDefaultNet((error: BusinessError<void>|null, data: boolean| undefined) => {
          if (error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' hasDefaultNet: data ->'+data);
            ExpectTrue(data == true);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNet_0600
     * @tc.name       : testNetworkMgrConnectionHasDefaultNet_static_0600
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionHasDefaultNet_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionHasDefaultNet_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.hasDefaultNet().then((data: boolean) => {
          hilog.info(domain, tag, '%{public}s', caseName +': hasDefaultNet data ->'+data);
          ExpectTrue(data == true);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNetSync_0100
     * @tc.name       : testNetworkMgrConnectionHasDefaultNetSync_static_0100
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionHasDefaultNetSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionHasDefaultNetSync_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let isDefaultNet: boolean = connection.hasDefaultNetSync();
        ExpectTrue(isDefaultNet == true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });


    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0100
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_0100
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0200
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_0200
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          }
        });
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0300
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_0300
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          }
        }, 5000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0400
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_0400
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          }
        }, 10);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0500
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_0500
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          }
        }, -1000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0600
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_0600
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          }
        });
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0700
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_0700
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          }
        }, 5000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0800
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_0800
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          }
        }, 10);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_0900
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_0900
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          }
        }, -1000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1000
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_1000
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1000";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
          }
        });
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1100
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_1100
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
          }
        }, 5000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1200
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_1200
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
          }
        }, 10);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1300
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_1300
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET]
          }
        }, -1000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1400
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_1400
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_VPN]
          }
        });
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1500
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_1500
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_VPN]
          }
        }, 5000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1600
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_1600
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_VPN]
          }
        }, 10);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_CreateNetConnection_1700
     * @tc.name       : testNetworkMgrConnectionCreateNetConnection_static_1700
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionCreateNetConnection_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionCreateNetConnection_static_1700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_VPN]
          }
        }, -1000);
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNet_Callback_0100
     * @tc.name       : testNetworkMgrConnectionGetDefaultNetCallback_static_0100
     * @tc.desc       : test obtain the default activated data network and use the callback method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetDefaultNetCallback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultNetCallback_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet((err: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
           hilog.info(domain, tag, '%{public}s', caseName +' data -> '+JSON.stringify(data)+' err -> '+JSON.stringify(err));
          if (err?.code == 0) {
            ExpectTrue(true);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNet_Promise_0100
     * @tc.name       : testNetworkMgrConnectionGetDefaultNetPromise_static_0100
     * @tc.desc       : test obtain the default activated data network and use Promise as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetDefaultNetPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultNetPromise_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          let netBlockStatus: connection.NetBlockStatusInfo = {
            netHandle: data,
            blocked: true
          }
          hilog.info(domain, tag, '%{public}s', caseName +':getDefaultNet: data-'+JSON.stringify(data));
          ExpectTrue(typeof data.netId == 'int');
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNetSync_0100
     * @tc.name       : testNetworkMgrConnectionGetDefaultNetSync_static_0100
     * @tc.desc       : test use synchronization method to obtain default activated data network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetDefaultNetSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultNetSync_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        ExpectTrue(typeof netHandle.netId == 'int');
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Callback_0100
     * @tc.name       : testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0100
     * @tc.desc       : test obtain default proxy configuration information for the network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultHttpProxy((err: BusinessError<void>|null, data: connection.HttpProxy| undefined) => {
          hilog.info(domain, tag, '%{public}s', caseName +' getDefaultHttpProxy data -> '+JSON.stringify(data)+' err -> '+JSON.stringify(err));
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' getDefaultHttpProxy success ');
            ExpectTrue(data != undefined);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Callback_0200
     * @tc.name       : testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0200
     * @tc.desc       : test obtain default proxy configuration information for the network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyCallback_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then( async (netHandle: connection.NetHandle)=>{
          hilog.info(domain, tag, '%{public}s', caseName +': netHandle ->'+JSON.stringify(netHandle));
          connection.setAppNet(netHandle, (err: BusinessError<void>|null) => {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            if (err?.code != 0) {
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
          await Utils.msSleep(2000);
          connection.getDefaultHttpProxy((err: BusinessError<void>|null, data: connection.HttpProxy| undefined) => {
            hilog.info(domain, tag, '%{public}s', caseName +' data -> '+JSON.stringify(data)+' err -> '+JSON.stringify(err));
            ExpectTrue(data != undefined);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        })
      } catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultHttpProxy_Promise_0100
     * @tc.name       : testNetworkMgrConnectionGetDefaultHttpProxyPromise_static_0100
     * @tc.desc       : test obtain default proxy configuration information for the network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetDefaultHttpProxyPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultHttpProxyPromise_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultHttpProxy().then((data: connection.HttpProxy) => {
          hilog.info(domain, tag, '%{public}s', caseName +': getDefaultHttpProxy data ->'+JSON.stringify(data));
          ExpectTrue(data != undefined);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAllNets_0100
     * @tc.name       : testNetworkMgrConnectionGetAllNets_static_0100
     * @tc.desc       : Obtain a list of all connected networks and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetAllNets_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetAllNets_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getAllNets((error: BusinessError<void>|null, data: connection.NetHandle[]| undefined) => {
          if (error?.code == 0) {
            hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
            ExpectTrue(true);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAllNets_0500
     * @tc.name       : testNetworkMgrConnectionGetAllNets_static_0500
     * @tc.desc       : Obtain a list of all connected networks and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetAllNets_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetAllNets_static_0500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getAllNets().then((data: connection.NetHandle[]) => {
          hilog.info(domain, tag, '%{public}s', caseName +': getAllNets: success data->'+JSON.stringify(data));
          ExpectTrue(data.length >= 0);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAllNetsSync_0100
     * @tc.name       : testNetworkMgrConnectionGetAllNetsSync_static_0100
     * @tc.desc       : Use synchronization method to obtain a list of all connected networks.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetAllNetsSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetAllNetsSync_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle[] = connection.getAllNetsSync();
        hilog.info(domain, tag, '%{public}s', caseName +' GetAllNetsSync: success data->'+JSON.stringify(netHandle));
        ExpectTrue(netHandle.length >= 0);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });
    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0100
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties_static_0100
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code == 0) {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
              ExpectTrue(true);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
           let err = error as BusinessError;
           hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
           ExpectFail();
           hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0600
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties_static_0600
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0700
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties_static_0700
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +':getConnectionProperties  data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0800
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties_static_0800
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_1700
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties_static_1700
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 9999999;
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0900
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties_static_0900
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            let netConnectionProInfo: connection.NetConnectionPropertyInfo = {
              netHandle: netHandle,
              connectionProperties: data
            }
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
            ExpectTrue(data != undefined);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });
    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_1400
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties_static_1400
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_1500
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties_static_1500
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_1600
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties_static_1600
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +':  getConnectionProperties data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_1800
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties_static_1800
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_1800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 999999;
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0100
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync_static_0100
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': GetConnectionPropertiesSync data ->'+JSON.stringify(connectionProperties));
        ExpectTrue(connectionProperties != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });
    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0600
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync_static_0600
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 200;
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': GetConnectionPropertiesSync data ->'+JSON.stringify(connectionProperties));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0700
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync_static_0700
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 0;
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': GetConnectionPropertiesSync data ->'+JSON.stringify(connectionProperties));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0800
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync_static_0800
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 23;
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +':GetConnectionPropertiesSync data ->'+JSON.stringify(connectionProperties));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0900
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync_static_0900
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 999999;
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': GetConnectionPropertiesSync data ->'+JSON.stringify(connectionProperties));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0100
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities_static_0100
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getNetCapabilities(netHandle, (error: BusinessError<void>|null, data: connection.NetCapabilities| undefined) => {
            if (error?.code == 0) {
              hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilities data ->'+JSON.stringify(data));
              ExpectTrue(true);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0600
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities_static_0600
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.getNetCapabilities(netHandle, (error: BusinessError<void>|null, data: connection.NetCapabilities| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilities data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0700
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities_static_0700
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.getNetCapabilities(netHandle, (error: BusinessError<void>|null, data: connection.NetCapabilities| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +'callback: success data-> '+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0800
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities_static_0800
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.getNetCapabilities(netHandle, (error: BusinessError<void>|null, data: connection.NetCapabilities| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': callback: success data->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_1700
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities_static_1700
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 9999999;
          connection.getNetCapabilities(netHandle, (error: BusinessError<void>|null, data: connection.NetCapabilities| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
              ExpectTrue(error?.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0900
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities_static_0900
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            let netCapInfo: connection.NetCapabilityInfo= {
              netHandle: netHandle,
              netCap:data
            }
            hilog.info(domain, tag, '%{public}s', caseName +': GetNetCapabilities data ->'+JSON.stringify(data));
            ExpectTrue(data != undefined);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  GetNetCapabilities error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet: err->'+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });
    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_1400
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities_static_1400
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            hilog.info(domain, tag, '%{public}s', caseName +':GetNetCapabilities data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  GetNetCapabilities error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_1500
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities_static_1500
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            hilog.info(domain, tag, '%{public}s', caseName +':GetNetCapabilities  data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  GetNetCapabilities error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_1600
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities_static_1600
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            hilog.info(domain, tag, '%{public}s', caseName +':GetNetCapabilities data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  GetNetCapabilities error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_1800
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities_static_1800
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_1800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
         connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 999999;
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            hilog.info(domain, tag, '%{public}s', caseName +':GetNetCapabilities  data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  GetNetCapabilities error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0100
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync_static_0100
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle =  connection.getDefaultNetSync();
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilitiesSync data ->'+JSON.stringify(getNetCapAbilitiesSync));
        ExpectTrue(getNetCapAbilitiesSync != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });
    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0600
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync_static_0600
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 200;
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilitiesSync data ->'+JSON.stringify(getNetCapAbilitiesSync));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0700
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync_static_0700
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 0;
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilitiesSync data ->'+JSON.stringify(getNetCapAbilitiesSync));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0800
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync_static_0800
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 23;
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilitiesSync data ->'+JSON.stringify(getNetCapAbilitiesSync));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0900
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync_static_0900
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        netHandle.netId = 9999999;
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilitiesSync data ->'+JSON.stringify(getNetCapAbilitiesSync));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch(err:BusinessError){
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ ' end');
        done();
      }
    });
    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0100
     * @tc.name       : testNetworkMgrConnectionNetCap_static_0100
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_MMS == 0);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0200
     * @tc.name       : testNetworkMgrConnectionNetCap_static_0200
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_NOT_METERED == 11);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0300
     * @tc.name       : testNetworkMgrConnectionNetCap_static_0300
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_INTERNET == 12);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0400
     * @tc.name       : testNetworkMgrConnectionNetCap_static_0400
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_NOT_VPN == 15);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0500
     * @tc.name       : testNetworkMgrConnectionNetCap_static_0500
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_VALIDATED == 16);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0600
     * @tc.name       : testNetworkMgrConnectionNetCap_static_0600
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_PORTAL == 17);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCap_0700
     * @tc.name       : testNetworkMgrConnectionNetCap_static_0700
     * @tc.desc       : Specific network capabilities .
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionNetCap_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCap_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        ExpectTrue(connection.NetCap.NET_CAPABILITY_CHECKING_CONNECTIVITY == 31);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_HttpProxy_0100
     * @tc.name   : testNetworkMgrConnectionHttpProxy_static_0100
     * @tc.desc   : Network proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionHttpProxy_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionHttpProxy_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.setAppHttpProxy({
          host: '192.168.1.1',
          port: 8080,
          exclusionList: ['192.168', 'baidu.com'],
          username: 'admin',
          password: '123456'
        } as connection.HttpProxy);
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_HttpProxy_0200
     * @tc.name   : testNetworkMgrConnectionHttpProxy_static_0200
     * @tc.desc   : Network proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionHttpProxy_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionHttpProxy_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.setAppHttpProxy({
          host: '127.0.0.1',
          port: 8080,
          exclusionList: ['127.0', 'baidu.com'],
          username: 'admin',
          password: '123456'
        } as connection.HttpProxy);
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_HttpProxy_0300
     * @tc.name   : testNetworkMgrConnectionHttpProxy_static_0300
     * @tc.desc   : Network proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionHttpProxy_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionHttpProxy_static_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.setAppHttpProxy({
          host: '127.0.0.1',
          port: 8080,
          exclusionList: ['*'],
          username: 'admin',
          password: '123456'
        } as connection.HttpProxy);
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_HttpProxy_0400
     * @tc.name   : testNetworkMgrConnectionHttpProxy_static_0400
     * @tc.desc   : Network proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionHttpProxy_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionHttpProxy_static_0400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.setAppHttpProxy({
          host: '127.0.0.1',
          port: 8080,
          exclusionList: ['*'],
          username: undefined,
          password: undefined
        } as connection.HttpProxy);
        ExpectTrue(true);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCapabilities_0100
     * @tc.name       : testNetworkMgrConnectionNetCapabilities_static_0100
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetCapabilities_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCapabilities_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI, connection.NetBearType.BEARER_CELLULAR],
            networkCap: [connection.NetCap.NET_CAPABILITY_MMS,
              connection.NetCap.NET_CAPABILITY_NOT_METERED,
              connection.NetCap.NET_CAPABILITY_INTERNET,
              connection.NetCap.NET_CAPABILITY_NOT_VPN,
              connection.NetCap.NET_CAPABILITY_VALIDATED],
            linkUpBandwidthKbps: 0,
            linkDownBandwidthKbps: 0
          }
        });
        hilog.info(domain, tag, '%{public}s', caseName +':  netCon->'+JSON.stringify(netCon));
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCapabilities_0200
     * @tc.name       : testNetworkMgrConnectionNetCapabilities_static_0200
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetCapabilities_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCapabilities_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI, connection.NetBearType.BEARER_CELLULAR],
            networkCap: [connection.NetCap.NET_CAPABILITY_MMS,
              connection.NetCap.NET_CAPABILITY_NOT_METERED,
              connection.NetCap.NET_CAPABILITY_INTERNET,
              connection.NetCap.NET_CAPABILITY_NOT_VPN,
              connection.NetCap.NET_CAPABILITY_VALIDATED],
            linkUpBandwidthKbps: 9999999,
            linkDownBandwidthKbps: 9999999
          }
        });
        hilog.info(domain, tag, '%{public}s', caseName +': netCon-> ->'+JSON.stringify(netCon));
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCapabilities_0300
     * @tc.name       : testNetworkMgrConnectionNetCapabilities_static_0300
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetCapabilities_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCapabilities_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI],
          },
          bearerPrivateIdentifier: 'wifi'
        });
        hilog.info(domain, tag, '%{public}s', caseName +': netCon-> ->'+JSON.stringify(netCon));
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetCapabilities_0400
     * @tc.name       : testNetworkMgrConnectionNetCapabilities_static_0400
     * @tc.desc       : test create a NetConnection object
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetCapabilities_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetCapabilities_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netCon: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_ETHERNET],
          },
          bearerPrivateIdentifier: 'slot0'
        });
        hilog.info(domain, tag, '%{public}s', caseName +': netCon-> ->'+JSON.stringify(netCon));
        ExpectTrue(netCon != undefined);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0100
     * @tc.name       : testNetworkMgrConnectionConnectionProperties_static_0100
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.interfaceName == 'string');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0200
     * @tc.name       : testNetworkMgrConnectionConnectionProperties_static_0200
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.domains == 'string');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0300
     * @tc.name       : testNetworkMgrConnectionConnectionProperties_static_0300
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(data?.linkAddresses != undefined );
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0400
     * @tc.name       : testNetworkMgrConnectionConnectionProperties_static_0400
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(data?.routes != undefined );
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0500
     * @tc.name       : testNetworkMgrConnectionConnectionProperties_static_0500
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(data?.dnses != undefined );
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0600
     * @tc.name       : testNetworkMgrConnectionConnectionProperties_static_0600
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.mtu == 'int');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0700
     * @tc.name       : testNetworkMgrConnectionConnectionProperties_static_0700
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.interfaceName == 'string');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0800
     * @tc.name       : testNetworkMgrConnectionConnectionProperties_static_0800
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.domains == 'string');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_0900
     * @tc.name       : testNetworkMgrConnectionConnectionProperties_static_0900
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(data.linkAddresses.length >= 0);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_1000
     * @tc.name       : testNetworkMgrConnectionConnectionProperties_static_1000
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_1000";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(data.routes.length >= 0);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_1100
     * @tc.name       : testNetworkMgrConnectionConnectionProperties_static_1100
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_1100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(data.dnses.length >= 0);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_ConnectionProperties_1200
     * @tc.name       : testNetworkMgrConnectionConnectionProperties_static_1200
     * @tc.desc       : Network connection information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionConnectionProperties_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionConnectionProperties_static_1200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.mtu == 'int');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0200
     * @tc.name       : testNetworkMgrConnectionRouteInfo_static_0200
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].destination == 'object');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0300
     * @tc.name       : testNetworkMgrConnectionRouteInfo_static_0300
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].gateway == 'object');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0400
     * @tc.name       : testNetworkMgrConnectionRouteInfo_static_0400
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].hasGateway == 'boolean');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0500
     * @tc.name       : testNetworkMgrConnectionRouteInfo_static_0500
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].isDefaultRoute == 'boolean');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0700
     * @tc.name       : testNetworkMgrConnectionRouteInfo_static_0700
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].destination == 'object');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0800
     * @tc.name       : testNetworkMgrConnectionRouteInfo_static_0800
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0800";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].gateway == 'object');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_0900
     * @tc.name       : testNetworkMgrConnectionRouteInfo_static_0900
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_0900";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].hasGateway == 'boolean');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_RouteInfo_1000
     * @tc.name       : testNetworkMgrConnectionRouteInfo_static_1000
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRouteInfo_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRouteInfo_static_1000";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].isDefaultRoute == 'boolean');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_LinkAddress_0100
     * @tc.name       : testNetworkMgrConnectionLinkAddress_static_0100
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionLinkAddress_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionLinkAddress_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].destination.prefixLength == 'int');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_LinkAddress_0200
     * @tc.name       : testNetworkMgrConnectionLinkAddress_static_0200
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionLinkAddress_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionLinkAddress_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].destination.address == 'object');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_LinkAddress_0300
     * @tc.name       : testNetworkMgrConnectionLinkAddress_static_0300
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionLinkAddress_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionLinkAddress_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].destination.address == 'object');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_LinkAddress_0400
     * @tc.name       : testNetworkMgrConnectionLinkAddress_static_0400
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionLinkAddress_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionLinkAddress_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].destination.prefixLength == 'int');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetAddress_0100
     * @tc.name       : testNetworkMgrConnectionNetAddress_static_0100
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetAddress_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetAddress_static_0100";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(typeof data?.routes[0].destination.address.address == 'string');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetAddress_0200
     * @tc.name       : testNetworkMgrConnectionNetAddress_static_0200
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetAddress_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetAddress_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              ExpectTrue(data?.routes[0].destination.address.family == 1 || data?.routes[0].destination.address.family == 2);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetAddress_0300
     * @tc.name       : testNetworkMgrConnectionNetAddress_static_0300
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetAddress_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetAddress_static_0300";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
            if (error?.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties: BusinessError-> '+JSON.stringify(error));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: data->'+JSON.stringify(data));
              let portTypeof: string = typeof data?.routes[0]?.destination?.address?.port;
              hilog.info(domain, tag, '%{public}s', caseName +': portTypeof ->'+ portTypeof);
              ExpectTrue(portTypeof == 'int' || portTypeof == 'undefined');
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetAddress_0400
     * @tc.name       : testNetworkMgrConnectionNetAddress_static_0400
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetAddress_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetAddress_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(typeof data.routes[0].destination.address.address == 'string');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetAddress_0500
     * @tc.name       : testNetworkMgrConnectionNetAddress_static_0500
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetAddress_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetAddress_static_0500";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            ExpectTrue(data.routes[0].destination.address.family == 1 || data.routes[0].destination.address.family == 2);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_NetAddress_0600
     * @tc.name       : testNetworkMgrConnectionNetAddress_static_0600
     * @tc.desc       : Network routing information.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionNetAddress_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionNetAddress_static_0600";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties: success data ->'+JSON.stringify(data));
            let portTypeof: string = typeof data?.routes[0]?.destination?.address?.port;
            hilog.info(domain, tag, '%{public}s', caseName +': portTypeof ->'+ portTypeof);
            ExpectTrue(portTypeof == 'int' || portTypeof == 'undefined');
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_On_0100
     * @tc.name       : testNetworkMgrConnectionOn_static_0100
     * @tc.desc       : Subscribe to network available events.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionOn_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionOn_static_0100";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.register((error: BusinessError<void>|null) => {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            if (error?.code != 0) {
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } else {
                hilog.info(domain, tag, '%{public}s', caseName +' register success ');
            }
        });
        netCon.on('netAvailable', (data: connection.NetHandle) => {
            hilog.info(domain, tag, '%{public}s', caseName +' on netAvailable  success : '+JSON.stringify(data));
        });
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +' catch: err-> '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_On_0200
     * @tc.name       : testNetworkMgrConnectionOn_static_0200
     * @tc.desc       : Subscription to network capability change events.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionOn_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionOn_static_0200";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.register((error: BusinessError<void>|null) => {
            hilog.info(domain, tag, '%{public}s', caseName +'  register error is '+JSON.stringify(error));
            if (error?.code != 0) {
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } else {
                console.info(`${caseName}register success`);
            }
        });
        netCon.on('netCapabilitiesChange', (data: connection.NetCapabilityInfo) => {
            hilog.info(domain, tag, '%{public}s', caseName +' Succeeded to get data:  '+JSON.stringify(data));
        });
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +' catch: err-> '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_On_0300
     * @tc.name       : testNetworkMgrConnectionOn_static_0300
     * @tc.desc       : Subscription network connection information change events.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionOn_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionOn_static_0300";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.register((error: BusinessError<void>|null) => {
            hilog.info(domain, tag, '%{public}s', caseName +'  register error  '+JSON.stringify(error));
            if (error?.code != 0) {
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                done();
            } else {
                hilog.info(domain, tag, '%{public}s', caseName +' register success');

            }
        });
        netCon.on('netConnectionPropertiesChange', (data: connection.NetConnectionPropertyInfo) => {
            hilog.info(domain, tag, '%{public}s', caseName +' Succeeded to get data: ');
            console.info(`${caseName}  + ${JSON.stringify(data)}}`);
        });
        ExpectTrue(true);
        console.info(`${caseName}---End`);
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +' catch: err-> '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_Register_0100
     * @tc.name       : testNetworkMgrConnectionRegister_static_0100
     * @tc.desc       : test subscribe to notifications of specified network status changes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionRegister_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionRegister_static_0100";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.register((err: BusinessError<void>|null) => {
          hilog.info(domain, tag, '%{public}s', caseName +' register callback: '+JSON.stringify(err));
          if (err?.code != 0) {
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
        await Utils.msSleep(1000);
        netCon.unregister((error: BusinessError <void>|null) => {
          if (error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +' unregister fail error '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' unregister success ');
            ExpectTrue(true);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +' catch: err-> '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_Unregister_0600
     * @tc.name       : testNetworkMgrConnectionUnregister_static_0600
     * @tc.desc       : test unsubscribe from notifications of default network state changes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetworkMgrConnectionUnregister_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionUnregister_static_0600";
      console.info(`${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.unregister((err: BusinessError<void>|null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  unregister callback: '+JSON.stringify(err));
            ExpectTrue(err?.code == 2101007);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' unregister success ');
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +' catch: err-> '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /*
    * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_0100
    * @tc.name       : testNetworkMgrConnectionReportNetConnected_static_0100
    * @tc.desc       : Report to network management that the network is available
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it("testNetworkMgrConnectionReportNetConnected_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_0100";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetConnected(netHandle, (error: BusinessError<void>|null) => {
            if (error?.code) {
              hilog.error(domain, tag, `${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_0500
     * @tc.name       : testNetworkMgrConnectionReportNetConnected_static_0500
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionReportNetConnected_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_0500";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.reportNetConnected(netHandle, (error: BusinessError<void> | null, data) => {
            if (error) {
              hilog.error(domain, tag, `${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
              ExpectTrue(error?.code === 2101006);
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_0600
     * @tc.name       : testNetworkMgrConnectionReportNetConnected_static_0600
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionReportNetConnected_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_0600";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 50;
          connection.reportNetConnected(netHandle, (error: BusinessError<void> | null, data) => {
            if (error) {
              hilog.error(domain, tag, `${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
              ExpectTrue(error?.code === 2101006);
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_0700
     * @tc.name       : testNetworkMgrConnectionReportNetConnected_static_0700
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionReportNetConnected_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_0700";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetConnected(netHandle, (error: BusinessError<void> | null, data) => {
            if (error?.code) {
              hilog.error(domain, tag, `${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_0800
     * @tc.name       : testNetworkMgrConnectionReportNetConnected_static_0800
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionReportNetConnected_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_0800";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 9999;
          connection.reportNetConnected(netHandle, (error: BusinessError<void> | null, data) => {
            if (error) {
              hilog.error(domain, tag, `${caseName} reportNetConnected: BusinessError>${JSON.stringify(error)}`);
              ExpectTrue(error?.code === 2101006);
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_1000
     * @tc.name       : testNetworkMgrConnectionReportNetConnected_static_1000
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionReportNetConnected_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_1000";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetConnected(netHandle).then(() => {
            hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} reportNetConnected: err->${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_1400
     * @tc.name       : testNetworkMgrConnectionReportNetConnected_static_1400
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionReportNetConnected_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_1400";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.reportNetConnected(netHandle).then(() => {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, `${caseName} reportNetConnected: err->${JSON.stringify(err)}`);
            ExpectTrue(err?.code === 2101006);
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(err)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_1500
     * @tc.name       : testNetworkMgrConnectionReportNetConnected_static_1500
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionReportNetConnected_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_1500";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then(async (netHandle: connection.NetHandle) => {
          netHandle.netId = 50;
          await connection.reportNetConnected(netHandle).then(() => {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, `${caseName} reportNetConnected: err->${JSON.stringify(err)}`);
            ExpectTrue(err?.code === 2101006);
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_1600
     * @tc.name       : testNetworkMgrConnectionReportNetConnected_static_1600
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionReportNetConnected_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_1600";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then(async (netHandle: connection.NetHandle) => {
          if(netHandle.netId > 0){
            await connection.reportNetConnected(netHandle).then(() => {
              hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }).catch((error: Error) => {
              hilog.error(domain, tag, `${caseName} reportNetConnected: err->${JSON.stringify(error)}`);
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            });
          }else{
            hilog.info(domain, tag, `${caseName} connect: err->please link the network`);
            ExpectFail();
            done();
          }
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetConnected_1700
     * @tc.name       : testNetworkMgrConnectionReportNetConnected_static_1700
     * @tc.desc       : Report to network management that the network is available
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionReportNetConnected_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetConnected_static_1700";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then(async (netHandle: connection.NetHandle) => {
          netHandle.netId = 9999;
          await connection.reportNetConnected(netHandle).then(() => {
            hilog.info(domain, tag, `${caseName}: reportNetConnected: success`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, `${caseName} reportNetConnected: err->${JSON.stringify(err)}`);
            ExpectTrue(err?.code === 2101006);
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_0100
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected_static_0100
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionReportNetDisconnected_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_0100";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetDisconnected(netHandle, (err: BusinessError<void>|null, data) => {
            if (err?.code) {
              hilog.error(domain, tag, `${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(netHandle)}`);
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
              hilog.info(domain, tag, `${caseName} error1111>${JSON.stringify(err)}`);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_0500
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected_static_0500
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionReportNetDisconnected_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_0500";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.reportNetDisconnected(netHandle, (err: BusinessError<void>|null, data) => {
            if (err) {
              hilog.error(domain, tag, `${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(err)}`);
              ExpectTrue(err?.code === 2101006);
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_0600
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected_static_0600
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionReportNetDisconnected_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_0600";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 50;
          connection.reportNetDisconnected(netHandle, (err: BusinessError<void>|null, data) => {
            if (err) {
              hilog.error(domain, tag, `${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(err)}`);
              ExpectTrue(err?.code === 2101006);
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_0700
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected_static_0700
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionReportNetDisconnected_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_0700";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetDisconnected(netHandle, (err: BusinessError<void>|null, data) => {
            if (err?.code) {
              hilog.error(domain, tag, `${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(err)}`);
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_0800
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected_static_0800
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionReportNetDisconnected_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_0800";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 9999;
          connection.reportNetDisconnected(netHandle, (err: BusinessError<void>|null, data) => {
            if (err) {
              hilog.error(domain, tag, `${caseName} reportNetDisconnected: BusinessError>${JSON.stringify(err)}`);
              ExpectTrue(err?.code === 2101006);
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_1000
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected_static_1000
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionReportNetDisconnected_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_1000";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetDisconnected(netHandle).then(() => {
            hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} reportNetDisconnected: err->${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_1400
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected_static_1400
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionReportNetDisconnected_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_1400";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.reportNetDisconnected(netHandle).then(() => {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, `${caseName} reportNetDisconnected: err->${JSON.stringify(err)}`);
            ExpectTrue(err?.code === 2101006);
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_1500
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected_static_1500
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionReportNetDisconnected_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_1500";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 50;
          connection.reportNetDisconnected(netHandle).then(() => {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, `${caseName} reportNetDisconnected: err->${JSON.stringify(err)}`);
            ExpectTrue(err?.code === 2101006);
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_1600
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected_static_1600
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionReportNetDisconnected_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_1600";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.reportNetDisconnected(netHandle).then(() => {
            hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} reportNetDisconnected: err->${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_ReportNetDisconnected_1700
     * @tc.name       : testNetworkMgrConnectionReportNetDisconnected_static_1700
     * @tc.desc       : Report the network to network management as unavailable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionReportNetDisconnected_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionReportNetDisconnected_static_1700";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 9999;
          connection.reportNetDisconnected(netHandle).then(() => {
            hilog.info(domain, tag, `${caseName}: reportNetDisconnected: success`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, `${caseName} reportNetDisconnected: err->${JSON.stringify(err)}`);
            ExpectTrue(err?.code === 2101006);
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_IsDefaultNetMetered_Callback_0100
     * @tc.name       : testNetworkMgrConnectionIsDefaultNetMeteredCallback_static_0100
     * @tc.desc       : test check if the data traffic usage on the current network is being measured and use the callback method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionIsDefaultNetMeteredCallback_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredCallback_static_0100";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        connection.isDefaultNetMetered((err: BusinessError<void>|null, data: boolean|undefined) => {
          hilog.info(domain, tag, `${caseName} isDefaultNetMetered callback: err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
          if (err?.code) {
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          } else {
            ExpectTrue(data === true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_IsDefaultNetMetered_Promise_0100
     * @tc.name       : testNetworkMgrConnectionIsDefaultNetMeteredPromise_static_0100
     * @tc.desc       : test check if the data traffic usage on the current network is being measured and use Promise as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionIsDefaultNetMeteredPromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredPromise_static_0100";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        connection.isDefaultNetMetered().then((data: boolean) => {
          hilog.info(domain, tag, `${caseName} isDefaultNetMetered: data->${JSON.stringify(data)}`);
          ExpectTrue(data === true);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((err: Error) => {
          hilog.error(domain, tag, `${caseName} isDefaultNetMetered: err->${JSON.stringify(err)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_Connection_IsDefaultNetMeteredSync_0100
     * @tc.name       : testNetworkMgrConnectionIsDefaultNetMeteredSync_static_0100
     * @tc.desc       : test check if the data traffic usage on the current network is being measured and return it using synchronous mode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionIsDefaultNetMeteredSync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionIsDefaultNetMeteredSync_static_0100";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let isMetered: boolean = connection.isDefaultNetMeteredSync();
        ExpectTrue(isMetered === true);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAppNet_0100
     * @tc.name       : testNetworkMgrConnectionGetAppNet_static_0100
     * @tc.desc       : Obtain network information bound to the app and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionGetAppNet_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetAppNet_static_0100";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        connection.getAppNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code) {
            hilog.error(domain, tag, `${caseName} callback: err->${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} callback: success data->${JSON.stringify(data)}`);
            ExpectTrue(data !== undefined);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAppNet_0500
     * @tc.name       : testNetworkMgrConnectionGetAppNet_static_0500
     * @tc.desc       : Obtain network information bound to the app and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionGetAppNet_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetAppNet_static_0500";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        connection.getAppNet().then((data: connection.NetHandle) => {
          hilog.info(domain, tag, `${caseName} getAppNet: success data->${JSON.stringify(data)}`);
          ExpectTrue(data !== undefined);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getAppNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_ConnectionGetAppNetSync_0100
     * @tc.name       : testNetworkMgrConnectionGetAppNetSync_static_0100
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionGetAppNetSync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetAppNetSync_static_0100";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getAppNetSync();
        hilog.info(domain, tag, `${caseName} GetAppNetSync: success data->${JSON.stringify(netHandle)}`);
        ExpectTrue(netHandle !== undefined);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_0100
     * @tc.name       : testNetworkMgrConnectionSetAppNet_static_0100
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionSetAppNet_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet_static_0100";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, netHandle: connection.NetHandle|undefined) => {
          if (error?.code) {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            if(netHandle !== undefined){
              connection.setAppNet(netHandle, (err: BusinessError<void>|null, data) => {
                hilog.info(domain, tag, `${caseName} SetAppNet: err->${JSON.stringify(err)}`);
                if (err?.code) {
                  hilog.error(domain, tag, `${caseName} SetAppNet: err->${JSON.stringify(err)}`);
                  ExpectFail();
                  hilog.error(domain, tag, `${caseName}---End`);
                  done();
                } else {
                  hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_0600
     * @tc.name       : testNetworkMgrConnectionSetAppNet_static_0600
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionSetAppNet_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet_static_0600";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, netHandle: connection.NetHandle|undefined) => {
          if(netHandle !== undefined){
            netHandle.netId = 200;
          }
          if (error?.code) {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            if(netHandle !== undefined){
              connection.setAppNet(netHandle, (error: BusinessError<void>|null, data) => {
                hilog.info(domain, tag, `${caseName} SetAppNet: error->${JSON.stringify(error)}`);
                if (error?.code) {
                  hilog.error(domain, tag, `${caseName} SetAppNet: error->${JSON.stringify(error)}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } else {
                  hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_0700
     * @tc.name       : testNetworkMgrConnectionSetAppNet_static_0700
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionSetAppNet_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet_static_0700";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, netHandle: connection.NetHandle|undefined) => {
          if(netHandle !== undefined){
            netHandle.netId = 0;
          }
          if (error?.code) {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            if(netHandle !== undefined){
              connection.setAppNet(netHandle, (error: BusinessError<void>|null, data) => {
                hilog.info(domain, tag, `${caseName} SetAppNet: error->${JSON.stringify(error)}`);
                if (error?.code) {
                  hilog.error(domain, tag, `${caseName} SetAppNet: error->${JSON.stringify(error)}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } else {
                  hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_0800
     * @tc.name       : testNetworkMgrConnectionSetAppNet_static_0800
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionSetAppNet_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet_static_0800";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, netHandle: connection.NetHandle|undefined) => {
          if(netHandle !== undefined){
            netHandle.netId = 23;
          }
          if (error?.code) {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            if(netHandle !== undefined){
              connection.setAppNet(netHandle, (error: BusinessError<void>|null, data) => {
                if (error?.code) {
                  hilog.error(domain, tag, `${caseName} SetAppNet: error->${JSON.stringify(error)}`);
                  ExpectTrue(error?.code === 2100001);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } else {
                  hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_1700
     * @tc.name       : testNetworkMgrConnectionSetAppNet_static_1700
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionSetAppNet_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet_static_1700";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, netHandle: connection.NetHandle|undefined) => {
          if(netHandle !== undefined){
            netHandle.netId = 99999999;
          }
          if (error?.code) {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            if(netHandle !== undefined){
              connection.setAppNet(netHandle, (error: BusinessError<void>|null, data) => {
                if (error?.code) {
                  hilog.error(domain, tag, `${caseName} SetAppNet: error->${JSON.stringify(error)}`);
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                } else {
                  hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(data)}`);
                  ExpectTrue(true);
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }
              });
            }
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_0900
     * @tc.name       : testNetworkMgrConnectionSetAppNet_static_0900
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it("testNetworkMgrConnectionSetAppNet_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet_static_0900";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.setAppNet(netHandle).then(() => {
            hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} SetAppNet: err->${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_1400
     * @tc.name       : testNetworkMgrConnectionSetAppNet_static_1400
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionSetAppNet_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet_static_1400";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 200;
          connection.setAppNet(netHandle).then(() => {
            hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} SetAppNet: err->${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_1500
     * @tc.name       : testNetworkMgrConnectionSetAppNet_static_1500
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionSetAppNet_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet_static_1500";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 0;
          connection.setAppNet(netHandle).then(() => {
            hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} SetAppNet: err->${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_1600
     * @tc.name       : testNetworkMgrConnectionSetAppNet_static_1600
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionSetAppNet_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet_static_1600";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 23;
          connection.setAppNet(netHandle).then(() => {
            hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, `${caseName} SetAppNet: err->${JSON.stringify(err)}`);
            ExpectTrue(err?.code === 2100001);
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number     : SUB_NetworkMgr_ConnectionSetAppNet_1800
     * @tc.name       : testNetworkMgrConnectionSetAppNet_static_1800
     * @tc.desc       : Bind the app to the specified network, and the bound app can only access the external network through the specified network. Use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("testNetworkMgrConnectionSetAppNet_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionSetAppNet_static_1800";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          netHandle.netId = 99999999;
          connection.setAppNet(netHandle).then(() => {
            hilog.info(domain, tag, `${caseName} SetAppNet: success data->${JSON.stringify(netHandle)}`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} SetAppNet: err->${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} getDefaultNet: err->${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0100
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_0100
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressByName_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.getAddressByName(host, (error: BusinessError<void>|null, data: connection.NetAddress|undefined) => {
            hilog.info(domain, tag, `${caseName} error: ${JSON.stringify(error)} data: ${JSON.stringify(data)}`);
            if (error?.code) {
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)}`);
              ExpectTrue(data?.address === host);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0200
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_0200
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressByName_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "xxxx";
          netHandle.getAddressByName(host, (error: BusinessError<void>|null, data: connection.NetAddress|undefined) => {
            if (error?.code) {
              hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectTrue(error?.code === 2100002);
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0500
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_0500
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressByName_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_0500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.getAddressByName(host).then((data: connection.NetAddress) => {
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data.address === host);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0600
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_0600
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_0600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "xxxx";
          netHandle.getAddressByName(host).then((data: connection.NetAddress) => {
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(err)}`);
            ExpectTrue(err?.code === 2100002);
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_0900
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_0900
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressByName_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_0900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.getAddressByName(host, (error: BusinessError<void>|null, data: connection.NetAddress|undefined) => {
            hilog.info(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
            if (error?.code) {
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)}`);
              ExpectTrue(data?.address === host);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1000
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_1000
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressByName_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.getAddressByName(host).then((data: connection.NetAddress) => {
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data?.address === host);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1100
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_1100
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressByName_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 0;
          netHandle.getAddressByName(host, (error: BusinessError<void>|null, data: connection.NetAddress|undefined) => {
            hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            if (error?.code) {
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              ExpectTrue(data?.address === host);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1200
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_1200
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressByName_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 23;
          netHandle.getAddressByName(host, (error: BusinessError<void>|null, data: connection.NetAddress|undefined) => {
            hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            if (error?.code) {
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              ExpectTrue(data?.address === host);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1300
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_1300
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressByName_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 200;
          netHandle.getAddressByName(host, (error: BusinessError<void>|null, data: connection.NetAddress|undefined) => {
            hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            if (error?.code) {
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              ExpectTrue(data?.address === host);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1400
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_1400
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressByName_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 999999;
          netHandle.getAddressByName(host, (error: BusinessError<void>|null, data: connection.NetAddress|undefined) => {
            hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)} error: ${JSON.stringify(error)}`);
            if (error?.code) {
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              ExpectTrue(data?.address === host);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1500
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_1500
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressByName_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 0;
          netHandle.getAddressByName(host).then((data: connection.NetAddress) => {
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data?.address === host);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1600
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_1600
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressByName_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 23;
          netHandle.getAddressByName(host).then((data: connection.NetAddress) => {
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data?.address === host);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1700
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_1700
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressByName_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 200;
          netHandle.getAddressByName(host).then((data: connection.NetAddress) => {
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data?.address === host);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
      * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_1800
      * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressByName_static_1800
      * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
      * @tc.level  : Level 3
      * @tc.type   : Function
      * @tc.size   : MediumTest
      */
    it("testNetworkMgrConnectionNetHandleGetAddressByName_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_1800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 999999;
          netHandle.getAddressByName(host).then((data: connection.NetAddress) => {
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data?.address === host);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0100
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_0100
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.getAddressesByName(host, (error: BusinessError<void>|null, data: Array<connection.NetAddress>|undefined) => {
            hilog.info(domain, tag, `${caseName}---error: ${JSON.stringify(error)}`);
            if (error?.code) {
              hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)}`);
              if (data !== undefined) {
                ExpectTrue(data[0]?.address === host);
              }
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0200
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_0200
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "xxxx";
          netHandle.getAddressesByName(host, (error: BusinessError<void>|null, data: Array<connection.NetAddress>|undefined) => {
            if (error?.code) {
              hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectTrue(error?.code === 2100002);
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0500
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_0500
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_0500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[]) => {
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data[0].address===host);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0600
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_0600
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_0600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "xxxx";
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[]) => {}).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} Failed to get addresses. err:${JSON.stringify(err)}`);
            ExpectTrue(err?.code === 2100002);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_0900
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_0900
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_0900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.getAddressesByName(host, (error: BusinessError<void>|null, data: Array<connection.NetAddress>|undefined) => {
            if (error?.code) {
              hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)}`);
              if (data !== undefined) {
                ExpectTrue(data[0]?.address === host);
              }
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1000
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_1000
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[]) => {
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data[0].address === host);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1100
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_1100
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.netId = 0;
          netHandle.getAddressesByName(host, (error: BusinessError<void>|null, data: Array<connection.NetAddress>|undefined) => {
            if (error?.code) {
              hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)}`);
              if (data !== undefined) {
                ExpectTrue(data[0]?.address === host);
              }
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1200
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_1200
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.netId = 23;
          netHandle.getAddressesByName(host, (error: BusinessError<void>|null, data: Array<connection.NetAddress>|undefined) => {
            if (error?.code) {
              hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)}`);
              if (data !== undefined) {
                ExpectTrue(data[0]?.address === host);
              }
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1300
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_1300
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.netId = 200;
          netHandle.getAddressesByName(host, (error: BusinessError<void>|null, data: Array<connection.NetAddress>|undefined) => {
            if (error?.code) {
              hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)}`);
              if (data !== undefined) {
                ExpectTrue(data[0]?.address === host);
              }
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1400
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_1400
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "192.168.1.1";
          netHandle.netId = 999999;
          netHandle.getAddressesByName(host, (error: BusinessError<void>|null, data: Array<connection.NetAddress>|undefined) => {
            if (error?.code) {
              hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}  data:${JSON.stringify(data)}`);
              if (data !== undefined) {
                ExpectTrue(data[0]?.address === host);
              }
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1500
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_1500
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 0;
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[]) => {
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data[0].address===host);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1600
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_1600
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 23;
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[]) => {
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data[0].address===host);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1700
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_1700
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 200;
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[]) => {
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data[0].address===host);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_1800
     * @tc.name   : testNetworkMgrConnectionNetHandleGetAddressesByName_static_1800
     * @tc.desc   : Use the corresponding network to resolve the host name and obtain all IP addresses.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionNetHandleGetAddressesByName_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_1800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "127.0.0.1";
          netHandle.netId = 999999;
          netHandle.getAddressesByName(host).then((data: connection.NetAddress[]) => {
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data[0].address===host);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_SetAppHttpProxy_0100
     * @tc.name   : testNetworkMgrConnectionSetAppHttpProxy_static_0100
     * @tc.desc   : Set network application level HTTP proxy configuration information.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionSetAppHttpProxy_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionSetAppHttpProxy_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.setAppHttpProxy({
          host: "192.168.1.1",
          port: 8080,
          exclusionList: ['192.168', 'baidu.com']
        } as connection.HttpProxy);
        ExpectTrue(true);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_AddCustomDnsRule_0100
     * @tc.name   : testNetworkMgrConnectionAddCustomDnsRule_static_0100
     * @tc.desc   : Add a custom host and corresponding IP address mapping for the current application.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionAddCustomDnsRule_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"], (error: BusinessError<void>|null, data) => {
          hilog.error(domain, tag, `${caseName} error：${JSON.stringify(error)}`);
          if (error?.code) {
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          } else {
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_AddCustomDnsRule_0400
     * @tc.name   : testNetworkMgrConnectionAddCustomDnsRule_static_0400
     * @tc.desc   : Add a custom host and corresponding IP address mapping for the current application.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionAddCustomDnsRule_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionAddCustomDnsRule_static_0400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then((data) => {
          hilog.error(domain, tag, `${caseName}`);
          ExpectTrue(true);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} error:${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_RemoveCustomDnsRule_0400
     * @tc.name   : testNetworkMgrConnectionRemoveCustomDnsRule_static_0400
     * @tc.desc   : Delete custom DNS rules for the corresponding host in the current application.Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionRemoveCustomDnsRule_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionRemoveCustomDnsRule_static_0400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          connection.removeCustomDnsRule("192.168.1.1").then((data) => {
            hilog.error(domain, tag, `${caseName} error`);
            ExpectTrue(true);
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} addCustomDnsRule error:${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_ClearCustomDnsRules_0100
     * @tc.name   : testNetworkMgrConnectionClearCustomDnsRules_static_0100
     * @tc.desc   : Delete all custom DNS rules for the current application.Using callback as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionClearCustomDnsRules_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionClearCustomDnsRules_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          connection.clearCustomDnsRules((error: BusinessError<void>|null, data) => {
            hilog.info(domain, tag, `${caseName} error：${JSON.stringify(error)}`);
            if (error?.code) {
              ExpectFail();
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} addCustomDnsRule error:${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetworkMgr_Connection_ClearCustomDnsRules_0200
     * @tc.name   : testNetworkMgrConnectionClearCustomDnsRules_static_0200
     * @tc.desc   : Delete all custom DNS rules for the current application . Using promise as an asynchronous method.
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetworkMgrConnectionClearCustomDnsRules_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionClearCustomDnsRules_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          connection.clearCustomDnsRules().then((data) => {
            hilog.info(domain, tag, `${caseName}`);
            ExpectTrue(true);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((error: Error) => {
            hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
            ExpectFail();
            hilog.error(domain, tag, `${caseName}---End`);
            done();
          });
        }).catch((error: Error) => {
          hilog.error(domain, tag, `${caseName} addCustomDnsRule error:${JSON.stringify(error)}`);
          ExpectFail();
          hilog.error(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

  })
}