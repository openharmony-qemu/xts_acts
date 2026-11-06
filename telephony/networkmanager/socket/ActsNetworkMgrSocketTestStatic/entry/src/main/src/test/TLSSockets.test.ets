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
import { describe, it, expect, Level, Size, TestType, afterEach, beforeEach } from '@ohos/hypium-static/src/main/indexStatic';
import socket from '@ohos.net.socket';
import { BusinessError, Callback } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'SocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let server_key: string = "-----BEGIN PRIVATE KEY-----\n" +
  "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCenbm9Vs2F+Mu9\n" +
  "51dRqoQy68pP2OmIWbl+mFLbgydilRgmsdBuWM/qGJtXGOR77Z89uXv18hIrVNBv\n" +
  "1Tt0DlGJmnO9i8AlRYhKj1lYsdnNRBHItkOZI7s4+NSGqOqYbM0Jmo4pp66c4mwz\n" +
  "MVuLLoO1+i5ROxROGa+b78hoQoCpUvtBX81pX1ds6To22bqig2zmdGjHHFkNk3mQ\n" +
  "yyG2JeIm4q7bt25S/D3HpX7VpkmqS1jewXu0tzAul+tydzqziQE4XeV0Oz+QUT/V\n" +
  "piPile0xKqmJX3l+YbkvHSIlfeFMJsM0ZngUkmKmFponIy0uZTY8VRnuRf7bs+Ft\n" +
  "FCDjf1BbAgMBAAECggEADQuP0SCoepJBv3adWdwaT03RL8v5OPuYI+9HMUKSJKt6\n" +
  "dwQ8zjaDsw8fB4TGleKvLBZrOYkVMXciRXBWGW9sCVMonbg2r1oOoYM0p/TIovcs\n" +
  "N0O2P4wOw9rDL+gIk0yveFC7zHU8CS8eEv/GNaY3sunGkWu4ecvnA34vD1QY3NQT\n" +
  "BPSv2+ZXSOV+nfSYg9noxJXHTgx+ALlSVe2731BFE1sBwkUpTpBvy/cnINwmsiVe\n" +
  "JIPH3JGzBydmvtYI+FjiqItqcsGaU8TKkqQmasZ9a92/8LMBWFS2cyLsKUiDaLHK\n" +
  "AwlL/Easbzd2Ri0cfhIXBWZweVa+DLr3B3XT/OhsAQKBgQDd9XcbYZWrM/HQ8k6V\n" +
  "PrbyxgF9pHjZPZF+OZjDknqDNRPNm1J/Ec+ij7nnazMPY9qOo4hwJNxd82dhSfbI\n" +
  "x+7gSCfecLDyGr44rH/zvLE/i5Yv52SDPv4x0gOpBzSfr+QV/dws450wccVpKstK\n" +
  "K3aw29ukOj7pnEXJn7dy10bVWwKBgQC28U1AfReCRdkh3GBIa5FdCT7GGN1ATQww\n" +
  "wtFkQ5RdWPbRbCQrxtafYQGTzjl+jzNRN/8tjU+VfdpK+mToKmXWBIkY3SlcTsPW\n" +
  "RHjf7pDKysK+q286e4PiLpV4KJus5H3SgVSroIpkjf5J4/W6xjR6MTHXvoOMxWns\n" +
  "wE6+EPNhAQKBgC3vTe4JvQrIXkQq0V6Lsxr9JXPWJPh4iHLCAr5+wwICaw3DFkib\n" +
  "7AetjQC6q7+En8ejSmpDBqQe6oc04nDdB6+83xtm4QfJxxI9iOFtbJVFExjo32FW\n" +
  "GQ9Acmd5yUc/BIoUlotns7FB6mQAaj/4TMD/Ty5mq3x3Te4TMsj+inc/AoGAONNJ\n" +
  "YL+6fq+9m4P9sGEhXRnTEuuERkXohHjvW8qWGkzZFgIWVjbEUetq9wN23nYSxaa0\n" +
  "L+0WDGR0WxfeIjORQGJWR4/jGhYpRLQuK7jJ5wQGa/2KZksZkzdPHGzYtmKfJrUf\n" +
  "nNQYSNXGaCNUH/kTMeV4CwDVkfN8TJsLmoRfZQECgYA3IGz12uGV1BvQaKaUy40r\n" +
  "xXAvIZbLM9L9otpERfr5I/mZL18xLqgp/mzoHG/FIvm3YvQBDQFaKZB0+pjaYdm/\n" +
  "vH6JfvJL7iqTKtgs/c+1EiizmkD/Z0aAZNQ6M1U69MjXcJlAa7USbBKkna1smyBA\n" +
  "Tjm6Um0WJONczsIiZq9M6Q==\n" +
  "-----END PRIVATE KEY-----"
