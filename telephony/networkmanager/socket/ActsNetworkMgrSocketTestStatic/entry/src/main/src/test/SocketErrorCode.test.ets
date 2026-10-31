'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { describe, it, expect, TestType, Size, Level, beforeAll, Hypium } from '@ohos/hypium-static/src/main/indexStatic';
import socket from '@ohos.net.socket';
import { BusinessError, Callback } from '@ohos.base';
import hilog from '@ohos.hilog';
import Context from "application.Context";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'SocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let context: Context | undefined;

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s',
      ` exportFail failed err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
  }
};

function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${info} test failed`);
  }
}

let ca_common: string[] = [
  `-----BEGIN CERTIFICATE----- MIIDbTCCAlWgAwIBAgIUEb8gE403eamzwoYHf3fE2JKw5s0wDQYJKoZIhvcNAQEL BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAgFw0yNTA2MTAxMjAyNDZaGA8yMDU1 MDYwMzEyMDI0NlowRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUx ITAfBgNVBAoMGEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDCCASIwDQYJKoZIhvcN AQEBBQADggEPADCCAQoCggEBAJmQ4OPvDI6GpbUAKDStkDS+UQZDnufrPYTCSGYS 77qAS7s9KrXhIWjs2j5LxC5tfNFoLMrXRmNjb6tPgs/EY6QLn+v4ICek7EeAzwRx Dr0Sh+Owj64toSb9WUBGNU5ahTLA4+cCpYhZamnCN18fYR2TXah/IbkjRZM8UN8Q iucCUn4lNT/1lh6qph+3UnRmafUzamlVkiQUsslbBZnm9vs88sYeTNlla9L4C8WH hnXLUOgl31TzWe2KppOS/b16p6bOwMS06kJbp8nS9Gd6GgH0k9Fny1X1JM/xZG4Z xvzLlNzhusXyzjNTrCmLGYDlLZxpp/aYUVf6Hb1b6exUAGMCAwEAAaNTMFEwHQYD VR0OBBYEFHR/rd7ZFFR7o05FG9mj1zwYHY88MB8GA1UdIwQYMBaAFHR/rd7ZFFR7 o05FG9mj1zwYHY88MA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEB AEih4pf7fOFdOHD9ztc2IFQE6uZswVqfNztk7dGZyC1bmlJnF9w92Ge/Qp7eqN4a 8aXT7Ttlj1Cn6VAznBd5JHs903UOI/gLNEHQWtSTP9BIoVoXHUNLzZbNvPveIT2d 8YAK1mG1NyCkR6zKIPLY4Lt8InR658l+h0XI5PiXZANZlgN3pETvpA04movMbZKS dn8bPMuhFExNTZEHceUTDz7Uqf/SYLPEwXSuLeYpjyyFnL6mXtE/q02n3sNcqkKx 3XtzIDzzOOxUDl2xPI+B36lzuIShhTbkGD/LdE3AHpX5CwZlooZF+INI+57UinM+ 6So9s6ovMthaJ+8Js8OxO5Y= -----END CERTIFICATE-----`
];

