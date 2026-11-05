'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium-static/src/main/indexStatic';
import { BusinessError } from '@ohos.base';
import networkSecurity from '@ohos.net.networkSecurity';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import { util } from '@kit.ArkTS';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'netWorkSecurityVerChainTag';
// 真实的自签名证书（使用 OpenSSL 生成）
const REAL_SELF_SIGNED_CERT = `-----BEGIN CERTIFICATE-----
MIIDwzCCAqugAwIBAgIUco4n2M+UmbUdOEgQj2MqDGF3l3YwDQYJKoZIhvcNAQEL
BQAwcTELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl
aWppbmcxEDAOBgNVBAoMB1Rlc3RPcmcxETAPBgNVBAsMCFRlc3RVbml0MRkwFwYD
VQQDDBB0ZXN0LmV4YW1wbGUuY29tMB4XDTI2MDUyNjA0MDUwNloXDTI3MDUyNjA0
MDUwNlowcTELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcM
B0JlaWppbmcxEDAOBgNVBAoMB1Rlc3RPcmcxETAPBgNVBAsMCFRlc3RVbml0MRkw
FwYDVQQDDBB0ZXN0LmV4YW1wbGUuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAopmI4zHV35hkOCBFyCZETJ+IVoRLUVofcn2ZVNzNTFX31j3MEqbN
rv+DT5bNoq9ZfFMIjosiGGTH0fH7cy5LmS+QH7G9o4zH+VYAjrZThFVtdJ1ohcLD
5g0+JaITKTeoznN28AI6U5NWgbDRWzEe9viUcAndaOfo/mHScMCJdGHK8PO9zWgp
oPtBOO/Ird99PetVyzlDAh+FS1hCY4ezeLp0fK9zAjjv8mMT2XUYIbKr5UErJOCg
j590zuVsBKO5nxY7ir2rj6BiA99rgqN9QGY2AZfZ+oG1O0/wPUWKee47Ra8Eoqes
bl1ReRAH8FiZhS76VQjCzDFTIXLZcAsUEwIDAQABo1MwUTAdBgNVHQ4EFgQUEt48
F7ek4uJeDBFPC5ftlR2w2b8wHwYDVR0jBBgwFoAUEt48F7ek4uJeDBFPC5ftlR2w
2b8wDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAZBNVOZ/Wi0yJ
YgMx6Hvy5EDsDNEM5g+U2yYHiFGBUOTywy0nim2+Fi3dwYuNmiLVk+eNQzB/LSkZ
xA7qEdonnrOvVGxuRb1Hr6J46PmuLZhBEshla9doMPEgQfcHZFEQQg1iVHdVmEV3
nTnCsx6Wf9Vk+GIvV5BkaFk3vZf71YzewosTBnjV1Do9z6Xyg8MEvXAa9eIKQcMq
P6pTYMLCNAZsIj8WFSYQuc+x7PyuIoFreH+holKsHpg4kGJU6KprRk0n+g7dWtfQ
dcYWT/x7+3cxaeu1TlQieKflftiYfZErOWATXT58p2biTxiaZVHdDsjvqwKCak8q
dgDWhRaGGQ==
-----END CERTIFICATE-----`;

// 完整证书链测试 - 根CA证书
const ROOT_CA_CERT = `-----BEGIN CERTIFICATE-----
MIIDUzCCAjugAwIBAgIUanZKy7n+qiQMKX8CkKM4F+JynvAwDQYJKoZIhvcNAQEL
BQAwVDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl
aWppbmcxDzANBgNVBAoMBlJvb3RDQTEQMA4GA1UEAwwHUm9vdCBDQTAeFw0yNjA1
MjYxMTU2MzNaFw0zNjA1MjMxMTU2MzNaMFQxCzAJBgNVBAYTAkNOMRAwDgYDVQQI
DAdCZWlqaW5nMRAwDgYDVQQHDAdCZWlqaW5nMQ8wDQYDVQQKDAZSb290Q0ExEDAO
BgNVBAMMB1Jvb3QgQ0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDi
0ytu5sX83b586aRsFtYSEW3h80uJHnx7b5eWMkH5iliODZ310PayyNeGYvoWfhLk
5T9lvsS/vWhgIfOcqHh2i0/vPLrpITyVGb+f2+77nNOCVJkZ9OTRUhmWh5V+pq9y
JRDO1ZfoNP2n5wR1LbJo64BcnlFxPLFVLZNFbtDJFlcdufUhQqIf5yQ9hKEesHvO
ka9hd8q05Oy7NHjwBMIXSeCH+XyhIMUS6+ng9MN2Y4vK9EvsqpFndiAdBqfGkFMY
ZEPJaAsR+wTJKg7H4iggImQ7ayjvQ7Hb2jELpqXy+nc2x3uE3ZnJZS3ONTKJYnqM
sHMIgcLJ1ybykwHXLTt3AgMBAAGjHTAbMAwGA1UdEwQFMAMBAf8wCwYDVR0PBAQD
AgEGMA0GCSqGSIb3DQEBCwUAA4IBAQDezzkyzFIfxZ5dmUPvyrN3HVyBJKRPAnQn
tod/Bqt/mRoXzKoy5iKI5NspTPpxeloSlzGptKK9wP94+1WeVMRpdnESLEenv5J2
bl7H7Rb9n21v8/SWmWubTae0K2PM59HQCLwA0Tqi3ZDANIkJ4ZciYYXZMQcoJRI9
4vNDkQHLbkOTLZGiAEZ1Vqsg4rf7KJXiM2QTzc+yciKXGwtnveoW1XHZL23bg5tu
lK2hczfKuewUZnuqD1BFLAL7qVwFbFtBcjk+bYJTaVL7vE8w5bb15/EL913TK/BU
S8rsW3WnkKWMUECl7xUxhxAp3Zoi53fiz89NS477FBwkDx9mqg1Z
-----END CERTIFICATE-----`;

