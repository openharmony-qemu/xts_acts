'use static'
import { describe, it, expect, Level, TestType, Size } from "@ohos/hypium-static/src/main/indexStatic";
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';
import hilog from '@ohos.hilog';

const domain: int = 0x0000;
const tag: string = 'connectionGetAddressesByNameWithOptionsTag';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, `exportFail failed err: ${JSON.stringify(err)}`);
  }
}
const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, ` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function GetAddressesByNameWithOptionsTest(): void {
  describe('GetAddressesByNameWithOptionsTest', () => {
    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions_static_0100
     * @tc.number  SUB_NetworkManager_Connection_GetAddressesByNameWithOptions_0100
     * @tc.desc    Use the corresponding network to resolve the host name and obtain all IP addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetAddressesByNameWithOptions_static_0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          const netHandle: connection.NetHandle = await connection.getDefaultNet();
          let host: string = "www.baidu.com";
          let familyType: connection.FamilyType = connection.FamilyType.FAMILY_TYPE_ALL;
          const data: connection.NetAddress[] = await netHandle.getAddressesByNameWithOptions(host, {
            family: familyType
          });

          hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
          ExpectTrue(data.length > 0);

          let ipv4Count = 0;
          let ipv6Count = 0;

          data.forEach((addr: connection.NetAddress) => {
            if (addr.family === 1) {
              ipv4Count++;
            } else if (addr.family === 2) {
              ipv6Count++;
            } else {
              hilog.error(domain, tag, `unknown family type ${addr.family}`);
              ExpectFail();
            }
          });

          ExpectTrue(data.length > 0);
          ExpectTrue(ipv4Count > 0);
          ExpectTrue(ipv6Count > 0);
          hilog.info(domain, tag, `${caseName}---End`);
          done();

        } catch (error) {
          hilog.error(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions_static_0200
     * @tc.number  SUB_NetworkManager_Connection_GetAddressesByNameWithOptions_0200
     * @tc.desc    Use the corresponding network to resolve the host name and obtain IPv4 addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetAddressesByNameWithOptions_static_0200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          const netHandle: connection.NetHandle = await connection.getDefaultNet();
          let host: string = "www.baidu.com";
          let familyType: connection.FamilyType = connection.FamilyType.FAMILY_TYPE_IPV4;
          const data: connection.NetAddress[] = await netHandle.getAddressesByNameWithOptions(host, {
            family: familyType
          });

          hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
          ExpectTrue(data.length > 0);

          let ipv4Count = 0;

          data.forEach((addr: connection.NetAddress) => {
            if (addr.family === 1) {
              ipv4Count++;
            } else if (addr.family === 2) {
              hilog.error(domain, tag, `unexpected IPV6 result`);
              ExpectFail();
            } else {
              hilog.error(domain, tag, `unknown family type ${addr.family}`);
              ExpectFail();
            }
          });
          ExpectTrue(data.length > 0);
          ExpectTrue(ipv4Count > 0);
          hilog.info(domain, tag, `${caseName}---End`);
          done();

        } catch (error) {
          hilog.error(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions_static_0300
     * @tc.number  SUB_NetworkManager_Connection_GetAddressesByNameWithOptions_0300
     * @tc.desc    Use the corresponding network to resolve the host name and obtain IPv6 addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetAddressesByNameWithOptions_static_0300';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          const netHandle: connection.NetHandle = await connection.getDefaultNet();
          let host: string = "www.baidu.com";
          let familyType: connection.FamilyType = connection.FamilyType.FAMILY_TYPE_IPV6;
          const data: connection.NetAddress[] = await netHandle.getAddressesByNameWithOptions(host, {
            family: familyType
          });

          hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
          ExpectTrue(data.length > 0);

          let ipv6Count = 0;

          data.forEach((addr: connection.NetAddress) => {
            if (addr.family === 1) {
              hilog.error(domain, tag, `unexpected IPV4 result`);
              ExpectFail();
            } else if (addr.family === 2) {
              ipv6Count++;
            } else {
              hilog.error(domain, tag, `unknown family type ${addr.family}`);
              ExpectFail();
            }
          });

          ExpectTrue(data.length > 0);
          ExpectTrue(ipv6Count > 0);
          hilog.info(domain, tag, `${caseName}---End`);
          done();

        } catch (error) {
          hilog.error(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions_static_0800
     * @tc.number  SUB_NetworkManager_Connection_GetAddressesByNameWithOptions_0800
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetAddressesByNameWithOptions_static_0800';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netHandle = await connection.getDefaultNet();
          let host: string = "";
          try {
            let data = await netHandle.getAddressesByNameWithOptions(host, { family: connection.FamilyType.FAMILY_TYPE_ALL });
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (err) {
            const error = err as BusinessError;
            hilog.info(domain, tag, `${caseName} Failed to get addresses. error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
            ExpectTrue(error.code === 2100001);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions_static_0900
     * @tc.number  SUB_NetworkManager_Connection_GetAddressesByNameWithOptions_0900
     * @tc.desc    Use the corresponding network to resolve the host name and obtain all IP addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetAddressesByNameWithOptions_static_0900';
        hilog.info(domain, tag, `${caseName}---Start`);
        let host: string = "www.baidu.com";
        let familyType: connection.FamilyType = connection.FamilyType.FAMILY_TYPE_ALL
        try {
          let data = await connection.getAddressesByNameWithOptions(host, { family: familyType });
          hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
          ExpectTrue(data.length > 0);
          let ipv4Count = 0;
          let ipv6Count = 0;
          data.forEach((addr: connection.NetAddress) => {
            if (addr.family === 1) {
              ipv4Count++;
            } else if (addr.family === 2) {
              ipv6Count++;
            } else {
              hilog.error(domain, tag, `unknown family type ${addr.family}`);
              ExpectFail();
            }
          })
          ExpectTrue(data.length > 0);
          ExpectTrue(ipv4Count > 0);
          ExpectTrue(ipv6Count > 0);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions_static_1000
     * @tc.number  SUB_NetworkManager_Connection_GetAddressesByNameWithOptions_1000
     * @tc.desc    Use the corresponding network to resolve the host name and obtain IPv4 addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetAddressesByNameWithOptions_static_1000';
        hilog.info(domain, tag, `${caseName}---Start`);
        let host: string = "www.baidu.com";
        let familyType: connection.FamilyType = connection.FamilyType.FAMILY_TYPE_IPV4
        try {
          try {
            let data = await connection.getAddressesByNameWithOptions(host, { family: familyType });
            ExpectTrue(data.length > 0);
            let ipv4Count = 0;
            data.forEach((addr: connection.NetAddress) => {
              if (addr.family === 1) {
                ipv4Count++;
              } else if (addr.family === 2) {
                hilog.error(domain, tag, `unexpected IPV6 result`);
                ExpectFail();
              } else {
                hilog.error(domain, tag, `unknown family type ${addr.family}`);
                ExpectFail();
              }
            })
            ExpectTrue(data.length > 0);
            ExpectTrue(ipv4Count > 0);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (err) {
            const error = err as BusinessError;
            hilog.info(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch(error) {
          hilog.info(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions_static_1100
     * @tc.number  SUB_NetworkManager_Connection_GetAddressesByNameWithOptions_1100
     * @tc.desc    Use the corresponding network to resolve the host name and obtain IPv6 addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetAddressesByNameWithOptions_static_1100';
        hilog.info(domain, tag, `${caseName}---Start`);
        let host: string = "www.baidu.com";
        let familyType: connection.FamilyType = connection.FamilyType.FAMILY_TYPE_IPV6
        try {
          let data = await connection.getAddressesByNameWithOptions(host, { family: familyType });
          ExpectTrue(data.length > 0);
          let ipv6Count = 0;
          data.forEach((addr: connection.NetAddress) => {
            if (addr.family === 1) {
              hilog.error(domain, tag, `unexpected IPV4 result`);
              ExpectFail();
            } else if (addr.family === 2) {
              ipv6Count++;
            } else {
              hilog.error(domain, tag, `unknown family type ${addr.family}`);
              ExpectFail();
            }
          })
          ExpectTrue(data.length > 0);
          ExpectTrue(ipv6Count > 0);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions_static_1600
     * @tc.number  SUB_NetworkManager_Connection_GetAddressesByNameWithOptions_1600
     * @tc.desc    getAddressesByNameWithOptions Invalid parameter value
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetAddressesByNameWithOptions_static_1600';
        hilog.info(domain, tag, `${caseName}---Start`);
        let host: string = "";
        try {
          let data = await connection.getAddressesByNameWithOptions(host, { family: connection.FamilyType.FAMILY_TYPE_ALL });
          hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} Failed to get addresses. error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectTrue(error.code === 2100001);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions_static_2300
     * @tc.number  SUB_NetworkManager_Connection_GetAddressesByNameWithOptions_2300
     * @tc.desc    Use the corresponding network to resolve the host name and obtain all IP addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetAddressesByNameWithOptions_static_2300';
        hilog.info(domain, tag, `${caseName}---Start`);
        let host: string = "www.baidu.com";
        try {
          let data = await connection.getAddressesByNameWithOptions(host, {});
          hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
          ExpectTrue(data.length > 0);
          let ipv4Count = 0;
          let ipv6Count = 0;
          data.forEach((addr: connection.NetAddress) => {
            if (addr.family === 1) {
              ipv4Count++;
            } else if (addr.family === 2) {
              ipv6Count++;
            } else {
              hilog.error(domain, tag, `unknown family type ${addr.family}`);
              ExpectFail();
            }
          })
          ExpectTrue(data.length > 0);
          ExpectTrue(ipv4Count > 0);
          ExpectTrue(ipv6Count > 0);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions_static_2600
     * @tc.number  SUB_NetworkManager_Connection_GetAddressesByNameWithOptions_2600
     * @tc.desc    Use the corresponding network to resolve the host name and obtain all IP addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetAddressesByNameWithOptions_static_2600';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netHandle = await connection.getDefaultNet();
          let host: string = "www.baidu.com";
          try {
            let data = await netHandle.getAddressesByNameWithOptions(host, {});
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            let ipv4Count = 0;
            let ipv6Count = 0;
            data.forEach((addr: connection.NetAddress) => {
              if (addr.family === 1) {
                ipv4Count++;
              } else if (addr.family === 2) {
                ipv6Count++;
              } else {
                hilog.error(domain, tag, `unknown family type ${addr.family}`);
                ExpectFail();
              }
            })
            ExpectTrue(data.length > 0);
            ExpectTrue(ipv4Count > 0);
            ExpectTrue(ipv6Count > 0);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (err) {
            const error = err as BusinessError;
            hilog.info(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions_static_2700
     * @tc.number  SUB_NetworkManager_Connection_GetAddressesByNameWithOptions_2700
     * @tc.desc    Use the corresponding network to resolve the host name and obtain all IP addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetAddressesByNameWithOptions_static_2700';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netHandle = await connection.getDefaultNet();
          let host: string = "www.baidu.com";
          try {
            let data = await netHandle.getAddressesByNameWithOptions(host);
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data.length > 0);
            let ipv4Count = 0;
            let ipv6Count = 0;
            data.forEach((addr: connection.NetAddress) => {
              if (addr.family === 1) {
                ipv4Count++;
              } else if (addr.family === 2) {
                ipv6Count++;
              } else {
                hilog.error(domain, tag, `unknown family type ${addr.family}`);
                ExpectFail();
              }
            })
            ExpectTrue(data.length > 0);
            ExpectTrue(ipv4Count > 0);
            ExpectTrue(ipv6Count > 0);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (err) {
            const error = err as BusinessError;
            hilog.info(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name    testConnectionGetAddressesByNameWithOptions_static_2800
     * @tc.number  SUB_NetworkManager_Connection_GetAddressesByNameWithOptions_2800
     * @tc.desc    Use the corresponding network to resolve the host name and obtain all IP addresses
     * @tc.level   Level 3
     * @tc.type    Function
     * @tc.size    MediumTest
     */
    it('testConnectionGetAddressesByNameWithOptions_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testConnectionGetAddressesByNameWithOptions_static_2800';
        hilog.info(domain, tag, `${caseName}---Start`);
        let host: string = "www.baidu.com";
        try {
          let data = await connection.getAddressesByNameWithOptions(host);
          hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
          ExpectTrue(data.length > 0);
          let ipv4Count = 0;
          let ipv6Count = 0;
          data.forEach((addr: connection.NetAddress) => {
            if (addr.family === 1) {
              ipv4Count++;
            } else if (addr.family === 2) {
              ipv6Count++;
            } else {
              hilog.error(domain, tag, `unknown family type ${addr.family}`);
              ExpectFail();
            }
          })
          ExpectTrue(data.length > 0);
          ExpectTrue(ipv4Count > 0);
          ExpectTrue(ipv6Count > 0);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail: ` + `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });
  })
}
