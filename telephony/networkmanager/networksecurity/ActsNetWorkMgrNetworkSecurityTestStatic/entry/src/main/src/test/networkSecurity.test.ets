import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import networkSecurity from '@ohos.net.networkSecurity';
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'networkSecurityTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
    try {
        expect().assertFail();
    } catch (err: BusinessError) {
        console.info("expectInfo", `test failed`);
    }
}
const ExpectTrue = (n: boolean) => {
    try {
        expect(n).assertTrue();
    } catch (err: BusinessError) {
        console.info("expectInfo", `test sucess`);
    }
}

function getRawFileContentWrapper(filePath: string): Promise<Uint8Array | undefined> {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let context = abilityDelegator.getAppContext();
    return new Promise<Uint8Array | undefined>((resolve, reject) => {
        context.resourceManager.getRawFileContent(filePath, (error, model_buffer) => {
            if (error) {
                reject(error);
            } else {
                resolve(model_buffer);
            }
        });
    });
}

let derPath: string;

async function writeFile(path: string) {
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let context = abilityDelegator.getAppContext();
    derPath = context.filesDir + '/' + path;
    hilog.info(domain, tag, '%{public}s', ':derPath-> '+derPath);
    try {
        const model_buffer = await getRawFileContentWrapper(path);
        if (!model_buffer) {
            throw new Error("model_buffer is undefined!");
        }
        hilog.info(domain, tag, `[rawfile_copy_to_sandbox]${model_buffer} ${model_buffer.toString()} `);
        let file = fs.openSync(derPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fs.writeSync(file.fd, model_buffer.buffer);
        fs.closeSync(file);
    } catch (error) {
        hilog.info(domain, tag, `[rawfile_copy_to_sandbox] ${derPath} is copy failed, error:${error}`);
    }
}

export default function networkSecurityTest() {
    const perSuccess: string = '-----BEGIN CERTIFICATE-----\nMIIDjjCCAnagAwIBAgIQAzrx5qcRqaC7KGSxHQn65TANBgkqhkiG9w0BAQsFADBhMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBHMjAeFw0xMzA4MDExMjAwMDBaFw0zODAxMTUxMjAwMDBaMGExCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xIDAeBgNVBAMTF0RpZ2lDZXJ0IEdsb2JhbCBSb290IEcyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuzfNNNx7a8myaJCtSnX/RrohCgiN9RlUyfuI2/Ou8jqJkTx65qsGGmvPrC3oXgkkRLpimn7Wo6h+4FR1IAWsULecYxpsMNzaHxmx1x7e/dfgy5SDN67sH0NO3Xss0r0upS/kqbitOtSZpLYl6ZtrAGCSYP9PIUkY92eQq2EGnI/yuum06ZIya7XzV+hdG82MHauVBJVJ8zUtluNJbd134/tJS7SsVQepj5WztCO7TG1F8PapspUwtP1MVYwnSlcUfIKdzXOS0xZKBgyMUNGPHgm+F6HmIcr9g+UQvIOlCsRnKPZzFBQ9RnbDhxSJITRNrw9FDKZJobq7nMWxM4MphQIDAQABo0IwQDAPBgNVHRMBAf8EBTADAQH/MA4GA1UdDwEB/wQEAwIBhjAdBgNVHQ4EFgQUTiJUIBiV5uNu5g/6+rkS7QYXjzkwDQYJKoZIhvcNAQELBQADggEBAGBnKJRvDkhj6zHd6mcY1Yl9PMWLSn/pvtsrF9+wX3N3KjITOYFnQoQj8kVnNeyIv/iPsGEMNKSuIEyExtv4NeF22d+mQrvHRAiGfzZ0JFrabA0UWTW98kndth/Jsw1HKj2ZL7tcu7XUIOGZX1NGFdtom/DzMNU+MeKNhJ7jitralj41E6Vf8PlwUHBHQRFXGU7Aj64GxJUTFy8bJZ918rGOmaFvE7FBcf6IKshPECBV1/MUReXgRPTqh5Uykw7+U0b6LJ3/iyK5S9kJRaTepLiaWN0bfVKfjllDiIGknibVb63dDcY3fe0Dkhvld1927jyNxF1WW6LZZm6zNTflMrY=\n-----END CERTIFICATE-----';
    const lastCA: string = '-----BEGIN CERTIFICATE-----\nMIICrTCCAhYCAQEwDQYJKoZIhvcNAQEEBQAwgZ4xIDAeBgNVBAoTF01pY3Jvc29mdCBUcnVzdCBOZXR3b3JrMR4wHAYDVQQLExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBUaW1lIFN0YW1waW5nIFNlcnZpY2UgUm9vdDErMCkGA1UECxMiQ29weXJpZ2h0IChjKSAxOTk3IE1pY3Jvc29mdCBDb3JwLjAeFw05NzA1MTMxNjEyNTlaFw05OTEyMzAyMzU5NTlaMIGeMSAwHgYDVQQKExdNaWNyb3NvZnQgVHJ1c3QgTmV0d29yazEeMBwGA1UECxMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgVGltZSBTdGFtcGluZyBTZXJ2aWNlIFJvb3QxKzApBgNVBAsTIkNvcHlyaWdodCAoYykgMTk5NyBNaWNyb3NvZnQgQ29ycC4wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBALdaOPUfN8ypQ8TcJBi+8oVStB1bXxi5C49Lbaj/zUBQbNOg01xHwrn3huTNfTUFaTcfrz3dH/2PFTTCxHnMWXSKb4wOw+gR64Q4R5hT4fEMDeQBDPAbHiDaKno9whVSjor/ezK/WB4lmIMmy4rJxAcUJLxJntd6s4caJTO8bQhHAgMBAAEwDQYJKoZIhvcNAQEEBQADgYEAUFvFa2+NUlsNyb2sNHOYygqHyq5MSroUpOtScJUh4LWhYE73QwJRAa8eOnDOvxi2hiiZZ+sI6JdAXBaC/bgl+zZvb3Y+xUyO4qdR+srBY7pegyRHC5Ny9kSazqeVOo9QEJ4dsVkWq88+34OLx/rDa9xkn0ArH0UkBK5JL/bfDJE=\n-----END CERTIFICATE-----';
    const yetVaild:string='-----BEGIN CERTIFICATE-----\nMIIDYTCCAkmgAwIBAgIUIewAwnXfv05454CM/TFKk+hHxG8wDQYJKoZIhvcNAQELBQAwPjEVMBMGA1UEAwwMbXlzZXJ2ZXIuY29tMRgwFgYDVQQKDA9NeSBPcmdhbml6YXRpb24xCzAJBgNVBAYTAlVTMCIYDzIwNTQwNTEwMDc1MDUzWhgPMjA1NDA2MTQwNzUwNTNaMD4xFTATBgNVBAMMDG15c2VydmVyLmNvbTEYMBYGA1UECgwPTXkgT3JnYW5pemF0aW9uMQswCQYDVQQGEwJVUzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKpFHPQ8xsHOit/gE9UilNRSKEKar2MbM2yLChjwAyD0o6F2pxsh5j/LKpW2SfJDuuss29fYFL6uz5cOe9L/iYAokvsfnkgROw9A32IWbYI8xp1oTBj7gWbaFa13bTNPNKNBL853HDLDq2j5iuwj/nfy5jJ4gjT6gIN+aIifIpHrAzbTddshLjtOnHd3qcIAKuS77bMZUDso3KLoBwf4cYRFnbzawHzbUB/+lF0oCKpVQaWPwR3/h/mk0whmtgCWFzudWeUUMg7oGi8EDs+yplIUKBzY+EJnMKgwb+cQmsvJwlKocT5emfBcgeZVa6D9IRsCY3M3KGu9Oj7CLwo1qmcCAwEAAaNTMFEwHQYDVR0OBBYEFHEcqcAomUhPIspbIbdX8GgTD+PpMB8GA1UdIwQYMBaAFHEcqcAomUhPIspbIbdX8GgTD+PpMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEBAIUnxVQZ1kC5MEUoIMMsFABx7gbnnlxhFmj5JSYVouE8/2ywjmxjTiY7vx9vLJVw/m8pVCCsNdKHcRnmtWqNF6P9ZuUrJwj81HNpEuGIzFlzQX6gJcaFu/uKd/f9R1NBSlz8ot4Fdb/4gU8J5o2LNV69BMIsgtrsVw/UkVGM+h+376ox2xXXt2zx2aq8/WOmHW0S7iL/RuUNAD8RoD6kHdECPvu1O6TWP1NXb3U35V6cmr+PAXF/zxCCvREvTe7sF6k7uPHosiqikH5PKgYfb+hYbV2pZm2yDwqh/90b0/xb4phJmCH2J+XoYlMaBX8v0N6WEz1+znNYU/tF99d/mL0=\n-----END CERTIFICATE-----';

    describe("NetworkSecurityTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /**
         * @@tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerification_0100
         * @tc.name      : testNetworkMgrNetworkSecurityCertVerification_static_0100
         * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('testNetworkMgrNetworkSecurityCertVerification_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerification_static_0100';
            hilog.info(domain, tag, '%{public}s'+ ' start');
            try {
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: '-----BEGIN CERTIFICATE-----\n... (certificate data) ...\n-----END CERTIFICATE-----',
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: '-----BEGIN CERTIFICATE-----\n... (CA certificate data) ...\n-----END CERTIFICATE-----',
                };
                networkSecurity.certVerification(cert, caCert).then((result: int) => {
                    hilog.info(domain, tag, '%{public}s', caseName +':Certificate verification result:->'+result);
                    ExpectFail();
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s' +' Certificate verification failed:  '+JSON.stringify(err));
                    ExpectTrue(err.code == 2305069);
                    done();
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @@tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerification_0200
         * @tc.name      : testNetworkMgrNetworkSecurityCertVerification_static_0200
         * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testNetworkMgrNetworkSecurityCertVerification_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerification_static_0200';
            hilog.info(domain, tag, '%{public}s'+ ' start');
            try {
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: perSuccess,
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: perSuccess,
                };
                networkSecurity.certVerification(cert, caCert).then((result: int) => {
                    hilog.info(domain, tag, '%{public}s', caseName +':Certificate verification result:->'+result);
                    ExpectTrue(result == 0);
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s' +' Certificate verification failed:  '+JSON.stringify(err));
                    ExpectFail();
                    done();
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @@tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerification_0300
         * @tc.name      : testNetworkMgrNetworkSecurityCertVerification_static_0300
         * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testNetworkMgrNetworkSecurityCertVerification_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerification_static_0300';
            hilog.info(domain, tag, '%{public}s'+ ' start');
            try {
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: '-----BEGIN CERTIFICATE-----\n... (certificate data) ...\n-----END CERTIFICATE-----',
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: '-----BEGIN CERTIFICATE-----\n... (CA certificate data) ...\n-----END CERTIFICATE-----',
                };
                networkSecurity.certVerification(cert, caCert).then((result: int) => {
                    hilog.info(domain, tag, '%{public}s', caseName +':Certificate verification result:->'+result);
                    ExpectFail();
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s' +' Certificate verification failed:  '+JSON.stringify(err));
                    ExpectTrue(err.code == 2305069);
                    done();
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerification_0400
         * @tc.name      : testNetworkMgrNetworkSecurityCertVerification_static_0400
         * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testNetworkMgrNetworkSecurityCertVerification_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerification_static_0400';
            hilog.info(domain, tag, `${caseName} --- start`);
            try {
                await writeFile('der_cacert.der')
                let file = fs.openSync(derPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                let buffer = new ArrayBuffer(4096);
                fs.readSync(file.fd, buffer);
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: buffer,
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: buffer,
                };
                networkSecurity.certVerification(cert, caCert).then((result: int) => {
                    hilog.info(domain, tag, `${caseName}: Certificate verification result: ${result}`);
                    ExpectTrue(result === 0);
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, `${caseName} Certificate verification failed: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                });
            } catch (err: BusinessError) {
                hilog.error(domain, tag, `${caseName}  catch error is: `, JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName} --- end`);
        });


		/**
		 * @tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerification_0600
		 * @tc.name      : testNetworkMgrNetworkSecurityCertVerification_static_0600
		 * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
		 * @tc.size      : MediumTest
		 * @tc.type      : Function
		 * @tc.level     : Level 3
		 */
        it('testNetworkMgrNetworkSecurityCertVerification_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerification_static_0600';
            hilog.info(domain, tag, `${caseName} --- start`);
            try {
                await writeFile('last.der')
                let file = fs.openSync(derPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                let buffer = new ArrayBuffer(4096);
                fs.readSync(file.fd, buffer);
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: buffer,
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: buffer,
                };
                networkSecurity.certVerification(cert, caCert).then((result: int) => {
                    hilog.info(domain, tag, `${caseName} Certificate verification result:`, result);
                    ExpectFail();
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.error(domain, tag, `${caseName} Certificate verification failed: ${JSON.stringify(err)}`);
                    ExpectTrue(err?.code === 2305010);
                    done();
                });
            } catch (err: BusinessError) {
                hilog.error(domain, tag, `${caseName} catch error is: `, JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName} --- end`);
        });

        /**
         * @@tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerification_0700
         * @tc.name      : testNetworkMgrNetworkSecurityCertVerification_static_0700
         * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testNetworkMgrNetworkSecurityCertVerification_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerification_static_0700';
            hilog.info(domain, tag, '%{public}s'+ ' start');
            try {
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: lastCA,
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: lastCA,
                };
                networkSecurity.certVerification(cert, caCert).then((result: int) => {
                    hilog.info(domain, tag, '%{public}s', caseName +':Certificate verification result:->'+result);
                    ExpectFail();
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s' +' Certificate verification failed:  '+JSON.stringify(err));
                    ExpectTrue(err.code == 2305010);
                    done();
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
		 * @tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerification_0800
		 * @tc.name      : testNetworkMgrNetworkSecurityCertVerification_static_0800
		 * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
		 * @tc.size      : MediumTest
		 * @tc.type      : Function
		 * @tc.level     : Level 3
		 */
        it('testNetworkMgrNetworkSecurityCertVerification_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerification_static_0800';
            hilog.info(domain, tag, `${caseName} --- start`);
            try {
                await writeFile('mycert.der')
                let file = fs.openSync(derPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                let buffer = new ArrayBuffer(4096);
                fs.readSync(file.fd, buffer);
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: buffer,
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: buffer,
                };
                networkSecurity.certVerification(cert, caCert).then((result: int) => {
                    hilog.info(domain, tag, `${caseName} Certificate verification result:`, result);
                    ExpectFail();
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.error(domain, tag, `${caseName} Certificate verification failed: ${JSON.stringify(err)}`);
                    ExpectTrue(err?.code === 2305009);
                    done();
                });
            } catch (err: BusinessError) {
                hilog.error(domain, tag, `${caseName} catch error is:`, JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, `${caseName} --- end`);
        });

        /**
         * @@tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerification_0900
         * @tc.name      : testNetworkMgrNetworkSecurityCertVerification_static_0900
         * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testNetworkMgrNetworkSecurityCertVerification_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerification_static_0900';
            hilog.info(domain, tag, '%{public}s'+ ' start');
            try {
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: yetVaild,
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: yetVaild,
                };
                networkSecurity.certVerification(cert, caCert).then((result: int) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': Certificate yetVaild result: ->'+ result);
                    ExpectFail();
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  Certificate yetVaild failed error is '+JSON.stringify(err));
                    ExpectTrue(err.code == 2305009);
                    done();
                });
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @@tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerificationSync_0100
         * @tc.name      : testNetworkMgrNetworkSecurityCertVerificationSync_static_0100
         * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testNetworkMgrNetworkSecurityCertVerificationSync_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerificationSync_static_0100';
            hilog.info(domain, tag, '%{public}s'+ ' start');
            try {
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: '-----BEGIN CERTIFICATE-----\n... (certificate data) ...\n-----END CERTIFICATE-----',
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: '-----BEGIN CERTIFICATE-----\n... (CA certificate data) ...\n-----END CERTIFICATE-----',
                };
                try {
                    let resultSync: int = networkSecurity.certVerificationSync(cert, caCert);
                    hilog.info(domain, tag, '%{public}s', caseName +': Synchronous Verification Result: ->'+resultSync);
                    ExpectTrue(resultSync == 2305069);
                    done();
                } catch (err: BusinessError) {
                    hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                    ExpectFail();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @@tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerificationSync_0200
         * @tc.name      : testNetworkMgrNetworkSecurityCertVerificationSync_static_0200
         * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testNetworkMgrNetworkSecurityCertVerificationSync_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerificationSync_static_0200';
            hilog.info(domain, tag, '%{public}s'+ ' start');
            try {
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: perSuccess,
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: perSuccess,
                };
                try {
                    let resultSync: int = networkSecurity.certVerificationSync(cert, caCert);
                    hilog.info(domain, tag, '%{public}s', caseName +': Synchronous Verification Result: ->'+resultSync);
                    ExpectTrue(resultSync == 0);
                    done();
                } catch (err: BusinessError) {
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @@tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerificationSync_0300
         * @tc.name      : testNetworkMgrNetworkSecurityCertVerificationSync_static_0300
         * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testNetworkMgrNetworkSecurityCertVerificationSync_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerificationSync_static_0300';
            hilog.info(domain, tag, '%{public}s'+ ' start');
            try {
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: '-----BEGIN CERTIFICATE-----\n... (certificate data) ...\n-----END CERTIFICATE-----',
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: '-----BEGIN CERTIFICATE-----\n... (CA certificate data) ...\n-----END CERTIFICATE-----',
                };
                try {
                    let resultSync: int = networkSecurity.certVerificationSync(cert, caCert);
                    hilog.info(domain, tag, '%{public}s', caseName +': Synchronous CERT_TYPE_DER Result: ->'+resultSync);
                    ExpectTrue(resultSync == 2305069);
                    done();
                } catch (err: BusinessError) {
                   hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerificationSync_0400
         * @tc.name      : testNetworkMgrNetworkSecurityCertVerificationSync_static_0400
         * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testNetworkMgrNetworkSecurityCertVerificationSync_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerificationSync_static_0400';
            hilog.info(domain, tag, '%{public}s'+ ' start');
            try {
                await writeFile('der_cacert.der')
                let file = fs.openSync(derPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                let buffer = new ArrayBuffer(4096);
                fs.readSync(file.fd, buffer);
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: buffer,
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: buffer,
                };
                try {
                    let resultSync: number = networkSecurity.certVerificationSync(cert, caCert);
                    hilog.info(domain, tag, `${caseName}: Sync Certificate verification result: ${resultSync}`);
                    ExpectTrue(resultSync === 0);
                    done();
                } catch (error) {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, `${caseName} Sync Certificate verification failed: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerificationSync_0600
         * @tc.name      : testNetworkMgrNetworkSecurityCertVerificationSync_static_0600
         * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testNetworkMgrNetworkSecurityCertVerificationSync_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerificationSync_static_0600';
            hilog.info(domain, tag, '%{public}s'+ ' start');
            try {
                await writeFile('last.der')
                let file = fs.openSync(derPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                let buffer = new ArrayBuffer(4096);
                fs.readSync(file.fd, buffer);
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: buffer,
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: buffer,
                };
                try {
                    let resultSync: number = networkSecurity.certVerificationSync(cert, caCert);
                    hilog.info(domain, tag, `${caseName}: Sync lastCA verification result: ${resultSync}`);
                    ExpectTrue(resultSync === 2305010);
                    done();
                } catch (error) {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, `${caseName} Sync lastCA verification failed: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @@tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerificationSync_0700
         * @tc.name      : testNetworkMgrNetworkSecurityCertVerificationSync_static_0700
         * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testNetworkMgrNetworkSecurityCertVerificationSync_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerificationSync_static_0700';
            hilog.info(domain, tag, '%{public}s'+ ' start');
            try {
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: lastCA,
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: lastCA,
                };
                try {
                    let resultSync: int = networkSecurity.certVerificationSync(cert, caCert);
                    hilog.info(domain, tag, '%{public}s', caseName +': Synchronous lastCA Result: ->'+resultSync);
                    ExpectTrue(resultSync == 2305010);
                    done();
                } catch (err: BusinessError) {
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
		 * @tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerificationSync_0800
		 * @tc.name      : testNetworkMgrNetworkSecurityCertVerificationSync_static_0800
		 * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
		 * @tc.size      : MediumTest
		 * @tc.type      : Function
		 * @tc.level     : Level 3
		 */
        it('testNetworkMgrNetworkSecurityCertVerificationSync_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerificationSync_static_0800';
            hilog.info(domain, tag, '%{public}s'+ ' start');
            try {
                await writeFile('mycert.der')
                let file = fs.openSync(derPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
                let buffer = new ArrayBuffer(4096);
                fs.readSync(file.fd, buffer);
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: buffer,
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_DER,
                    data: buffer,
                };
                try {
                    let resultSync: number = networkSecurity.certVerificationSync(cert, caCert);
                    hilog.info(domain, tag, `${caseName}: Sync mycert verification result: ${resultSync}`);
                    ExpectTrue(resultSync === 2305009);
                    done();
                } catch (error) {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, `${caseName} Sync mycert verification failed: ${JSON.stringify(err)}`);
                    ExpectFail();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @@tc.number    : SUB_NetworkMgr_NetworkSecurity_CertVerificationSync_0900
         * @tc.name      : testNetworkMgrNetworkSecurityCertVerificationSync_static_0900
         * @tc.desc      : Obtain system preset CA certificates and user installed CA certificates from certificate management, and verify the certificate chain passed in by the application.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testNetworkMgrNetworkSecurityCertVerificationSync_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityCertVerificationSync_static_0900';
            hilog.info(domain, tag, '%{public}s'+ ' start');
            try {
                const cert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: yetVaild,
                };
                const caCert: networkSecurity.CertBlob = {
                    type: networkSecurity.CertType.CERT_TYPE_PEM,
                    data: yetVaild,
                };
                try {
                    let resultSync: int = networkSecurity.certVerificationSync(cert, caCert);
                    hilog.info(domain, tag, '%{public}s', caseName +': Synchronous yetVaild Result: ->'+resultSync);
                    ExpectTrue(resultSync == 2305009);
                    done();
                } catch (err: BusinessError) {
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @@tc.number    : SUB_NetworkMgr_NetworkSecurity_IsCleartextPermitted_1000
         * @tc.name      : testNetworkMgrNetworkSecurityIsCleartextPermitted_static_1000
         * @tc.desc      : Obtains whether plaintext HTTP access is allowed. By default, plaintext HTTP access is allowed.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('testNetworkMgrNetworkSecurityIsCleartextPermitted_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityIsCleartextPermitted_static_1000';
            hilog.info(domain, tag, `${caseName}  start`);
            try {
                let resultSync: boolean = networkSecurity.isCleartextPermitted();
                hilog.info(domain, tag, '%{public}s', caseName +': isCleartextPermitted Result: -> '+resultSync);
                ExpectTrue(resultSync);
                done();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

        /**
         * @@tc.number    : SUB_NetworkMgr_NetworkSecurity_IsCleartextPermittedByHostName_1100
         * @tc.name      : testNetworkMgrNetworkSecurityIsCleartextPermittedByHostName_static_1100
         * @tc.desc      : Obtains whether plaintext HTTP access is allowed. By default, plaintext HTTP access is allowed.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('testNetworkMgrNetworkSecurityIsCleartextPermittedByHostName_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testNetworkMgrNetworkSecurityIsCleartextPermittedByHostName_static_1100';
            hilog.info(domain, tag, `${caseName}  start`);
            try {
                let resultSync: boolean = networkSecurity.isCleartextPermittedByHostName("passport.baidu.com");
                hilog.info(domain, tag, '%{public}s', caseName +': isCleartextPermittedByHostName Result: -> '+resultSync);
                ExpectTrue(resultSync);
                done();
            } catch (err: BusinessError) {
                hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(err));
                ExpectFail();
                done();
            }
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        });

    })
}