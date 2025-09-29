/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { cert } from "@kit.DeviceCertificateKit";
import { stringToUint8Array } from "../certificate/p12";

/* 实体证书被吊销 START */
export let certChainPem: string =
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIIC7zCCAligAwIBAgIUWzNrc/tonSnZY9JR8BfKXk8KOW8wDQYJKoZIhvcNAQEL\n" +
  "BQAwcjELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl\n" +
  "aWppbmcxGDAWBgNVBAoMD0ludGVybWVkaWF0ZSBDQTELMAkGA1UECwwCSVQxGDAW\n" +
  "BgNVBAMMD0ludGVybWVkaWF0ZSBDQTAeFw0yNTA5MjQwOTU1NDhaFw0zMDEwMTgw\n" +
  "OTU1NDhaMG8xCzAJBgNVBAYTAkNOMRAwDgYDVQQIDAdCZWlqaW5nMRAwDgYDVQQH\n" +
  "DAdCZWlqaW5nMRUwEwYDVQQKDAxFeGFtcGxlIENvcnAxCzAJBgNVBAsMAklUMRgw\n" +
  "FgYDVQQDDA93d3cuZXhhbXBsZS5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJ\n" +
  "AoGBAOL3NbuvatdyzBwrwoSQ4CKXYVwPnLZ/ZIVw+P5abGmEuQgJymcwCu+CKf4t\n" +
  "FnCMGMLlRKYIJKNAw6ZYqAp2I1PzhLZ9DqcbdX+Jp9ex71H3jWQzdF953heNyReW\n" +
  "sUzbyCQ7h3Yi1qFlDCtCbX30lDEOxcdzFsgFmoQwfTbJbZKTAgMBAAGjgYQwgYEw\n" +
  "CQYDVR0TBAIwADALBgNVHQ8EBAMCBDAwJwYDVR0RBCAwHoIPd3d3LmV4YW1wbGUu\n" +
  "Y29tggtleGFtcGxlLmNvbTAdBgNVHQ4EFgQUpsHrA3AlSqtbPq8ysbAltPALNK8w\n" +
  "HwYDVR0jBBgwFoAUKFr/bKcMqpmzp09sdvd+oXGIIz0wDQYJKoZIhvcNAQELBQAD\n" +
  "gYEATe/voa3M7E2kBGTn82kuqnL2pgqlkcKZMEclSzEKKJCbSK5h0L3umN8A75Qq\n" +
  "dKr/MAZD8vPB7QNGlLmP5ujjDt14/LbnuDivIVhvzTgnkem7KhkzAPt+mUnv3dZy\n" +
  "HWuf0uQdbr+V4HGbe9CjZM4TnyzlJDdpKDdMx19IVQPmPg4=\n"                 +
  "-----END CERTIFICATE-----\n"                                        +
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIICujCCAiOgAwIBAgIUECXHZotH6yK5LTTdPFMkY9kZkawwDQYJKoZIhvcNAQEL\n" +
  "BQAwYjELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl\n" +
  "aWppbmcxEDAOBgNVBAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdS\n" +
  "b290IENBMB4XDTI1MDkyNDA5NTExOVoXDTMwMDkyMzA5NTExOVowcjELMAkGA1UE\n" +
  "BhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0JlaWppbmcxGDAWBgNV\n" +
  "BAoMD0ludGVybWVkaWF0ZSBDQTELMAkGA1UECwwCSVQxGDAWBgNVBAMMD0ludGVy\n" +
  "bWVkaWF0ZSBDQTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAttFaze2h1w2l\n" +
  "Dvw4+1CtA+9rbNBqD8MSiJQzvlHgFgjC7boVUYD3/WnNo2oMJjS2PNcgoB4/Yyht\n" +
  "0BkMf/x34BZBZKz6AvXAQXA3glMqJWREdTazSpLbWOhHGl7zVeU7AQBOQuBJavjd\n" +
  "nqJ4SFuZQYAyaDeki+grcBMAE9m4k0UCAwEAAaNdMFswDAYDVR0TBAUwAwEB/zAL\n" +
  "BgNVHQ8EBAMCAQYwHQYDVR0OBBYEFCha/2ynDKqZs6dPbHb3fqFxiCM9MB8GA1Ud\n" +
  "IwQYMBaAFAdRcKjUzOZqsbuWW7G2sgxX+ezgMA0GCSqGSIb3DQEBCwUAA4GBADqL\n" +
  "mv4laRDp6yrZZ7OUOY4vWbrCnJzYjWUAXoPv0DXmO3kFLN1/u7M2+P2/aKyal/HS\n" +
  "uIUf7duzDQKakjQ6SI5+UGMVjV3IypVZLMTqaEhkni8klQJQ9DgI4WTQnN9oyEfr\n" +
  "QK1+3QhI5nSHZ0vAlm9atzD0s0Jci6JuMBUw7ehm\n"                         +
  "-----END CERTIFICATE-----\n"                                        +
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIICwzCCAiygAwIBAgIUFHmiDZ6lR+Z3+u80U1r9f1CViV0wDQYJKoZIhvcNAQEL\n" +
  "BQAwYjELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl\n" +
  "aWppbmcxEDAOBgNVBAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdS\n" +
  "b290IENBMB4XDTI1MDkyNDA5NDgyN1oXDTM1MDkyMjA5NDgyN1owYjELMAkGA1UE\n" +
  "BhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0JlaWppbmcxEDAOBgNV\n" +
  "BAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdSb290IENBMIGfMA0G\n" +
  "CSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIKZ7fGE1Z+SqdfywoEl9NqQLOiLiHumzD\n" +
  "JDY1ZWApQpX9098Z2PmvPV6oh84UFEc2nv+yKG1kid2qh9jcm0zNaV2q0AA3t0d8\n" +
  "WTzjbs4HG4kdcUk5FtLhMVEBTUR0/ii38Y4tJXNmaarGyNbyB85GNqXTpxn9mkBp\n" +
  "cAEGa4A7BwIDAQABo3YwdDAdBgNVHQ4EFgQUB1FwqNTM5mqxu5ZbsbayDFf57OAw\n" +
  "HwYDVR0jBBgwFoAUB1FwqNTM5mqxu5ZbsbayDFf57OAwCwYDVR0PBAQDAgEGMAkG\n" +
  "A1UdEQQCMAAwCQYDVR0SBAIwADAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEB\n" +
  "CwUAA4GBAEwSMp+Zo4hMxmPp9VmKuvC5ElJCisdghrJxhb6KWVza9temcnAEkshZ\n" +
  "IRqW4mnstsY5YSuIhPF/oinVCVB7ViRPEb8ZnzxE3Bbka0/ShhE5wjBn75NcCbtD\n" +
  "WZvp+1vl8LlmRwRe2kr5JvcPw5IpGRq1tunznRpg+/3eEpI+KT3E\n"             +
  "-----END CERTIFICATE-----\n";

