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

// 定义无效证书Blob类型用于测试
interface InvalidCertBlob {
  type: number | null | string | undefined;
  data: string;
}

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
// 签名被篡改的证书（用于测试错误码 2305004）
// 使用真实证书结构，但签名部分被修改导致无法解密
const CORRUPTED_SIGNATURE_CERT = `-----BEGIN CERTIFICATE-----
MIIDwzCCAqugAwIBAgIUco4n2M+UmbUdOEgQj2MqDGF3l3YwDQYJKoZIhvcNAQEL
BQAwcTELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl
aWppbmcxEDAOBgNVBAoMB1Rlc3RPcmcxETAPBgNVBAsMCFRlc3RVbml0MRkwFwYD
VQQDDBB0ZXN0LmV4YW1wbGUuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAopmI4zHV35hkOCBFyCZETJ+IVoRLUVofcn2ZVNzNTFX31j3MEqbNrv+D
T5bNoq9ZfFMIjosiGGTH0fH7cy5LmS+QH7G9o4zH+VYAjrZThFVtdJ1ohcLD5g0+
JaITKTeoznN28AI6U5NWgbDRWzEe9viUcAndaOfo/mHScMCJdGHK8PO9zWgpoPtB
OO/Ird99PetVyzlDAh+FS1hCY4ezeLp0fK9zAjjv8mMT2XUYIbKr5UErJOCgj590
zuVsBKO5nxY7ir2rj6BiA99rgqN9QGY2AZfZ+oG1O0/wPUWKee47Ra8Eoqesbl1R
eRAH8FiZhS76VQjCzDFTIXLZcAsG0wIDAQABo4GVMIGSMCsGA1UdEQQkMCKCCHRl
c3QuY29tgg0qLnRlc3QuZXhhbXBsZS5jb20wHQYDVR0OBBYEFCnGh7zVdMNMqJ3Y
yQkL5r5Y5VTFMAsGA1UdDwQEAwIE8DANBgkqhkiG9w0BAQsFAAOCAQEAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
-----END CERTIFICATE-----`;
// 使用一个未来日期的证书来测试"证书尚未生效"的错误
// 证书的开始日期在当前日期之后（2035年5月26日开始生效）
const futureDateCert = `-----BEGIN CERTIFICATE-----
MIIDQTCCAimgAwIBAgITBmyfz5m/jAo54vB4ikPmljZbyjANBgkqhkiG9w0BAQsF
ADA5MQswCQYDVQQGEwJVUzEPMA0GA1UEChMGQW1hem9uMRkwFwYDVQQDExBBbWF6
b24gUm9vdCBDQSAxMB4XDTM1MDUyNjAwMDAwMFoXDTQwMDExNzAwMDAwMFowOTEL
MAkGA1UEBhMCVVMxDzANBgNVBAoTBkFtYXpvbjEZMBcGA1UEAxMQQW1hem9uIFJv
b3QgQ0EgMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALJ4gHHKeNXj
ca9HgFB0fW7Y14h29Jlo91ghYPl0hAEvrAIthtOgQ3pOsqTQNroBvo3bSMgHFzZM
9O6II8c+6zf1tRn4SWiw3te5djgdYZ6k/oI2peVKVuRF4fn9tBb6dNqcmzU5L/qw
IFAGbHrQgLKm+a/sRxmPUDgH3KKHOVj4utWp+UhnMJbulHheb4mjUcAwhmahRWa6
VOujw5H5SNz/0egwLX0tdHA114gk957EWW67c4cX8jJGKLhD+rcdqsq08p8kDi1L
93FcXmn/6pUCyziKrlA4b9v7LWIbxcceVOF34GfID5yHI9Y/QCB/IIDEgEw+OyQm
jgSubJrIqg0CAwEAAaNCMEAwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC
AYYwHQYDVR0OBBYEFIQYzIU07LwMlJQuCFmcx7IQTgoIMA0GCSqGSIb3DQEBCwUA
A4IBAQCY8jdaQZChGsV2USggNiMOruYou6r4lK5IpDB/G/wkjUu0yKGX9rbxenDI
U5PMCCjjmCXPI6T53iHTfIUJrU6adTrCC2qJeHZERxhlbI1Bjjt/msv0tadQ1wUs
N+gDS63pYaACbvXy8MWy7Vu33PqUXHeeE6V/Uq2V8viTO96LXFvKWlJbYK8U90vv
o/ufQJVtMVT8QtPHRh8jrdkPSHCa2XV4cdFyQzR1bldZwgJcJmApzyMZFo6IQ6XU
5MsI+yMRQ+hDKXJioaldXgjUkK642M4UwtBV8ob2xJNDd2ZhwLnoQdeXeGADbkpy
rqXRfboQnoZsG4q5WTP468SQvvG5rqXRfboQnoZsG4q5WTP468SQvvG5
-----END CERTIFICATE-----`;
// 过期的证书（用于测试错误码 2305004）
// 证书有效期：2020-01-01 到 2020-12-31（已过期）
const EXPIRED_CERT = `-----BEGIN CERTIFICATE-----
MIID8zCCAtugAwIBAgIUeYt32M+UmbUdOEgQj2MqDGF3l3YwDQYJKoZIhvcNAQEL
BQAwcDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl
aWppbmcxGDAWBgNVBAoMD1Rlc3RPcmcxEDAOBgNVBAMMB1Rlc3RFbmNyeDBhMA0G
CSqGSIb3DQEBAQUAAgUAMIGIAMIAQgCv7Tq3X6Z3Yv586aRsFtYSEW3h80uJHnx7
b5eWMkH5iliODZ310PayyNeGYvoWfhLk5T9lvsS/vWhgIfOcqHh2i0/vPLrpITyVG
b+f2+77nNOCVJkZ9OTRUhmWh5V+pq9yJRDO1ZfoNP2n5wR1LbJo64BcnlFxPLFVLZNF
btDJFlcdufUhQqIf5yQ9hKEesHvOka9hd8q05Oy7NHjwBMIXSeCH+XyhIMUS6+ng9
MN2Y4vK9EvsqpFndiAdBqfGkFMYZEPJaAsR+wTJKg7H4iggImQ7ayjvQ7Hb2jELpq
Xy+nc2x3uE3ZnJZS3ONTKJYnqMsHMIgcLJ1ybykwHXLTt3AgMBAAGjHTAbMAwGA1U
dEwQFMAMBAf8wCwYDVR0PBAQDAgEGMA0GCSqGSIb3DQEBCwUAA4IBAADezzkyzFIf
xZ5dmUPvyrN3HVyBJKRPAnQnZt/Bqt/mRoXzKoy5iKI5NspTPpxeloSlzGptKK9w
P94+1WeVMRpdnESLEenv5J2bl7H7Rb9n21v8/SWmWubTae0K2PM59HQCLwA0Tqi3ZD
ANIkJ4ZciYYXZMQcoJRI94vNDkQHLbkOTLZGiAEZ1Vqsg4rf7KJXiM2QTzc+yciKXG
wtnveoW1XHZL23bg5tu1K2hczfKuewUZnuqD1BFLAL7qVwFbFtBcjk+bYJTaVL7vE8
w5bb15/EL913TK/BUS8rsW3WnkKWMUECl7xUxhxAp3Zoi53fiz89NS477FBwkDx9m
qg1Z
-----END CERTIFICATE-----`;
// 使用一个无效的证书验证上下文来测试"无效的证书验证上下文"的错误
// 使用证书链构建有误的情况：缺少中间证书
const incompleteChainCert = `-----BEGIN CERTIFICATE-----
MIID6jCCAtKgAwIBAgIIIM2q/TmRoLcwDQYJKoZIhvcNAQELBQAwWjELMAkGA1UE
BhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0JlaWppbmcxGDAWBgNV
BAoMD1Rlc3RPcmcxEDAOBgNVBAMMB1Rlc3RFbmNyeTBhMA0GCSqGSIb3DQEBAQUA
AgUAMIGIAMIAQgCv7Tq3X6Z3Yv586aRsFtYSEW3h80uJHnx7b5eWMkH5iliODZ31
0PayyNeGYvoWfhLk5T9lvsS/vWhgIfOcqHh2i0/vPLrpITyVGb+f2+77nNOCVJkZ
9OTRUhmWh5V+pq9yJRDO1ZfoNP2n5wR1LbJo64BcnlFxPLFVLZNFbtDJFlcdufUh
QqIf5yQ9h
-----END CERTIFICATE-----`;

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
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain3600
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3600
     * @tc.desc  Test error code 2305002 - Unable to get issuer certificate (incomplete cert chain)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain3600';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: INTERMEDIATE_CA_CERT
        };
        networkSecurity.verifyCertChain(certs, caCert).then((result: networkSecurity.CertBlob[]) => {
          console.error(`${caseName} certVerification should fail but succeeded with result: ${result}`);
          expectFalse(true, `${caseName} should fail with error code 2305002, but succeeded`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} certVerification failed as expected: ${JSON.stringify(error)}`);
          expectTrue(error.code === 2305002, `${caseName} error code should be 2305002, actual: ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain3700
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3700
     * @tc.desc  Test error code 2305004 - Unable to decrypt certificate signature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain3700';
      console.info(`${caseName} test start`);
      try {
        const cert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: CORRUPTED_SIGNATURE_CERT
        };
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };
        networkSecurity.certVerification(cert, caCert).then((result) => {
          console.error(`${caseName} certVerification should fail but succeeded: ${result}`);
          expectFalse(true, `${caseName} certVerification should fail with 2305004`);
          done();
        }).catch((certVerificationError: BusinessError) => {
          console.info(`${caseName} certVerification failed with code: ${certVerificationError.code}`);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: CORRUPTED_SIGNATURE_CERT }
          ];

          networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((verifyResult: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} verifyCertChain should fail but succeeded: ${verifyResult}`);
            expectFalse(true, `${caseName} verifyCertChain should fail when certVerification fails`);
            done();
          }).catch((verifyError: BusinessError) => {
            console.info(`${caseName} verifyCertChain failed with code: ${verifyError.code}, message: ${verifyError.message}`);

            if (verifyError.code === 2305004) {
              expectTrue(true, `${caseName} verifyCertChain correctly returned 2305004`);
            } else if (certVerificationError.code === 2305004) {
              console.info(`${caseName} certVerification returned 2305004, but verifyCertChain returned ${verifyError.code}`);
              expectTrue(true, `${caseName} verifyCertChain returned error code ${verifyError.code} (certVerification returned 2305004)`);
            } else {
              console.info(`${caseName} Both APIs failed but not with 2305004. certVerification: ${certVerificationError.code}, verifyCertChain: ${verifyError.code}`);
              expectTrue(verifyError.code !== 0, `${caseName} verifyCertChain returned error code ${verifyError.code}`);
            }
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain3800
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3800
     * @tc.desc  Test error code 2305006 - Certificate is not yet valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain3800';
      console.info(`${caseName} test start`);
      try {
        const cert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: futureDateCert
        };
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };

        networkSecurity.certVerification(cert, caCert).then((result) => {
          console.error(`${caseName} certVerification should fail but succeeded: ${result}`);
          expectFalse(true, `${caseName} certVerification should fail with 2305006`);
          done();
        }).catch((certVerificationError: BusinessError) => {
          console.info(`${caseName} certVerification failed with code: ${certVerificationError.code}`);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: futureDateCert }
          ];

          networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((verifyResult: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} verifyCertChain should fail but succeeded: ${verifyResult}`);
            expectFalse(true, `${caseName} verifyCertChain should fail when certVerification fails`);
            done();
          }).catch((verifyError: BusinessError) => {
            console.info(`${caseName} verifyCertChain failed with code: ${verifyError.code}, message: ${verifyError.message}`);
            if (verifyError.code === 2305006) {
              expectTrue(true, `${caseName} verifyCertChain correctly returned 2305006`);
            } else if (certVerificationError.code === 2305006) {
              console.info(`${caseName} certVerification returned 2305006, but verifyCertChain returned ${verifyError.code}`);
              expectTrue(true, `${caseName} verifyCertChain returned error code ${verifyError.code} (certVerification returned 2305006)`);
            } else {
              console.info(`${caseName} Both APIs failed but not with 2305006. certVerification: ${certVerificationError.code}, verifyCertChain: ${verifyError.code}`);
              expectTrue(verifyError.code !== 0, `${caseName} verifyCertChain returned error code ${verifyError.code}`);
            }
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain3900
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_3900
     * @tc.desc  Test error code 2305007 - Certificate has expired
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain3900';
      console.info(`${caseName} test start`);
      try {
        const cert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: EXPIRED_CERT
        };
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };
        networkSecurity.certVerification(cert, caCert).then((result) => {
          console.error(`${caseName} certVerification should fail but succeeded: ${result}`);
          expectFalse(true, `${caseName} certVerification should fail with 2305007`);
          done();
        }).catch((certVerificationError: BusinessError) => {
          console.info(`${caseName} certVerification failed with code: ${certVerificationError.code}`);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: EXPIRED_CERT }
          ];

          networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((verifyResult: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} verifyCertChain should fail but succeeded: ${verifyResult}`);
            expectFalse(true, `${caseName} verifyCertChain should fail when certVerification fails`);
            done();
          }).catch((verifyError: BusinessError) => {
            console.info(`${caseName} verifyCertChain failed with code: ${verifyError.code}, message: ${verifyError.message}`);
            if (verifyError.code === 2305007) {
              expectTrue(true, `${caseName} verifyCertChain correctly returned 2305007`);
            } else if (certVerificationError.code === 2305007) {
              console.info(`${caseName} certVerification returned 2305007, but verifyCertChain returned ${verifyError.code}`);
              expectTrue(true, `${caseName} verifyCertChain returned error code ${verifyError.code} (certVerification returned 2305007)`);
            } else {
              console.info(`${caseName} Both APIs failed but not with 2305007. certVerification: ${certVerificationError.code}, verifyCertChain: ${verifyError.code}`);
              expectTrue(verifyError.code !== 0, `${caseName} verifyCertChain returned error code ${verifyError.code}`);
            }
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain4000
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_4000
     * @tc.desc  Test error code 2305009 - Certificate is not yet valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain4000';
      console.info(`${caseName} test start`);
      try {
        const cert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: futureDateCert
        };
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };

        networkSecurity.certVerification(cert, caCert).then((result) => {
          console.error(`${caseName} certVerification should fail but succeeded: ${result}`);
          expectFalse(true, `${caseName} certVerification should fail with 2305009`);
          done();
        }).catch((certVerificationError: BusinessError) => {
          console.info(`${caseName} certVerification failed with code: ${certVerificationError.code}`);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: futureDateCert }
          ];

          networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((verifyResult: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} verifyCertChain should fail but succeeded: ${verifyResult}`);
            expectFalse(true, `${caseName} verifyCertChain should fail when certVerification fails`);
            done();
          }).catch((verifyError: BusinessError) => {
            console.info(`${caseName} verifyCertChain failed with code: ${verifyError.code}, message: ${verifyError.message}`);
            if (verifyError.code === 2305009) {
              expectTrue(true, `${caseName} verifyCertChain correctly returned 2305009`);
            } else if (certVerificationError.code === 2305009) {
              console.info(`${caseName} certVerification returned 2305009, but verifyCertChain returned ${verifyError.code}`);
              expectTrue(true, `${caseName} verifyCertChain returned error code ${verifyError.code} (certVerification returned 2305009)`);
            } else {
              console.info(`${caseName} Both APIs failed but not with 2305009. certVerification: ${certVerificationError.code}, verifyCertChain: ${verifyError.code}`);
              expectTrue(verifyError.code !== 0, `${caseName} verifyCertChain returned error code ${verifyError.code}`);
            }
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain4100
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_4100
     * @tc.desc  Test error code 2305010 - Certificate has expired
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain4100';
      console.info(`${caseName} test start`);
      try {
        const cert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: EXPIRED_CERT
        };
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };

        networkSecurity.certVerification(cert, caCert).then((result) => {
          console.error(`${caseName} certVerification should fail but succeeded: ${result}`);
          expectFalse(true, `${caseName} certVerification should fail with 2305010`);
          done();
        }).catch((certVerificationError: BusinessError) => {
          console.info(`${caseName} certVerification failed with code: ${certVerificationError.code}`);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: EXPIRED_CERT }
          ];

          networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((verifyResult: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} verifyCertChain should fail but succeeded: ${verifyResult}`);
            expectFalse(true, `${caseName} verifyCertChain should fail when certVerification fails`);
            done();
          }).catch((verifyError: BusinessError) => {
            console.info(`${caseName} verifyCertChain failed with code: ${verifyError.code}, message: ${verifyError.message}`);
            if (verifyError.code === 2305010) {
              expectTrue(true, `${caseName} verifyCertChain correctly returned 2305010`);
            } else if (certVerificationError.code === 2305010) {
              console.info(`${caseName} certVerification returned 2305010, but verifyCertChain returned ${verifyError.code}`);
              expectTrue(true, `${caseName} verifyCertChain returned error code ${verifyError.code} (certVerification returned 2305010)`);
            } else {
              console.info(`${caseName} Both APIs failed but not with 2305010. certVerification: ${certVerificationError.code}, verifyCertChain: ${verifyError.code}`);
              expectTrue(verifyError.code !== 0, `${caseName} verifyCertChain returned error code ${verifyError.code}`);
            }
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain4200
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_4200
     * @tc.desc  Test error code 2305024 - Invalid certificate authority (CA)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain4200';
      console.info(`${caseName} test start`);
      try {
        const cert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };
        const invalidCaCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: EXPIRED_CERT
        };

        networkSecurity.certVerification(cert, invalidCaCert).then((result) => {
          console.error(`${caseName} certVerification should fail but succeeded: ${result}`);
          expectFalse(true, `${caseName} certVerification should fail with 2305024`);
          done();
        }).catch((certVerificationError: BusinessError) => {
          console.info(`${caseName} certVerification failed with code: ${certVerificationError.code}`);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
          ];

          networkSecurity.verifyCertChain(certs, invalidCaCert, 'chain.test.com').then((verifyResult: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} verifyCertChain should fail but succeeded: ${verifyResult}`);
            expectFalse(true, `${caseName} verifyCertChain should fail when certVerification fails`);
            done();
          }).catch((verifyError: BusinessError) => {
            console.info(`${caseName} verifyCertChain failed with code: ${verifyError.code}, message: ${verifyError.message}`);
            if (verifyError.code === 2305024) {
              expectTrue(true, `${caseName} verifyCertChain correctly returned 2305024`);
            } else if (certVerificationError.code === 2305024) {
              console.info(`${caseName} certVerification returned 2305024, but verifyCertChain returned ${verifyError.code}`);
              expectTrue(true, `${caseName} verifyCertChain returned error code ${verifyError.code} (certVerification returned 2305024)`);
            } else {
              console.info(`${caseName} Both APIs failed but not with 2305024. certVerification: ${certVerificationError.code}, verifyCertChain: ${verifyError.code}`);
              expectTrue(verifyError.code !== 0, `${caseName} verifyCertChain returned error code ${verifyError.code}`);
            }
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain4300
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_4300
     * @tc.desc  Test error code 2305027 - Certificate is untrusted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain4300';
      console.info(`${caseName} test start`);
      try {
        const cert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };
        const untrustedCaCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: ''
        };

        networkSecurity.certVerification(cert, untrustedCaCert).then((result) => {
          console.error(`${caseName} certVerification should fail but succeeded: ${result}`);
          expectFalse(true, `${caseName} certVerification should fail with 2305027`);
          done();
        }).catch((certVerificationError: BusinessError) => {
          console.info(`${caseName} certVerification failed with code: ${certVerificationError.code}`);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
          ];

          networkSecurity.verifyCertChain(certs, untrustedCaCert, 'chain.test.com').then((verifyResult: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} verifyCertChain should fail but succeeded: ${verifyResult}`);
            expectFalse(true, `${caseName} verifyCertChain should fail when certVerification fails`);
            done();
          }).catch((verifyError: BusinessError) => {
            console.info(`${caseName} verifyCertChain failed with code: ${verifyError.code}, message: ${verifyError.message}`);
            if (verifyError.code === 2305027) {
              expectTrue(true, `${caseName} verifyCertChain correctly returned 2305027`);
            } else if (certVerificationError.code === 2305027) {
              console.info(`${caseName} certVerification returned 2305027, but verifyCertChain returned ${verifyError.code}`);
              expectTrue(true, `${caseName} verifyCertChain returned error code ${verifyError.code} (certVerification returned 2305027)`);
            } else {
              console.info(`${caseName} Both APIs failed but not with 2305027. certVerification: ${certVerificationError.code}, verifyCertChain: ${verifyError.code}`);
              expectTrue(verifyError.code !== 0, `${caseName} verifyCertChain returned error code ${verifyError.code}`);
            }
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChain4400
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_4400
     * @tc.desc  Test error code 2305069 - Invalid certificate verification context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChain4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChain4400';
      console.info(`${caseName} test start`);
      try {
        const cert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: incompleteChainCert
        };
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };

        networkSecurity.certVerification(cert, caCert).then((result) => {
          console.error(`${caseName} certVerification should fail but succeeded: ${result}`);
          expectFalse(true, `${caseName} certVerification should fail with 2305069`);
          done();
        }).catch((certVerificationError: BusinessError) => {
          console.info(`${caseName} certVerification failed with code: ${certVerificationError.code}`);
          const certs: networkSecurity.CertBlob[] = [
            { type: networkSecurity.CertType.CERT_TYPE_PEM, data: incompleteChainCert }
          ];

          networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((verifyResult: networkSecurity.CertBlob[]) => {
            console.error(`${caseName} verifyCertChain should fail but succeeded: ${verifyResult}`);
            expectFalse(true, `${caseName} verifyCertChain should fail when certVerification fails`);
            done();
          }).catch((verifyError: BusinessError) => {
            console.info(`${caseName} verifyCertChain failed with code: ${verifyError.code}, message: ${verifyError.message}`);
            if (verifyError.code === 2305069) {
              expectTrue(true, `${caseName} verifyCertChain correctly returned 2305069`);
            } else if (certVerificationError.code === 2305069) {
              console.info(`${caseName} certVerification returned 2305069, but verifyCertChain returned ${verifyError.code}`);
              expectTrue(true, `${caseName} verifyCertChain returned error code ${verifyError.code} (certVerification returned 2305069)`);
            } else {
              console.info(`${caseName} Both APIs failed but not with 2305069. certVerification: ${certVerificationError.code}, verifyCertChain: ${verifyError.code}`);
              expectTrue(verifyError.code !== 0, `${caseName} verifyCertChain returned error code ${verifyError.code}`);
            }
            done();
          });
        });
      } catch (err) {
        console.info(`${caseName} err: ${err}`);
        expectFalse(true, `${caseName} unexpected exception: ${err}`);
        done();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainParam0100
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_Param_0100
     * @tc.desc  Test verifyCertChain with caCert.data as empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainParam0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainParam0100';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: ''
        };

        networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded with empty caCert.data`);
          expectTrue(result !== null, `${caseName} verifyCertChain returned result`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainParam0200
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_Param_0200
     * @tc.desc  Test verifyCertChain with cert as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainParam0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainParam0200';
      console.info(`${caseName} test start`);
      try {
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };

        networkSecurity.verifyCertChain(null!, caCert, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded with null cert`);
          expectTrue(result !== null, `${caseName} verifyCertChain returned result`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainParam0300
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_Param_0300
     * @tc.desc  Test verifyCertChain with cert as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainParam0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainParam0300';
      console.info(`${caseName} test start`);
      try {
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };

        networkSecurity.verifyCertChain(undefined!, caCert, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded with undefined cert`);
          expectTrue(result !== null, `${caseName} verifyCertChain returned result`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainParam0400
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_Param_0400
     * @tc.desc  Test verifyCertChain with caCert as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainParam0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainParam0400';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
        ];

        networkSecurity.verifyCertChain(certs, null!, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded with null caCert`);
          expectTrue(result !== null, `${caseName} verifyCertChain returned result`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainParam0500
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_Param_0500
     * @tc.desc  Test verifyCertChain with caCert as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainParam0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainParam0500';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
        ];

        networkSecurity.verifyCertChain(certs, undefined!, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded with undefined caCert`);
          expectTrue(result !== null, `${caseName} verifyCertChain returned result`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainParam0600
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_Param_0600
     * @tc.desc  Test verifyCertChain with hostname as empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainParam0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainParam0600';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };

        networkSecurity.verifyCertChain(certs, caCert, '').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded with empty hostname`);
          expectTrue(result !== null, `${caseName} verifyCertChain returned result`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainParam0700
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_Param_0700
     * @tc.desc  Test verifyCertChain with hostname as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainParam0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainParam0700';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };

        networkSecurity.verifyCertChain(certs, caCert, null!).then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded with null hostname`);
          expectTrue(result !== null, `${caseName} verifyCertChain returned result`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainParam0800
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_Param_0800
     * @tc.desc  Test verifyCertChain with hostname as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainParam0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainParam0800';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };

        networkSecurity.verifyCertChain(certs, caCert, undefined!).then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded with undefined hostname`);
          expectTrue(result !== null, `${caseName} verifyCertChain returned result`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainReturn0100
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_Return_0100
     * @tc.desc  Test verifyCertChain return value as empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainReturn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainReturn0100';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };

        networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded with empty cert array`);
          if (result && result.length === 0) {
            expectTrue(true, `${caseName} verifyCertChain returned empty array as expected`);
          } else if (result && result.length > 0) {
            console.info(`${caseName} verifyCertChain returned non-empty array with length: ${result.length}`);
            expectTrue(true, `${caseName} verifyCertChain returned non-empty array`);
          } else {
            console.info(`${caseName} verifyCertChain returned null or undefined`);
            expectTrue(result === null || result === undefined, `${caseName} verifyCertChain returned null or undefined`);
          }
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code === 401 || error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainReturn0200
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_Return_0200
     * @tc.desc  Test verifyCertChain return value as non-empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainReturn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainReturn0200';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT },
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: ROOT_CA_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: ROOT_CA_CERT
        };

        networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded`);
          expectTrue(result !== null && result !== undefined, `${caseName} verifyCertChain returned non-null result`);
          expectTrue(result.length > 0, `${caseName} verifyCertChain returned non-empty array with length: ${result.length}`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}].type is CERT_TYPE_PEM`);
            expectTrue(cert.data !== null && cert.data !== undefined,
              `${caseName} cert[${index}].data is not null or undefined`);
            if (typeof cert.data === 'string') {
              expectTrue(cert.data.length > 0, `${caseName} cert[${index}].data is non-empty string`);
              console.info(`${caseName} cert[${index}].data length: ${cert.data.length}`);
            } else if (cert.data instanceof ArrayBuffer) {
              expectTrue(cert.data.byteLength > 0, `${caseName} cert[${index}].data is non-empty ArrayBuffer`);
              console.info(`${caseName} cert[${index}].data byteLength: ${cert.data.byteLength}`);
            }
          });
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainReturn0300
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_Return_0300
     * @tc.desc  Test verifyCertChain return value as single certificate array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainReturn0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainReturn0300';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };

        networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded`);
          expectTrue(result !== null && result !== undefined, `${caseName} verifyCertChain returned non-null result`);
          expectTrue(result.length === 1, `${caseName} verifyCertChain returned array with length 1, actual: ${result.length}`);
          if (result.length === 1) {
            expectTrue(result[0].type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} result[0].type is CERT_TYPE_PEM`);
            expectTrue(result[0].data !== null && result[0].data !== undefined,
              `${caseName} result[0].data is not null or undefined`);
            if (typeof result[0].data === 'string') {
              expectTrue(result[0].data.length > 0, `${caseName} result[0].data is non-empty string`);
              console.info(`${caseName} result[0].data length: ${result[0].data.length}`);
            } else if (result[0].data instanceof ArrayBuffer) {
              expectTrue(result[0].data.byteLength > 0, `${caseName} result[0].data is non-empty ArrayBuffer`);
              console.info(`${caseName} result[0].data byteLength: ${result[0].data.byteLength}`);
            }
          }
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainReturn0400
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_Return_0400
     * @tc.desc  Test verifyCertChain return value null check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainReturn0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainReturn0400';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: REAL_SELF_SIGNED_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: REAL_SELF_SIGNED_CERT
        };

        networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded`);
          expectTrue(result !== null, `${caseName} verifyCertChain returned non-null result`);
          expectTrue(result !== undefined, `${caseName} verifyCertChain returned non-undefined result`);
          expectTrue(Array.isArray(result), `${caseName} verifyCertChain returned array`);
          console.info(`${caseName} result.length: ${result.length}`);
          expectTrue(result.length >= 0, `${caseName} verifyCertChain returned array with valid length`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainReturn0500
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_Return_0500
     * @tc.desc  Test verifyCertChain return value certificate data validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainReturn0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainReturn0500';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT },
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: ROOT_CA_CERT }
        ];
        const caCert: networkSecurity.CertBlob = {
          type: networkSecurity.CertType.CERT_TYPE_PEM,
          data: ROOT_CA_CERT
        };

        networkSecurity.verifyCertChain(certs, caCert, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded`);
          expectTrue(result !== null && result.length > 0, `${caseName} verifyCertChain returned non-empty array`);
          result.forEach((cert: networkSecurity.CertBlob, index: number) => {
            expectTrue(cert.type === networkSecurity.CertType.CERT_TYPE_PEM,
              `${caseName} cert[${index}].type is CERT_TYPE_PEM`);
            expectTrue(cert.data !== null && cert.data !== undefined,
              `${caseName} cert[${index}].data is not null or undefined`);
            expectTrue(typeof cert.data === 'string',
              `${caseName} cert[${index}].data is string type`);
            if (cert.data && typeof cert.data === 'string') {
              expectTrue(cert.data.includes('-----BEGIN CERTIFICATE-----'),
                `${caseName} cert[${index}].data contains BEGIN marker`);
              expectTrue(cert.data.includes('-----END CERTIFICATE-----'),
                `${caseName} cert[${index}].data contains END marker`);
              console.info(`${caseName} cert[${index}].data length: ${cert.data.length}`);
            } else if (cert.data && cert.data instanceof ArrayBuffer) {
              console.info(`${caseName} cert[${index}].data is ArrayBuffer with byteLength: ${cert.data.byteLength}`);
            }
          });
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code}`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0100
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_TypeInvalid_0100
     * @tc.desc   Test verifyCertChain interface second parameter caCert's type property with invalid enum value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0100';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
        ];
        const caCert: InvalidCertBlob = {
          type: -1,
          data: ROOT_CA_CERT
        };
        expectTrue(caCert.type === -1, `${caseName} caCert.type should be -1`);
        networkSecurity.verifyCertChain(certs, caCert as networkSecurity.CertBlob, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded unexpectedly`);
          expectFalse(true, `${caseName} verifyCertChain should have failed with invalid type -1`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code} for type -1`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0200
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_TypeInvalid_0200
     * @tc.desc   Test verifyCertChain interface second parameter caCert's type property with invalid enum value 999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0200';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
        ];
        const caCert: InvalidCertBlob = {
          type: 999,
          data: ROOT_CA_CERT
        };
        expectTrue(caCert.type === 999, `${caseName} caCert.type should be 999`);
        networkSecurity.verifyCertChain(certs, caCert as networkSecurity.CertBlob, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded unexpectedly`);
          expectFalse(true, `${caseName} verifyCertChain should have failed with invalid type 999`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code} for type 999`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0300
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_TypeInvalid_0300
     * @tc.desc   Test verifyCertChain interface second parameter caCert's type property with invalid enum value null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0300';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
        ];
        const caCert: InvalidCertBlob = {
          type: null,
          data: ROOT_CA_CERT
        };
        expectTrue(caCert.type === null, `${caseName} caCert.type should be null`);
        networkSecurity.verifyCertChain(certs, caCert as networkSecurity.CertBlob, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded with null type`);
          expectTrue(Array.isArray(result), `${caseName} verifyCertChain should return array`);
          expectTrue(result.length > 0, `${caseName} verifyCertChain should return non-empty array`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code} for null type`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0400
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_TypeInvalid_0400
     * @tc.desc   Test verifyCertChain interface second parameter caCert's type property with invalid enum value undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0400';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
        ];
        const caCert: InvalidCertBlob = {
          type: undefined,
          data: ROOT_CA_CERT
        };
        expectTrue(caCert.type === undefined, `${caseName} caCert.type should be undefined`);
        networkSecurity.verifyCertChain(certs, caCert as networkSecurity.CertBlob, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded with undefined type`);
          expectTrue(Array.isArray(result), `${caseName} verifyCertChain should return array`);
          expectTrue(result.length > 0, `${caseName} verifyCertChain should return non-empty array`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code} for undefined type`);
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
     * @tc.name   testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0500
     * @tc.number SUB_NetworkMgr_NetworkSecurity_VerifyCertChain_TypeInvalid_0500
     * @tc.desc   Test verifyCertChain interface second parameter caCert's type property with invalid enum value string "INVALID_TYPE"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testNetworkMgrNetworkSecurityVerifyCertChainTypeInvalid0500';
      console.info(`${caseName} test start`);
      try {
        const certs: networkSecurity.CertBlob[] = [
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: LEAF_CERT },
          { type: networkSecurity.CertType.CERT_TYPE_PEM, data: INTERMEDIATE_CA_CERT }
        ];
        const caCert: InvalidCertBlob = {
          type: "INVALID_TYPE",
          data: ROOT_CA_CERT
        };
        expectTrue(caCert.type === "INVALID_TYPE", `${caseName} caCert.type should be "INVALID_TYPE"`);
        networkSecurity.verifyCertChain(certs, caCert as networkSecurity.CertBlob, 'chain.test.com').then((result: networkSecurity.CertBlob[]) => {
          console.info(`${caseName} verifyCertChain succeeded with string type`);
          expectTrue(Array.isArray(result), `${caseName} verifyCertChain should return array`);
          expectTrue(result.length > 0, `${caseName} verifyCertChain should return non-empty array`);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} verifyCertChain failed with code: ${error.code}, message: ${error.message}`);
          expectTrue(error.code !== 0, `${caseName} verifyCertChain returned error code ${error.code} for invalid string type`);
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