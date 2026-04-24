/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <sys/socket.h>
#include <unistd.h>
#include "functionalext.h"
#define IPPROTO_IP 0
#define IP_HDRINCL 3
#define IP_TTL 2
#define TCP_MAXSEG 2
#define TCP_NODELAY 1
#define IP_TOS 1
#define IP_OPTIONS 4

static int DoGetsockopt(int sockfd, int level, int optname)
{
    int optval = 0;
    socklen_t optlen = sizeof(optval);
    int ret = getsockopt(sockfd, level, optname, &optval, &optlen);
    if (ret == 0) {
        return 0;
    }
    if (errno == ENOPROTOOPT || errno == EOPNOTSUPP || errno == ENOTSUP) {
        return 0;
    }
    return ret;
}

/**
 * @tc.name      : getsockopt_0100
 * @tc.desc      : SOL_SOCKET,SO_DEBUG
 * @tc.level     : Level 0
 */
void getsockopt_0100(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_DEBUG);
    EXPECT_EQ("getsockopt_0100", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_0200
 * @tc.desc      : SOL_SOCKET,SO_REUSEADDR
 * @tc.level     : Level 0
 */
void getsockopt_0200(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR);
    EXPECT_EQ("getsockopt_0200", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_0300
 * @tc.desc      : SOL_SOCKET,SO_TYPE
 * @tc.level     : Level 0
 */
void getsockopt_0300(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_TYPE);
    EXPECT_EQ("getsockopt_0300", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_0400
 * @tc.desc      : SOL_SOCKET,SO_ERROR
 * @tc.level     : Level 0
 */
void getsockopt_0400(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_ERROR);
    EXPECT_EQ("getsockopt_0400", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_0500
 * @tc.desc      : SOL_SOCKET,SO_DONTROUTE
 * @tc.level     : Level 0
 */
void getsockopt_0500(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_DONTROUTE);
    EXPECT_EQ("getsockopt_0500", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_0600
 * @tc.desc      : SOL_SOCKET,SO_BROADCAST
 * @tc.level     : Level 0
 */
void getsockopt_0600(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_BROADCAST);
    EXPECT_EQ("getsockopt_0600", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_0700
 * @tc.desc      : SOL_SOCKET,SO_SNDBUF
 * @tc.level     : Level 0
 */
void getsockopt_0700(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_SNDBUF);
    EXPECT_EQ("getsockopt_0700", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_0800
 * @tc.desc      : SOL_SOCKET,SO_RCVBUF
 * @tc.level     : Level 0
 */
void getsockopt_0800(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_RCVBUF);
    EXPECT_EQ("getsockopt_0800", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_0900
 * @tc.desc      : SOL_SOCKET,SO_KEEPALIVE
 * @tc.level     : Level 0
 */
void getsockopt_0900(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_KEEPALIVE);
    EXPECT_EQ("getsockopt_0900", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_1000
 * @tc.desc      : SOL_SOCKET,SO_OOBINLINE
 * @tc.level     : Level 0
 */
void getsockopt_1000(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_OOBINLINE);
    EXPECT_EQ("getsockopt_1000", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_1100
 * @tc.desc      : SOL_SOCKET,SO_LINGER
 * @tc.level     : Level 0
 */
void getsockopt_1100(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_LINGER);
    EXPECT_EQ("getsockopt_1100", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_1200
 * @tc.desc      : SOL_SOCKET,SO_RCVLOWAT
 * @tc.level     : Level 0
 */
void getsockopt_1200(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_RCVLOWAT);
    EXPECT_EQ("getsockopt_1200", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_1300
 * @tc.desc      : SOL_SOCKET,SO_SNDLOWAT
 * @tc.level     : Level 0
 */
void getsockopt_1300(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_SNDLOWAT);
    EXPECT_EQ("getsockopt_1300", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_1400
 * @tc.desc      : SOL_SOCKET,O_RCVTIMEO
 * @tc.level     : Level 1
 */
void getsockopt_1400(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_RCVTIMEO);
    EXPECT_EQ("getsockopt_1400", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_1500
 * @tc.desc      : SOL_SOCKET,SO_SNDTIMEO
 * @tc.level     : Level 1
 */
void getsockopt_1500(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_SNDTIMEO);
    EXPECT_EQ("getsockopt_1500", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_1600
 * @tc.desc      : SOL_SOCKET,SO_TIMESTAMP
 * @tc.level     : Level 1
 */
void getsockopt_1600(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_TIMESTAMP);
    EXPECT_EQ("getsockopt_1600", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_1700
 * @tc.desc      : SOL_SOCKET,SO_TIMESTAMPNS
 * @tc.level     : Level 1
 */
void getsockopt_1700(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, SOL_SOCKET, SO_TIMESTAMPNS);
    EXPECT_EQ("getsockopt_1700", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_1800
 * @tc.desc      : IPPROTO_IP,IP_HDRINCL
 * @tc.level     : Level 1
 */
void getsockopt_1800(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, IPPROTO_IP, IP_HDRINCL);
    EXPECT_EQ("getsockopt_1800", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_1900
 * @tc.desc      : IPPROTO_IP,IP_OPTIONS
 * @tc.level     : Level 1
 */
void getsockopt_1900(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, IPPROTO_IP, IP_OPTIONS);
    EXPECT_EQ("getsockopt_1900", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_2000
 * @tc.desc      : IPPROTO_IP,IP_TOS
 * @tc.level     : Level 1
 */
void getsockopt_2000(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, IPPROTO_IP, IP_TOS);
    EXPECT_EQ("getsockopt_2000", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_2100
 * @tc.desc      : IPPROTO_IP,IP_TTL
 * @tc.level     : Level 1
 */
void getsockopt_2100(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, IPPROTO_IP, IP_TTL);
    EXPECT_EQ("getsockopt_2100", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_2200
 * @tc.desc      : IPPROTO_IP,TCP_MAXSEGs
 * @tc.level     : Level 1
 */
void getsockopt_2200(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, IPPROTO_IP, TCP_MAXSEG);
    EXPECT_EQ("getsockopt_2200", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_2300
 * @tc.desc      : IPPROTO_IP,TCP_NODELAY
 * @tc.level     : Level 1
 */
void getsockopt_2300(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int content = DoGetsockopt(sockfd, IPPROTO_IP, TCP_NODELAY);
    EXPECT_EQ("getsockopt_2200", content, 0);
    close(sockfd);
}

/**
 * @tc.name      : getsockopt_2400
 * @tc.desc      : SOL_SOCKET,SO_RCVBUF
 * @tc.level     : Level 2
 */
void getsockopt_2400(void)
{
    int optval = 0;
    socklen_t optlen = sizeof(optval);
    int content = getsockopt(0, SOL_SOCKET, SO_RCVBUF, &optval, &optlen);
    EXPECT_EQ("getsockopt_2400", content, -1);
}

/**
 * @tc.name      : getsockopt_2500
 * @tc.desc      : SOL_SOCKET,SO_DEBUG nullptr
 * @tc.level     : Level 2
 */
void getsockopt_2500(void)
{
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    int optval = 0;
    int content = getsockopt(sockfd, SOL_SOCKET, SO_DEBUG, &optval, nullptr);
    EXPECT_EQ("getsockopt_2500", content, -1);
    close(sockfd);
}

static int GetsockoptNetworkTest_impl(void)
{
    getsockopt_0100();
    getsockopt_0200();
    getsockopt_0300();
    getsockopt_0400();
    getsockopt_0500();
    getsockopt_0600();
    getsockopt_0700();
    getsockopt_0800();
    getsockopt_0900();
    getsockopt_1000();
    getsockopt_1100();
    getsockopt_1200();
    getsockopt_1300();
    getsockopt_1400();
    getsockopt_1500();
    getsockopt_1600();
    getsockopt_1700();
    getsockopt_1800();
    getsockopt_1900();
    getsockopt_2000();
    getsockopt_2100();
    getsockopt_2200();
    getsockopt_2300();
    getsockopt_2400();
    getsockopt_2500();
    return t_status;
}

int GetsockoptNetworkTest(void)
{
    return GetsockoptNetworkTest_impl();
}