export let noCertCrl: string =
  "-----BEGIN X509 CRL-----\n"                                         +
  "MIIB4jCBywIBATANBgkqhkiG9w0BAQsFADCBhzELMAkGA1UEBhMCQ04xEDAOBgNV\n" +
  "BAgMB0JlaWppbmcxEDAOBgNVBAcMB0JlaWppbmcxHTAbBgNVBAoMFFRlc3QgSW50\n" +
  "ZXJtZWRpYXRlIENBMRYwFAYDVQQLDA1JVCBEZXBhcnRtZW50MR0wGwYDVQQDDBRU\n" +
  "ZXN0IEludGVybWVkaWF0ZSBDQRcNMjUwOTIyMDYzOTIzWhcNMjUxMDIyMDYzOTIz\n" +
  "WqAPMA0wCwYDVR0UBAQCAhAAMA0GCSqGSIb3DQEBCwUAA4IBAQBr1SaaRVZRrGLU\n" +
  "65uWBafmmRgolu+XGMlDv+3ppFUBcFNIFrL90Nobhh5gsuCNCu7gVs18mBfhRYrl\n" +
  "9886wzWusfQdu0LD1NBGfcKTa4ktBxVAVKpFEsgn8+1qTPz8lA3fWUnZjCJd0Ypw\n" +
  "tABlC8ISSid7wEDIi07WRMsMlWBMhJlSUTyF9ve9GYQHjdX6CBOfMLgwZbz2iP64\n" +
  "7Sv7qLGD/49MzrgqFQ8pzuUOL1UoYockEhZMqZh3XAePQI5h51OBnud1bf22s9YV\n" +
  "//69wV6R4g50kbxPvkYaYkH5n/kGhACt4UBT0WNsjWbX4lspo2hfh/oVvHI9sWut\n" +
  "D9l43siD\n"                                                         +
  "-----END X509 CRL-----";
/* 实体证书被吊销 END */

