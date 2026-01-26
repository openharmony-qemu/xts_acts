import { describe, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { connection } from '@kit.NetworkKit';
import assertFail from '@ohos/hypium/src/main/module/assert/assertFail';


const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};
function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}


export default function GetAddressesByNameWithOptionsTest() {
  describe('GetAddressesByNameWithOptionsTest',  () => {
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions0100
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_0100
     * @tc.desc    Use the corresponding network to resolve the host name and obtain all IP addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions0100';
      console.info(`${caseName}---Start`);
      connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
        let host: string = "www.baidu.com";
        let familyType: connection.FamilyType = connection.FamilyType.FAMILY_TYPE_ALL
        netHandle.getAddressesByNameWithOptions(host,{family:familyType}).then((data: connection.NetAddress[])=>{
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          let ipv4Count = 0;
          let ipv6Count = 0;
          data.forEach((addr)=>{
            if (addr.family == connection.FamilyType.FAMILY_TYPE_IPV4) {
              ipv4Count++;
            } else if (addr.family == connection.FamilyType.FAMILY_TYPE_IPV6) {
              ipv6Count++;
            } else {
              console.error(`unknown family type ${addr.family}`);
              expect().assertFail();
            }
          })
          expect(ipv4Count).assertLarger(0);
          expect(ipv6Count).assertLarger(0);
          console.info(`${caseName}---End`);
          done();
        })
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions0200
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_0200
     * @tc.desc    Use the corresponding network to resolve the host name and obtain IPv4 addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions0200';
      console.info(`${caseName}---Start`);
      connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
        let host: string = "www.baidu.com";
        let familyType: connection.FamilyType = connection.FamilyType.FAMILY_TYPE_IPV4
        netHandle.getAddressesByNameWithOptions(host,{family:familyType}).then((data: connection.NetAddress[])=>{
          let ipv4Count = 0;
          data.forEach((addr)=>{
            if (addr.family == connection.FamilyType.FAMILY_TYPE_IPV4) {
              ipv4Count++;
            } else if (addr.family == connection.FamilyType.FAMILY_TYPE_IPV6) {
              console.error(`unexpected IPV6 result`);
              expect().assertFail();
            } else {
              console.error(`unknown family type ${addr.family}`);
              expect().assertFail();
            }
          })
          expect(ipv4Count).assertLarger(0);
          console.info(`${caseName}---End`);
          done();
        });
      });
    });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions0300
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_0300
     * @tc.desc    Use the corresponding network to resolve the host name and obtain IPv6 addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions0300';
      console.info(`${caseName}---Start`);
    
      connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
        let host: string = "www.baidu.com";
        let familyType: connection.FamilyType = connection.FamilyType.FAMILY_TYPE_IPV6
        netHandle.getAddressesByNameWithOptions(host,{family:familyType}).then((data: connection.NetAddress[])=>{
          let ipv6Count = 0;
          data.forEach((addr)=>{
            if (addr.family == connection.FamilyType.FAMILY_TYPE_IPV4) {
              console.error(`unexpected IPV4 result`);
              expect().assertFail();
            } else if (addr.family == connection.FamilyType.FAMILY_TYPE_IPV6) {
              ipv6Count++;
            } else {
              console.error(`unknown family type ${addr.family}`);
              expect().assertFail();
            }
          })
          expect(ipv6Count).assertLarger(0);
          console.info(`${caseName}---End`);
          done();
        });
      });
    });
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions0400
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_0400
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions0400';
      console.info(`${caseName}---Start`);
      connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
        let host: string = "www.baidu.com";
        netHandle.getAddressesByNameWithOptions(host, undefined).then((data: connection.NetAddress[])=>{
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expect().assertFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError)=> {
          console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
          expect(error.code).assertEqual(2100001);
          console.info(`${caseName}---End`);
          done();
        });
      });
    });
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions0500
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_0500
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions0500';
      console.info(`${caseName}---Start`);
      connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
        let host: string = "www.baidu.com";
        netHandle.getAddressesByNameWithOptions(host, null).then((data: connection.NetAddress[])=>{
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expect().assertFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError)=> {
          console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
          ExpectTrue(error.code == 2100001);
          console.info(`${caseName}---End`);
          done();
        });
      });
    });
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions0600
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_0600
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions0600';
      console.info(`${caseName}---Start`);
      connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
        let host: string = "www.baidu.com";
        netHandle.getAddressesByNameWithOptions(host, { family: -1 }).then((data: connection.NetAddress[])=>{
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expect().assertFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError)=> {
          console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
          ExpectTrue(error.code == 2100001);
          console.info(`${caseName}---End`);
          done();
        });
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions0700
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_0700
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions0700';
      console.info(`${caseName}---Start`);
      connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
        let host: string = "www.baidu.com";
        netHandle.getAddressesByNameWithOptions(host, { family: 3 }).then((data: connection.NetAddress[])=>{
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expect().assertFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError)=> {
          console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
          ExpectTrue(error.code == 2100001);
          console.info(`${caseName}---End`);
          done();
        });
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions0800
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_0800
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions0800';
      console.info(`${caseName}---Start`);
      connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
        let host: string = "";
        netHandle.getAddressesByNameWithOptions(host, { family: connection.FamilyType.FAMILY_TYPE_ALL }).then((data: connection.NetAddress[])=>{
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expect().assertFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError)=> {
          console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
          ExpectTrue(error.code == 2100001);
          console.info(`${caseName}---End`);
          done();
        });
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions0900
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_0900
     * @tc.desc    Use the corresponding network to resolve the host name and obtain all IP addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions0900';
      console.info(`${caseName}---Start`);
      let host: string = "www.baidu.com";
      let familyType: connection.FamilyType = connection.FamilyType.FAMILY_TYPE_ALL
      connection.getAddressesByNameWithOptions(host,{family:familyType}).then((data: connection.NetAddress[])=>{
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        let ipv4Count = 0;
        let ipv6Count = 0;
        data.forEach((addr)=>{
          if (addr.family == connection.FamilyType.FAMILY_TYPE_IPV4) {
            ipv4Count++;
          } else if (addr.family == connection.FamilyType.FAMILY_TYPE_IPV6) {
            ipv6Count++;
          } else {
            console.error(`unknown family type ${addr.family}`);
            expect().assertFail();
          }
        })
        expect(ipv4Count).assertLarger(0);
        expect(ipv6Count).assertLarger(0);
        console.info(`${caseName}---End`);
        done();
      })
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions1000
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_1000
     * @tc.desc    Use the corresponding network to resolve the host name and obtain IPv4 addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions1000';
      console.info(`${caseName}---Start`);
      let host: string = "www.baidu.com";
      let familyType: connection.FamilyType = connection.FamilyType.FAMILY_TYPE_IPV4
      connection.getAddressesByNameWithOptions(host,{family:familyType}).then((data: connection.NetAddress[])=>{
        let ipv4Count = 0;
        data.forEach((addr)=>{
          if (addr.family == connection.FamilyType.FAMILY_TYPE_IPV4) {
            ipv4Count++;
          } else if (addr.family == connection.FamilyType.FAMILY_TYPE_IPV6) {
            console.error(`unexpected IPV6 result`);
            expect().assertFail();
          } else {
            console.error(`unknown family type ${addr.family}`);
            expect().assertFail();
          }
        })
        expect(ipv4Count).assertLarger(0);
        console.info(`${caseName}---End`);
        done();
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions1100
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_1100
     * @tc.desc    Use the corresponding network to resolve the host name and obtain IPv6 addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions1100';
      console.info(`${caseName}---Start`);
      let host: string = "www.baidu.com";
      let familyType: connection.FamilyType = connection.FamilyType.FAMILY_TYPE_IPV6
      connection.getAddressesByNameWithOptions(host,{family:familyType}).then((data: connection.NetAddress[])=>{
        let ipv6Count = 0;
        data.forEach((addr)=>{
          if (addr.family == connection.FamilyType.FAMILY_TYPE_IPV4) {
            console.error(`unexpected IPV4 result`);
            expect().assertFail();
          } else if (addr.family == connection.FamilyType.FAMILY_TYPE_IPV6) {
            ipv6Count++;
          } else {
            console.error(`unknown family type ${addr.family}`);
            expect().assertFail();
          }
        })
        expect(ipv6Count).assertLarger(0);
        console.info(`${caseName}---End`);
        done();
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions1200
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_1200
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions1200';
      console.info(`${caseName}---Start`);
      let host: string = "www.baidu.com";
      connection.getAddressesByNameWithOptions(host, undefined).then((data: connection.NetAddress[])=>{
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        expect().assertFail();
        console.info(`${caseName}---End`);
        done();
      }).catch((error: BusinessError)=> {
        console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
        expect(error.code).assertEqual(2100001);
        console.info(`${caseName}---End`);
        done();
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions1300
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_1300
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions1300';
      console.info(`${caseName}---Start`);
      let host: string = "www.baidu.com";
      connection.getAddressesByNameWithOptions(host, null).then((data: connection.NetAddress[])=>{
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        expect().assertFail();
        console.info(`${caseName}---End`);
        done();
      }).catch((error: BusinessError)=> {
        console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
        ExpectTrue(error.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions1400
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_1400
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions1400';
      console.info(`${caseName}---Start`);
      let host: string = "www.baidu.com";
      connection.getAddressesByNameWithOptions(host, { family: -1 }).then((data: connection.NetAddress[])=>{
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        expect().assertFail();
        console.info(`${caseName}---End`);
        done();
      }).catch((error: BusinessError)=> {
        console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
        ExpectTrue(error.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions1500
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_1500
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions1500';
      console.info(`${caseName}---Start`);
      let host: string = "www.baidu.com";
      connection.getAddressesByNameWithOptions(host, { family: 3 }).then((data: connection.NetAddress[])=>{
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        expect().assertFail();
        console.info(`${caseName}---End`);
        done();
      }).catch((error: BusinessError)=> {
        console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
        ExpectTrue(error.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions1600
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_1600
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions1600';
      console.info(`${caseName}---Start`);
      let host: string = "";
      connection.getAddressesByNameWithOptions(host, { family: connection.FamilyType.FAMILY_TYPE_ALL }).then((data: connection.NetAddress[])=>{
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        expect().assertFail();
        console.info(`${caseName}---End`);
        done();
      }).catch((error: BusinessError)=> {
        console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
        ExpectTrue(error.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions1700
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_1700
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions1700';
      console.info(`${caseName}---Start`);
      connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
        let host = null;
        netHandle.getAddressesByNameWithOptions(host, { family: connection.FamilyType.FAMILY_TYPE_ALL }).then((data: connection.NetAddress[])=>{
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expect().assertFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError)=> {
          console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
          ExpectTrue(error.code == 2100001);
          console.info(`${caseName}---End`);
          done();
        });
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions1800
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_1800
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions1800';
      console.info(`${caseName}---Start`);
      connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
        let host = undefined;
        netHandle.getAddressesByNameWithOptions(host, { family: connection.FamilyType.FAMILY_TYPE_ALL }).then((data: connection.NetAddress[])=>{
          console.info(`${caseName} data: ${JSON.stringify(data)}`);
          expect().assertFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError)=> {
          console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
          ExpectTrue(error.code == 2100001);
          console.info(`${caseName}---End`);
          done();
        });
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions1900
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_1900
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions1900';
      console.info(`${caseName}---Start`);
      let host = null;
      connection.getAddressesByNameWithOptions(host, { family: connection.FamilyType.FAMILY_TYPE_ALL }).then((data: connection.NetAddress[])=>{
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        expect().assertFail();
        console.info(`${caseName}---End`);
        done();
      }).catch((error: BusinessError)=> {
        console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
        ExpectTrue(error.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      });
    });
    
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions2000
     * @tc.number  SUB_Connection_GetAddressesByNameWithOptions_2000
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 , async (done: Function) => {
      const caseName: string = 'testConnectionGetAddressesByNameWithOptions2000';
      console.info(`${caseName}---Start`);
      let host = undefined;
      connection.getAddressesByNameWithOptions(host, { family: connection.FamilyType.FAMILY_TYPE_ALL }).then((data: connection.NetAddress[])=>{
        console.info(`${caseName} data: ${JSON.stringify(data)}`);
        expect().assertFail();
        console.info(`${caseName}---End`);
        done();
      }).catch((error: BusinessError)=> {
        console.info(`${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
        ExpectTrue(error.code == 2100001);
        console.info(`${caseName}---End`);
        done();
      });
    });
  })
}