// 中间CA证书
const INTERMEDIATE_CA_CERT = `-----BEGIN CERTIFICATE-----
MIIDYzCCAkugAwIBAgIUOtdY6soXDHPVb3ohGVgTkcPSP5IwDQYJKoZIhvcNAQEL
BQAwVDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl
aWppbmcxDzANBgNVBAoMBlJvb3RDQTEQMA4GA1UEAwwHUm9vdCBDQTAeFw0yNjA1
MjYxMTU2NTJaFw0zMTA1MjUxMTU2NTJaMGQxCzAJBgNVBAYTAkNOMRAwDgYDVQQI
DAdCZWlqaW5nMRAwDgYDVQQHDAdCZWlqaW5nMRcwFQYDVQQKDA5JbnRlcm1lZGlh
dGVDQTEYMBYGA1UEAwwPSW50ZXJtZWRpYXRlIENBMIIBIjANBgkqhkiG9w0BAQEF
AAOCAQ8AMIIBCgKCAQEA6P0Cq7obBIGpDEsm0YqvjjqDDX8mGkhD+ivIrmJw6zxP
s4paOA03KsBHf0o4IyQZAJJoyHBnJXMN+mMSpy/3OLzpHnNJp6KZi14AF7nRcb9x
++AFGeTp6twIHDzgSesSgKSPfHi3A/3uawZb7NQOvvfRNXt12ynDxK3HdMJdpeZV
2tSEG/wUzApEwXCG2Tho8Ey9hC5SMOpLwALJkASykqR8HRVONv1+S4pk12dq9xwS
7md+GfiX+Y0lUd5HJfEvnIls4ZAf8yfgijIILyxMgK5R0YAZgWNFK5fUqibi7GJD
yDaPFolWweSFiir6A93LNc5k8uGtC0QAOEYya9OTqQIDAQABox0wGzAMBgNVHRME
BTADAQH/MAsGA1UdDwQEAwIBBjANBgkqhkiG9w0BAQsFAAOCAQEANvoBZgcp23G3
3bHAMqqIi17k34zC8ccapKwNFw4hjuTHhDH/aDhJny8ldAWmUiZSePw2Y24CC1nC
RxLG7j3eSCHdAOaBf9FkwodVscg/B5iFbSPXMffb8A6SOmtF9Oy2UAha7zBFtKXH
MR6F/Q917/rn4G4oAIwDFByB/I1FrRC3DQv5dVHnlo8E/8/WAqqzbKhhznQG8EA5
wwRCmHkizjInElVj17iMaET751hGH4tKs1EyI4b5+0I6efuzYbJmIw/uR92rx2HC
gN8UNAlM8ugtsOzA44ZXddYX5hQtEETjOJbkZbpqkyAE6Rg79C0QfN1KEHmrA/7N
6sRQ2OdlZA==
-----END CERTIFICATE-----`;

// 叶子证书（由中间CA签发）
const LEAF_CERT = `-----BEGIN CERTIFICATE-----
MIIDljCCAn6gAwIBAgIUcqRJ9L2iCvP+74gmQQe8VnLZFFswDQYJKoZIhvcNAQEL
BQAwZDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl
aWppbmcxFzAVBgNVBAoMDkludGVybWVkaWF0ZUNBMRgwFgYDVQQDDA9JbnRlcm1l
ZGlhdGUgQ0EwHhcNMjYwNTI2MTE1NzA0WhcNMjcwNTI2MTE1NzA0WjBvMQswCQYD
VQQGEwJDTjEQMA4GA1UECAwHQmVpamluZzEQMA4GA1UEBwwHQmVpamluZzEQMA4G
A1UECgwHVGVzdE9yZzERMA8GA1UECwwIVGVzdFVuaXQxFzAVBgNVBAMMDmNoYWlu
LnRlc3QuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtlcGNsu2
1EpawvSjhDlWjAGTz2IC+Oow40vCOU7QnQ9Xy5T5CUk2FwQ5fgqV/egBc1KbfQPF
kvzoUBRxzQ/YcDXTuPe6OSUylTpQD0FfpW8YexmH1HE+p9G09ygHl7XSmNkTQPSl
NdtabL9vVx4ZNtXcodhSmm5O46BskPxS5pU4Vwt+rPTjy69F1hBd0ckPzFGVhMY7
9VKltpg6jJ5P1A122c4gGdqbbIimgMBizUStynucAY8bzOEkCljOtdJ4pbpcnCzT
TLz4L8Z+OEuWFOQBm0y5JuPwKhl7H157HbYEZdGAjSl+8zseZOahtB6z6XxKN+Of
OHgctuA3b2tY7wIDAQABozUwMzAJBgNVHRMEAjAAMAsGA1UdDwQEAwIFoDAZBgNV
HREEEjAQgg5jaGFpbi50ZXN0LmNvbTANBgkqhkiG9w0BAQsFAAOCAQEAnpFpHEBg
rvBS+DULXl8HVmQWJijc35zjq4woM9rnDhSRFK/2YXa8eVPvA5ofEHDrZTYZ82bh
IGJS74KaM9fjlFmPkrl0+E/oqmRKeaFpQqorC3SBbP+Fjx3zeccPGxby/HGg4UkE
lTC9NrleAHB9LiQAq5tEocT7Kn5+S1uXnip95+J3ulA5aI03K0ezd5ooyG0YTxRS
AxaJYPPakGnf0jHnEad3ksIeA1B3W4sVy/UzXwWCUKBR38uuZi3t4bkCldoW5N6V
3eCeTmI7ymVPVbfwWgWkpHvRrfzsHAgQGtMqFtwTZcEsAC+S4M3AQi97S9sirc9s
Sfj9LgSSKb+QSA==
-----END CERTIFICATE-----`;
// DigiCert Global Root CA - 系统通常自带的根证书   --CACERT不填，只填根证书
// 用于测试系统证书库功能
const DIGICERT_ROOT_CA = `-----BEGIN CERTIFICATE-----
MIIDrzCCApegAwIBAgIQCDvgVpBCRrGhdWrJWZHHSjANBgkqhkiG9w0BAQUFADBh
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBD
QTAeFw0wNjExMTAwMDAwMDBaFw0zMTExMTAwMDAwMDBaMGExCzAJBgNVBAYTAlVT
MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5j
b20xIDAeBgNVBAMTF0RpZ2lDZXJ0IEdsb2JhbCBSb290IENBMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4jvhEXLeqKTTo1eqUKKPC3eQyaKl7hLOllsB
CSDMAZOnTjC3U/dDxGkAV53ijSLdhwZAAIEJzs4bg7/fzTtxRuLWZscFs3YnFo97
nh6Vfe63SKMI2tavegw5BmV/Sl0fvBf4q77uKNd0f3p4mVmFaG5cIzJLv07A6Fpt
43C/dxC//AH2hdmoRBBYMql1GNXRor5H4idq9Joz+EkIYIvUX7Q6hL+hqkpMfT7P
T19sdl6gSzeRntwi5m3OFBqOasv+zbMUZBfHWymeMr/y7vrTC0LUq7dBMtoM1O/4
gdW7jVg/tRvoSSiicNoxBN33shbyTApOB6jtSj1etX+jkMOvJwIDAQABo2MwYTAO
BgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUA95QNVbR
TLtm8KPiGxvDl7I90VUwHwYDVR0jBBgwFoAUA95QNVbRTLtm8KPiGxvDl7I90VUw
DQYJKoZIhvcNAQEFBQADggEBAMucN6pIExIK+t1EnE9SsPTfrgT1eXkIoyQY/Esr
hMAtudXH/vTBH1jLuG2cenTnmCmrEbXjcKChzUyImZOMkXDiqw8cvpOp/2PV5Adg
06O/nVsJ8dWO41P0jmP6P6fbtGbfYmbW0W5BjfIttep3Sp+dWOIrWcBAI+0tKIJF
PnlUkiaY4IBIqDfv8NZ5YBberOgOzW6sRBc4L0na4UU+Krk2U886UAb3LujEV0ls
YSEY1QSteDwsOoBrp+uvFRTp2InBuThs4pFsiv9kuXclVzDAGySj4dzp30d8tbQk
CAUw7C29C79Fv1C5qfPrmAESrciIxpg0X40KPMbp1ZWVbd4=
-----END CERTIFICATE-----`;
const expectFalse: (n: boolean, name: string) => void = (n: boolean, name: string) => {
  try {
    expect(n).assertFalse();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${name}, test failed`);
  }
}

const expectTrue: (n: boolean, name: string) => void = (n: boolean, name: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${name}, test failed`);
  }
}