/* 中间证书被吊销 START */
export let certChainPem2: string =
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIIC8TCCAlqgAwIBAgIUIUvzWX3AOgQ/QjNel1SBhBtTPBAwDQYJKoZIhvcNAQEL\n" +
  "BQAwdDELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl\n" +
  "aWppbmcxGTAXBgNVBAoMEEludGVybWVkaWF0ZTIgQ0ExCzAJBgNVBAsMAklUMRkw\n" +
  "FwYDVQQDDBBJbnRlcm1lZGlhdGUyIENBMB4XDTI1MDkyNDEwMDIzNVoXDTMwMTAx\n" +
  "ODEwMDIzNVowbzELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNV\n" +
  "BAcMB0JlaWppbmcxFTATBgNVBAoMDEV4YW1wbGUgQ29ycDELMAkGA1UECwwCSVQx\n" +
  "GDAWBgNVBAMMD3d3dy5leGFtcGxlLmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAw\n" +
  "gYkCgYEA4vc1u69q13LMHCvChJDgIpdhXA+ctn9khXD4/lpsaYS5CAnKZzAK74Ip\n" +
  "/i0WcIwYwuVEpggko0DDplioCnYjU/OEtn0Opxt1f4mn17HvUfeNZDN0X3neF43J\n" +
  "F5axTNvIJDuHdiLWoWUMK0JtffSUMQ7Fx3MWyAWahDB9NsltkpMCAwEAAaOBhDCB\n" +
  "gTAJBgNVHRMEAjAAMAsGA1UdDwQEAwIEMDAnBgNVHREEIDAegg93d3cuZXhhbXBs\n" +
  "ZS5jb22CC2V4YW1wbGUuY29tMB0GA1UdDgQWBBSmwesDcCVKq1s+rzKxsCW08As0\n" +
  "rzAfBgNVHSMEGDAWgBRI56SWC90zDEsVlYS5LPemujOebzANBgkqhkiG9w0BAQsF\n" +
  "AAOBgQAhHhPjX5P1PEexyez0eW7DCAo03fxRBhcNjSBBCmiFWeOXvsvZgnDXv/Ky\n" +
  "5tR88MQ0HX2FAl9n0jo3qdvrMfo1EaT+fp1/PKmoE7y0WJD5JkMsKrKvR/5Gaspm\n" +
  "KwlxMhYyu7ET8A022NYLx885eBnWI6OOcnqYXnGeCnWWgNiXug==\n"             +
  "-----END CERTIFICATE-----\n"                                        +
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIICvDCCAiWgAwIBAgIUECXHZotH6yK5LTTdPFMkY9kZka0wDQYJKoZIhvcNAQEL\n" +
  "BQAwYjELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl\n" +
  "aWppbmcxEDAOBgNVBAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdS\n" +
  "b290IENBMB4XDTI1MDkyNDEwMDA0NFoXDTMwMDkyMzEwMDA0NFowdDELMAkGA1UE\n" +
  "BhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0JlaWppbmcxGTAXBgNV\n" +
  "BAoMEEludGVybWVkaWF0ZTIgQ0ExCzAJBgNVBAsMAklUMRkwFwYDVQQDDBBJbnRl\n" +
  "cm1lZGlhdGUyIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC94fbVrcDy\n" +
  "59VyR7/s3D27BPgnod1JzhzDF1QbOQ2N3ZMGBjpxbPtJ7wICK/bRFBNvUwXqJZba\n" +
  "zBER7y1VGZssrDpAW1CcVlAteyVb0ia2kr7sYRmTpUv5sl3nrZIVCy5SqeBVt19L\n" +
  "3UYz/ppHOfFoLLyoXYA/Ix3AlzPJWnCmnwIDAQABo10wWzAMBgNVHRMEBTADAQH/\n" +
  "MAsGA1UdDwQEAwIBBjAdBgNVHQ4EFgQUSOeklgvdMwxLFZWEuSz3proznm8wHwYD\n" +
  "VR0jBBgwFoAUB1FwqNTM5mqxu5ZbsbayDFf57OAwDQYJKoZIhvcNAQELBQADgYEA\n" +
  "dQJjyNHJkf7LlucyWJigmE24BasJDm0Il9pfsvNF7ZzlbUNjrEFnXLXG/ZwRavp/\n" +
  "j5M54cBLOQL02DU0f+YqcPaUmhNqrFq7EVa5VVKZgdQ8f7rOdJVrDhGugfg8zkQo\n" +
  "lbRUUGJ4JVlIR7ntr0WmG0frmZ+/V/t57sxRKNvGq8M=\n"                     +
  "-----END CERTIFICATE-----\n"                                        +
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIICwzCCAiygAwIBAgIUFHmiDZ6lR+Z3+u80U1r9f1CViV0wDQYJKoZIhvcNAQEL\n" +
  "BQAwYjELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl\n" +
  "aWppbmcxEDAOBgNVBAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdS\n" +
  "b290IENBMB4XDTI1MDkyNDA5NDgyN1oXDTM1MDkyMjA5NDgyN1owYjELMAkGA1UE\n" +
  "BhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0JlaWppbmcxEDAOBgNV\n" +
  "BAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdSb290IENBMIGfMA0G\n" +
  "CSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIKZ7fGE1Z+SqdfywoEl9NqQLOiLiHumzD\n" +
  "JDY1ZWApQpX9098Z2PmvPV6oh84UFEc2nv+yKG1kid2qh9jcm0zNaV2q0AA3t0d8\n" +
  "WTzjbs4HG4kdcUk5FtLhMVEBTUR0/ii38Y4tJXNmaarGyNbyB85GNqXTpxn9mkBp\n" +
  "cAEGa4A7BwIDAQABo3YwdDAdBgNVHQ4EFgQUB1FwqNTM5mqxu5ZbsbayDFf57OAw\n" +
  "HwYDVR0jBBgwFoAUB1FwqNTM5mqxu5ZbsbayDFf57OAwCwYDVR0PBAQDAgEGMAkG\n" +
  "A1UdEQQCMAAwCQYDVR0SBAIwADAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEB\n" +
  "CwUAA4GBAEwSMp+Zo4hMxmPp9VmKuvC5ElJCisdghrJxhb6KWVza9temcnAEkshZ\n" +
  "IRqW4mnstsY5YSuIhPF/oinVCVB7ViRPEb8ZnzxE3Bbka0/ShhE5wjBn75NcCbtD\n" +
  "WZvp+1vl8LlmRwRe2kr5JvcPw5IpGRq1tunznRpg+/3eEpI+KT3E\n"             +
  "-----END CERTIFICATE-----";