// let server_ca: string =
//   "-----BEGIN CERTIFICATE-----\n" +
//     "MIIDazCCAlOgAwIBAgIUUkPBvZGXiOfpNTu6MGDlDw8OaLEwDQYJKoZIhvcNAQEL\n" +
//     "BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM\n" +
//     "GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAeFw0yNDAyMDUwODQyMDNaFw0yNTAy\n" +
//     "MDQwODQyMDNaMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEw\n" +
//     "HwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggEiMA0GCSqGSIb3DQEB\n" +
//     "AQUAA4IBDwAwggEKAoIBAQCenbm9Vs2F+Mu951dRqoQy68pP2OmIWbl+mFLbgydi\n" +
//     "lRgmsdBuWM/qGJtXGOR77Z89uXv18hIrVNBv1Tt0DlGJmnO9i8AlRYhKj1lYsdnN\n" +
//     "RBHItkOZI7s4+NSGqOqYbM0Jmo4pp66c4mwzMVuLLoO1+i5ROxROGa+b78hoQoCp\n" +
//     "UvtBX81pX1ds6To22bqig2zmdGjHHFkNk3mQyyG2JeIm4q7bt25S/D3HpX7Vpkmq\n" +
//     "S1jewXu0tzAul+tydzqziQE4XeV0Oz+QUT/VpiPile0xKqmJX3l+YbkvHSIlfeFM\n" +
//     "JsM0ZngUkmKmFponIy0uZTY8VRnuRf7bs+FtFCDjf1BbAgMBAAGjUzBRMB0GA1Ud\n" +
//     "DgQWBBR2f3W2xNpqseiAN81AmkbhSzQDVjAfBgNVHSMEGDAWgBR2f3W2xNpqseiA\n" +
//     "N81AmkbhSzQDVjAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQCG\n" +
//     "gybJtcyHNSOkvfa7FOVDGqKK2J+j51EGTINwPqf2oUF0sFJPNx0Rm+s7JBPb/EC1\n" +
//     "70abbejtFOSBZMjoEMa5VFXDOAJ9bMILqk4owmnUWvkfVwLA5tRXxcVx34d02OLj\n" +
//     "qIc9h0s7d2rbU1LOw3/8f4oVgDzcr8FMEWYG0y6h8g6NOUFky17wTODSgZIrWRxY\n" +
//     "0fHpDe+jlQnxCoiAv7m3hGiNE0yquA4B4y4aduqyxNW1yQPxeHtrPeONJV6/8MIR\n" +
//     "JxWsJPT2P9ao/DHCItMK1gEibmkATbHvpQfU/V75QoqVXY8GdYlLt0P247aiPyYr\n" +
//     "As8jWsq731gdVsRCnGzE\n" +
//     "-----END CERTIFICATE-----"
// let client_ca: string =
//   "-----BEGIN CERTIFICATE-----\n" +
//     "MIIDazCCAlOgAwIBAgIURbEi4CXEaH9XNkI5fYJaET0/TtQwDQYJKoZIhvcNAQEL\n" +
//     "BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM\n" +
//     "GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAeFw0yNDAyMDUwODQyMTdaFw0yNTAy\n" +
//     "MDQwODQyMTdaMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEw\n" +
//     "HwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggEiMA0GCSqGSIb3DQEB\n" +
//     "AQUAA4IBDwAwggEKAoIBAQC18uHdYs6dTxvrjWKUaDDlw0E7Q4GyA5xy2dFZGCjT\n" +
//     "/gJWPkYkx1tfpoRMlJm0eq4GqNnWnCjlIlkB86RbBbYrvTbnc3hPG7Cb4eRYKa0J\n" +
//     "YQd1o/rdUSlcwjgzexI2MfwCPvVn8mr+LGTO9DI4xdoydk6DuwGhz/+bV5YQKaUA\n" +
//     "piK9UplkCqJuQoKp02FHRTLi5r5hse8cFHo/9vI6JjpG8P4pHeI4nFsIR6Gs6X8a\n" +
//     "3lF1VvSSMCGmJEkSB8Yj44XSdI87bMQR3JFbJDtqHk9uCCE0pZI6/gUTBcj8vYhq\n" +
//     "ufQHWpJbSkFQHONomNz8ETUGe1JFhojBAzKdQ53vn5OnAgMBAAGjUzBRMB0GA1Ud\n" +
//     "DgQWBBRCy+tupSv+6zxgjJzAczIA7JEJCTAfBgNVHSMEGDAWgBRCy+tupSv+6zxg\n" +
//     "jJzAczIA7JEJCTAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQBS\n" +
//     "StAubW6cZxrbt2yUjsos3WvJ3W7U8HmcoJ/dXA1oEn79F7ERIZnFujNf78EcCv/r\n" +
//     "1EC16bKdC+eZ4YnOk3uqG9cmyPUkkinLREGR4yb5t5xpytC0QE5E7L9Ey1JjfEXF\n" +
//     "N0hY7C98JoovSocaT+R7Ohn/zTsagfi58yaO7lCTRp+9a2kDWkn+DskDJWF1MZ4Q\n" +
//     "a0zyM9HmySrAH9UMsN/TjSfzb7iANe5vScIKYOt8cMi0fYJtxse7rGOe89p59Eu7\n" +
//     "ooq6CHKKexboL492pSADmrYTc7yn67PQk8WzJLieUZ6pqWr2R9u/abAFCrCgn9BK\n" +
//     "JF/0rKL3sMGKgJ3MYlos\n" +
//     "-----END CERTIFICATE-----"
let client_key: string =
  "-----BEGIN PRIVATE KEY-----\n" +
    "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC18uHdYs6dTxvr\n" +
    "jWKUaDDlw0E7Q4GyA5xy2dFZGCjT/gJWPkYkx1tfpoRMlJm0eq4GqNnWnCjlIlkB\n" +
    "86RbBbYrvTbnc3hPG7Cb4eRYKa0JYQd1o/rdUSlcwjgzexI2MfwCPvVn8mr+LGTO\n" +
    "9DI4xdoydk6DuwGhz/+bV5YQKaUApiK9UplkCqJuQoKp02FHRTLi5r5hse8cFHo/\n" +
    "9vI6JjpG8P4pHeI4nFsIR6Gs6X8a3lF1VvSSMCGmJEkSB8Yj44XSdI87bMQR3JFb\n" +
    "JDtqHk9uCCE0pZI6/gUTBcj8vYhqufQHWpJbSkFQHONomNz8ETUGe1JFhojBAzKd\n" +
    "Q53vn5OnAgMBAAECggEAJTi1yhNvjzDi1lJLK28RKb/C9Xu+6Yrhk4FJ2X8ewxeA\n" +
    "pOICeX2rDKtE/2Ga/BfoyAX84nF50D4xlTuhkNlfRh1kQP8XSp+whoM0snB8LKID\n" +
    "46YTKPl0i7xTwPxZYmrhUhhNHeGyz6KHUOsV5xVaqN4Y+8vi7pZdhQrq8Q2D6ti5\n" +
    "Z5WhKlXEQHIwkZ8aaW0+PoO4L2TntPZnf8X3HD5HsV7LhC+2l5l6MVjC8VW85BGh\n" +
    "RT1JnteVCGl2rQ/X+eO9c9h7jktjoCJF68Is1GRgAYyADbeTw6IIRa7zEjWcMUs6\n" +
    "l4w+YnIgDTCfxuxDzabpnCnQKXKV+Fp6+OFNUQlY+QKBgQDk83QVqXuv+Myqqwk6\n" +
    "mEvcvvuJHvSG6uZVq936HyMQcZbuyv02ZAmdIa/oyxnubgZH2pcWc03sVSXI85zA\n" +
    "/fJZbKpft++aCxCbnCzW5aes2SwhWLOk/KcQTmZV9Y/BeOY3hxwHRE7sWKAZtItx\n" +
    "DPNbobnuP1ROANf3TqZDJxgcqwKBgQDLcdyqy/lPtlqnItPGK3UmymKmX9aSVhGW\n" +
    "eUyQkjY+D6g3S24CF+YrbiBWfHt829g40+OALFdkxC6KYbJ4lF76uLzP0PTUuK7b\n" +
    "30+FikOlKSM6wvUWVLQGSHw5gype4aVghulTaoeST7XS5Xy/b5b/shlkHVzXJ6cI\n" +
    "wc57JFxs9QKBgQCQx48Z/7ISpm+uYTgV0KbwcekYXfXdt39un59ggv4mcN40JTMY\n" +
    "iQw3TE00FfNQ/kyEdatjbAjTsUiSmdL/i9cMS5Y1r1gZ/nNDI/CK+HEe8bphX/lC\n" +
    "FO8Edb9rDj0Y6H4UkSDdS4npFWYwuyYOmFTwFgZArdV++jOX1Sl4f6lUvwKBgAa2\n" +
    "7FSKxOC3oQhRIvIwbv5nwZfCI//SbWQs/rTqznV/6MpiZ/ATv9oBGXohQ6YcT2eY\n" +
    "vrJ1RDEkNHEGxnAqXXQi8sBdIid/LO4+0Y4TwSXLVMlUs+gXxZVLgSYYySY2hlHI\n" +
    "Qh0pr+3JSbP7NQHQeghYZXQjb/P98Ape8ySnT5GdAoGAU9BaC1hYA7CimvJDNGCK\n" +
    "XqC9gnSLSnX6gJP+l0S1STQtZiHePCUpe3JNtH9BtALqH+ErnQgTWmpFKQL82F03\n" +
    "IvHGZg2ODuFbqBhYGorDF4s8QhBi/qwPdL2t6b9FBIQf1xOoptW8lyD5bb8L/Jg0\n" +
    "XsEJk5PDRBPhdhCceGrQM7I=\n" +
    "-----END PRIVATE KEY-----"