let pri_key_server: string = '-----BEGIN PRIVATE KEY-----\n' +
  'MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC/OF6q3q4R9tuJ\n' +
  'tlqmkGIXvZT60t7B7DxNs2s2M5Y6UqgAKJrY9MUoPmKwqPQS6ZZbpHZyYyRS7uSl\n' +
  'SB1JjpvT05m2KHm20Tx+ttyia+pkR07Aq/LSdt+ujCfE0rVF343oVQZcgaSbejpT\n' +
  'gQwvUsvAuPKczT1ytyh81rfpG1gkWpFf26CqUJ0q66h66P8/hWiiNmn4tb1bKuEB\n' +
  'VMyRZwHEwIVPXxQkoRtt2Wy8XBFqhBaKfNfb+Im8Ml9FQ3C91A1fcJi5agoNGTxn\n' +
  'ZJZI0xlt4vu8nMZuc9CgW64se0cImQsH2cYnj4W7t/Fg0TirmW/QNhNnP+K1kz1t\n' +
  'lWWyBj0NAgMBAAECggEAMxqymkH3DZAG7lAQ/BD8VlHxffNbW0Jyf2WjEpJI5P9w\n' +
  'LNKtR6xrAK1jnMkaqe9JouZaTYnXjF6SNuYGBcGaPcuAeiFpHgXfgBII91OWCgTQ\n' +
  'tEeAFuV0NGb6vex+S9VKTLxkfdacEn1hFy4W/pLHJ5OGK4fik0UGCg8siZ0oOlaP\n' +
  'wr3cM2vsGlgukweXOyV21I0B/DygEo/2PuikmaqfMAzz0scVngNb1lWkhq2ouFc7\n' +
  'K3LMH+hFnEdmoRtjnhvza70Whi5bW4Va99Ntqm364eTIjPZFuVoyUDbYiOzn30gO\n' +
  'njH58WJ/v1LLXeJ9oKQr4CTV0bxEl7aZ4xSYhFe3NQKBgQDm7K5nnWIKBhIWhMBb\n' +
  'YAjTvUCfSltMEJhqMnjKSrU84QxHhlOO7+wjHbL1zA9gTgK/wU6DSRUKz2BcVnYv\n' +
  'ol9iEw7qHzx2dHrG94EKnDn4XDFctBou4SeAElu9dJmMK6pBMIvhfwK70dJxyX6I\n' +
  'pdvhbrZJcIOgqhgVFjJnW1GoXwKBgQDT+/lHPRNMF2ngI8ImDB0nYErsHnbLC7GC\n' +
  '6XoS7xUlTTrXo0ONbuxHfiAUVYrN4C9/Dsh2eQMwwBwWP3Au8mQWOCGDhlxEVcxy\n' +
  'wnpy9ecdpptiO/YQNn6dBRMIU5g6k0TZY4lZZ/SIDm29M9GtzIHIm0fW2MksfIiJ\n' +
  'f7SOkhoCEwKBgQCfNnX0qHUM1iyoa/S3y1mqqyQf70NNCXAcYBoZ1zJn+/3cXofD\n' +
  '2DVl7LcTcxLy4jZRATVhnQSuBFa6sz4fD4NV+i/hSZIFVb/E6KaGqznou5+o+9/F\n' +
  'jKUQTxgDYp3vH7ft5Eu9ODWpSzweCb989WXJYuy5a6LFJiEegMRVsId3XwKBgQCO\n' +
  '4KpnhZbYFn/Z/sAA/PE5dQGKnA3dVQhUACGzWUmbVq5uYTBKx5ShqzTb/7wKfywE\n' +
  'K2aZ035/ATztEdz/B4jGIRcVmx3dQScHwmTdzzfzGDRqxZdX3iMAmkb1ucJE2LXy\n' +
  '/8+3XwXGHlOAzshoqApht6d3+628OkOcyWJdJcQ52QKBgQC4uC2IY9kVSE7aPXs/\n' +
  'UMk8IMX187wWZe1ULhwkhwgsvJDx1qvNDFlOiBoFAH9TagKVzQrtoa4X9C3Qf6IK\n' +
  'SwbdPtDz0VeUWxXF+ASA1v7SM+Ra2v7hrOfrOWLeSnTTLZzcUAQjlkc3ynFcGimF\n' +
  'JNJFAqr9K+LHatgjxTcHO9amFQ==\n' +
  '-----END PRIVATE KEY-----\n';