export let rootCrl: string =
  "-----BEGIN X509 CRL-----\n"                                         +
  "MIIBYzCBzQIBATANBgkqhkiG9w0BAQsFADBiMQswCQYDVQQGEwJDTjEQMA4GA1UE\n" +
  "CAwHQmVpamluZzEQMA4GA1UEBwwHQmVpamluZzEQMA4GA1UECgwHUm9vdCBDQTEL\n" +
  "MAkGA1UECwwCSVQxEDAOBgNVBAMMB1Jvb3QgQ0EXDTI1MDkyNDEwMjYxMVoXDTM1\n" +
  "MDkyMjEwMjYxMVowJzAlAhQQJcdmi0frIrktNN08UyRj2RmRrRcNMjUwOTI0MTAy\n" +
  "NTUxWqAOMAwwCgYDVR0UBAMCAQUwDQYJKoZIhvcNAQELBQADgYEAEGLDAa7xHu6U\n" +
  "SEUa7vDI9ZjxeQLJedqo3+j/ihMu1YBSP9yPXTUJ6MZcT8oMLLvYnjjV7Lp4jIq5\n" +
  "yBX3iW9+nrXfJKoHRkP9NMqUdk1jRBVNIG8xT+EYssa+lurN+wDjytI+BEA+kCJQ\n" +
  "4S4wrhhI4mBOBr53GbbsgZfEUhCrMoE=\n"                                 +
  "-----END X509 CRL-----";
/* 中间证书被吊销 END */