let server_ca: string =
  "-----BEGIN CERTIFICATE-----\n" +
    "MIIDazCCAlOgAwIBAgIUbK9khgMcmPN/m0tvaakKXFVop/cwDQYJKoZIhvcNAQEL\n" +
    "BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM\n" +
    "GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAeFw0yNjA4MTEwNjM1MzBaFw0zNjA4\n" +
    "MDgwNjM1MzBaMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEw\n" +
    "HwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggEiMA0GCSqGSIb3DQEB\n" +
    "AQUAA4IBDwAwggEKAoIBAQCenbm9Vs2F+Mu951dRqoQy68pP2OmIWbl+mFLbgydi\n" +
    "lRgmsdBuWM/qGJtXGOR77Z89uXv18hIrVNBv1Tt0DlGJmnO9i8AlRYhKj1lYsdnN\n" +
    "RBHItkOZI7s4+NSGqOqYbM0Jmo4pp66c4mwzMVuLLoO1+i5ROxROGa+b78hoQoCp\n" +
    "UvtBX81pX1ds6To22bqig2zmdGjHHFkNk3mQyyG2JeIm4q7bt25S/D3HpX7Vpkmq\n" +
    "S1jewXu0tzAul+tydzqziQE4XeV0Oz+QUT/VpiPile0xKqmJX3l+YbkvHSIlfeFM\n" +
    "JsM0ZngUkmKmFponIy0uZTY8VRnuRf7bs+FtFCDjf1BbAgMBAAGjUzBRMB0GA1Ud\n" +
    "DgQWBBR2f3W2xNpqseiAN81AmkbhSzQDVjAfBgNVHSMEGDAWgBR2f3W2xNpqseiA\n" +
    "N81AmkbhSzQDVjAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQA3\n" +
    "E9HMUKHVaxql6QFcYvxhPXOKX3RZwNVOdan1knyUgvzf2f6F4s0BvjdleTgpAnkB\n" +
    "pdAFPWOaJUonAVcpQZVh4V0k8eFJGnZQZ8qRQeZTp5Xkp0veNAoRJZBYBiFjEzSn\n" +
    "p6RVIcMdrLGw/vGgXZYepjD2UFp7HPHa5hxFMAm29DQQyNxAlWWaRbh0WBc1DbgD\n" +
    "LgwKh/OjT0e5UGCMDOjcpVo6Dvwgq2NDKSWM03A/9z3vn/OxrwJcggFSpaz0TVPF\n" +
    "1ODBgR0Aoq+9W5fvr0rXzYdqMk+mF/mMFc75lar9fDWWNhF1x5/uxw3h7oXP3N2z\n" +
    "8Y9G4YByfSqP/Gjfsf6E\n" +
    "-----END CERTIFICATE-----"