const getErrCode: (err: Error) => number = (err: Error): number => {
  try {
    const e: BusinessError = err as BusinessError;
    return e.code;
  } catch (castErr) {
    return -1;
  }
}

function getRawFileContentWrapper(filePath: string): Promise<Uint8Array> {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return new Promise<Uint8Array>((resolve, reject) => {
    context.resourceManager.getRawFileContent(filePath, (error, data) => {
      if (error) {
        reject(error);
      } else {
        if (data !== undefined) {
          resolve(data);
        } else {
          reject(new Error('Data is undefined'));
        }
      }
    });
  });
}

let derPath: string;


async function writeFile(path: string) {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  let derPath: string = context.filesDir + '/' + path;

  try {
    const model_buffer: Uint8Array = await getRawFileContentWrapper(path);
    hilog.info(domain, tag, '%{public}s', `[rawfile_copy_to_sandbox] length: ${model_buffer.byteLength}`);

    // 打开文件
    let file = fs.openSync(derPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);

    // 写入数据
    fs.writeSync(file.fd, model_buffer.buffer);
    fs.closeSync(file);
  } catch (error) {
    hilog.info(domain, tag, '%{public}s',
      `[rawfile_copy_to_sandbox] ${derPath} is copy failed:${error.code}, message: ${error.message}.`);
  }
}

// 将 PEM 格式证书转换为 DER 格式（ArrayBuffer）
function pemToDer(pemCert: string): ArrayBuffer {
  let base64Data: string = pemCert;

  // ArkTS 不支持正则字面量如 /\r
  //g 直接作为 replace 参数
  // 必须使用 new RegExp() 构造函数

  // 替换 BEGIN 标记
  base64Data = base64Data.replace(new RegExp('-----BEGIN CERTIFICATE-----', 'g'), '');

  // 替换 END 标记
  base64Data = base64Data.replace(new RegExp('-----END CERTIFICATE-----', 'g'), '');

  // 替换回车换行 \r

  base64Data = base64Data.replace(new RegExp('\\r\\n', 'g'), '');

  // 替换换行

  base64Data = base64Data.replace(new RegExp('\\n', 'g'), '');

  // 替换空格
  base64Data = base64Data.replace(new RegExp('\\s', 'g'), '');

  // 使用 Base64Helper 解码
  let base64Helper: util.Base64Helper = new util.Base64Helper();
  let uint8Array: Uint8Array = base64Helper.decodeSync(base64Data);

  // 将 Uint8Array 转换为 ArrayBuffer
  // 注意：uint8Array.buffer 返回的是 ArrayBuffer，但要注意视图共享内存的问题
  // 如果 uint8Array 是独立创建的，buffer 是安全的
  return uint8Array.buffer;
}