let cert_server: string = '-----BEGIN CERTIFICATE-----\n' +
  'MIIDJDCCAgwCFH93ojUm8aIfF/P/YdW+iDl9RRiAMA0GCSqGSIb3DQEBCwUAMEUx\n' +
  'CzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRl\n' +
  'cm5ldCBXaWRnaXRzIFB0eSBMdGQwIBcNMjUwNjEwMTIxMzM4WhgPMjA1NTA2MDMx\n' +
  'MjEzMzhaMFYxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYD\n' +
  'VQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQxDzANBgNVBAMMBnNlcnZlcjCC\n' +
  'ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL84XqrerhH224m2WqaQYhe9\n' +
  'lPrS3sHsPE2zazYzljpSqAAomtj0xSg+YrCo9BLpllukdnJjJFLu5KVIHUmOm9PT\n' +
  'mbYoebbRPH623KJr6mRHTsCr8tJ2366MJ8TStUXfjehVBlyBpJt6OlOBDC9Sy8C4\n' +
  '8pzNPXK3KHzWt+kbWCRakV/boKpQnSrrqHro/z+FaKI2afi1vVsq4QFUzJFnAcTA\n' +
  'hU9fFCShG23ZbLxcEWqEFop819v4ibwyX0VDcL3UDV9wmLlqCg0ZPGdklkjTGW3i\n' +
  '+7ycxm5z0KBbrix7RwiZCwfZxiePhbu38WDROKuZb9A2E2c/4rWTPW2VZbIGPQ0C\n' +
  'AwEAATANBgkqhkiG9w0BAQsFAAOCAQEATco08kfIG/HpyHtoWtfdyxDiihXm5onQ\n' +
  'sTnUF3q/ETSwUU1UCUkxRr/KbiSikRcN6o7mFtbd7qECAN5THc3+bFjcimfMYXLb\n' +
  'zl/Bcc7wlVgbD4hnSYtuU14seHGHtQVh9kPKn+OdDL55VKnzbI9O8OZIcE7XVIi8\n' +
  'wFRCWIq2PCxiTgB3Abu9V0Czy5EszFtNaCfUj65mPHCymRAeyYme7mKzxUWzsxKB\n' +
  'i4NJvjFZ9qWh0hC8o/ux+26oo9XJlWVvd35/RAx+mZz4R6733/RR+8pVt4p+GnGM\n' +
  '/BX+2zvrb7nXns+Ghvd/+J4ignxeSpDuc6WjLPtOh52puWxfMFulIg==\n' +
  '-----END CERTIFICATE-----\n'

let pri_key_client: string = '-----BEGIN PRIVATE KEY-----\n' +
  'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCv9q4wAWgKXMsR\n' +
  'Ep858Kmq0e1ZnZBKLadpBwrkxembHmYF8PQxKkkM7wHjiBu0H1KlWdJgUV8d3DPO\n' +
  '+83OlFuWheKgr8DT1eRXAw2IEBPTOTBD4CeAkjJR7HtHTgeYBq7x40nAwRxExEKV\n' +
  'j1eLU/r64EhV8/BtZniknTbbUic4C6buykSrwMXM4Y4FjfHkNyh2c/FHR0u46jeR\n' +
  '452rMuN5tJCtqfORadc5Dw//pUVS/M7wS8behUyEvCLoZo1zB286N4+by15hpEe2\n' +
  '4RdjGuscCXUpJeiCNU3tQMhV38/olFyciKjc93iqSiT9pOc0vYNCiMvl1Sm8KTfV\n' +
  'BE3KojS9AgMBAAECggEAQ2xSZwuK6XmPx51qjGFmKZFhkDZ6/KlMncY4its4vRqj\n' +
  'PgCLGLGapw2HnD7hWp2r5baqkQRs3TysT1GVlOOsylrHsQlW6fRpl1uQmkOKzSL7\n' +
  'Fu7zQ+UAyfpCbFp+N2bMLtwHvQdhhQnsd3Eiury1jN5WaTTcuZaLgIvK4rOyWlsd\n' +
  'Y5H9ipi+GGT2snDkrFdP2A6T32IjtsjBzEVyh9X12caEWvTnUcL7G8IAGkz5eeui\n' +
  'PphT+94GuVac3QxvY1seZMhK1+ofPVx13olzlCEYNf5nOCc2vJr+L5xtbjvn8345\n' +
  'sdwjCpMBn3PWYR+Rh4IANILX94YKGE65/UY2SFaOswKBgQDm6ra4kGBEexcK0RtW\n' +
  'Usx3HbD8sy7TDIPsAUZFJfmBETNYQT2sHfln3G3uAiCObf94L7jC/ghBkXimGSno\n' +
  'aigJnaiEFwieX8aTcQo2Bhnm4oBqKEO7siN3GBN8w6KL7hlDwCuwvBT/fCnXj2qB\n' +
  '7d3scuNOoIV4JuvQqUE+Ol0SqwKBgQDDE9adCgcwW7RjsxvV9G+4zN4s7d5XVo0+\n' +
  'F7CPNMJBGav647y0v/tWOtlGhkHDnP1WUl2UZx4J+6+b0yIdMdRAcso1Ko9TxakB\n' +
  'nRig9/1buTh+akkTHootda7/85/PITaSmRId7XkgS2KIb9rLeewV3tx9M2Ol9Sl6\n' +
  '2KyprxmWNwKBgQDgDZuPRx7xM1GvQCe7QYl8hkWlW6KySrFx++aXz3ng/rSIDH1v\n' +
  'lIHbgaj0SAIY0KgRkJRANsYCAMlEuKPOC7qfYecRi1vkd1+wzfyvYIofWWRqHHlk\n' +
  'FDuPIcA+zX/ZMAQ5lauOx1/EaVAcBN6+BPPQqcTeFKiMZY9nneJdI7oNEwKBgE6Z\n' +
  'obFopvjfGlHJiv+sG4/US/jCZwG9x+8q0GMDGPnuBBN0y0XwzK4zy/PUiI7upEyx\n' +
  'py7yVXIkTN92NJqaxzCoj7zYRyOz0qLpz1CcWyMoABE/de4UMgybDEXovY1RjpGG\n' +
  'x3vzgQh4F11t5DR0DaHKSADSQeZOX8Y1o2xDNwYFAoGAeR1iNXRTxVzSzYA+wMUY\n' +
  'bqUS39N7fdTma8+K2jYvXeuhyG3o8gyL3jYY3nC6LTtk+Ds+gCsajkuXFLiCRYVV\n' +
  '7TuKMq402Q/EQ91Ow98L1n6KWWML2+qolA6gdXe1T6EE14Jp6i1ZKl7hK2xNYZMt\n' +
  'pdyN4l1O+mtWzoN536XgpOk=\n' +
  '-----END PRIVATE KEY-----\n';