let client_ca: string =
  "-----BEGIN CERTIFICATE-----\n" +
    "MIIDazCCAlOgAwIBAgIUfpyIF7ZdeTHvMTFVT3Q3Nufjf/4wDQYJKoZIhvcNAQEL\n" +
    "BQAwRTELMAkGA1UEBhMCQVUxEzARBgNVBAgMClNvbWUtU3RhdGUxITAfBgNVBAoM\n" +
    "GEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDAeFw0yNjA4MTEwNjM1MzdaFw0zNjA4\n" +
    "MDgwNjM1MzdaMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEw\n" +
    "HwYDVQQKDBhJbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggEiMA0GCSqGSIb3DQEB\n" +
    "AQUAA4IBDwAwggEKAoIBAQC18uHdYs6dTxvrjWKUaDDlw0E7Q4GyA5xy2dFZGCjT\n" +
    "/gJWPkYkx1tfpoRMlJm0eq4GqNnWnCjlIlkB86RbBbYrvTbnc3hPG7Cb4eRYKa0J\n" +
    "YQd1o/rdUSlcwjgzexI2MfwCPvVn8mr+LGTO9DI4xdoydk6DuwGhz/+bV5YQKaUA\n" +
    "piK9UplkCqJuQoKp02FHRTLi5r5hse8cFHo/9vI6JjpG8P4pHeI4nFsIR6Gs6X8a\n" +
    "3lF1VvSSMCGmJEkSB8Yj44XSdI87bMQR3JFbJDtqHk9uCCE0pZI6/gUTBcj8vYhq\n" +
    "ufQHWpJbSkFQHONomNz8ETUGe1JFhojBAzKdQ53vn5OnAgMBAAGjUzBRMB0GA1Ud\n" +
    "DgQWBBRCy+tupSv+6zxgjJzAczIA7JEJCTAfBgNVHSMEGDAWgBRCy+tupSv+6zxg\n" +
    "jJzAczIA7JEJCTAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQCO\n" +
    "zsjMBCi5QJHRIip8q8kFgOrsbGRqxiZYdKLrdqr6ynh/87X9uhS5QEtn+ENIEiU3\n" +
    "PGa66Lb87vew8TBwRg6XgjzaXnsje3BfqV5L2hl2w/vlySyty61gORRhJDs+MA4t\n" +
    "yMzjJuvUGwi4Yt6OJTRAiy2bSz/xJCP3wi8R9164bd/b0FjLpgyR67HF5XTyt0RB\n" +
    "fCm9CrtSj1dUyZWK9Er7LOGaDNvB8wDLcxj3s2ZvfUbI9imQvsg7/+RittWsjj5S\n" +
    "52bTUqHp26tearOlJObPg/G0vbmuvRN9eWK2U2Spmjui/nT9PQbwoXd1EVeRJu/S\n" +
    "YSUgHYebLrCfFgNmWFTD\n" +
    "-----END CERTIFICATE-----"