/* 中间证书被吊销 START */
export let certChainPem3: string =
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIIC7zCCAligAwIBAgIUWzNrc/tonSnZY9JR8BfKXk8KOW8wDQYJKoZIhvcNAQEL\n" +
  "BQAwcjELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl\n" +
  "aWppbmcxGDAWBgNVBAoMD0ludGVybWVkaWF0ZSBDQTELMAkGA1UECwwCSVQxGDAW\n" +
  "BgNVBAMMD0ludGVybWVkaWF0ZSBDQTAeFw0yNTA5MjQwOTU1NDhaFw0zMDEwMTgw\n" +
  "OTU1NDhaMG8xCzAJBgNVBAYTAkNOMRAwDgYDVQQIDAdCZWlqaW5nMRAwDgYDVQQH\n" +
  "DAdCZWlqaW5nMRUwEwYDVQQKDAxFeGFtcGxlIENvcnAxCzAJBgNVBAsMAklUMRgw\n" +
  "FgYDVQQDDA93d3cuZXhhbXBsZS5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJ\n" +
  "AoGBAOL3NbuvatdyzBwrwoSQ4CKXYVwPnLZ/ZIVw+P5abGmEuQgJymcwCu+CKf4t\n" +
  "FnCMGMLlRKYIJKNAw6ZYqAp2I1PzhLZ9DqcbdX+Jp9ex71H3jWQzdF953heNyReW\n" +
  "sUzbyCQ7h3Yi1qFlDCtCbX30lDEOxcdzFsgFmoQwfTbJbZKTAgMBAAGjgYQwgYEw\n" +
  "CQYDVR0TBAIwADALBgNVHQ8EBAMCBDAwJwYDVR0RBCAwHoIPd3d3LmV4YW1wbGUu\n" +
  "Y29tggtleGFtcGxlLmNvbTAdBgNVHQ4EFgQUpsHrA3AlSqtbPq8ysbAltPALNK8w\n" +
  "HwYDVR0jBBgwFoAUKFr/bKcMqpmzp09sdvd+oXGIIz0wDQYJKoZIhvcNAQELBQAD\n" +
  "gYEATe/voa3M7E2kBGTn82kuqnL2pgqlkcKZMEclSzEKKJCbSK5h0L3umN8A75Qq\n" +
  "dKr/MAZD8vPB7QNGlLmP5ujjDt14/LbnuDivIVhvzTgnkem7KhkzAPt+mUnv3dZy\n" +
  "HWuf0uQdbr+V4HGbe9CjZM4TnyzlJDdpKDdMx19IVQPmPg4=\n"                 +
  "-----END CERTIFICATE-----\n"                                        +
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIICujCCAiOgAwIBAgIUECXHZotH6yK5LTTdPFMkY9kZkawwDQYJKoZIhvcNAQEL\n" +
  "BQAwYjELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl\n" +
  "aWppbmcxEDAOBgNVBAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdS\n" +
  "b290IENBMB4XDTI1MDkyNDA5NTExOVoXDTMwMDkyMzA5NTExOVowcjELMAkGA1UE\n" +
  "BhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0JlaWppbmcxGDAWBgNV\n" +
  "BAoMD0ludGVybWVkaWF0ZSBDQTELMAkGA1UECwwCSVQxGDAWBgNVBAMMD0ludGVy\n" +
  "bWVkaWF0ZSBDQTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAttFaze2h1w2l\n" +
  "Dvw4+1CtA+9rbNBqD8MSiJQzvlHgFgjC7boVUYD3/WnNo2oMJjS2PNcgoB4/Yyht\n" +
  "0BkMf/x34BZBZKz6AvXAQXA3glMqJWREdTazSpLbWOhHGl7zVeU7AQBOQuBJavjd\n" +
  "nqJ4SFuZQYAyaDeki+grcBMAE9m4k0UCAwEAAaNdMFswDAYDVR0TBAUwAwEB/zAL\n" +
  "BgNVHQ8EBAMCAQYwHQYDVR0OBBYEFCha/2ynDKqZs6dPbHb3fqFxiCM9MB8GA1Ud\n" +
  "IwQYMBaAFAdRcKjUzOZqsbuWW7G2sgxX+ezgMA0GCSqGSIb3DQEBCwUAA4GBADqL\n" +
  "mv4laRDp6yrZZ7OUOY4vWbrCnJzYjWUAXoPv0DXmO3kFLN1/u7M2+P2/aKyal/HS\n" +
  "uIUf7duzDQKakjQ6SI5+UGMVjV3IypVZLMTqaEhkni8klQJQ9DgI4WTQnN9oyEfr\n" +
  "QK1+3QhI5nSHZ0vAlm9atzD0s0Jci6JuMBUw7ehm\n"                         +
  "-----END CERTIFICATE-----\n"                                        +
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIICwzCCAiygAwIBAgIUFHmiDZ6lR+Z3+u80U1r9f1CViV0wDQYJKoZIhvcNAQEL\n" +
  "BQAwYjELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl\n" +
  "aWppbmcxEDAOBgNVBAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdS\n" +
  "b290IENBMB4XDTI1MDkyNDA5NDgyN1oXDTM1MDkyMjA5NDgyN1owYjELMAkGA1UE\n" +
  "BhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0JlaWppbmcxEDAOBgNV\n" +
  "BAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdSb290IENBMIGfMA0G\n" +
  "CSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIKZ7fGE1Z+SqdfywoEl9NqQLOiLiHumzD\n" +
  "JDY1ZWApQpX9098Z2PmvPV6oh84UFEc2nv+yKG1kid2qh9jcm0zNaV2q0AA3t0d8\n" +
  "WTzjbs4HG4kdcUk5FtLhMVEBTUR0/ii38Y4tJXNmaarGyNbyB85GNqXTpxn9mkBp\n" +
  "cAEGa4A7BwIDAQABo3YwdDAdBgNVHQ4EFgQUB1FwqNTM5mqxu5ZbsbayDFf57OAw\n" +
  "HwYDVR0jBBgwFoAUB1FwqNTM5mqxu5ZbsbayDFf57OAwCwYDVR0PBAQDAgEGMAkG\n" +
  "A1UdEQQCMAAwCQYDVR0SBAIwADAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEB\n" +
  "CwUAA4GBAEwSMp+Zo4hMxmPp9VmKuvC5ElJCisdghrJxhb6KWVza9temcnAEkshZ\n" +
  "IRqW4mnstsY5YSuIhPF/oinVCVB7ViRPEb8ZnzxE3Bbka0/ShhE5wjBn75NcCbtD\n" +
  "WZvp+1vl8LlmRwRe2kr5JvcPw5IpGRq1tunznRpg+/3eEpI+KT3E\n"             +
  "-----END CERTIFICATE-----";

