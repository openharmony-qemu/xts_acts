/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <netinet/ip.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <sys/socket.h>
#include "test.h"

/**
 * @tc.name      : sendmmsg_0100
 * @tc.desc      : Test sendmmsg to send messages through socket
 * @tc.level     : Level 0
 */
void sendmmsg_0100(void)
{
    int sockfd;
    struct sockaddr_in addr;
    struct mmsghdr msg[2];
    struct iovec msg1[2], msg2;
    int retval;

    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd == -1) {
        t_error("sendmmsg_0100 socket error");
        exit(EXIT_FAILURE);
    }

    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
    addr.sin_port = htons(1234);
    if (connect(sockfd, (struct sockaddr *)&addr, sizeof(addr)) == -1) {
        t_error("sendmmsg_0100 connect error");
        exit(EXIT_FAILURE);
    }

    char payload1[] = "one";
    char payload2[] = "two";
    char payload3[] = "three";

    memset(msg1, 0, sizeof(msg1));
    msg1[0].iov_base = payload1;
    msg1[0].iov_len = 3;
    msg1[1].iov_base = payload2;
    msg1[1].iov_len = 3;

    memset(&msg2, 0, sizeof(msg2));
    msg2.iov_base = payload3;
    msg2.iov_len = 5;

    memset(msg, 0, sizeof(msg));
    msg[0].msg_hdr.msg_iov = msg1;
    msg[0].msg_hdr.msg_iovlen = 2;

    msg[1].msg_hdr.msg_iov = &msg2;
    msg[1].msg_hdr.msg_iovlen = 1;

    retval = sendmmsg(sockfd, msg, 2, 0);
    if (retval == -1)
        t_error("sendmmsg_0100 sendmmsg error");
}

static int SendmmsgTest_impl(int argc, char *argv[]){
    sendmmsg_0100();
    return T_STATUS;
}

int SendmmsgTest(void)
{
    static char __libc_prog[] = "libc_test";
    char *__libc_argv[] = { __libc_prog, NULL };
    return SendmmsgTest_impl(1, __libc_argv);
}
