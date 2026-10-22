'use static';
import { describe, it, expect, Level, TestType, Size } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';
import hilog from '@ohos.hilog';
let domain: int = 0x0000;
let tag: string = 'connectionErrorCodeTag';


const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, ` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};


export default function ConnextionErrorCode(): void {
  describe('ConnextionErrorCode',  () => {
    /**
     * @tc.name   testConnectionGetAddressesByNameErrCo_static_0400
     * @tc.number SUB_Telephony_Connection_getAddressesByName_ErrCo_0400
     * @tc.desc   AddressesByName  Cannot connect to service
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testConnectionGetAddressesByNameErrCo_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      const caseName: string = 'testConnectionGetAddressesByNameErrCo_static_0400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        connection.getAddressesByName("www.dsfhkashdfasdfasdfsdf.com/sef/", (error: BusinessError | null, data: connection.NetAddress[] | undefined) => {
          if (error?.code !== 0) {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. Code:${error?.code}, message:${error?.message}`);
            ExpectTrue(error?.code === 2100002);
          }else {
            hilog.info(domain, tag, `${caseName} success to get addressta: ` + JSON.stringify(data));
            ExpectTrue(false);
          }
          done();
        });
      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    })

    /**
     * @tc.name   testConnectionGetAddressesByNameErrCo_static_0500
     * @tc.number SUB_Telephony_Connection_getAddressesByName_ErrCo_0500
     * @tc.desc   AddressesByName  Cannot connect to service
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testConnectionGetAddressesByNameErrCo_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      const caseName: string = 'testConnectionGetAddressesByNameErrCo_static_0500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        try {
          let data = await connection.getAddressesByName('as');
          hilog.info(domain, tag, `${caseName} success to get addressta: ` + JSON.stringify(data));
          ExpectTrue(false);
          done();
        } catch (error) {
          hilog.error(domain, tag, `${caseName} Failed to get addresses. Code:${error?.code}, message:${error?.message}`);
          ExpectTrue(error?.code === 2100002);
          done();
        }
      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    })

    /**
     * @tc.name   testConnectionGetAddressByNameErrC_static_0600
     * @tc.number SUB_Connection_GetAddressByName_ErrCo_0600
     * @tc.desc   getAddressByName Invalid parameter value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionGetAddressByNameErrC_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done:() => void): Promise<void> => {
      const caseName: string = 'testConnectionGetAddressByNameErrC_static_0600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          let netHandle = await connection.getDefaultNet();
          let host: string = "";
          netHandle.getAddressByName(host, (error: BusinessError | null, data: connection.NetAddress | undefined) => {
            if (error?.code !== 0) {
              hilog.info(domain, tag, `${caseName} Failed to get addresses. code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectTrue(error?.code === 2100001);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(false);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        } catch (error) {
          hilog.info(domain, tag, `${caseName} test failed error: ${JSON.stringify(error)}`);
          ExpectTrue(false);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testConnectionGetAddressByNameErrC_static_0700
     * @tc.number SUB_Connection_GetAddressByName_ErrC_0700
     * @tc.desc   getAddressByName Invalid parameter value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionGetAddressByNameErrC_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done:() => void): Promise<void> => {
      const caseName: string = 'testConnectionGetAddressByNameErrC_static_0700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          let netHandle = await connection.getDefaultNet();
          let host: string = "";
          try {
            let data = await netHandle.getAddressByName(host);
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(false);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag, `${caseName} Failed to get addresses. code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectTrue(error?.code === 2100001);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (error) {
          hilog.info(domain, tag, `${caseName} test failed error: ${JSON.stringify(error)}`);
          ExpectTrue(false);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetHandleGetAddressesByNameErrCo_static_0800
     * @tc.number SUB_NetHandle_GetAddressesByName_ErrCo_0800
     * @tc.desc   getAddressesByName Invalid parameter value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetHandleGetAddressesByNameErrCo_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetHandleGetAddressesByNameErrCo_static_0800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          let netHandle = await connection.getDefaultNet();
          let host: string = "";
          netHandle.getAddressesByName(host, (error: BusinessError | null, data: connection.NetAddress[] | undefined) => {
            if (error?.code !== 0) {
              hilog.info(domain, tag, `${caseName} Failed to get addresses.  code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
              ExpectTrue(error?.code === 2100001);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(false);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        } catch (error) {
          hilog.info(domain, tag, `${caseName} code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
          ExpectTrue(false);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetHandleGetAddressesByNameErrCo_static_0900
     * @tc.number SUB_NetHandle_GetAddressesByName_ErrCo_0900
     * @tc.desc   getAddressesByName Invalid parameter value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetHandleGetAddressesByNameErrCo_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetHandleGetAddressesByNameErrCo_static_0900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          let netHandle = await connection.getDefaultNet();
          let host: string = "";
          try {
            let data = await netHandle.getAddressesByName(host);
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(false);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (error) {
            hilog.info(domain, tag, `${caseName} Failed to get addresses.  code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
            ExpectTrue(error.code === 2100001);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (error) {
          hilog.info(domain, tag, `${caseName} code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
          ExpectTrue(false);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkMgrConnectionOnNetCap_static_0100
     * @tc.number SUB_NetworkMgr_Connection_On_NetCap_0100
     * @tc.desc   Subscription to network capability change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionOnNetCap_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done:() => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionOnNetCap_static_0100";
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        let netCon: connection.NetConnection = connection.createNetConnection();
        netCon.onNetCapabilitiesChange((data: connection.NetCapabilityInfo) => {
          hilog.info(domain, tag, "mona:" + data.netHandle)
          hilog.info(domain, tag, "mona:" + data.netCap)
          ExpectTrue(data.netHandle !== undefined)
          ExpectTrue(data.netCap !== undefined)
          hilog.info(domain, tag, `${caseName} Succeeded to get data:  + ${JSON.stringify(data)}`);
          done();
        });
         netCon.register((error: BusinessError | null) => {
           hilog.info(domain, tag, `${caseName} register start`)
           hilog.info(domain, tag, `${caseName} code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
         });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectTrue(false);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });
  })
}