let cert_client: string = '-----BEGIN CERTIFICATE-----\n' +
  'MIIDJDCCAgwCFH93ojUm8aIfF/P/YdW+iDl9RRiBMA0GCSqGSIb3DQEBCwUAMEUx\n' +
  'CzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRl\n' +
  'cm5ldCBXaWRnaXRzIFB0eSBMdGQwIBcNMjUwNjEwMTIyMDA5WhgPMjA1NTA2MDMx\n' +
  'MjIwMDlaMFYxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYD\n' +
  'VQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQxDzANBgNVBAMMBmNsaWVudDCC\n' +
  'ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAK/2rjABaApcyxESnznwqarR\n' +
  '7VmdkEotp2kHCuTF6ZseZgXw9DEqSQzvAeOIG7QfUqVZ0mBRXx3cM877zc6UW5aF\n' +
  '4qCvwNPV5FcDDYgQE9M5MEPgJ4CSMlHse0dOB5gGrvHjScDBHETEQpWPV4tT+vrg\n' +
  'SFXz8G1meKSdNttSJzgLpu7KRKvAxczhjgWN8eQ3KHZz8UdHS7jqN5Hjnasy43m0\n' +
  'kK2p85Fp1zkPD/+lRVL8zvBLxt6FTIS8IuhmjXMHbzo3j5vLXmGkR7bhF2Ma6xwJ\n' +
  'dSkl6II1Te1AyFXfz+iUXJyIqNz3eKpKJP2k5zS9g0KIy+XVKbwpN9UETcqiNL0C\n' +
  'AwEAATANBgkqhkiG9w0BAQsFAAOCAQEAP75ox5G7MytaueZH97xQAdLFEyHkoduX\n' +
  'PMddYDJcRv5VAG+EHrhSId/DoaIDrhPHgwkzUWbYHn6RB63bkt11CXJKHwoZywIp\n' +
  'efdIMlWpDJ+ISEu9q3THWAnXKdB4EuI1j3LSzNeoSQc64Wy4NQcIixmf6JnqyzQr\n' +
  '3UFEJ4jj1nJGRhBUQza4lhSN3dJNF1kawbTn4aQ0D+rvhWcCKSPTzsGy+xvPUvsV\n' +
  '7PlTzCrTmn7rgovs9iwgWFOvNdJJI6O2oTuZZSSGT/Xc1fpZPbIlLBTHlSpi4F6Y\n' +
  'vttpfMLHS7YyAAppfegn79OBf3DP/N3VRmcDeQgh7FOwWmp+aZg4rA==\n' +
  '-----END CERTIFICATE-----';

