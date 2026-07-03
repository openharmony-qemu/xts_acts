/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import networkSecurity from '@ohos.net.networkSecurity';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import { util } from '@kit.ArkTS';

const expectFalse: (n: boolean, name: string) => void = (n: boolean, name: string) => {
  try {
    expect(n).assertFalse();
  }
  catch (err) {
    console.info(`${name}, test failed`);
  }
}

const expectTrue: (n: boolean, name: string) => void = (n: boolean, name: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`${name}, test failed`);
  }
}

function getRawFileContentWrapper(filePath: string): Promise<Uint8Array> {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return new Promise<Uint8Array>((resolve, reject) => {
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
  try {
    const model_buffer = await getRawFileContentWrapper(path);
    console.log(`[rawfile_copy_to_sandbox]${model_buffer} ${model_buffer.toString()} `);
    let file = fs.openSync(derPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.writeSync(file.fd, model_buffer.buffer);
    fs.closeSync(file);
  } catch (error) {
    console.log(`[rawfile_copy_to_sandbox] ${derPath} is copy failed:${error.code}, message: ${error.message}.`);
  }
}

// 将 PEM 格式证书转换为 DER 格式（ArrayBuffer）
function pemToDer(pemCert: string): ArrayBuffer {
  // 去掉 PEM 格式的 BEGIN 和 END 标记，以及换行符
  let base64Data: string = pemCert;
  base64Data = base64Data.replace('-----BEGIN CERTIFICATE-----', '');
  base64Data = base64Data.replace('-----END CERTIFICATE-----', '');
  base64Data = base64Data.replace(/\r\n/g, '');
  base64Data = base64Data.replace(/\n/g, '');
  base64Data = base64Data.replace(/\s/g, '');
  
  // 使用 Base64Helper 解码
  let base64Helper: util.Base64Helper = new util.Base64Helper();
  let uint8Array: Uint8Array = base64Helper.decodeSync(base64Data);
  
  // 将 Uint8Array 转换为 ArrayBuffer
  return uint8Array.buffer;
}

export default function netWorkSecurityTest() {

  const perSuccess: string = '-----BEGIN CERTIFICATE-----\nMIIDjjCCAnagAwIBAgIQAzrx5qcRqaC7KGSxHQn65TANBgkqhkiG9w0BAQsFADBhMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBHMjAeFw0xMzA4MDExMjAwMDBaFw0zODAxMTUxMjAwMDBaMGExCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xIDAeBgNVBAMTF0RpZ2lDZXJ0IEdsb2JhbCBSb290IEcyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuzfNNNx7a8myaJCtSnX/RrohCgiN9RlUyfuI2/Ou8jqJkTx65qsGGmvPrC3oXgkkRLpimn7Wo6h+4FR1IAWsULecYxpsMNzaHxmx1x7e/dfgy5SDN67sH0NO3Xss0r0upS/kqbitOtSZpLYl6ZtrAGCSYP9PIUkY92eQq2EGnI/yuum06ZIya7XzV+hdG82MHauVBJVJ8zUtluNJbd134/tJS7SsVQepj5WztCO7TG1F8PapspUwtP1MVYwnSlcUfIKdzXOS0xZKBgyMUNGPHgm+F6HmIcr9g+UQvIOlCsRnKPZzFBQ9RnbDhxSJITRNrw9FDKZJobq7nMWxM4MphQIDAQABo0IwQDAPBgNVHRMBAf8EBTADAQH/MA4GA1UdDwEB/wQEAwIBhjAdBgNVHQ4EFgQUTiJUIBiV5uNu5g/6+rkS7QYXjzkwDQYJKoZIhvcNAQELBQADggEBAGBnKJRvDkhj6zHd6mcY1Yl9PMWLSn/pvtsrF9+wX3N3KjITOYFnQoQj8kVnNeyIv/iPsGEMNKSuIEyExtv4NeF22d+mQrvHRAiGfzZ0JFrabA0UWTW98kndth/Jsw1HKj2ZL7tcu7XUIOGZX1NGFdtom/DzMNU+MeKNhJ7jitralj41E6Vf8PlwUHBHQRFXGU7Aj64GxJUTFy8bJZ918rGOmaFvE7FBcf6IKshPECBV1/MUReXgRPTqh5Uykw7+U0b6LJ3/iyK5S9kJRaTepLiaWN0bfVKfjllDiIGknibVb63dDcY3fe0Dkhvld1927jyNxF1WW6LZZm6zNTflMrY=\n-----END CERTIFICATE-----';
  const lastCA: string = '-----BEGIN CERTIFICATE-----\nMIICrTCCAhYCAQEwDQYJKoZIhvcNAQEEBQAwgZ4xIDAeBgNVBAoTF01pY3Jvc29mdCBUcnVzdCBOZXR3b3JrMR4wHAYDVQQLExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBUaW1lIFN0YW1waW5nIFNlcnZpY2UgUm9vdDErMCkGA1UECxMiQ29weXJpZ2h0IChjKSAxOTk3IE1pY3Jvc29mdCBDb3JwLjAeFw05NzA1MTMxNjEyNTlaFw05OTEyMzAyMzU5NTlaMIGeMSAwHgYDVQQKExdNaWNyb3NvZnQgVHJ1c3QgTmV0d29yazEeMBwGA1UECxMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgVGltZSBTdGFtcGluZyBTZXJ2aWNlIFJvb3QxKzApBgNVBAsTIkNvcHlyaWdodCAoYykgMTk5NyBNaWNyb3NvZnQgQ29ycC4wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBALdaOPUfN8ypQ8TcJBi+8oVStB1bXxi5C49Lbaj/zUBQbNOg01xHwrn3huTNfTUFaTcfrz3dH/2PFTTCxHnMWXSKb4wOw+gR64Q4R5hT4fEMDeQBDPAbHiDaKno9whVSjor/ezK/WB4lmIMmy4rJxAcUJLxJntd6s4caJTO8bQhHAgMBAAEwDQYJKoZIhvcNAQEEBQADgYEAUFvFa2+NUlsNyb2sNHOYygqHyq5MSroUpOtScJUh4LWhYE73QwJRAa8eOnDOvxi2hiiZZ+sI6JdAXBaC/bgl+zZvb3Y+xUyO4qdR+srBY7pegyRHC5Ny9kSazqeVOo9QEJ4dsVkWq88+34OLx/rDa9xkn0ArH0UkBK5JL/bfDJE=\n-----END CERTIFICATE-----';
  const yetVaild:string='-----BEGIN CERTIFICATE-----\nMIIDYTCCAkmgAwIBAgIUIewAwnXfv05454CM/TFKk+hHxG8wDQYJKoZIhvcNAQELBQAwPjEVMBMGA1UEAwwMbXlzZXJ2ZXIuY29tMRgwFgYDVQQKDA9NeSBPcmdhbml6YXRpb24xCzAJBgNVBAYTAlVTMCIYDzIwNTQwNTEwMDc1MDUzWhgPMjA1NDA2MTQwNzUwNTNaMD4xFTATBgNVBAMMDG15c2VydmVyLmNvbTEYMBYGA1UECgwPTXkgT3JnYW5pemF0aW9uMQswCQYDVQQGEwJVUzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKpFHPQ8xsHOit/gE9UilNRSKEKar2MbM2yLChjwAyD0o6F2pxsh5j/LKpW2SfJDuuss29fYFL6uz5cOe9L/iYAokvsfnkgROw9A32IWbYI8xp1oTBj7gWbaFa13bTNPNKNBL853HDLDq2j5iuwj/nfy5jJ4gjT6gIN+aIifIpHrAzbTddshLjtOnHd3qcIAKuS77bMZUDso3KLoBwf4cYRFnbzawHzbUB/+lF0oCKpVQaWPwR3/h/mk0whmtgCWFzudWeUUMg7oGi8EDs+yplIUKBzY+EJnMKgwb+cQmsvJwlKocT5emfBcgeZVa6D9IRsCY3M3KGu9Oj7CLwo1qmcCAwEAAaNTMFEwHQYDVR0OBBYEFHEcqcAomUhPIspbIbdX8GgTD+PpMB8GA1UdIwQYMBaAFHEcqcAomUhPIspbIbdX8GgTD+PpMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEBAIUnxVQZ1kC5MEUoIMMsFABx7gbnnlxhFmj5JSYVouE8/2ywjmxjTiY7vx9vLJVw/m8pVCCsNdKHcRnmtWqNF6P9ZuUrJwj81HNpEuGIzFlzQX6gJcaFu/uKd/f9R1NBSlz8ot4Fdb/4gU8J5o2LNV69BMIsgtrsVw/UkVGM+h+376ox2xXXt2zx2aq8/WOmHW0S7iL/RuUNAD8RoD6kHdECPvu1O6TWP1NXb3U35V6cmr+PAXF/zxCCvREvTe7sF6k7uPHosiqikH5PKgYfb+hYbV2pZm2yDwqh/90b0/xb4phJmCH2J+XoYlMaBX8v0N6WEz1+znNYU/tF99d/mL0=\n-----END CERTIFICATE-----'

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

  // 真实的公共CA证书链（从 www.example.com 获取）
  // 叶子证书：example.com（由 Cloudflare TLS Issuing ECC CA 3 签发）
  // 有效期：2026-05-31 至 2026-08-29
  const PUBLIC_CA_LEAF_CERT = `-----BEGIN CERTIFICATE-----
MIID5zCCA42gAwIBAgIQGqc/6iV74zNLmilVLm+HjjAKBggqhkjOPQQDAjBRMQsw
CQYDVQQGEwJVUzEYMBYGA1UECgwPU1NMIENvcnBvcmF0aW9uMSgwJgYDVQQDDB9D
bG91ZGZsYXJlIFRMUyBJc3N1aW5nIEVDQyBDQSAzMB4XDTI2MDUzMTIxMzkxMloX
DTI2MDgyOTIxNDEyNlowFjEUMBIGA1UEAwwLZXhhbXBsZS5jb20wWTATBgcqhkjO
PQIBBggqhkjOPQMBBwNCAAR3K9vg9mgByiZluphXApVAUpQtIO9MPLbbdVxu2SDI
KEYKZhTqszaA9lNa6oAGtsi++/m+uwI35sAG+zkIpAeOo4ICgDCCAnwwDAYDVR0T
AQH/BAIwADAfBgNVHSMEGDAWgBSDA/3n9vVKTRVB9O0iFtMyCj7KZjBsBggrBgEF
BQcBAQRgMF4wOQYIKwYBBQUHMAKGLWh0dHA6Ly9pLmNmLWkuc3NsLmNvbS9DbG91
ZGZsYXJlLVRMUy1JLUUzLmNlcjAhBggrBgEFBQcwAYYVaHR0cDovL28uY2YtaS5z
c2wuY29tMCUGA1UdEQQeMByCC2V4YW1wbGUuY29tgg0qLmV4YW1wbGUuY29tMCMG
A1UdIAQcMBowCAYGZ4EMAQIBMA4GDCsGAQQBgqkwAQMBATATBgNVHSUEDDAKBggr
BgEFBQcDATBTBgNVHR8ETDBKMEigRqBEhkJodHRwOi8vYy5jZi1pLnNzbC5jb20v
YWU4MDFlZDFjNTViYjU3OWQ3OTIwOGIwZDc3MmFjZmI4Y2MzYTIwOC5jcmwwDgYD
VR0PAQH/BAQDAgeAMA8GCSsGAQQBgtpLLAQCBQAwggEEBgorBgEEAdZ5AgQCBIH1
BIHyAPAAdgCUTkOH+uzB74HzGSQmqBhlAcfTXzgCAT9yZ31VNy4Z2AAAAZ6AAzGJ
AAAEAwBHMEUCIQCBv0JM0mXaiiQ9efuArkk3O2t/RQ39q7O3oKtYCvOUhQIgdn2u
t5rn+AWzBqZ9m1VOlMLpT/jy2M92Is6itMy9rR8AdgDIo8R/x7OtuTVrAT9qehJt
4zpOQ6XGRvmXrTl1mR3PmgAAAZ6AAzGgAAAEAwBHMEUCIQCoc8r0LVigaz6pvG8s
v0+uBqzf+LPNPxwYxtgkuVdNMwIgAbK/qRNJIWljIVp30PFWjmM+SnoT80ShaPJM
GdbtNLMwCgYIKoZIzj0EAwIDSAAwRQIhALDciGbviRHUIMPez2CVH+Vc0NiaT8Br
FrUGD7dej3D4AiAfs90UtVHGYKTXYYPIJlVqUK1amlBBby7M2KI7pSMjxA==
-----END CERTIFICATE-----`;

  // 中间CA证书：Cloudflare TLS Issuing ECC CA 3
  const PUBLIC_CA_INTERMEDIATE_CERT = `-----BEGIN CERTIFICATE-----
MIIC4jCCAmmgAwIBAgIQMe7oivuHzZ74M2YEdD+bJzAKBggqhkjOPQQDAzBPMQsw
CQYDVQQGEwJVUzEYMBYGA1UECgwPU1NMIENvcnBvcmF0aW9uMSYwJAYDVQQDDB1T
U0wuY29tIFRMUyBUcmFuc2l0IEVDQyBDQSBSMjAeFw0yNTA1MjkxOTQ5NDVaFw0z
NTA1MjcxOTQ5NDRaMFExCzAJBgNVBAYTAlVTMRgwFgYDVQQKDA9TU0wgQ29ycG9y
YXRpb24xKDAmBgNVBAMMH0Nsb3VkZmxhcmUgVExTIElzc3VpbmcgRUNDIENBIDMw
WTATBgcqhkjOPQIBBggqhkjOPQMBBwNCAAT9HRQUjiNCkybPcNCJ17Eecqw+XVlS
gd8c9dYludZ3B4ULjRKxKz9AuR9yBuD/QFIKk0n4yXGwfu7go0VRGER0o4IBIzCC
AR8wEgYDVR0TAQH/BAgwBgEB/wIBADAfBgNVHSMEGDAWgBQyosfYWIv/f8A88lVp
M+zOzB+8lzBIBggrBgEFBQcBAQQ8MDowOAYIKwYBBQUHMAKGLGh0dHA6Ly9jZXJ0
LnNzbC5jb20vU1NMLmNvbS1UTFMtVC1FQ0MtUjIuY2VyMBEGA1UdIAQKMAgwBgYE
VR0gADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwEwPQYDVR0fBDYwNDAy
oDCgLoYsaHR0cDovL2NybHMuc3NsLmNvbS9TU0wuY29tLVRMUy1ULUVDQy1SMi5j
cmwwHQYDVR0OBBYEFIMD/ef29UpNFUH07SIW0zIKPspmMA4GA1UdDwEB/wQEAwIB
hjAKBggqhkjOPQQDAwNnADBkAjBkW/dgTArl36px6LVMWzfHLv0pFD+P9BoOYzir
Z2aS2IwsQPHb0rQdZMY5NghTTk4CMCiwDU71fhtYVRulUc575HJroLXgj+BkpkBu
bdHnb2+aPpCH7LP6QNQ/Xm9NiqdxAw==
-----END CERTIFICATE-----`;

  // 根CA证书：SSL.com TLS Transit ECC CA R2
  const PUBLIC_CA_ROOT_CERT = `-----BEGIN CERTIFICATE-----
MIICDzCCAZWgAwIBAgIQbShBqkKHvIkzLVtJLe8ejTAKBggqhkjOPQQDAzBPMQsw
CQYDVQQGEwJVUzEYMBYGA1UECgwPU1NMIENvcnBvcmF0aW9uMSYwJAYDVQQDDB1T
U0wuY29tIFRMUyBUcmFuc2l0IEVDQyBDQSBSMjAeFw0yMjA4MjUxNjQyNDVaFw00
MjA4MTkxNjQyNDRaME8xCzAJBgNVBAYTAlVTMRgwFgYDVQQKDA9TU0wgQ29ycG9y
YXRpb24xJjAkBgNVBAMMHVNTTC5jb20gVExTIFRyYW5zaXQgRUNDIENBIFIyMHYw
EAYHKoZIzj0CAQYFK4EEACIDYgAExi8JKBu+F+Wi2lMXnWY4YeXTJXbUj1xGDSor
KNKt/NrS2PvZSLYJt+W+f2zzN7yyZPDthBiUJpYfZwHzKLJPmCMfWfGhKkr/Rlhv
0QiPBkIZMC+ga3oolBKTRbNhzmlQo0IwQDAPBgNVHRMBAf8EBTADAQH/MB0GA1Ud
DgQWBBQyosfYWIv/f8A88lVpM+zOzB+8lzAOBgNVHQ8BAf8EBAMCAYYwCgYIKoZI
zj0EAwMDaAAwZQIxALHr7VCz+k3c6JDyJLsZ8zGJLfVKkjXPBzXrfWGLJfGnNe3F
arlefJJhTmCfDfEKfgIwBV/13n3APJfYXlCkbpHLXz1KmEfLXfZPsXMAS4TKqHhE
hdq9flCDwNSiXzUUWGMJ
-----END CERTIFICATE-----`;

  // DigiCert Global Root CA - 系统通常自带的根证书
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

  describe('netWorkSecurityVerChainTest', () => {
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain0100
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0100
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + correct hostname for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain0100';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: ROOT_CA_CERT
        };
        networkSecurity.verifyCertChain(certs, caCert,'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
            `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain0200
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0200
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + correct hostname for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain0200';
      console.info(`${caseName} test start`);
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
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
            `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain0300
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0300
     * @tc.desc  A correct and complete certificate chain (leaf + intermediate + root CA) + correct hostname for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain0300';
      console.info(`${caseName} test start`);
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
        networkSecurity.verifyCertChain(certs, caCert,'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
            `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain0400
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0400
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + correct hostname for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain0400';
      console.info(`${caseName} test start`);
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
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
            `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain0500
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0500
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain0500';
      console.info(`${caseName} test start`);
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
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
            `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain0600
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0600
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + no hostname for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain0600';
      console.info(`${caseName} test start`);
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
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
            `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain0700
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0700
     * @tc.desc  A correct and complete certificate chain (leaf + intermediate + root CA) + no hostname for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain0700';
      console.info(`${caseName} test start`);
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
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
            `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain0800
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0800
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + no hostname for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain0800';
      console.info(`${caseName} test start`);
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
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 3, `${caseName} result length should be 3, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
            `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain0900
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_0900
     * @tc.desc   Correct Single Self-Signed Certificate + CA + correct hostname for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain0900';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };
        networkSecurity.verifyCertChain(certs, caCert,'test.example.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 1, `${caseName} result length should be 1, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
            `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain1000
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1000
     * @tc.desc   Correct Single Self-Signed Certificate + CA + correct hostname for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain1000';
      console.info(`${caseName} test start`);
      try {
        const realselfsignedCertDer: ArrayBuffer = pemToDer(REAL_SELF_SIGNED_CERT);
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_DER, data: realselfsignedCertDer }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_DER,
          data: realselfsignedCertDer
        };
        networkSecurity.verifyCertChain(certs, caCert,'test.example.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 1, `${caseName} result length should be 3, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
            `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain1100
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1100
     * @tc.desc   Correct Single Self-Signed Certificate + CA + no hostname for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain1100';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };
        networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 1, `${caseName} result length should be 1, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
            `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain1200
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1200
     * @tc.desc   Correct Single Self-Signed Certificate + CA + no hostname for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain1200';
      console.info(`${caseName} test start`);
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
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 1, `${caseName} result length should be 3, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
            `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain1300
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1300
     * @tc.desc   Correct single system built-in CA certificate (root) + CA is undefined for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain1300';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: DIGICERT_ROOT_CA }
        ];
        const caCert: networkSecurity.CertBlob | undefined = undefined;
        expectTrue(caCert === undefined, `${caseName} caCert should be undefined`);
        networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 1, `${caseName} result length should be 1, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain1400
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1400
     * @tc.desc   Correct single system built-in CA certificate (root) + CA is undefined for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain1400';
      console.info(`${caseName} test start`);
      try {
        const digiCertDer: ArrayBuffer = pemToDer(DIGICERT_ROOT_CA);
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_DER, data: digiCertDer }
        ];
        const caCert: networkSecurity.CertBlob | undefined = undefined;
        expectTrue(caCert === undefined, `${caseName} caCert should be undefined`);
        networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 1, `${caseName} result length should be 1, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain1500
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1500
     * @tc.desc   Multiple Identical Self-Signed Certificates + CA + Hostname for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain1500';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT },
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };
        networkSecurity.verifyCertChain(certs, caCert,'test.example.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 1, `${caseName} result length should be 1, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
            `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain1600
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1600
     * @tc.desc   Multiple Identical Self-Signed Certificates + CA + Hostname for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain1600';
      console.info(`${caseName} test start`);
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
        networkSecurity.verifyCertChain(certs, caCert,'test.example.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 1, `${caseName} result length should be 3, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
            `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain1700
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1700
     * @tc.desc   Multiple Identical Self-Signed Certificates + CA + no Hostname for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain1700';
      console.info(`${caseName} test start`);
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
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 1, `${caseName} result length should be 1, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_PEM,
            `${caseName} caCert type should be CERT_TYPE_PEM, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain1800
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1800
     * @tc.desc   Multiple Identical Self-Signed Certificates + CA + no Hostname for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain1800';
      console.info(`${caseName} test start`);
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
          console.info(`${caseName} VerifyCertChain result length: ${result.length}`);
          expectTrue(result.length === 1, `${caseName} result length should be 3, actual: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}] type should be CERT_TYPE_PEM, actual: ${cert.type}`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}] data string length should be greater than 0`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}] data ArrayBuffer byteLength should be greater than 0`);
            }
          });
          expectTrue(caCert.type === networkSecurity.CertType.CERT_TYPE_DER,
            `${caseName} caCert type should be CERT_TYPE_DER, actual: ${caCert.type}`);
          if (typeof caCert.data === 'string') {
            expectTrue(caCert.data.length > 0, `${caseName} caCert data string length should be greater than 0`);
          } else if (caCert.data instanceof ArrayBuffer) {
            expectTrue(caCert.data.byteLength > 0, `${caseName} caCert data ArrayBuffer byteLength should be greater than 0`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} VerifyCertChain failed: ${JSON.stringify(error)}`);
          expectFalse(true, `${caseName} should succeed, but failed with error: ${error.code} - ${error.message}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain1900
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_1900
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + Invalid hostname for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain1900';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: ROOT_CA_CERT
        };
        networkSecurity.verifyCertChain(certs, caCert,'wrong.hostname.com').then((result: networkSecurity.CertBlob[]) => {
          console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
          expectFalse(true, `${caseName} should fail with error code 2305062, but succeeded`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305062, `${caseName} error code should be 2305062, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain2000
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2000
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + Invalid hostname for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain2000';
      console.info(`${caseName} test start`);
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
        networkSecurity.verifyCertChain(certs, caCert,'wrong.hostname.com').then((result: networkSecurity.CertBlob[]) => {
          console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
          expectFalse(true, `${caseName} should fail with error code 2305062, but succeeded`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305062, `${caseName} error code should be 2305062, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain2100
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2100
     * @tc.desc  A correct and complete certificate chain (leaf + intermediate + root CA) + Invalid hostname for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain2100';
      console.info(`${caseName} test start`);
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
        networkSecurity.verifyCertChain(certs, caCert, 'wrong.hostname.com').then((result: networkSecurity.CertBlob[]) => {
          console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
          expectFalse(true, `${caseName} should fail with error code 2305062, but succeeded`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305062, `${caseName} error code should be 2305062, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain2200
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2200
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root CA) + Invalid hostname for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain2200';
      console.info(`${caseName} test start`);
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
        networkSecurity.verifyCertChain(certs, caCert, 'wrong.hostname.com').then((result: networkSecurity.CertBlob[]) => {
          console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
          expectFalse(true, `${caseName} should fail with error code 2305062, but succeeded`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305062, `${caseName} error code should be 2305062, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain2300
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2300
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root) for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain2300';
      console.info(`${caseName} test start`);
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
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain2400
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2400
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root) for Forward order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain2400';
      console.info(`${caseName} test start`);
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
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain2500
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2500
     * @tc.desc  A correct and complete certificate chain (leaf + intermediate + root)  for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain2500';
      console.info(`${caseName} test start`);
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
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain2600
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2600
     * @tc.desc   A correct and complete certificate chain (leaf + intermediate + root)  for out of order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain2600';
      console.info(`${caseName} test start`);
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
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });


    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain2700
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2700
     * @tc.desc   Correct Single Self-Signed Certificate + no CA for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain2700';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
        ];
        networkSecurity.verifyCertChain(certs).then((result: networkSecurity.CertBlob[]) => {
          console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
          expectFalse(true, `${caseName} should fail with error code 2305018, but succeeded`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305018, `${caseName} error code should be 2305018, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain2800
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2800
     * @tc.desc   Correct Single Self-Signed Certificate + no CA for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain2800';
      console.info(`${caseName} test start`);
      try {
        const realselfsignedCertDer: ArrayBuffer = pemToDer(REAL_SELF_SIGNED_CERT);
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_DER, data: realselfsignedCertDer }
        ];
        networkSecurity.verifyCertChain(certs).then((result: networkSecurity.CertBlob[]) => {
          console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
          expectFalse(true, `${caseName} should fail with error code 2305018, but succeeded`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305018, `${caseName} error code should be 2305018, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain2900
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_2900
     * @tc.desc   empty array to certs Certificate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain2900';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [];
        networkSecurity.verifyCertChain(certs).then((result: networkSecurity.CertBlob[]) => {
          console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
          expectFalse(true, `${caseName} should fail with error code 401, but succeeded`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 401, `${caseName} error code should be 401, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain3000
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3000
     * @tc.desc   invalid certs Certificatefor PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain3000';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [{
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: 'INVALID CERT'
        }];
        networkSecurity.verifyCertChain(certs).then((result: networkSecurity.CertBlob[]) => {
          console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
          expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain3100
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3100
     * @tc.desc   invalid certs Certificate for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain3100';
      console.info(`${caseName} test start`);
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
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain3200
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3200
     * @tc.desc  A correct and leaf Certificate + CA + correct hostname for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain3200';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: LEAF_CERT
        };
        networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
          expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain3300
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3300
     * @tc.desc  A correct and leaf Certificate+ CA + correct hostname for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain3300';
      console.info(`${caseName} test start`);
      try {
        const leafCertDer: ArrayBuffer = pemToDer(LEAF_CERT);
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_DER, data: leafCertDer }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: LEAF_CERT
        };
        networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
          expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain3400
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3400
     * @tc.desc  A correct and Intermediate Certificate + CA + correct hostname for PEM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain3400';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: INTERMEDIATE_CA_CERT
        };
        networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
          expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain3500
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3500
     * @tc.desc  A correct and Intermediate Certificate + CA + correct hostname  for DER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain3500';
      console.info(`${caseName} test start`);
      try {
        const intermediateCertDer: ArrayBuffer = pemToDer(INTERMEDIATE_CA_CERT);
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_DER, data: intermediateCertDer }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: LEAF_CERT
        };
        networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.error(`${caseName} VerifyCertChain should fail but succeeded with result length: ${result.length}`);
          expectFalse(true, `${caseName} should fail with error code 2305001, but succeeded`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} VerifyCertChain failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305001, `${caseName} error code should be 2305001, actual: ${error.code}`);
          done();
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
  });
}