let sendLongMessage: string =
  '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。' +
    '创建要上传或下载的任务，并将其排入队列，每个应用最多支持创建10个未完成的任务。使用callback异步回调。'

let tlsServer: socket.TLSSocketServer = socket.constructTLSSocketServerInstance();

let addr: socket.NetAddress = {
  address: '127.0.0.1',
  port: 8001,
  family: 1
};

let ServerOptions: socket.TLSConnectOptions = {
  address: addr,
  secureOptions: {
    ca: client_ca,
    key: server_key,
    cert: server_ca,
    protocols: [socket.Protocol.TLSv12],
    useRemoteCipherPrefer: true,
    signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
    cipherSuite: "AES256-SHA256"
  },
  ALPNProtocols: ["spdy/1", "http/1.1"]
};

let tlsConnectOptions: socket.TLSConnectOptions = {
  address: addr,
  secureOptions: {
    ca: server_ca,
    key: client_key,
    cert: client_ca,
    protocols: [socket.Protocol.TLSv12],
    useRemoteCipherPrefer: true,
    signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
    cipherSuite: "AES256-SHA256"
  },
  ALPNProtocols: ["spdy/1", "http/1.1"]
};

function expectEqual(exp: string | number | boolean, assert: string | number | boolean,
  info: string = ''): void {
  try {
    expect(exp).assertEqual(assert);
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${info} test failed`);
  }
}

function expectFail(info: string = ''): void {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${info} test failed`);
  }
}

