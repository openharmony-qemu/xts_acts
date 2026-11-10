'use static';
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
import socket from '@ohos.net.socket'
import { describe, it, expect, Level, Size, TestType, afterEach, beforeEach } from "@ohos/hypium-static/src/main/indexStatic";
import { BusinessError } from "@ohos.base";
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'tlsSocketServerCloseTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

function sleep(time: int): Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('ok')
    }, time)
  });
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test failed`);
  }
}
const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, ` exportFail failed err: ${JSON.stringify(err)}`);
  }
};

let password = "huaw" + "ei_123";
let key = "-----BEGIN PRIVATE KEY-----\n" +
  "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCzzNudbYUqQHGy\n" +
  "ryOABhTVexWUE4j/zAc405N1SA6pKg4L0KXihTLocf0Su4UZcpctH7XRZUwjvW32\n" +
  "AsezSwdp9HRScv3oLLsJ4b9kBRb/4izPIznU2g9PMU/41nvx7gFOSTii5auJzzHh\n" +
  "TNMTDt0A13WQzCnKd4HcUlSx9KUGVpiIWNz8L+tIDFUNW7MThLznCaK1hZLmn5rt\n" +
  "5zL6wTpxLZ/USlEVNOFdqf8q1Od467W+A2vjL6ovYy/jweXWrH251QhNazECz3Od\n" +
  "hBcdRd9S2gn9CjK/RyQX7e6tiJXtyJgK+kSCozNn5k28eKUi8dXzr8IW2QiVGoAG\n" +
  "Wgo2aeVvAgMBAAECggEAAKpLcOzVNzfg8OalzKCvb3EBPlt55yVYHTFrzoBC0tZH\n" +
  "V/boVnPFX5UuMwwiSfIpiu7ZBob8IN967GlXtN0YZZQIqwyirtoN0VdvjOpKBt+i\n" +
  "sitAXKEqFkZzS2amK93GVRFv8ykBIPe3FFTnYxNI9PogyqII6+kxXviQR/0Ojy9s\n" +
  "L0wkzPqRUl8Xkn61CJVVxY2cdyTuAtpdYH6kZQI23oq1eyYDjMXD1CHYmG5dG9ei\n" +
  "M3ROgZeKH6OHf0xM5DJdJKS37B9G+3E6GMTg6XSI8gxQx3VhGeUGi7V4YRrZh924\n" +
  "KFz6ATBFJkIyEQ9WGERb6RNOzm6croqnz1gM6sECUQKBgQDdvZ08KCsvMs/W4rWL\n" +
  "36r982GUvj2efmayucZBviSgjWC/ynbO+fQ1BjWYzDbIABPN6tcyryh6fodcRcAh\n" +
  "FisS9BdyQ0yTtgacZnc9hJsVWzfvlQhNtIDTft4mSoih8QIJKVQhPjbe6VErk1vA\n" +
  "JMOmamRbEm0CVXd2q1l+mNJz/wKBgQDPlGVtw645vVwZLn9MYHYDgUYJjZJWL60K\n" +
  "36Db+jy3SzfjDWo25/hCjM/rF43cIZBWVdga2hvNhVyF2JwRTPpIlEOWZlbo4L5z\n" +
  "C8nSzBLXnv18BME0LY/0vE1bq/nsSfgTZLbyONrtqt2sIw52O4eY9jYr1L22fDqz\n" +
  "a4/8piHOkQKBgQCUK81y0mCxBGIv9IRd+FMZqVWugEVKsKpNiag6bCWrh218G32y\n" +
  "pwIRoJmWBfghQzP4qJGuk68X047+ELnnIhocazFzsBbuqXbXcf0CBadf6PmCxfKr\n" +
  "gg+HxEIMEkgk9phmqNBH+nvODtinpqtrxOVcQcHXvYNMSPIwQSXnW5Vd3wKBgD+w\n" +
  "fF5tR6uXmgZv6cb5Ybw5kc+kjF29Sw6nBqf342Epxv/3QbuO+PESW0j6dSAxfCPB\n" +
  "OwkiGp24aWb3ywrT34cdVo9y3v+c1VJfL5Fp4+4cbhH7M3xa7mxcyi9yWMBTAbaR\n" +
  "lEBFiYaagmEqcGl+YmBgSsawA3VWMHyUaB1Qq9bBAoGAM0SdW7wtqjT3HwfFnjzt\n" +
  "T2ClsFzSe1q176llsnzkWpreGszMbCyYgYB20DSO4e7SWAcC1pA9flJp7zib7xFz\n" +
  "A1py3kqt6v0W1E1WXLA3QjOP7t8g3XZsQNud3MVe5NQoFYrWE/8KcSvBJXugpbcG\n" +
  "BRsRc8V9Y5Tii1RgvT31QXQ=\n" +
  "-----END PRIVATE KEY-----";
let ca_c = "-----BEGIN CERTIFICATE-----\n" +
  "MIIDhzCCAm+gAwIBAgIUEefGTn+Xtyu7ek/gtGwKAnglx7IwDQYJKoZIhvcNAQEL\n" +
  "BQAwUjELMAkGA1UEBhMCQ04xEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM\n" +
  "GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDELMAkGA1UEAwwCSFcwIBcNMjUxMjIy\n" +
  "MDkxODQ0WhgPMjA1NTEyMTUwOTE4NDRaMFIxCzAJBgNVBAYTAkNOMRMwEQYDVQQI\n" +
  "DApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQx\n" +
  "CzAJBgNVBAMMAkhXMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA133v\n" +
  "W8HO6rmuTCh+6jttIaUDgJRXj0A6Jn2SEFVow4AtoMAYzZlCVZXWFabO3pAkHP8a\n" +
  "9Mee/oKnt1/G2SnPyuPYDO6AJGvJEi8LmcO7g7wgpS9CeeGHBMh3/H0xYviRAFdX\n" +
  "PN9KNReG2Qyy5m8vBZi7d6QxtqeVpRn0VmjyCXOgf6HzlG4EHQ7oeQ1F/GCgaXj0\n" +
  "99Z+9uJsf17eTe0eVzlQPV8+voof0mTN7QOREaN3cm/Q/PhqEArbgwi3G7Hh8Rwq\n" +
  "gKDSoHbfVsrYMv6grd6QAutHVHMxg6PQnugjmoUZ0fmqCaFPRE42YhQcCy4ms6K8\n" +
  "v8D/Fgu68v3hvNlpCQIDAQABo1MwUTAdBgNVHQ4EFgQUbGhloOYtlZgiJa6rWBq3\n" +
  "eFI5INswHwYDVR0jBBgwFoAUbGhloOYtlZgiJa6rWBq3eFI5INswDwYDVR0TAQH/\n" +
  "BAUwAwEB/zANBgkqhkiG9w0BAQsFAAOCAQEAhQDL9CcVvAK4gsr4yd05rX180STV\n" +
  "fkJvbYOGzqpiE+LustbaQM/LBK0qkJacoP2AvimekLi4yGDrNu8KluI0WAlC98+z\n" +
  "S1JB4cndpk+iL6Jr2y+ugb8W52m5SgCKW9I5gpL0GKKCdalsze0nLnJVF1+G8akL\n" +
  "B8+srBn3M2LaJdFYD485poPH59Mx0b3y8L4tfiJQbdGivrprCoR+7nLfXSueHeHb\n" +
  "WOv/iqF+83eQb6as0GrfLRHCquhBdafCVY/T6B3Gn6kMwzU/b6stGUokpuPZX7Tg\n" +
  "vHxFiuE3IxSGI4xaEBxC85oXHsOfNLGOShsNdM4R8BiY+peVU7XLc02Srw==\n" +
  "-----END CERTIFICATE-----";

let cert_c = "-----BEGIN CERTIFICATE-----\n" +
  "MIIDeDCCAmCgAwIBAgIUN0hCaro9vqOoeqNx+l6bWGZKY4AwDQYJKoZIhvcNAQEL\n" +
  "BQAwUjELMAkGA1UEBhMCQ04xEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM\n" +
  "GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDELMAkGA1UEAwwCSFcwHhcNMjUxMjIy\n" +
  "MDkyMjQ2WhcNMzUxMjIwMDkyMjQ2WjBWMQswCQYDVQQGEwJDTjETMBEGA1UECAwK\n" +
  "U29tZS1TdGF0ZTEhMB8GA1UECgwYSW50ZXJuZXQgV2lkZ2l0cyBQdHkgTHRkMQ8w\n" +
  "DQYDVQQDDAZIV19QVEwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCz\n" +
  "zNudbYUqQHGyryOABhTVexWUE4j/zAc405N1SA6pKg4L0KXihTLocf0Su4UZcpct\n" +
  "H7XRZUwjvW32AsezSwdp9HRScv3oLLsJ4b9kBRb/4izPIznU2g9PMU/41nvx7gFO\n" +
  "STii5auJzzHhTNMTDt0A13WQzCnKd4HcUlSx9KUGVpiIWNz8L+tIDFUNW7MThLzn\n" +
  "CaK1hZLmn5rt5zL6wTpxLZ/USlEVNOFdqf8q1Od467W+A2vjL6ovYy/jweXWrH25\n" +
  "1QhNazECz3OdhBcdRd9S2gn9CjK/RyQX7e6tiJXtyJgK+kSCozNn5k28eKUi8dXz\n" +
  "r8IW2QiVGoAGWgo2aeVvAgMBAAGjQjBAMB0GA1UdDgQWBBS6XjNDkmfeM8WufAlv\n" +
  "AKJ/YopbZTAfBgNVHSMEGDAWgBRsaGWg5i2VmCIlrqtYGrd4Ujkg2zANBgkqhkiG\n" +
  "9w0BAQsFAAOCAQEAyAS03vc+5k6Hn/HYU1Y1hvBjbbnYJnJfnad2+epE3r9wm/Pb\n" +
  "X2/9kKF0jJ6Nl5u7a1ZZV+OoHSa8caOUXeH1RRO5I1iPmAqRUNmvLuouXW9PXu/f\n" +
  "u8ovkDHUoYVO4EhY2gjWe1HEO3cWnfgTwd2hy0UsK3k7j6FR5r0X78QLtNe7prLr\n" +
  "RbrwZhoPSKhF9iQWlADOthnbH0zVcTCKGz6ZFuJkdNs+tmYA4aiVK1gGJhD77lKy\n" +
  "IEDJ5Ekf6HEf+1dAZYmNsaHe9mtNGSJlFocIHi62Fzr6jE/yBA0gYu5fZ9s82M2x\n" +
  "KQ4kYU8nxku0c2ZvhIvOY2u/g6ywZlCLitLnyA==\n" +
  "-----END CERTIFICATE-----";
let tlsSecureOptions: socket.TLSSecureOptions = {
  key: key,
  cert: cert_c,
  protocols: socket.Protocol.TLSv13,
  useRemoteCipherPrefer: true,
}
let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
let tlsClient: socket.TLSSocket = socket.constructTLSSocketInstance();

export default function TlsSocketServerCloseTest(): void {
  describe("TlsSocketServerCloseTest", () => {
    beforeEach(async () => {
      tlsServer = socket.constructTLSSocketServerInstance();
      tlsClient = socket.constructTLSSocketInstance();
      await sleep(50);
    })
    afterEach(async () => {
      await tlsClient.close().catch((err) => {
        hilog.info(domain, tag, `afterEach tlsClient close fail, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
      });
    })

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0100
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_0100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let port: number = Math.round(1024 + Math.random() * 5000 + Math.random() * 4000);
          let netAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: port.toInt()
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`)
          tlsServer.onTlsServerConnect((client: socket.TLSSocketConnection) => {
            hilog.info(domain, tag,
              `${caseName} ======= tlsServer on  connect  success client is :` + JSON.stringify(client));
            sleep(500).then(() => {
              tlsServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tlsServer close success`);
                ExpectTrue(true);
                tlsServer.offTlsServerConnect();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                ExpectFail();
                done();
              })
            });
          })

          tlsClient.bind(netAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} tlsClient bind failed err is: ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} tlsClient bind success `);
              let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
                ca: ca_c,
                cert: cert_c,
                password: password,
                key: key,
                protocols: [socket.Protocol.TLSv13],
                signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
              };
              let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
                address: netAddress,
                secureOptions: tlsTwoWaySecureOption
              };
              hilog.info(domain, tag, "--- connection start--")
              tlsClient.connect(tlsTwoWayConnectOptions).then(() => {
                hilog.info(domain, tag, `${caseName} tlsClient connect success`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName}tlsClient connect failed catch  err is ` + JSON.stringify(err));
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0200
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_0200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let port: number = Math.round(1024 + Math.random() * 5000 + Math.random() * 4000);
          let netAddress: socket.NetAddress = {
            address: '::1',
            port: port.toInt(),
            family: 2
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`)
          tlsServer.onTlsServerConnect((client: socket.TLSSocketConnection) => {
            hilog.info(domain, tag,
              `${caseName} ======= tlsServer on  connect  success client is :` + JSON.stringify(client));
            sleep(500).then(() => {
              tlsServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tlsServer close success`);
                ExpectTrue(true);
                tlsServer.offTlsServerConnect();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                ExpectFail();
                done();
              })
            });
          })

          tlsClient.bind(netAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} tlsClient bind failed err is: ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} tlsClient bind success `);
              let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
                ca: ca_c,
                cert: cert_c,
                password: password,
                key: key,
                protocols: [socket.Protocol.TLSv13],
                signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
              };

              let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
                address: netAddress,
                secureOptions: tlsTwoWaySecureOption
              };
              hilog.info(domain, tag, "--- connection start---")
              tlsClient.connect(tlsTwoWayConnectOptions).then(() => {
                hilog.info(domain, tag, `${caseName} tlsClient connect success`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName}tlsClient connect failed catch  err is ` + JSON.stringify(err));
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_0300
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0300
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_0300';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let port: number = Math.round(1024 + Math.random() * 5000 + Math.random() * 4000);
          let netAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: port.toInt()
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`)
          tlsServer.onTlsServerConnect((tlsSocketConnection: socket.TLSSocketConnection) => {
            hilog.info(domain, tag,
              `${caseName} ======= tlsServer on  connect  success client is :` + JSON.stringify(tlsSocketConnection));
            sleep(500).then(() => {
              tlsServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tlsServer close success`);
                tlsSocketConnection.send("tlsServer close send").then(() => {
                  hilog.info(domain, tag, `${caseName} client send success`);
                  ExpectTrue(true);
                  tlsServer.offTlsServerConnect();
                  done()
                }).catch((err) => {
                  hilog.info(domain, tag, `${caseName} client send failed err is: ` + JSON.stringify(err));
                  ExpectFail();
                  done();
                })
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                ExpectFail();
                done();
              })
            });
          })
          tlsClient.bind(netAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} tlsClient bind failed err is: ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} tlsClient bind success `);
              let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
                ca: ca_c,
                cert: cert_c,
                password: password,
                key: key,
                protocols: [socket.Protocol.TLSv13],
                signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
              };
              let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
                address: netAddress,
                secureOptions: tlsTwoWaySecureOption
              };
              hilog.info(domain, tag, "--- connection start")
              tlsClient.connect(tlsTwoWayConnectOptions).then(() => {
                hilog.info(domain, tag, `${caseName} tlsClient connect success`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName}tlsClient connect failed catch  err is ` + JSON.stringify(err));
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0400
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_0400';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let port: number = Math.round(1024 + Math.random() * 5000 + Math.random() * 4000);
          let netAddress: socket.NetAddress = {
            address: '::1',
            port: port.toInt(),
            family: 2
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`)
          tlsServer.onTlsServerConnect((tlsSocketConnection: socket.TLSSocketConnection) => {
            hilog.info(domain, tag,
              `${caseName} ======= tlsServer on  connect  success client is :` + JSON.stringify(tlsSocketConnection));
            sleep(500).then(() => {
              tlsServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tlsServer close success`);
                tlsSocketConnection.send("tlsServer close send").then(() => {
                  hilog.info(domain, tag, `${caseName} client send success`);
                  ExpectTrue(true);
                  tlsServer.offTlsServerConnect();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }).catch((err) => {
                  hilog.info(domain, tag, `${caseName} client send failed err is: ` + JSON.stringify(err));
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                })
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                ExpectFail();
                done();
              })
            });
          })

          tlsClient.bind(netAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} tlsClient bind failed err is: ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} tlsClient bind success `);
              let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
                ca: ca_c,
                cert: cert_c,
                password: password,
                key: key,
                protocols: [socket.Protocol.TLSv13],
                signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
              };
              let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
                address: netAddress,
                secureOptions: tlsTwoWaySecureOption
              };
              hilog.info(domain, tag, "--- connection start")
              tlsClient.connect(tlsTwoWayConnectOptions).then(() => {
                hilog.info(domain, tag, `${caseName} tlsClient connect success`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName}tlsClient connect failed err is , code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_0500
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0500
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_0500';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let port: number = Math.round(1024 + Math.random() * 5000 + Math.random() * 4000);
          let netAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: port.toInt()
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`)
          tlsServer.onTlsServerConnect((client: socket.TLSSocketConnection) => {
            hilog.info(domain, tag,
              `${caseName} ======= tlsServer on  connect  success client is :` + JSON.stringify(client));
            sleep(500).then(() => {
              tlsServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tlsServer close success`);
                tlsClient.send("send again").then(async () => {
                  hilog.info(domain, tag, `${caseName} tlsClient send success`);
                  ExpectTrue(true);
                  tlsServer.offTlsServerConnect();
                  done();
                  hilog.info(domain, tag, `${caseName}---End`);
                }).catch((err) => {
                  hilog.info(domain, tag, `${caseName} tlsClient send failed err is` + JSON.stringify(err));
                  ExpectFail();
                  done();
                  hilog.info(domain, tag, `${caseName}---End`);
                })
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                ExpectFail();
                done();
              })
            });
          })

          tlsClient.bind(netAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} tlsClient bind failed err is: ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} tlsClient bind success `);
              let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
                ca: ca_c,
                cert: cert_c,
                password: password,
                key: key,
                protocols: [socket.Protocol.TLSv13],
                signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
              };
              let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
                address: netAddress,
                secureOptions: tlsTwoWaySecureOption
              };
              hilog.info(domain, tag, "--- connection start----")
              tlsClient.connect(tlsTwoWayConnectOptions).then(() => {
                hilog.info(domain, tag, `${caseName} tlsClient connect success`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsClient connect failed catch  err is ` + JSON.stringify(err));
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0600
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_0600';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let port: number = Math.round(1024 + Math.random() * 5000 + Math.random() * 4000);
          let netAddress: socket.NetAddress = {
            address: '::1',
            port: port.toInt(),
            family: 2
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`)
          tlsServer.onTlsServerConnect((client: socket.TLSSocketConnection) => {
            hilog.info(domain, tag,
              `${caseName} ======= tlsServer on  connect  success client is :` + JSON.stringify(client));
            sleep(500).then(() => {
              tlsServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tlsServer close success`);
                tlsClient.send("send again").then(async () => {
                  hilog.info(domain, tag, `${caseName} tlsClient send success`);
                  ExpectTrue(true);
                  tlsServer.offTlsServerConnect();
                  done();
                  hilog.info(domain, tag, `${caseName}---End`);
                }).catch((err) => {
                  hilog.info(domain, tag, `${caseName} tlsClient send failed err is` + JSON.stringify(err));
                  ExpectFail();
                  done();
                  hilog.info(domain, tag, `${caseName}---End`);
                })
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                ExpectFail();
                done();
              })
            });
          })

          tlsClient.bind(netAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} tlsClient bind failed err is: ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} tlsClient bind success `);
              let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
                ca: ca_c,
                cert: cert_c,
                password: password,
                key: key,
                protocols: [socket.Protocol.TLSv13],
                signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
              };
              let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
                address: netAddress,
                secureOptions: tlsTwoWaySecureOption
              };
              hilog.info(domain, tag, "--- connection start----")
              tlsClient.connect(tlsTwoWayConnectOptions).then(() => {
                hilog.info(domain, tag, `${caseName} tlsClient connect success`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsClient connect failed catch  err is ` + JSON.stringify(err));
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_0700
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0700
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_0700';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let port: number = Math.round(1024 + Math.random() * 5000 + Math.random() * 4000);
          let netAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: port.toInt(),
            family: 1
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`)
          tlsServer.onTlsServerConnect((client: socket.TLSSocketConnection) => {
            hilog.info(domain, tag,
              `${caseName} ======= tlsServer on  connect  success client is :` + JSON.stringify(client));
            sleep(500).then(() => {
              tlsServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tlsServer close success`);
                tlsServer.listen(tlsConnectOptions).then(() => {
                  hilog.info(domain, tag, `${caseName} tlsServer listen again success`);
                  ExpectTrue(true);
                  tlsServer.offTlsServerConnect();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }).catch((err) => {
                  hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                })
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                ExpectFail();
                done();
              })
            });
          })

          tlsClient.bind(netAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} tlsClient bind failed err is: ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} tlsClient bind success `);
              let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
                ca: ca_c,
                cert: cert_c,
                password: password,
                key: key,
                protocols: [socket.Protocol.TLSv13],
                signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
              };
              let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
                address: netAddress,
                secureOptions: tlsTwoWaySecureOption
              };
              hilog.info(domain, tag, "--- connection start---")
              tlsClient.connect(tlsTwoWayConnectOptions).then(() => {
                hilog.info(domain, tag, `${caseName} tlsClient connect success`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsClient connect failed catch  err is ` + JSON.stringify(err));
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_0800
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0800
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_0800';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let port: number = Math.round(1024 + Math.random() * 5000 + Math.random() * 4000);
          let netAddress: socket.NetAddress = {
            address: '::1',
            port: port.toInt(),
            family: 2
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`)
          tlsServer.onTlsServerConnect((client: socket.TLSSocketConnection) => {
            hilog.info(domain, tag,
              `${caseName} ======= tlsServer on  connect  success client is :` + JSON.stringify(client));
            sleep(500);
            tlsServer.close().then(() => {
              hilog.info(domain, tag, `${caseName} tlsServer close success`);
              tlsServer.listen(tlsConnectOptions).then(() => {
                hilog.info(domain, tag, `${caseName} tlsServer listen again success`);
                ExpectTrue(true);
                tlsServer.offTlsServerConnect();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              })
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
              ExpectFail();
              done();
            })
          })

          tlsClient.bind(netAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} tlsClient bind failed err is: ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} tlsClient bind success `);
              let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
                ca: ca_c,
                cert: cert_c,
                password: password,
                key: key,
                protocols: [socket.Protocol.TLSv13],
                signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
              };
              let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
                address: netAddress,
                secureOptions: tlsTwoWaySecureOption
              };
              hilog.info(domain, tag, "--- connection start---")
              tlsClient.connect(tlsTwoWayConnectOptions).then(() => {
                hilog.info(domain, tag, `${caseName} tlsClient connect success`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsClient connect failed catch  err is ` + JSON.stringify(err));
                ExpectFail();
                done();
                hilog.info(domain, tag, `${caseName}---End`);
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_0900
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_0900
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_0900';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let port: number = Math.round(1024 + Math.random() * 5000 + Math.random() * 4000);
          let netAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: port.toInt()
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`)
          tlsServer.onTlsServerConnect((client: socket.TLSSocketConnection) => {
            hilog.info(domain, tag,
              `${caseName} ======= tlsServer on  connect  success client is :` + JSON.stringify(client));
            sleep(500).then(() => {
              tlsServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tlsServer close success`);
                ExpectTrue(true);
                tlsServer.offTlsServerConnect();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              })
            });
          })

          tlsClient.bind(netAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} tlsClient bind failed err is: ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} tlsClient bind success `);
              let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
                ca: ca_c,
                cert: cert_c,
                password: password,
                key: key,
                protocols: [socket.Protocol.TLSv13],
                signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
              };
              let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
                address: netAddress,
                secureOptions: tlsTwoWaySecureOption
              };
              hilog.info(domain, tag, "--- connection--start---")
              tlsClient.connect(tlsTwoWayConnectOptions).then(() => {
                hilog.info(domain, tag, `${caseName} tlsClient connect success`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsClient connect  get err is ` + JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      }
    )
    ;

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_1000
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_1000
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_1000';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let port: number = Math.round(1024 + Math.random() * 5000 + Math.random() * 4000);
          let netAddress: socket.NetAddress = {
            address: '::1',
            port: port.toInt(),
            family: 2
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`)
          tlsServer.onTlsServerConnect((client: socket.TLSSocketConnection) => {
            hilog.info(domain, tag,
              `${caseName} ======= tlsServer on  connect  success client is :` + JSON.stringify(client));
            sleep(500).then(() => {
              tlsServer.close().then(() => {
                hilog.info(domain, tag, `${caseName} tlsServer close success`);
                ExpectTrue(true);
                tlsServer.offTlsServerConnect();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              })
            });
          })

          tlsClient.bind(netAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} tlsClient bind failed err is: ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} tlsClient bind success `);
              let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
                ca: ca_c,
                cert: cert_c,
                password: password,
                key: key,
                protocols: [socket.Protocol.TLSv13],
                signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
              };
              let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
                address: netAddress,
                secureOptions: tlsTwoWaySecureOption
              };
              hilog.info(domain, tag, "--- connection--start---")
              tlsClient.connect(tlsTwoWayConnectOptions).then(() => {
                hilog.info(domain, tag, `${caseName} tlsClient connect success`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsClient connect  get err is ` + JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      }
    )
    ;

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_1100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_1100
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_1100';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let port: number = Math.round(1024 + Math.random() * 5000 + Math.random() * 4000);
          let netAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: port.toInt()
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`)
          tlsServer.onTlsServerConnect((tlsSocketConnection: socket.TLSSocketConnection) => {
            hilog.info(domain, tag,
              `${caseName} ======= tlsServer on  connect  success client is :` +
                JSON.stringify(tlsSocketConnection));
            tlsSocketConnection.close().then(() => {
              hilog.info(domain, tag, `${caseName} tlsSocketConnection close success`);
              sleep(500).then(() => {
                tlsServer.close().then(() => {
                  hilog.info(domain, tag, `${caseName} tlsServer close success`);
                  ExpectTrue(true);
                  tlsServer.offTlsServerConnect();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }).catch((err) => {
                  hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                })
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsSocketConnection close failed` + JSON.stringify(err));
                ExpectFail();
                sleep(500).then(() => {
                  tlsServer.close().then(() => {
                    hilog.info(domain, tag, `${caseName} tlsServer close success`);
                    ExpectTrue(true);
                    tlsServer.offTlsServerConnect();
                    hilog.info(domain, tag, `${caseName}---End`);
                    done();
                  }).catch((err) => {
                    hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, `${caseName}---End`);
                    done();
                  })
                });
              })
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} tlsSocketConnection close failed` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
          })

          tlsClient.bind(netAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} tlsClient bind failed err is: ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} tlsClient bind success `);
              let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
                ca: ca_c,
                cert: cert_c,
                password: password,
                key: key,
                protocols: [socket.Protocol.TLSv13],
                signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
              };
              let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
                address: netAddress,
                secureOptions: tlsTwoWaySecureOption
              };
              hilog.info(domain, tag, "--- connection--start---")
              tlsClient.connect(tlsTwoWayConnectOptions).then(() => {
                hilog.info(domain, tag, `${caseName} tlsClient connect success`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsClient connect  get err is ` + JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_1200
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_1200
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_1200';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let port: number = Math.round(1024 + Math.random() * 5000 + Math.random() * 4000);
          let netAddress: socket.NetAddress = {
            address: '::1',
            port: port.toInt(),
            family: 2
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`)
          tlsServer.onTlsServerConnect((tlsSocketConnection: socket.TLSSocketConnection) => {
            hilog.info(domain, tag,
              `${caseName} ======= tlsServer on  connect  success client is :` +
                JSON.stringify(tlsSocketConnection));
            tlsSocketConnection.close().then(() => {
              hilog.info(domain, tag, `${caseName} tlsSocketConnection close success`);
              sleep(500).then(() => {
                tlsServer.close().then(() => {
                  hilog.info(domain, tag, `${caseName} tlsServer close success`);
                  ExpectTrue(true);
                  tlsServer.offTlsServerConnect();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }).catch((err) => {
                  hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                })
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsServer close failed catch err is :` + JSON.stringify(err));
              })
            }).catch((err) => {
              hilog.info(domain, tag, `${caseName} tlsSocketConnection close failed` + JSON.stringify(err));
              ExpectFail();
              sleep(500).then((_) => {
                tlsServer.close().then(() => {
                  hilog.info(domain, tag, `${caseName} tlsServer close success`);
                  ExpectTrue(true);
                  tlsServer.offTlsServerConnect();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                }).catch((err) => {
                  hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
                  ExpectFail();
                  hilog.info(domain, tag, `${caseName}---End`);
                  done();
                })
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsServer close failed catch err is :` + JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              })
            })
          })

          tlsClient.bind(netAddress, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} tlsClient bind failed err is: ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} tlsClient bind success `);
              let tlsTwoWaySecureOption: socket.TLSSecureOptions = {
                ca: ca_c,
                cert: cert_c,
                password: password,
                key: key,
                protocols: [socket.Protocol.TLSv13],
                signatureAlgorithms: "rsa_pss_rsae_sha256:rsa_pss_rsae_sha384:ecdsa_secp256r1_sha256:ecdsa_secp384r1_sha384:ed25519"
              };
              let tlsTwoWayConnectOptions: socket.TLSConnectOptions = {
                address: netAddress,
                secureOptions: tlsTwoWaySecureOption
              };
              hilog.info(domain, tag, "--- connection--start---")
              tlsClient.connect(tlsTwoWayConnectOptions).then(async () => {
                hilog.info(domain, tag, `${caseName} tlsClient connect success`);
              }).catch((err) => {
                hilog.info(domain, tag, `${caseName} tlsClient connect  get err is ` + JSON.stringify(err));
                ExpectFail();
                hilog.info(domain, tag, `${caseName}---End`);
                done();
              });
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_1300
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_1300
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_1300';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let port: number = Math.round(1024 + Math.random() * 5000 + Math.random() * 4000);
          let netAddress: socket.NetAddress = {
            address: '::1',
            port: port.toInt(),
            family: 2
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`)
          tlsServer.close().then(() => {
            hilog.info(domain, tag, `${caseName} tlsServer close success`);
            ExpectTrue(true);
            tlsServer.offTlsServerConnect();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_1400
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_1400
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_1400';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let netAddress01: socket.NetAddress = {
            address: '::1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 2
          }
          let netAddress02: socket.NetAddress = {
            address: '::1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 2
          }
          let tlsConnectOptions01: socket.TLSConnectOptions = {
            address: netAddress01,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          let tlsConnectOptions02: socket.TLSConnectOptions = {
            address: netAddress02,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions01)
          hilog.info(domain, tag, `${caseName} tlsServer listen tlsConnectOptions01 success`);
          tlsServer.listen(tlsConnectOptions02)
          hilog.info(domain, tag, `${caseName} tlsServer listen tlsConnectOptions02 again success`);
          tlsServer.close().then(() => {
            hilog.info(domain, tag, `${caseName} tlsServer close success`);
            ExpectTrue(true);
            tlsServer.offTlsServerConnect();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, `${caseName} tlsServer close failed err is :` + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerClose_static_1500
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Close_1500
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketTLSSocketServerClose_static_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerClose_static_1500';
        hilog.info(domain, tag, `${caseName} test start`);
        try {
          let netAddress: socket.NetAddress = {
            address: '::1',
            port: (Math.round(1024 + Math.random() * 5000 + Math.random() * 4000)).toInt(),
            family: 2
          }
          let tlsConnectOptions: socket.TLSConnectOptions = {
            address: netAddress,
            secureOptions: tlsSecureOptions,
            ALPNProtocols: ["http/1.1"]
          }
          await tlsServer.listen(tlsConnectOptions);
          hilog.info(domain, tag, `${caseName} tlsServer listen  success`);
          await tlsServer.close()
          hilog.info(domain, tag, `${caseName} tlsServer close first  success`);
          await tlsServer.close()
          hilog.info(domain, tag, `${caseName} tlsServer close again  success`);
          tlsServer.offTlsServerConnect();
          ExpectTrue(true);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag, `${caseName} err: ${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName} test end`);
          done();
        }
      });
  })
}