export let intermediateOtherCrl: string =
  "-----BEGIN X509 CRL-----\n"                                         +
  "MIIBdTCB3wIBATANBgkqhkiG9w0BAQsFADB0MQswCQYDVQQGEwJDTjEQMA4GA1UE\n" +
  "CAwHQmVpamluZzEQMA4GA1UEBwwHQmVpamluZzEZMBcGA1UECgwQSW50ZXJtZWRp\n" +
  "YXRlMiBDQTELMAkGA1UECwwCSVQxGTAXBgNVBAMMEEludGVybWVkaWF0ZTIgQ0EX\n" +
  "DTI1MDkyNDEwMzUyN1oXDTMwMTAxODEwMzUyN1owJzAlAhRbM2tz+2idKdlj0lHw\n" +
  "F8peTwo5bxcNMjUwOTI0MTAzNTEyWqAOMAwwCgYDVR0UBAMCAQcwDQYJKoZIhvcN\n" +
  "AQELBQADgYEAMq6HTPtl9tyaTB4CKUAbA7HQt+M4wjo3kxDQenpIsImouvnUF61S\n" +
  "BY0VucZ84GvXXiU1+yVl5Hw+HXLat0w8csUjkKMshCh7V7m36osLu2hF5DBxlm45\n" +
  "Dx4hQrnAEcB4Ddm4fqyLPhe+BJoDbhNML0r4St+jRJTzBNEK65HudIs=\n"         +
  "-----END X509 CRL-----";

export let trustRootCertPem: string =
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIICwzCCAiygAwIBAgIUFHmiDZ6lR+Z3+u80U1r9f1CViV0wDQYJKoZIhvcNAQEL\n" +
  "BQAwYjELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl\n" +
  "aWppbmcxEDAOBgNVBAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdS\n" +
  "b290IENBMB4XDTI1MDkyNDA5NDgyN1oXDTM1MDkyMjA5NDgyN1owYjELMAkGA1UE\n" +
  "BhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0JlaWppbmcxEDAOBgNV\n" +
  "BAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdSb290IENBMIGfMA0G\n" +
  "CSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIKZ7fGE1Z+SqdfywoEl9NqQLOiLiHumzD\n" +
  "JDY1ZWApQpX9098Z2PmvPV6oh84UFEc2nv+yKG1kid2qh9jcm0zNaV2q0AA3t0d8\n" +
  "WTzjbs4HG4kdcUk5FtLhMVEBTUR0/ii38Y4tJXNmaarGyNbyB85GNqXTpxn9mkBp\n" +
  "cAEGa4A7BwIDAQABo3YwdDAdBgNVHQ4EFgQUB1FwqNTM5mqxu5ZbsbayDFf57OAw\n" +
  "HwYDVR0jBBgwFoAUB1FwqNTM5mqxu5ZbsbayDFf57OAwCwYDVR0PBAQDAgEGMAkG\n" +
  "A1UdEQQCMAAwCQYDVR0SBAIwADAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEB\n" +
  "CwUAA4GBAEwSMp+Zo4hMxmPp9VmKuvC5ElJCisdghrJxhb6KWVza9temcnAEkshZ\n" +
  "IRqW4mnstsY5YSuIhPF/oinVCVB7ViRPEb8ZnzxE3Bbka0/ShhE5wjBn75NcCbtD\n" +
  "WZvp+1vl8LlmRwRe2kr5JvcPw5IpGRq1tunznRpg+/3eEpI+KT3E\n"             +
  "-----END CERTIFICATE-----";
/* 实体证书被其他颁发者吊销 END */