let addr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 3000
};

let addrErr: socket.NetAddress = {
  address: '9999',
  port: 10000
};

let connOpt: socket.TLSConnectOptions = {
  address: addr,
  secureOptions: {
    ca: ca_common,
    cert: cert_client,
    key: pri_key_client,
    password: '123456',
    protocols: [socket.Protocol.TLSv12],
    useRemoteCipherPrefer: true,
    signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
    cipherSuite: "AES256-SHA256"
  },
  ALPNProtocols: ["spdy/1", "http/1.1"],
  proxy: {
    type: socket.ProxyTypes.NONE,
    username: 'name1',
    password: 'password1',
    address: {
      address: '127.0.0.1',
      port: 10000
    }
  }
};

let connOptErr: socket.TLSConnectOptions = {
  address: addrErr,
  secureOptions: {
    ca: ca_common,
    cert: cert_client,
    key: pri_key_client,
    password: '123456',
    protocols: [socket.Protocol.TLSv12],
    useRemoteCipherPrefer: true,
    signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
    cipherSuite: "AES256-SHA256"
  },
  ALPNProtocols: ["spdy/1", "http/1.1"],
  proxy: {
    type: socket.ProxyTypes.NONE,
    username: 'name2',
    password: 'password2',
    address: {
      address: '127.0.0.1',
      port: 10000
    }
  }
}