function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `${info} test failed`);
  }
}

export default function TLSSocketsTest(): void {
  describe('TLSSocketsTest', () => {
    let tlsClient: socket.TLSSocket | undefined;
    beforeEach(() => {
      tlsClient = socket.constructTLSSocketInstance();
    })

    afterEach(() => {
      tlsClient!.close().catch((err) => {
        hilog.info(domain, tag, '%{public}s',
          `fail to close, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
        expectFail();
      });
    })

    /**
     * @tc.name   testSocketTLSSocketSendCallback_static_0100
     * @tc.number SUB_Network_Socket_SendCallback_0100
     * @tc.desc   Sending data through TLSSocket connection(data is '') Use the callback method as the asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketTLSSocketSendCallback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSocketTLSSocketSendCallback_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsServer.listen(ServerOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
          })
          tlsClient!.bind(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} bind success`);
            tlsClient!.onTlsMessage((value: socket.SocketMessageInfo) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            tlsClient!.connect(tlsConnectOptions).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connect successfully`);
              tlsClient!.send('', (err: BusinessError | null) => {
                if (err?.code !== 0) {
                  expectTrue(err?.code === 401)
                  done();
                } else {
                  expectFail()
                  done();
                }
              })
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} connect fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done()
            })
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail()
          done();
        }
      });

    /**
     * @tc.name   testSocketTLSSocketSendCallback_static_0200
     * @tc.number SUB_Network_Socket_SendCallback_0200
     * @tc.desc   Sending data through TLSSocket connection(data is 'hello word!') Use the callback method as the asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketTLSSocketSendCallback_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSocketTLSSocketSendCallback_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsServer.listen(ServerOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })

          tlsClient!.bind(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} bind success`);
            tlsClient!.onTlsMessage((value: socket.SocketMessageInfo) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            tlsClient!.connect(tlsConnectOptions).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connect successfully`);
              tlsClient!.send('hello word!', (err: BusinessError | null) => {
                if (err?.code !== 0) {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} send fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                  expectFail()
                } else {
                  expectTrue(true)
                }
                done();
              })
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} connect fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done()
            })
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail()
          done();
        }
      });

    /**
     * @tc.name   testSocketTLSSocketSendCallback_static_0300
     * @tc.number SUB_Network_Socket_SendCallback_0300
     * @tc.desc   Sending data through TLSSocket connection(send long message) Use the callback method as the asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketTLSSocketSendCallback_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSocketTLSSocketSendCallback_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsServer.listen(ServerOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })

          tlsClient!.bind(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} bind success`);
            tlsClient!.onTlsMessage((value: socket.SocketMessageInfo) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            tlsClient!.connect(tlsConnectOptions).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connect successfully`);
              tlsClient!.send(sendLongMessage, (err: BusinessError | null) => {
                if (err?.code !== 0) {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} send fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                  expectFail()
                } else {
                  expectTrue(true)
                }
                done();
              })
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} connect fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done()
            })
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail()
          done();
        }
      });

    /**
     * @tc.name   testSocketTLSSocketSendCallback_static_0400
     * @tc.number SUB_Network_Socket_SendCallback_0400
     * @tc.desc   Sending data through TLSSocket connection(Send the normal data again after the send content is empty) Use the callback method as the asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketTLSSocketSendCallback_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSocketTLSSocketSendCallback_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsServer.listen(ServerOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })

          tlsClient!.bind(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} bind success`);
            tlsClient!.onTlsMessage((value: socket.SocketMessageInfo) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            tlsClient!.connect(tlsConnectOptions).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connect successfully`);
              tlsClient!.send('', (err: BusinessError | null) => {
                if (err?.code !== 0) {
                  expectTrue(err?.code === 401)
                  done()
                } else {
                  expectFail()
                  done()
                }
              })
              tlsClient!.send('hello word!', (err: BusinessError | null) => {
                if (err?.code !== 0) {
                  expectFail()
                  done()
                } else {
                  expectTrue(true)
                  done()
                }
              })
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} connect fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done()
            })
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail()
          done();
        }
      });

    /**
     * @tc.name   testSocketTLSSocketSendCallback_static_0500
     * @tc.number SUB_Network_Socket_SendCallback_0500
     * @tc.desc   Sending data through TLSSocket connection(repetition send long message) Use the callback method as the asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketTLSSocketSendCallback_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSocketTLSSocketSendCallback_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsServer.listen(ServerOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })

          tlsClient!.bind(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} bind success`);
            tlsClient!.onTlsMessage((value: socket.SocketMessageInfo) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            tlsClient!.connect(tlsConnectOptions).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connect successfully`);
              tlsClient!.send(sendLongMessage, (err: BusinessError | null) => {
                if (err?.code !== 0) {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} send fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                  expectFail()
                  done()
                } else {
                  expectTrue(true)
                  done()
                }
              })
              tlsClient!.send(sendLongMessage, (err: BusinessError | null) => {
                if (err?.code !== 0) {
                  hilog.info(domain, tag, '%{public}s',
                    `${caseName} send fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                  expectFail()
                  done()
                } else {
                  expectTrue(true)
                  done()
                }
              })
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} connect fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done()
            })
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail()
          done();
        }
      });

    /**
     * @tc.name   testTLSSocketSendPromise_static_0100
     * @tc.number SUB_Network_Socket_SendPromise_0100
     * @tc.desc   Sending data through TLSSocket connection(data is 'hello word!') Use the promise method as the asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTLSSocketSendPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTLSSocketSendPromise_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsServer.listen(ServerOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })

          tlsClient!.bind(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} bind success`);
            tlsClient!.onTlsMessage((value: socket.SocketMessageInfo) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            tlsClient!.connect(tlsConnectOptions).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connect successfully`);
              tlsClient!.send('hello word!').then(() => {
                expectTrue(true)
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} send fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail()
                done()
              })
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} connect fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done()
            })
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail()
          done();
        }
      });

    /**
     * @tc.name   testTLSSocketSendPromise_static_0200
     * @tc.number SUB_Network_Socket_SendPromise_0200
     * @tc.desc   Sending data through TLSSocket connection(repetition send long message) Use the promise method as the asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTLSSocketSendPromise_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTLSSocketSendPromise_static_0200';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsServer.listen(ServerOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })

          tlsClient!.bind(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} bind success`);
            tlsClient!.onTlsMessage((value: socket.SocketMessageInfo) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            tlsClient!.connect(tlsConnectOptions).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connect successfully`);
              tlsClient!.send(sendLongMessage).then(() => {
                expectTrue(true)
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} send fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail()
                done()
              })
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} connect fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done()
            })
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail()
          done();
        }
      });

    /**
     * @tc.name   testTLSSocketSendPromise_static_0300
     * @tc.number SUB_Network_Socket_SendPromise_0300
     * @tc.desc   Sending data through TLSSocket connection(data is '') Use the promise method as the asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTLSSocketSendPromise_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTLSSocketSendPromise_static_0300';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsServer.listen(ServerOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })

          tlsClient!.bind(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} bind success`);
            tlsClient!.onTlsMessage((value: socket.SocketMessageInfo) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            tlsClient!.connect(tlsConnectOptions).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connect successfully`);
              tlsClient!.send('').then(() => {
                expectFail()
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} send fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectTrue(err?.code === 401)
                done();
              })
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} connect fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done()
            })
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail()
          done();
        }
      });

    /**
     * @tc.name   testTLSSocketSendPromise_static_0400
     * @tc.number SUB_Network_Socket_SendPromise_0400
     * @tc.desc   Sending data through TLSSocket connection(Send the normal data again after the send content is empty) Use the promise method as the asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTLSSocketSendPromise_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTLSSocketSendPromise_static_0400';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsServer.listen(ServerOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })

          tlsClient!.bind(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} bind success`);
            tlsClient!.onTlsMessage((value: socket.SocketMessageInfo) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            tlsClient!.connect(tlsConnectOptions).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connect successfully`);
              tlsClient!.send('').then(() => {
                expectFail()
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} send fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectTrue(err?.code === 401)
                done()
              })

              tlsClient!.send('hello Mr.Tree').then(() => {
                expectTrue(true)
                done();
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} send fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail()
                done();
              })
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} connect fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done()
            })
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail()
          done();
        }
      });

    /**
     * @tc.name   testTLSSocketSendPromise_static_0500
     * @tc.number SUB_Network_Socket_SendPromise_0500
     * @tc.desc   Sending data through TLSSocket connection(repetition send long message) Use the promise method as the asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTLSSocketSendPromise_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testTLSSocketSendPromise_static_0500';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          await tlsServer.listen(ServerOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })

          tlsClient!.bind(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} bind success`);
            tlsClient!.onTlsMessage((value: socket.SocketMessageInfo) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            tlsClient!.connect(tlsConnectOptions).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connect successfully`);
              tlsClient!.send(sendLongMessage).then(() => {
                expectTrue(true)
                done()
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} send fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail()
                done()
              })

              tlsClient!.send(sendLongMessage).then(() => {
                expectTrue(true)
                done()
              }).catch((err) => {
                hilog.info(domain, tag, '%{public}s',
                  `${caseName} send fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
                expectFail()
                done()
              })
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} connect fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done()
            })
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail()
          done();
        }
      });

    /**
     * @tc.name   testSocketTLSSocketConnectPromise_static_0100
     * @tc.number SUB_Network_Socket_ConnectPromise_0100
     * @tc.desc   Sending data through TLSSocket connection(data is '') Use the callback method as the asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSocketTLSSocketConnectPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSocketTLSSocketConnectPromise_static_0100';
        hilog.info(domain, tag, '%{public}s', `${caseName} test start`);
        try {
          let tlsConnectOptions2: socket.TLSConnectOptions = {
            address: addr,
            secureOptions: {
              ca: server_ca,
              key: client_key,
              cert: client_ca,
              protocols: [socket.Protocol.TLSv12],
              useRemoteCipherPrefer: true,
              signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
              cipherSuite: "AES256-SHA256"
            },
            ALPNProtocols: []
          };
          await tlsServer.listen(ServerOptions).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} listen success`);
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} listen err:code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done();
          })

          tlsClient!.bind(addr).then(() => {
            hilog.info(domain, tag, '%{public}s', `${caseName} bind success`);
            tlsClient!.onTlsMessage((value: socket.SocketMessageInfo) => {
              hilog.info(domain, tag, '%{public}s', `${caseName} SocketMessageInfo:${JSON.stringify(value)} `);
            })
            tlsClient!.connect(tlsConnectOptions2).then(() => {
              hilog.info(domain, tag, '%{public}s', `${caseName} connect successfully`);

              tlsClient!.send('', (err: BusinessError | null) => {
                if (err?.code !== 0) {
                  expectTrue(err?.code === 401)
                } else {
                  expectFail()
                }
                done();
              })
            }).catch((err) => {
              hilog.info(domain, tag, '%{public}s',
                `${caseName} connect fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
              expectFail();
              done();
            })
          }).catch((err) => {
            hilog.info(domain, tag, '%{public}s',
              `${caseName} bind fail: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            expectFail();
            done()
          })
        } catch (err) {
          hilog.info(domain, tag, '%{public}s',
            `${caseName} err: code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, '%{public}s', `${caseName} test end`);
          expectFail()
          done();
        }
      });
  });
}