/* 实体证书被吊销后又被撤销 START */
export let certChainPem4: string =
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIIC7zCCAligAwIBAgIUWzNrc/tonSnZY9JR8BfKXk8KOXAwDQYJKoZIhvcNAQEL\n" +
  "BQAwcjELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl\n" +
  "aWppbmcxGDAWBgNVBAoMD0ludGVybWVkaWF0ZSBDQTELMAkGA1UECwwCSVQxGDAW\n" +
  "BgNVBAMMD0ludGVybWVkaWF0ZSBDQTAeFw0yNTA5MjUwNzM0MTRaFw0zMDEwMTkw\n" +
  "NzM0MTRaMG8xCzAJBgNVBAYTAkNOMRAwDgYDVQQIDAdCZWlqaW5nMRAwDgYDVQQH\n" +
  "DAdCZWlqaW5nMRUwEwYDVQQKDAxFeGFtcGxlIENvcnAxCzAJBgNVBAsMAklUMRgw\n" +
  "FgYDVQQDDA93d3cuZXhhbXBsZS5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJ\n" +
  "AoGBAOL3NbuvatdyzBwrwoSQ4CKXYVwPnLZ/ZIVw+P5abGmEuQgJymcwCu+CKf4t\n" +
  "FnCMGMLlRKYIJKNAw6ZYqAp2I1PzhLZ9DqcbdX+Jp9ex71H3jWQzdF953heNyReW\n" +
  "sUzbyCQ7h3Yi1qFlDCtCbX30lDEOxcdzFsgFmoQwfTbJbZKTAgMBAAGjgYQwgYEw\n" +
  "CQYDVR0TBAIwADALBgNVHQ8EBAMCBDAwJwYDVR0RBCAwHoIPd3d3LmV4YW1wbGUu\n" +
  "Y29tggtleGFtcGxlLmNvbTAdBgNVHQ4EFgQUpsHrA3AlSqtbPq8ysbAltPALNK8w\n" +
  "HwYDVR0jBBgwFoAUKFr/bKcMqpmzp09sdvd+oXGIIz0wDQYJKoZIhvcNAQELBQAD\n" +
  "gYEAPwB97/Ufq3RDnQbYbj6JHMQCIgxzaFbnHUxyOUHGPTbu0Ak/rFDhhlF8i/l2\n" +
  "HQ+uDUZXXga6hm1xGXMlbLPwI1iBgHkRGH6HvexNlNdf6OVkAcKocB/dDtECXC6O\n" +
  "YVuy11IIsuq479YgyaSRmUjq9vrrfPkQN3qkEgWNTidsUro=\n"                 +
  "-----END CERTIFICATE-----\n"                                        +
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIICujCCAiOgAwIBAgIUECXHZotH6yK5LTTdPFMkY9kZkawwDQYJKoZIhvcNAQEL\n" +
  "BQAwYjELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl\n" +
  "aWppbmcxEDAOBgNVBAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdS\n" +
  "b290IENBMB4XDTI1MDkyNDA5NTExOVoXDTMwMDkyMzA5NTExOVowcjELMAkGA1UE\n" +
  "BhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0JlaWppbmcxGDAWBgNV\n" +
  "BAoMD0ludGVybWVkaWF0ZSBDQTELMAkGA1UECwwCSVQxGDAWBgNVBAMMD0ludGVy\n" +
  "bWVkaWF0ZSBDQTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAttFaze2h1w2l\n" +
  "Dvw4+1CtA+9rbNBqD8MSiJQzvlHgFgjC7boVUYD3/WnNo2oMJjS2PNcgoB4/Yyht\n" +
  "0BkMf/x34BZBZKz6AvXAQXA3glMqJWREdTazSpLbWOhHGl7zVeU7AQBOQuBJavjd\n" +
  "nqJ4SFuZQYAyaDeki+grcBMAE9m4k0UCAwEAAaNdMFswDAYDVR0TBAUwAwEB/zAL\n" +
  "BgNVHQ8EBAMCAQYwHQYDVR0OBBYEFCha/2ynDKqZs6dPbHb3fqFxiCM9MB8GA1Ud\n" +
  "IwQYMBaAFAdRcKjUzOZqsbuWW7G2sgxX+ezgMA0GCSqGSIb3DQEBCwUAA4GBADqL\n" +
  "mv4laRDp6yrZZ7OUOY4vWbrCnJzYjWUAXoPv0DXmO3kFLN1/u7M2+P2/aKyal/HS\n" +
  "uIUf7duzDQKakjQ6SI5+UGMVjV3IypVZLMTqaEhkni8klQJQ9DgI4WTQnN9oyEfr\n" +
  "QK1+3QhI5nSHZ0vAlm9atzD0s0Jci6JuMBUw7ehm\n"                         +
  "-----END CERTIFICATE-----\n"                                        +
  "-----BEGIN CERTIFICATE-----\n"                                      +
  "MIICwzCCAiygAwIBAgIUFHmiDZ6lR+Z3+u80U1r9f1CViV0wDQYJKoZIhvcNAQEL\n" +
  "BQAwYjELMAkGA1UEBhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0Jl\n" +
  "aWppbmcxEDAOBgNVBAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdS\n" +
  "b290IENBMB4XDTI1MDkyNDA5NDgyN1oXDTM1MDkyMjA5NDgyN1owYjELMAkGA1UE\n" +
  "BhMCQ04xEDAOBgNVBAgMB0JlaWppbmcxEDAOBgNVBAcMB0JlaWppbmcxEDAOBgNV\n" +
  "BAoMB1Jvb3QgQ0ExCzAJBgNVBAsMAklUMRAwDgYDVQQDDAdSb290IENBMIGfMA0G\n" +
  "CSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIKZ7fGE1Z+SqdfywoEl9NqQLOiLiHumzD\n" +
  "JDY1ZWApQpX9098Z2PmvPV6oh84UFEc2nv+yKG1kid2qh9jcm0zNaV2q0AA3t0d8\n" +
  "WTzjbs4HG4kdcUk5FtLhMVEBTUR0/ii38Y4tJXNmaarGyNbyB85GNqXTpxn9mkBp\n" +
  "cAEGa4A7BwIDAQABo3YwdDAdBgNVHQ4EFgQUB1FwqNTM5mqxu5ZbsbayDFf57OAw\n" +
  "HwYDVR0jBBgwFoAUB1FwqNTM5mqxu5ZbsbayDFf57OAwCwYDVR0PBAQDAgEGMAkG\n" +
  "A1UdEQQCMAAwCQYDVR0SBAIwADAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEB\n" +
  "CwUAA4GBAEwSMp+Zo4hMxmPp9VmKuvC5ElJCisdghrJxhb6KWVza9temcnAEkshZ\n" +
  "IRqW4mnstsY5YSuIhPF/oinVCVB7ViRPEb8ZnzxE3Bbka0/ShhE5wjBn75NcCbtD\n" +
  "WZvp+1vl8LlmRwRe2kr5JvcPw5IpGRq1tunznRpg+/3eEpI+KT3E\n"             +
  "-----END CERTIFICATE-----";