function expectEqual(exp: string | number | boolean, assert: string | number | boolean, info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${info} test failed`);
  }
}

export default function SocketErrCodeTest01(): void {
  describe('SocketErrCodeTest01', () => {
    beforeAll(() => {
      context = abilityDelegator.getAppContext();
      hilog.info(domain, tag, `context : ${JSON.stringify(context)}`);
    })

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketGetLocalAddress_static_0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_GetLocalAddress_0100
     * @tc.desc   UDP GetLocalAddress Bad file descriptor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrSocketUDPSocketGetLocalAddress_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketUDPSocketGetLocalAddress_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          udp.getLocalAddress().then((localAddress: socket.NetAddress) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} UDP_Socket get SUCCESS! Address：` + JSON.stringify(localAddress));
            ExpectFail();
            done()
          }).catch((err) => {
            hilog.error(domain, tag, '%{public}s', `${caseName} DP_Socket get FAILED! err: ${err?.code}`)
            expectTrue(err?.code === 2301009);
            done()
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectTrue(err?.code === 2301009);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSendErr_static_0100
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_Err_0100
     * @tc.desc   UDPSocket send bad file descriptor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrSocketUDPSocketSendErr_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrSocketUDPSocketSendErr_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let netAddress1: socket.NetAddress = {
            address: '127.0.0.1',
            port: 8888
          }
          let netAddress2: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9999
          }
          let proxyOption: socket.ProxyOptions = {
            type: socket.ProxyTypes.NONE,
            address: netAddress2
          }
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: netAddress1,
            proxy: proxyOption
          }
          udp.send(sendOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} catch err code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301009);
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} send success`);
              ExpectFail();
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(err?.code === 2301009);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSendErr_static_0200
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_Err_0200
     * @tc.desc   UDPSocket send Bad file descriptor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrSocketUDPSocketSendErr_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrSocketUDPSocketSendErr_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let netAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 8889
          }
          let socks5Server: socket.NetAddress = {
            address: '9998',
            port: 9998
          }
          let proxyOption: socket.ProxyOptions = {
            type: socket.ProxyTypes.SOCKS5,
            address: socks5Server,
            username: "xxx",
            password: "xxx"
          }
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: netAddress,
            proxy: proxyOption
          }
          udp.send(sendOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} test failed err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301009);
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} send success`);
              ExpectFail();
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(err?.code === 2301009);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerListenerr_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Listen_err_0100
     * @tc.desc   TLSSocketServer listen(callback) cannot assign requested address.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrSocketTLSSocketServerListenerr_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerListenerr_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
          tlsServer.listen(connOptErr, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} listen fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              hilog.info(domain, tag, '%{public}s',
                `${caseName} catch err code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code == 2303199 || err?.code == 2303111)
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
              ExpectFail();
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectTrue(err?.code === 2303199 || err?.code === 2303111)
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerListenerr_static_0200
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_Listen_err_0200
     * @tc.desc   TLSSocketServer listen(promise) cannot assign requested address.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrSocketTLSSocketServerListenerr_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerListenerr_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
          tlsServer.listen(connOptErr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
            ExpectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            hilog.info(domain, tag, '%{public}s',
              `${caseName} catch err code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code == 2303199 || err?.code == 2303111)
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectTrue(err?.code === 2303199 || err?.code === 2303111)
          done();
        }
      });


    /**
     * @tc.name   testNetworkMgrSocketTLSSocketGetSocketFd_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_GetSocketFd_0100
     * @tc.desc   TLSSocket GetSocketFd success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrSocketTLSSocketGetSocketFd_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketGetSocketFd_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let tls: socket.TLSSocket = socket.constructTLSSocketInstance();
          tls.getSocketFd().then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} get success`);
            expectTrue(true);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} get err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          ExpectFail();
          done();
        }
      });

    /**
     * @tc.name   testLocalSocketServerGetState_static_0100
     * @tc.number SUB_LocalSocketServer_GetState_test_0100
     * @tc.desc   test LocalSocketServer getState function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLocalSocketServerGetState_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testLocalSocketServerGetState_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let sandboxPath: string = context?.filesDir + '/testSocket_getState'
          let listenAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          server.listen(listenAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.error(domain, tag, '%{public}s', "listen fail: " + JSON.stringify(err));
            ExpectFail();
            done();
          })
          server.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} getState success: ` + JSON.stringify(data));
            expectTrue(true);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} getState err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testSocketerrCodeTCPSocketServer_static_0100
     * @tc.number SUB_Socket_errCode_TCPSocketServer_0100
     * @tc.desc   Cancel multiple subscriptions to the TCP Socket Connection shutdown event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketerrCodeTCPSocketServer_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSocketerrCodeTCPSocketServer_static_0100';
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          let tcpServer: socket.TCPSocketServer = socket.constructTCPSocketServerInstance();
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          let listenAddress: socket.NetAddress = {
            address: '12345',
            port: 12445,
            family: 1
          };
          await tcpServer.listen(listenAddress);
          let tcpConnectOptions: socket.TCPConnectOptions = {
            address: listenAddress,
            proxy: {
              type: socket.ProxyTypes.SOCKS5,
              address: {
                address: '127.0.0.1',
                port: 12346
              }
            }
          };
          tcpServer.onTcpServerConnect((client: socket.TCPSocketConnection) => {
            client.onTcpConnClose(() => {
              ExpectFail();
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            });
            client.offTcpConnClose();
            client.close().then(() => {
              expectTrue(true);
              tcpServer.offTcpServerConnect();
              hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
              done();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s', 'fail to close' + err?.code.toString());
              tcpServer.offTcpServerConnect();
              done();
            });
          });
          tcp.connect(tcpConnectOptions).catch((err1) => {
            let err = err1 as BusinessError;
            hilog.info(domain, tag, '%{public}s', 'fail to connect' + err?.code.toString());
            done()
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(err?.code === 2303199)
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testSocketerrCodeTCPSocketServer_static_0400
     * @tc.number SUB_Socket_errCode_TCPSocketServer_0400
     * @tc.desc   Test TCPSocketConnection offMessage 401 event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketerrCodeTCPSocketServer_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSocketerrCodeTCPSocketServer_static_0400';
        let server = socket.constructTCPSocketServerInstance();
        try {
          hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
          server.onTcpServerConnect((data) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} on connect success ${JSON.stringify(data)}`);
            data.offTcpConnMessage(undefined);
          });
          server.offTcpServerConnect();
          done();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName}_catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(err?.code === 401)
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSendErr_static_0300
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_Err_0300
     * @tc.desc   UDPSocket send bad file descriptor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrSocketUDPSocketSendErr_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrSocketUDPSocketSendErr_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let netAddress1: socket.NetAddress = {
            address: '127.0.0.1',
            port: 8888
          };
          let netAddress2: socket.NetAddress = {
            address: '127.0.0.1',
            port: 9999
          };
          let proxyOption: socket.ProxyOptions = {
            type: socket.ProxyTypes.NONE,
            address: netAddress2,
            username: "",
            password: ""
          };
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: netAddress1,
            proxy: proxyOption
          };
          udp.send(sendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} send success`);
            ExpectFail();
            done();
          })
            .catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} catch err code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301009);
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            });

        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(Number((err as BusinessError).code) === 2301009);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrSocketUDPSocketSendErr_static_0400
     * @tc.number SUB_NetworkMgr_Socket_UDPSocket_Send_Err_0400
     * @tc.desc   UDPSocket send Bad file descriptor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrSocketUDPSocketSendErr_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetworkMgrSocketUDPSocketSendErr_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let udp: socket.UDPSocket = socket.constructUDPSocketInstance();
          let netAddress: socket.NetAddress = {
            address: '127.0.0.1',
            port: 8889
          }
          let socks5Server: socket.NetAddress = {
            address: '9998',
            port: 9998
          }
          let proxyOption: socket.ProxyOptions = {
            type: socket.ProxyTypes.SOCKS5,
            address: socks5Server,
            username: "",
            password: ""
          };
          let sendOptions: socket.UDPSendOptions = {
            data: 'Hello, server!',
            address: netAddress,
            proxy: proxyOption
          }
          udp.send(sendOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} send success`);
            ExpectFail();
            done();
          })
            .catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} catch err code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectTrue(err?.code === 2301009);
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} test failed err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(err?.code === 2301009);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerSetExtraOptionsErr_static_0400
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_SetExtraOptions_err_0400
     * @tc.desc   TLSSocketServer SetExtraOptions(callback) parameter err.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrSocketTLSSocketServerSetExtraOptionsErr_static_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerSetExtraOptionsErr_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: true,
            TCPNoDelay: true,
            socketLinger: {
              on: true, linger: 10
            },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: true,
            socketTimeout: 3000
          };
          let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
          await tlsServer.listen(connOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen callback success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', "failed: " + JSON.stringify(err));
            ExpectFail();
            done();
          });
          tlsServer.setExtraOptions(tcpExtraOptions, (err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} catch err code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', `${caseName} setExtraOptions success`);
              expectTrue(true);
              done();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrSocketTLSSocketServerSetExtraOptionserr_static_0600
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketServer_SetExtraOptions_err_0600
     * @tc.desc   TLSSocketServer SetExtraOptions(promise) parameter err.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrSocketTLSSocketServerSetExtraOptionserr_static_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketTLSSocketServerSetExtraOptionserr_static_0600';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let tcpExtraOptions: socket.TCPExtraOptions = {
            keepAlive: false,
            OOBInline: true,
            TCPNoDelay: true,
            socketLinger: {
              on: true, linger: 10
            },
            receiveBufferSize: 1000,
            sendBufferSize: 1000,
            reuseAddress: true,
            socketTimeout: 3000
          };
          let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();
          await tlsServer.listen(connOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', "listen callback success");
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', "failed: " + JSON.stringify(err));
            ExpectFail();
            done();
          });
          tlsServer.setExtraOptions(tcpExtraOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} setExtraOptions success`);
            expectTrue(true);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} catch err code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testLocalSocketServerSetExtraOptions_static_0300
     * @tc.number SUB_LocalSocketServer_SetExtraOptions_test_0300
     * @tc.desc   test LocalSocketServer SetExtraOptions(promise) 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLocalSocketServerSetExtraOptions_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testLocalSocketServerSetExtraOptions_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let extraOpt: socket.ExtraOptionsBase = {
            reuseAddress: true
          }
          server.setExtraOptions(extraOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} set success`);
            ExpectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} set fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            hilog.info(domain, tag, '%{public}s',
              `${caseName} catch err code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301009);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(err?.code === 2301009);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testLocalSocketServerSetExtraOptions_static_0400
     * @tc.number SUB_LocalSocketServer_SetExtraOptions_test_0400
     * @tc.desc   test LocalSocketServer SetExtraOptions(promise) 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLocalSocketServerSetExtraOptions_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testLocalSocketServerSetExtraOptions_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let extraOpt: socket.ExtraOptionsBase = {
            reuseAddress: false
          }
          server.setExtraOptions(extraOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} set success`);
            ExpectFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} set fail code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            hilog.info(domain, tag, '%{public}s',
              `${caseName} catch err code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301009);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(err?.code === 2301009);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testLocalSocketServerListen_static_0400
     * @tc.number SUB_LocalSocketServer_Listen_test_0400
     * @tc.desc   test LocalSocketServer listen 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLocalSocketServerListen_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testLocalSocketServerListen_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let addr: socket.LocalAddress = {
            address: ''
          };
          server.listen(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', 'listen success');
            ExpectFail();
            done();
          }).catch((err) => {
            hilog.error(domain, tag, '%{public}s', 'listen fail: ' + JSON.stringify(err));
            expectTrue(err?.code === 401);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(err?.code === 401);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testNetworkMgrSocketLocalSocketServerSend_static_0100
     * @tc.number SUB_NetworkMgr_Socket_LocalSocketServer_Send_0100
     * @tc.desc   check whether the close interface takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkMgrSocketLocalSocketServerSend_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testNetworkMgrSocketLocalSocketServerSend_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let localServer: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let localClient: socket.LocalSocket = socket.constructLocalSocketInstance();
          let sandboxPath: string = context?.filesDir + '/testSocket02';
          let listenAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          localServer.onConnect((localSocketConnection: socket.LocalSocketConnection) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} localServer on connect`);
            let sendOptions: socket.LocalSendOptions = {
              data: 'Hello, client!',
              encoding: ''
            }
            localSocketConnection.send(sendOptions).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} localSocketConnection send success`);
              expectTrue(true);
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connection send err is ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            })
            localServer.close().then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} localServer close success`);
              expectTrue(true);
              done();
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} get err is ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            })
          });
          await localServer.listen(listenAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} localServer listen success`);
            expectTrue(true);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} catch listen err is ` + JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
          let localAddress: socket.LocalAddress = {
            address: sandboxPath
          }
          let connectOpt: socket.LocalConnectOptions = {
            address: localAddress,
          }
          let sendOpt: socket.LocalSendOptions = {
            data: 'Hello world!'
          }
          await localClient.connect(connectOpt).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} localClient connect success`);
            expectTrue(true);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} localClient connect fail , err is` + JSON.stringify(err?.code)+JSON.stringify(err?.message));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} catch fail err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          done();
        }
      });

    /**
     * @tc.name   testLocalSocketConnect_static_0300
     * @tc.number SUB_LocalSocket_Connect_test_0300
     * @tc.desc   test LocalSocket Connect 401 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLocalSocketConnect_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testLocalSocketConnect_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let client: socket.LocalSocket = socket.constructLocalSocketInstance();
          let addr: socket.LocalConnectOptions = {
            address: {
              address: ''
            },
            timeout: 200
          }
          client.connect(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} connect success`);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} connect err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectTrue(err?.code === 2301111);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          expectTrue(err?.code === 2301111);
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });

    /**
     * @tc.name   testLocalSocketServerGetState_static_0200
     * @tc.number SUB_LocalSocketServer_GetState_test_0200
     * @tc.desc   test LocalSocketServer getState function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLocalSocketServerGetState_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testLocalSocketServerGetState_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
        try {
          let server: socket.LocalSocketServer = socket.constructLocalSocketServerInstance();
          let sandboxPath: string = context?.filesDir + '/testSocket_getState'
          let listenAddr: socket.LocalAddress = {
            address: sandboxPath
          }
          await server.listen(listenAddr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.error(domain, tag, '%{public}s', "listen fail: " + JSON.stringify(err));
            ExpectFail();
            done();
          })
          server.getState().then((data: socket.SocketStateBase) => {
            hilog.info(domain, tag, '%{public}s', `${caseName} getState success: ` + JSON.stringify(data));
            expectEqual(data.isBound, true);
            expectEqual(data.isClose, false);
            expectEqual(data.isConnected, false);
            done();
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} getState err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          ExpectFail();
          done();
        }
        hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
      });
  })
}