export default function netWorkSecurityVerChainTest(): void {
  describe('netWorkSecurityVerChainTest', () => {
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_0100
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0100
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + correct hostname for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: ROOT_CA_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com')
            .then((result: networkSecurity.CertBlob[]) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
              expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
              result.forEach((cert: networkSecurity.CertBlob, index: int) => {
                expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                  `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
                if (typeof cert.data === 'string') {
                  let certData = cert.data as string;
                  expectTrue(certData.length > 0,
                    `${caseName} cert[${index}] data string length should be greater than 0`);
                } else if (cert.data instanceof ArrayBuffer) {
                  let certData = cert.data as ArrayBuffer;
                  expectTrue(certData.byteLength > 0,
                    `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
                }
              });
              expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
              if (typeof caCert.data === 'string') {
                let caCertData = caCert.data as string;
                expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
              } else if (caCert.data instanceof ArrayBuffer) {
                let caCertData = caCert.data as ArrayBuffer;
                expectTrue(caCertData.byteLength > 0,
                  `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
              }
              done();
            })
            .catch((error) => {
              console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
              expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_0200
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0200
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + correct hostname for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const leafCertDer: ArrayBuffer = pemToDer(LEAF_CERT);
          const intermediateCertDer: ArrayBuffer = pemToDer(INTERMEDIATE_CA_CERT);
          const rootCertDer: ArrayBuffer = pemToDer(ROOT_CA_CERT);

          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: leafCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: intermediateCertDer }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_DER,
            data: rootCertDer
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
            expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
            result.forEach((cert: networkSecurity.CertBlob, index: int) => {
              expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
              if (typeof cert.data === 'string') {
                let certData = cert.data as string;
                expectTrue(certData.length > 0,
                  `${caseName} cert[${index}] data string length should be greater than 0`);
              } else if (cert.data instanceof ArrayBuffer) {
                let certData = cert.data as ArrayBuffer;
                expectTrue(certData.byteLength > 0,
                  `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
              }
            });
            expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
              `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
            if (typeof caCert.data === 'string') {
              let caCertData = caCert.data as string;
              expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
            } else if (caCert.data instanceof ArrayBuffer) {
              let caCertData = caCert.data as ArrayBuffer;
              expectTrue(caCertData.byteLength > 0,
                `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
            }
            done();
          }).catch((error) => {
            console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
            expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_0300
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0300
     * @tc.desc  A correct and complete certificate chain (leaf + intermediate + root CA) + correct hostname for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: ROOT_CA_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT },
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: ROOT_CA_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com')
            .then((result: networkSecurity.CertBlob[]) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
              expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
              result.forEach((cert: networkSecurity.CertBlob, index: int) => {
                expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                  `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
                if (typeof cert.data === 'string') {
                  let certData = cert.data as string;
                  expectTrue(certData.length > 0,
                    `${caseName} cert[${index}] data string length should be greater than 0`);
                } else if (cert.data instanceof ArrayBuffer) {
                  let certData = cert.data as ArrayBuffer;
                  expectTrue(certData.byteLength > 0,
                    `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
                }
              });
              expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
              if (typeof caCert.data === 'string') {
                let caCertData = caCert.data as string;
                expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
              } else if (caCert.data instanceof ArrayBuffer) {
                let caCertData = caCert.data as ArrayBuffer;
                expectTrue(caCertData.byteLength > 0,
                  `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
              }
              done();
            })
            .catch((error) => {
              console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
              expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_0400
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0400
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + correct hostname for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const leafCertDer: ArrayBuffer = pemToDer(LEAF_CERT);
          const intermediateCertDer: ArrayBuffer = pemToDer(INTERMEDIATE_CA_CERT);
          const rootCertDer: ArrayBuffer = pemToDer(ROOT_CA_CERT);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: leafCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: rootCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: intermediateCertDer },
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_DER,
            data: rootCertDer
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
            expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
            result.forEach((cert: networkSecurity.CertBlob, index: int) => {
              expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
              if (typeof cert.data === 'string') {
                let certData = cert.data as string;
                expectTrue(certData.length > 0,
                  `${caseName} cert[${index}] data string length should be greater than 0`);

              } else if (cert.data instanceof ArrayBuffer) {
                let certData = cert.data as ArrayBuffer;
                expectTrue(certData.byteLength > 0,
                  `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
              }
            });
            expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
              `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
            if (typeof caCert.data === 'string') {
              let caCertData = caCert.data as string;
              expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
            } else if (caCert.data instanceof ArrayBuffer) {
              let caCertData = caCert.data as ArrayBuffer;
              expectTrue(caCertData.byteLength > 0,
                `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
            }
            done();
          }).catch((error) => {
            console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
            expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_0500
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0500
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: ROOT_CA_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
            expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
            result.forEach((cert: networkSecurity.CertBlob, index: int) => {
              expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
              if (typeof cert.data === 'string') {
                let certData = cert.data as string;
                expectTrue(certData.length > 0,
                  `${caseName} cert[${index}] data string length should be greater than 0`);

              } else if (cert.data instanceof ArrayBuffer) {
                let certData = cert.data as ArrayBuffer;
                expectTrue(certData.byteLength > 0,
                  `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
              }
            });
            expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
            if (typeof caCert.data === 'string') {
              let caCertData = caCert.data as string;
              expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
            } else if (caCert.data instanceof ArrayBuffer) {
              let caCertData = caCert.data as ArrayBuffer;
              expectTrue(caCertData.byteLength > 0,
                `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
            }
            done();
          }).catch((error) => {
            console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
            expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_0600
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0600
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + no hostname for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const leafCertDer: ArrayBuffer = pemToDer(LEAF_CERT);
          const intermediateCertDer: ArrayBuffer = pemToDer(INTERMEDIATE_CA_CERT);
          const rootCertDer: ArrayBuffer = pemToDer(ROOT_CA_CERT);

          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: leafCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: intermediateCertDer }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_DER,
            data: rootCertDer
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
            expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
            result.forEach((cert: networkSecurity.CertBlob, index: int) => {
              expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
              if (typeof cert.data === 'string') {
                let certData = cert.data as string;
                expectTrue(certData.length > 0,
                  `${caseName} cert[${index}] data string length should be greater than 0`);

              } else if (cert.data instanceof ArrayBuffer) {
                let certData = cert.data as ArrayBuffer;
                expectTrue(certData.byteLength > 0,
                  `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
              }
            });
            expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
              `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
            if (typeof caCert.data === 'string') {
              let caCertData = caCert.data as string;
              expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
            } else if (caCert.data instanceof ArrayBuffer) {
              let caCertData = caCert.data as ArrayBuffer;
              expectTrue(caCertData.byteLength > 0,
                `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
            }
            done();
          }).catch((error) => {
            console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
            expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_0700
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0700
     * @tc.desc  A correct and complete certificate chain (leaf + intermediate + root CA) + no hostname for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_0700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: ROOT_CA_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT },
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: ROOT_CA_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
            expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
            result.forEach((cert: networkSecurity.CertBlob, index: int) => {
              expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
              if (typeof cert.data === 'string') {
                let certData = cert.data as string;
                expectTrue(certData.length > 0,
                  `${caseName} cert[${index}] data string length should be greater than 0`);

              } else if (cert.data instanceof ArrayBuffer) {
                let certData = cert.data as ArrayBuffer;
                expectTrue(certData.byteLength > 0,
                  `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
              }
            });
            expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
            if (typeof caCert.data === 'string') {
              let caCertData = caCert.data as string;
              expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
            } else if (caCert.data instanceof ArrayBuffer) {
              let caCertData = caCert.data as ArrayBuffer;
              expectTrue(caCertData.byteLength > 0,
                `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
            }
            done();
          }).catch((error) => {
            console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
            expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_0800
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0800
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + no hostname for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_0800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const leafCertDer: ArrayBuffer = pemToDer(LEAF_CERT);
          const intermediateCertDer: ArrayBuffer = pemToDer(INTERMEDIATE_CA_CERT);
          const rootCertDer: ArrayBuffer = pemToDer(ROOT_CA_CERT);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: leafCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: rootCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: intermediateCertDer },
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_DER,
            data: rootCertDer
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
            expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
            result.forEach((cert: networkSecurity.CertBlob, index: int) => {
              expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
              if (typeof cert.data === 'string') {
                let certData = cert.data as string;
                expectTrue(certData.length > 0,
                  `${caseName} cert[${index}] data string length should be greater than 0`);

              } else if (cert.data instanceof ArrayBuffer) {
                let certData = cert.data as ArrayBuffer;
                expectTrue(certData.byteLength > 0,
                  `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
              }
            });
            expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
              `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
            if (typeof caCert.data === 'string') {
              let caCertData = caCert.data as string;
              expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
            } else if (caCert.data instanceof ArrayBuffer) {
              let caCertData = caCert.data as ArrayBuffer;
              expectTrue(caCertData.byteLength > 0,
                `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
            }
            done();
          }).catch((error) => {
            console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
            expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_0900
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0900
     * @tc.desc   Correct Single Self-Signed Certificate + CA + correct hostname for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_0900';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: REAL_SELF_SIGNED_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert, 'test.example.com')
            .then((result: networkSecurity.CertBlob[]) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
              expectTrue(result.length === 1, `${caseName} result length should be 1, actual: ${result.length}`);
              result.forEach((cert: networkSecurity.CertBlob, index: int) => {
                expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                  `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
                if (typeof cert.data === 'string') {
                  let certData = cert.data as string;
                  expectTrue(certData.length > 0,
                    `${caseName} cert[${index}] data string length should be greater than 0`);

                } else if (cert.data instanceof ArrayBuffer) {
                  let certData = cert.data as ArrayBuffer;
                  expectTrue(certData.byteLength > 0,
                    `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
                }
              });
              expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
              if (typeof caCert.data === 'string') {
                let caCertData = caCert.data as string;
                expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
              } else if (caCert.data instanceof ArrayBuffer) {
                let caCertData = caCert.data as ArrayBuffer;
                expectTrue(caCertData.byteLength > 0,
                  `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
              }
              done();
            })
            .catch((error) => {
              console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
              expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_1000
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1000
     * @tc.desc   Correct Single Self-Signed Certificate + CA + correct hostname for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_1000';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const realselfsignedCertDer: ArrayBuffer = pemToDer(REAL_SELF_SIGNED_CERT);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: realselfsignedCertDer }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_DER,
            data: realselfsignedCertDer
          };
          networkSecurity.verifyCertChain(certs, caCert, 'test.example.com')
            .then((result: networkSecurity.CertBlob[]) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
              expectTrue(result.length === 1, `${caseName} result length should be 3, actual: ${result.length}`);
              result.forEach((cert: networkSecurity.CertBlob, index: int) => {
                expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                  `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
                if (typeof cert.data === 'string') {
                  let certData = cert.data as string;
                  expectTrue(certData.length > 0,
                    `${caseName} cert[${index}] data string length should be greater than 0`);

                } else if (cert.data instanceof ArrayBuffer) {
                  let certData = cert.data as ArrayBuffer;
                  expectTrue(certData.byteLength > 0,
                    `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
                }
              });
              expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
                `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
              if (typeof caCert.data === 'string') {
                let caCertData = caCert.data as string;
                expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
              } else if (caCert.data instanceof ArrayBuffer) {
                let caCertData = caCert.data as ArrayBuffer;
                expectTrue(caCertData.byteLength > 0,
                  `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
              }
              done();
            })
            .catch((error) => {
              console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
              expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_1100
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1100
     * @tc.desc   Correct Single Self-Signed Certificate + CA + no hostname for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_1100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: REAL_SELF_SIGNED_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
            expectTrue(result.length === 1, `${caseName} result length should be 1, actual: ${result.length}`);
            result.forEach((cert: networkSecurity.CertBlob, index: int) => {
              expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
              if (typeof cert.data === 'string') {
                let certData = cert.data as string;
                expectTrue(certData.length > 0,
                  `${caseName} cert[${index}] data string length should be greater than 0`);

              } else if (cert.data instanceof ArrayBuffer) {
                let certData = cert.data as ArrayBuffer;
                expectTrue(certData.byteLength > 0,
                  `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
              }
            });
            expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
            if (typeof caCert.data === 'string') {
              let caCertData = caCert.data as string;
              expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
            } else if (caCert.data instanceof ArrayBuffer) {
              let caCertData = caCert.data as ArrayBuffer;
              expectTrue(caCertData.byteLength > 0,
                `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
            }
            done();
          }).catch((error) => {
            console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
            expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_1200
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1200
     * @tc.desc   Correct Single Self-Signed Certificate + CA + no hostname for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_1200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const realselfsignedCertDer: ArrayBuffer = pemToDer(REAL_SELF_SIGNED_CERT);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: realselfsignedCertDer }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_DER,
            data: realselfsignedCertDer
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
            expectTrue(result.length === 1, `${caseName} result length should be 3, actual: ${result.length}`);
            result.forEach((cert: networkSecurity.CertBlob, index: int) => {
              expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
              if (typeof cert.data === 'string') {
                let certData = cert.data as string;
                expectTrue(certData.length > 0,
                  `${caseName} cert[${index}] data string length should be greater than 0`);

              } else if (cert.data instanceof ArrayBuffer) {
                let certData = cert.data as ArrayBuffer;
                expectTrue(certData.byteLength > 0,
                  `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
              }
            });
            expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
              `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
            if (typeof caCert.data === 'string') {
              let caCertData = caCert.data as string;
              expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
            } else if (caCert.data instanceof ArrayBuffer) {
              let caCertData = caCert.data as ArrayBuffer;
              expectTrue(caCertData.byteLength > 0,
                `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
            }
            done();
          }).catch((error) => {
            console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
            expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_1300
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1300
     * @tc.desc   Correct single system built-in CA certificate (root) + CA is undefined for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_1300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: DIGICERT_ROOT_CA }
          ];
          const caCert: networkSecurity.CertBlob | undefined = undefined;
          expectTrue(caCert === undefined, `${caseName} caCert should be undefined`);
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
            expectTrue(result.length === 1, `${caseName} result length should be 1, actual: ${result.length}`);
            result.forEach((cert: networkSecurity.CertBlob, index: int) => {
              expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
              if (typeof cert.data === 'string') {
                let certData = cert.data as string;
                expectTrue(certData.length > 0,
                  `${caseName} cert[${index}] data string length should be greater than 0`);

              } else if (cert.data instanceof ArrayBuffer) {
                let certData = cert.data as ArrayBuffer;
                expectTrue(certData.byteLength > 0,
                  `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
              }
            });
            done();
          }).catch((error) => {
            console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
            expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_1400
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1400
     * @tc.desc   Correct single system built-in CA certificate (root) + CA is undefined for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_1400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const digiCertDer: ArrayBuffer = pemToDer(DIGICERT_ROOT_CA);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: digiCertDer }
          ];
          const caCert: networkSecurity.CertBlob | undefined = undefined;
          expectTrue(caCert === undefined, `${caseName} caCert should be undefined`);
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
            expectTrue(result.length === 1, `${caseName} result length should be 1, actual: ${result.length}`);
            result.forEach((cert: networkSecurity.CertBlob, index: int) => {
              expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
              if (typeof cert.data === 'string') {
                let certData = cert.data as string;
                expectTrue(certData.length > 0,
                  `${caseName} cert[${index}] data string length should be greater than 0`);

              } else if (cert.data instanceof ArrayBuffer) {
                let certData = cert.data as ArrayBuffer;
                expectTrue(certData.byteLength > 0,
                  `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
              }
            });
            done();
          }).catch((error) => {
            console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
            expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_1500
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1500
     * @tc.desc   Multiple Identical Self-Signed Certificates + CA + Hostname for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_1500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: REAL_SELF_SIGNED_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert, 'test.example.com')
            .then((result: networkSecurity.CertBlob[]) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
              expectTrue(result.length === 1, `${caseName} result length should be 1, actual: ${result.length}`);
              result.forEach((cert: networkSecurity.CertBlob, index: int) => {
                expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                  `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
                if (typeof cert.data === 'string') {
                  let certData = cert.data as string;
                  expectTrue(certData.length > 0,
                    `${caseName} cert[${index}] data string length should be greater than 0`);

                } else if (cert.data instanceof ArrayBuffer) {
                  let certData = cert.data as ArrayBuffer;
                  expectTrue(certData.byteLength > 0,
                    `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
                }
              });
              expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
              if (typeof caCert.data === 'string') {
                let caCertData = caCert.data as string;
                expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
              } else if (caCert.data instanceof ArrayBuffer) {
                let caCertData = caCert.data as ArrayBuffer;
                expectTrue(caCertData.byteLength > 0,
                  `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
              }
              done();
            })
            .catch((error) => {
              console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
              expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_1600
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1600
     * @tc.desc   Multiple Identical Self-Signed Certificates + CA + Hostname for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_1600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const realselfsignedCertDer: ArrayBuffer = pemToDer(REAL_SELF_SIGNED_CERT);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_DER,
            data: realselfsignedCertDer
          };
          networkSecurity.verifyCertChain(certs, caCert, 'test.example.com')
            .then((result: networkSecurity.CertBlob[]) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
              expectTrue(result.length === 1, `${caseName} result length should be 3, actual: ${result.length}`);
              result.forEach((cert: networkSecurity.CertBlob, index: int) => {
                expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                  `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
                if (typeof cert.data === 'string') {
                  let certData = cert.data as string;
                  expectTrue(certData.length > 0,
                    `${caseName} cert[${index}] data string length should be greater than 0`);

                } else if (cert.data instanceof ArrayBuffer) {
                  let certData = cert.data as ArrayBuffer;
                  expectTrue(certData.byteLength > 0,
                    `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
                }
              });
              expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
                `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
              if (typeof caCert.data === 'string') {
                let caCertData = caCert.data as string;
                expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
              } else if (caCert.data instanceof ArrayBuffer) {
                let caCertData = caCert.data as ArrayBuffer;
                expectTrue(caCertData.byteLength > 0,
                  `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
              }
              done();
            })
            .catch((error) => {
              console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
              expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_1700
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1700
     * @tc.desc   Multiple Identical Self-Signed Certificates + CA + no Hostname for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_1700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: REAL_SELF_SIGNED_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
            expectTrue(result.length === 1, `${caseName} result length should be 1, actual: ${result.length}`);
            result.forEach((cert: networkSecurity.CertBlob, index: int) => {
              expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
              if (typeof cert.data === 'string') {
                let certData = cert.data as string;
                expectTrue(certData.length > 0,
                  `${caseName} cert[${index}] data string length should be greater than 0`);

              } else if (cert.data instanceof ArrayBuffer) {
                let certData = cert.data as ArrayBuffer;
                expectTrue(certData.byteLength > 0,
                  `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
              }
            });
            expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
            if (typeof caCert.data === 'string') {
              let caCertData = caCert.data as string;
              expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
            } else if (caCert.data instanceof ArrayBuffer) {
              let caCertData = caCert.data as ArrayBuffer;
              expectTrue(caCertData.byteLength > 0,
                `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
            }
            done();
          }).catch((error) => {
            console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
            expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_1800
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1800
     * @tc.desc   Multiple Identical Self-Signed Certificates + CA + no Hostname for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_1800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const realselfsignedCertDer: ArrayBuffer = pemToDer(REAL_SELF_SIGNED_CERT);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: realselfsignedCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: realselfsignedCertDer }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_DER,
            data: realselfsignedCertDer
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
            expectTrue(result.length === 1, `${caseName} result length should be 3, actual: ${result.length}`);
            result.forEach((cert: networkSecurity.CertBlob, index: int) => {
              expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
                `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
              if (typeof cert.data === 'string') {
                let certData = cert.data as string;
                expectTrue(certData.length > 0,
                  `${caseName} cert[${index}] data string length should be greater than 0`);

              } else if (cert.data instanceof ArrayBuffer) {
                let certData = cert.data as ArrayBuffer;
                expectTrue(certData.byteLength > 0,
                  `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
              }
            });
            expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
              `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
            if (typeof caCert.data === 'string') {
              let caCertData = caCert.data as string;
              expectTrue(caCertData.length > 0, `${caseName} caCert data string length should be greater than 0`);
            } else if (caCert.data instanceof ArrayBuffer) {
              let caCertData = caCert.data as ArrayBuffer;
              expectTrue(caCertData.byteLength > 0,
                `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
            }
            done();
          }).catch((error) => {
            console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
            expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_1900
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1900
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + Invalid hostname for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_1900';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: ROOT_CA_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert, 'wrong.hostname.com')
            .then((result: networkSecurity.CertBlob[]) => {
              console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
              expectFalse(true, `${caseName} should fail with error code 2305062, but succeeded`);
              done();
            })
            .catch((error) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
              expectTrue(error.code === 2305062, `${caseName} error code should be 2305062, actual: ${error.code}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_2000
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2000
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + Invalid hostname for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_2000';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const leafCertDer: ArrayBuffer = pemToDer(LEAF_CERT);
          const intermediateCertDer: ArrayBuffer = pemToDer(INTERMEDIATE_CA_CERT);
          const rootCertDer: ArrayBuffer = pemToDer(ROOT_CA_CERT);

          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: leafCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: intermediateCertDer }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_DER,
            data: rootCertDer
          };
          networkSecurity.verifyCertChain(certs, caCert, 'wrong.hostname.com')
            .then((result: networkSecurity.CertBlob[]) => {
              console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
              expectFalse(true, `${caseName} should fail with error code 2305062, but succeeded`);
              done();
            })
            .catch((error) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
              expectTrue(error.code === 2305062, `${caseName} error code should be 2305062, actual: ${error.code}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_2100
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2100
     * @tc.desc  A correct and complete certificate chain (leaf + intermediate + root CA) + Invalid hostname for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_2100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: ROOT_CA_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT },
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: ROOT_CA_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert, 'wrong.hostname.com')
            .then((result: networkSecurity.CertBlob[]) => {
              console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
              expectFalse(true, `${caseName} should fail with error code 2305062, but succeeded`);
              done();
            })
            .catch((error) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
              expectTrue(error.code === 2305062, `${caseName} error code should be 2305062, actual: ${error.code}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_2200
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2200
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + Invalid hostname for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_2200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const leafCertDer: ArrayBuffer = pemToDer(LEAF_CERT);
          const intermediateCertDer: ArrayBuffer = pemToDer(INTERMEDIATE_CA_CERT);
          const rootCertDer: ArrayBuffer = pemToDer(ROOT_CA_CERT);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: leafCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: rootCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: intermediateCertDer },
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_DER,
            data: rootCertDer
          };
          networkSecurity.verifyCertChain(certs, caCert, 'wrong.hostname.com')
            .then((result: networkSecurity.CertBlob[]) => {
              console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
              expectFalse(true, `${caseName} should fail with error code 2305062, but succeeded`);
              done();
            })
            .catch((error) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
              expectTrue(error.code === 2305062, `${caseName} error code should be 2305062, actual: ${error.code}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_2300
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2300
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root) for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_2300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: ROOT_CA_CERT }
          ];
          networkSecurity.verifyCertChain(certs).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_2400
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2400
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root) for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_2400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const leafCertDer: ArrayBuffer = pemToDer(LEAF_CERT);
          const intermediateCertDer: ArrayBuffer = pemToDer(INTERMEDIATE_CA_CERT);
          const rootCertDer: ArrayBuffer = pemToDer(ROOT_CA_CERT);

          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: leafCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: intermediateCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: rootCertDer }
          ];
          networkSecurity.verifyCertChain(certs).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_2500
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2500
     * @tc.desc  A correct and complete certificate chain (leaf + intermediate + root)  for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_2500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: ROOT_CA_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT },
          ];
          networkSecurity.verifyCertChain(certs).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_2600
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2600
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root)  for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_2600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const leafCertDer: ArrayBuffer = pemToDer(LEAF_CERT);
          const intermediateCertDer: ArrayBuffer = pemToDer(INTERMEDIATE_CA_CERT);
          const rootCertDer: ArrayBuffer = pemToDer(ROOT_CA_CERT);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: leafCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: rootCertDer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: intermediateCertDer },
          ];
          networkSecurity.verifyCertChain(certs).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });


    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_2700
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2700
     * @tc.desc   Correct Single Self-Signed Certificate + no CA for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_2700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
          ];
          networkSecurity.verifyCertChain(certs).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 2305018, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 2305018, `${caseName} error code should be 2305018, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_2800
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2800
     * @tc.desc   Correct Single Self-Signed Certificate + no CA for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_2800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const realselfsignedCertDer: ArrayBuffer = pemToDer(REAL_SELF_SIGNED_CERT);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: realselfsignedCertDer }
          ];
          networkSecurity.verifyCertChain(certs).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 2305018, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 2305018, `${caseName} error code should be 2305018, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_2900
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2900
     * @tc.desc   empty array to certs Certificate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_2900';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [];
          networkSecurity.verifyCertChain(certs).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 401, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 401, `${caseName} error code should be 401, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_3000
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3000
     * @tc.desc   invalid certs Certificatefor PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_3000';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [{
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: 'INVALID CERT'
          }];
          networkSecurity.verifyCertChain(certs).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_3100
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3100
     * @tc.desc   invalid certs Certificate for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_3100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const derData = new Uint8Array([0x30, 0x82, 0x03, 0x00]);
          const certs: networkSecurity.CertBlob[] = [{
            type: networkSecurity.CertType.CERT_TYPE_DER,
            data: derData.buffer
          }];
          networkSecurity.verifyCertChain(certs).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_3200
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3200
     * @tc.desc  A correct and leaf Certificate + CA + correct hostname for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_3200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: LEAF_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com')
            .then((result: networkSecurity.CertBlob[]) => {
              console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
              expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
              done();
            })
            .catch((error) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
              expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_3300
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3300
     * @tc.desc  A correct and leaf Certificate+ CA + correct hostname for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_3300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const leafCertDer: ArrayBuffer = pemToDer(LEAF_CERT);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: leafCertDer }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: LEAF_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com')
            .then((result: networkSecurity.CertBlob[]) => {
              console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
              expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
              done();
            })
            .catch((error) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
              expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_3400
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3400
     * @tc.desc  A correct and Intermediate Certificate + CA + correct hostname for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_3400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: INTERMEDIATE_CA_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com')
            .then((result: networkSecurity.CertBlob[]) => {
              console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
              expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
              done();
            })
            .catch((error) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
              expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_3500
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3500
     * @tc.desc  A correct and Intermediate Certificate + CA + correct hostname  for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_3500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const intermediateCertDer: ArrayBuffer = pemToDer(INTERMEDIATE_CA_CERT);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: intermediateCertDer }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: LEAF_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com')
            .then((result: networkSecurity.CertBlob[]) => {
              console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
              expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
              done();
            })
            .catch((error) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
              expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_3600
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3600
     * @tc.desc   Certs param is undefined, expect error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_3600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] | undefined = undefined;
          networkSecurity.verifyCertChain(certs!).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 401, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 401, `${caseName} error code should be 401, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          const errCode: number = getErrCode(err as Error);
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch errCode:${errCode}, err:${JSON.stringify(err)}`);
          expectTrue(errCode === 401 || errCode === -1,
            `${caseName} catch error code should be 401 or runtime NullPointerError, actual: ${errCode}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_3700
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3700
     * @tc.desc   Certs param is null, expect error code 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_3700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] | null = null;
          networkSecurity.verifyCertChain(certs!).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 401, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 401, `${caseName} error code should be 401, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          const errCode: number = getErrCode(err as Error);
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch errCode:${errCode}, err:${JSON.stringify(err)}`);
          expectTrue(errCode === 401 || errCode === -1,
            `${caseName} catch error code should be 401 or runtime NullPointerError, actual: ${errCode}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_3800
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3800
     * @tc.desc   CaCert param is null with a valid chain, expect error code 401 or cert verify failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_3800';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
          ];
          const caCert: networkSecurity.CertBlob | null = null;
          networkSecurity.verifyCertChain(certs, caCert!).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} succeeded with result length: ${result.length}`);
            expectTrue(result.length >= 1, `${caseName} result length should be at least 1, actual: ${result.length}`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 401 || error.code === 2305001 || error.code === 2305018,
              `${caseName} error code should be 401 or 2305001 or 2305018, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          const errCode: number = getErrCode(err as Error);
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch errCode:${errCode}, err:${JSON.stringify(err)}`);
          expectTrue(errCode === 401 || errCode === 2305001 || errCode === 2305018 || errCode === -1,
            `${caseName} catch error code should be 401 or 2305001 or 2305018 or runtime error, actual: ${errCode}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_3900
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3900
     * @tc.desc   Hostname param is null with a valid chain, expect error code 401 or hostname verify failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_3900';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: ROOT_CA_CERT
          };
          const hostname: string | null = null;
          networkSecurity.verifyCertChain(certs, caCert, hostname!).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} succeeded with result length: ${result.length}`);
            expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 401 || error.code === 2305062,
              `${caseName} error code should be 401 or 2305062, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          const errCode: number = getErrCode(err as Error);
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch errCode:${errCode}, err:${JSON.stringify(err)}`);
          expectTrue(errCode === 401 || errCode === 2305062 || errCode === -1,
            `${caseName} catch error code should be 401 or 2305062 or runtime error, actual: ${errCode}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_4000
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_4000
     * @tc.desc   Hostname param is undefined with a valid chain, expect success same as no hostname.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_4000';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: ROOT_CA_CERT
          };
          const hostname: string | undefined = undefined;
          networkSecurity.verifyCertChain(certs, caCert, hostname).then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
            expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
            result.forEach((cert: networkSecurity.CertBlob, index: int) => {
              expectTrue(cert.data !== undefined && cert.data !== null,
                `${caseName} cert[${index}] data should not be null or undefined`);
              if (typeof cert.data === 'string') {
                let certData = cert.data as string;
                expectTrue(certData.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
              } else if (cert.data instanceof ArrayBuffer) {
                let certData = cert.data as ArrayBuffer;
                expectTrue(certData.byteLength > 0,
                  `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
              }
            });
            done();
          }).catch((error) => {
            console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
            expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_4100
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_4100
     * @tc.desc   Hostname param is an empty string with a valid chain, expect error code 401 or 2305062.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_4100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: ROOT_CA_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert, '').then((result: networkSecurity.CertBlob[]) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} succeeded with result length: ${result.length}`);
            expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 401 || error.code === 2305062,
              `${caseName} error code should be 401 or 2305062, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          const errCode: number = getErrCode(err as Error);
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch errCode:${errCode}, err:${JSON.stringify(err)}`);
          expectTrue(errCode === 401 || errCode === 2305062 || errCode === -1,
            `${caseName} catch error code should be 401 or 2305062 or runtime error, actual: ${errCode}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_4200
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_4200
     * @tc.desc   Certs cert type mismatches data format (DER type with PEM data), expect error code 401 or 2305001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_4200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const mismatchType: networkSecurity.CertType = networkSecurity.CertType.CERT_TYPE_DER;
          const certs: networkSecurity.CertBlob[] = [
            { type: mismatchType, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: ROOT_CA_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 401 or 2305001, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 401 || error.code === 2305001,
              `${caseName} error code should be 401 or 2305001, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          const errCode: number = getErrCode(err as Error);
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch errCode:${errCode}, err:${JSON.stringify(err)}`);
          expectTrue(errCode === 401 || errCode === 2305001 || errCode === -1,
            `${caseName} catch error code should be 401 or 2305001 or runtime error, actual: ${errCode}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_4300
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_4300
     * @tc.desc   Certs cert type mismatches data format (DER type with PEM data), expect error code 401 or 2305001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_4300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const mismatchType: networkSecurity.CertType = networkSecurity.CertType.CERT_TYPE_DER;
          const certs: networkSecurity.CertBlob[] = [
            { type: mismatchType, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: ROOT_CA_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 401 or 2305001, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 401 || error.code === 2305001,
              `${caseName} error code should be 401 or 2305001, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          const errCode: number = getErrCode(err as Error);
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch errCode:${errCode}, err:${JSON.stringify(err)}`);
          expectTrue(errCode === 401 || errCode === 2305001 || errCode === -1,
            `${caseName} catch error code should be 401 or 2305001 or runtime error, actual: ${errCode}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_4400
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_4400
     * @tc.desc   CaCert type mismatches data format (DER type with PEM data), expect error code 401 or 2305001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_4400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
          ];
          const mismatchType: networkSecurity.CertType = networkSecurity.CertType.CERT_TYPE_DER;
          const caCert: networkSecurity.CertBlob = {
            type: mismatchType,
            data: ROOT_CA_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 401 or 2305001, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 401 || error.code === 2305001,
              `${caseName} error code should be 401 or 2305001, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          const errCode: number = getErrCode(err as Error);
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch errCode:${errCode}, err:${JSON.stringify(err)}`);
          expectTrue(errCode === 401 || errCode === 2305001 || errCode === -1,
            `${caseName} catch error code should be 401 or 2305001 or runtime error, actual: ${errCode}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_4500
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_4500
     * @tc.desc   Certs data is an empty string for PEM, expect error code 401 or 2305001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_4500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: '' },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: ROOT_CA_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 401 or 2305001, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 401 || error.code === 2305001,
              `${caseName} error code should be 401 or 2305001, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          const errCode: number = getErrCode(err as Error);
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch errCode:${errCode}, err:${JSON.stringify(err)}`);
          expectTrue(errCode === 401 || errCode === 2305001 || errCode === -1,
            `${caseName} catch error code should be 401 or 2305001 or runtime error, actual: ${errCode}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_4600
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_4600
     * @tc.desc   Certs data is an empty ArrayBuffer for DER, expect error code 401 or 2305001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_4600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const emptyDerData = new Uint8Array(0);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: emptyDerData.buffer },
            { type: networkSecurity.CertType.CERT_TYPE_DER, data: pemToDer(INTERMEDIATE_CA_CERT) }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_DER,
            data: pemToDer(ROOT_CA_CERT)
          };
          networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} should fail but succeeded with result length: ${result.length}`);
            expectFalse(true, `${caseName} should fail with error code 401 or 2305001, but succeeded`);
            done();
          }).catch((error) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} failed as expected: ${JSON.stringify(error)}`);
            expectTrue(error.code === 401 || error.code === 2305001,
              `${caseName} error code should be 401 or 2305001, actual: ${error.code}`);
            done();
          });
        } catch (err) {
          const errCode: number = getErrCode(err as Error);
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch errCode:${errCode}, err:${JSON.stringify(err)}`);
          expectTrue(errCode === 401 || errCode === 2305001 || errCode === -1,
            `${caseName} catch error code should be 401 or 2305001 or runtime error, actual: ${errCode}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain_static_4700
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_4700
     * @tc.desc   Return value coverage: verify CertBlob array structure, type and data of each element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain_static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain_static_4700';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
          ];
          const caCert: networkSecurity.CertBlob = {
            type: networkSecurity.CertType.CERT_TYPE_PEM,
            data: ROOT_CA_CERT
          };
          networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com')
            .then((result: networkSecurity.CertBlob[]) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} VerifyCertChain result length: ${result.length}`);
              expectTrue(result !== undefined && result !== null, `${caseName} result should not be null or undefined`);
              expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
              result.forEach((cert: networkSecurity.CertBlob, index: int) => {
                expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM ||
                  cert.type === networkSecurity.CertType.CERT_TYPE_DER,
                  `${caseName} cert[${index}] type should be a valid CertType, actual: ${cert.type}`);
                expectTrue(cert.data !== undefined && cert.data !== null,
                  `${caseName} cert[${index}] data should not be null or undefined`);
                if (typeof cert.data === 'string') {
                  let certData = cert.data as string;
                  expectTrue(certData.length > 0,
                    `${caseName} cert[${index}] data string length should be greater than 0`);
                } else if (cert.data instanceof ArrayBuffer) {
                  let certData = cert.data as ArrayBuffer;
                  expectTrue(certData.byteLength > 0,
                    `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
                }
              });
              done();
            })
            .catch((error) => {
              console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
              expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', `${caseName} err: ${err}`);
          expectFalse(true, `${caseName} unexpected exception: ${err}`);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
  });
}