export let intermediateCrl: string =
  "-----BEGIN X509 CRL-----\n"                                         +
  "MIIBqTCCARICAQEwDQYJKoZIhvcNAQELBQAwcjELMAkGA1UEBhMCQ04xEDAOBgNV\n" +
  "BAgMB0JlaWppbmcxEDAOBgNVBAcMB0JlaWppbmcxGDAWBgNVBAoMD0ludGVybWVk\n" +
  "aWF0ZSBDQTELMAkGA1UECwwCSVQxGDAWBgNVBAMMD0ludGVybWVkaWF0ZSBDQRcN\n" +
  "MjUwOTI1MDc0MjQ5WhcNMzAxMDE5MDc0MjQ5WjBcMCUCFFsza3P7aJ0p2WPSUfAX\n" +
  "yl5PCjlvFw0yNTA5MjQxMDM1MTJaMDMCFFsza3P7aJ0p2WPSUfAXyl5PCjlwFw0y\n" +
  "NTA5MjUwNzQyNDNaMAwwCgYDVR0VBAMKAQigDjAMMAoGA1UdFAQDAgEJMA0GCSqG\n" +
  "SIb3DQEBCwUAA4GBAD8hUoFocPZjak648YdEsyHtwhEgUcELXWQZgrFKXGt7xALt\n" +
  "8QS+b5bVSH2/AZaRSZmPdB4tpzBl90ex3+c4qDacF/pj3D5UX/1o2Qxi3b9ubq2Z\n" +
  "o1qRJ5xfs5z6o18z5tCs35CjvmSi4bj9qO7a3zAFP+NBcK1Fie0o+okrKsAS\n"     +
  "-----END X509 CRL-----";
/* 实体证书被吊销后又被撤销 END */

export let intermediateCrlExpired: string =
  "-----BEGIN X509 CRL-----\n"                                         +
  "MIIBczCB3QIBATANBgkqhkiG9w0BAQsFADByMQswCQYDVQQGEwJDTjEQMA4GA1UE\n" +
  "CAwHQmVpamluZzEQMA4GA1UEBwwHQmVpamluZzEYMBYGA1UECgwPSW50ZXJtZWRp\n" +
  "YXRlIENBMQswCQYDVQQLDAJJVDEYMBYGA1UEAwwPSW50ZXJtZWRpYXRlIENBFw0y\n" +
  "NTA5MjUwOTE5NDFaFw0yNTA5MjYwOTE5NDFaMCcwJQIUWzNrc/tonSnZY9JR8BfK\n" +
  "Xk8KOXAXDTI1MDkyNTA5MTg0MlqgDjAMMAoGA1UdFAQDAgEKMA0GCSqGSIb3DQEB\n" +
  "CwUAA4GBAKw5U3TY8bno3++6J4ehGK8Hv4bfSyXRHcfEndDUVb3A7sJIJcmJFnye\n" +
  "UmqjuZO/TvKBmo1YDN5O1SdHf6L8pOpVbu26CDIOem3pYx/PZUelQz2hL2vhm5SW\n" +
  "6ogWzVGsm4vl27itxJo8r4Cym/GPEWBZERavssMzeDvRUGCAoa+K\n"             +
  "-----END X509 CRL-----"

export async function createX509CRL(crmPem: string): Promise<cert.CertCRLCollection> {
  try {
    let crlEncodingBlob: cert.EncodingBlob = {
      data: stringToUint8Array(crmPem),
      encodingFormat: cert.EncodingFormat.FORMAT_PEM
    }
    let crl: cert.X509CRL = await cert.createX509CRL(crlEncodingBlob);
    let collection: cert.CertCRLCollection = cert.createCertCRLCollection([], [crl]);
    return collection;
  } catch (error) {
    throw error as Error;
  }
}

export async function createCertChain(chainPem: string): Promise<cert.X509CertChain> {
  try {
    let encodingBlob: cert.EncodingBlob = {
      data: stringToUint8Array(chainPem),
      encodingFormat: cert.EncodingFormat.FORMAT_PEM
    };
    let x509CertChain: cert.X509CertChain = await cert.createX509CertChain(encodingBlob);
    return x509CertChain;
  }
  catch (error) {
    throw error as Error;
  }
}

export async function createX509Cert(certPem: string): Promise<cert.X509Cert> {
  try {
    let encodingBlob: cert.EncodingBlob = {
      data: stringToUint8Array(certPem),
      encodingFormat: cert.EncodingFormat.FORMAT_PEM
    };
    let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
    return x509Cert;
  }
  catch (error) {
    throw error as Error;
  }
}