'use static'
/**
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
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

import connection from '@ohos.net.connection';

const NetBearTypeBEARER_CELLULAR = connection.NetBearType.BEARER_CELLULAR;
const NetBearTypeBEARER_WIFI = connection.NetBearType.BEARER_WIFI;
const NetBearTypeBEARER_BLUETOOTH = connection.NetBearType.BEARER_BLUETOOTH;
const NetBearTypeBEARER_ETHERNET = connection.NetBearType.BEARER_ETHERNET;
const NetBearTypeBEARER_VPN = connection.NetBearType.BEARER_VPN;
const NetCapNET_CAPABILITY_MMS = connection.NetCap.NET_CAPABILITY_MMS;
const NetCapNET_CAPABILITY_NOT_METERED = connection.NetCap.NET_CAPABILITY_NOT_METERED;
const NetCapNET_CAPABILITY_INTERNET = connection.NetCap.NET_CAPABILITY_INTERNET;
const NetCapNET_CAPABILITY_NOT_VPN = connection.NetCap.NET_CAPABILITY_NOT_VPN;
const NetCapNET_NET_CAPABILITY_VALIDATED = connection.NetCap.NET_CAPABILITY_VALIDATED;
const NetCapNET_CAPABILITY_PORTAL = connection.NetCap.NET_CAPABILITY_PORTAL;
const NetCapNET_CAPABILITY_CHECKING_CONNECTIVITY = connection.NetCap.NET_CAPABILITY_CHECKING_CONNECTIVITY;

export default class CommonUtils {
  static isValidV4NetAddress(caseName: string, addr: connection.NetAddress): boolean {
    console.info(caseName + "isValidV4NetAddress:" + JSON.stringify(addr))
    let res: boolean = CommonUtils.isValidIPv4Regex(caseName, addr.address);
    if (addr.family !== undefined) {
      let family = addr.family;
      res = res && family === 1
    }
    if (addr.port !== undefined) {
      let port: int = addr.port as int;
      res = res && port >= 0 && port <= 65535
    }
    return res;
  }

  static isValidIPv6Address(caseName: string, addr: connection.NetAddress, isRoute: boolean = false): boolean {
    console.info(caseName + "isValidIPv6Address：" + JSON.stringify(addr))
    let res: boolean = CommonUtils.validateIPv6GlobalAddress(caseName, addr.address, isRoute);
    if (addr.family !== undefined) {
      let family = addr.family;
      res = res && addr.family === 2;
    }
    if (addr.port !== undefined) {
      let port: int = addr.port as int;
      res = res && port >= 0 && port <= 65535;
    }
    return res;
  }

  static async sleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static isValidIPv4Regex(caseName: string, ip: string): boolean {
    // IPv4正则表达式：
    // ^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$
    // 但需要检查每段数字是否在0-255之间

    const ipv4Pattern = new RegExp('^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$');
    return ipv4Pattern.test(ip);
  }

  /**
   * 基本IPv6地址格式验证
   */
  static isValidIPv6(ip: string): boolean {
    // 简单的IPv6格式正则（匹配压缩和未压缩格式）
    const ipv6Pattern = new RegExp(
      '^(([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}|' +
        '(([0-9a-fA-F]{1,4}:){0,6}[0-9a-fA-F]{1,4})?::' +
        '(([0-9a-fA-F]{1,4}:){0,6}[0-9a-fA-F]{1,4})?)$'
    );

    // 检查IPv4映射的IPv6地址
    const ipv4MappedPattern = new RegExp(
      '^::ffff:(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3})$'
    );

    if (ip.includes('.')) {
      // 包含点号，可能是IPv4映射地址
      if (ipv4MappedPattern.test(ip)) {
        return true;
      }
      return false;
    }
    return ipv6Pattern.test(ip);
  }

  /**
   * 将IPv6地址展开为完整形式（8组4位十六进制）
   */
  static expandIPv6(ip: string): string | null {
    if (!ip || typeof ip !== 'string') {
      return null;
    }

    const ipv4MappedRegex = new RegExp('^::ffff:(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})$');
    const match = ip.match(ipv4MappedRegex);

    if (match) {
      // match[1] 到 match[4] 分别是四个 IPv4 部分
      const p1 = match[1];
      const p2 = match[2];
      const p3 = match[3];
      const p4 = match[4];

      if (p1 === undefined || p2 === undefined || p3 === undefined || p4 === undefined) {
        return null;
      }

      const parts: number[] = [p1, p2, p3, p4].map((p) => parseInt(p, 10));

      // 检查 IPv4 部分是否在 0-255 之间
      for (const num of parts) {
        if (isNaN(num) || num < 0 || num > 255) {
          return null;
        }
      }

      // 转换为十六进制，每部分补零到 2 位
      const hexParts = parts.map((p) => p.toString(16).padStart(2, '0'));
      const ipv4Hex = hexParts.join('');

      // 返回标准格式：0000:0000:0000:0000:0000:ffff:xxxx:xxxx
      return '0000:0000:0000:0000:0000:ffff:' + ipv4Hex.substring(0, 4) + ':' + ipv4Hex.substring(4);
    }

    // 2. 处理双冒号压缩 ::
    if (ip.includes('::')) {
      const splitParts = ip.split('::');
      // :: 只能出现一次，所以 split 后数组长度应为 2
      if (splitParts.length !== 2) {
        return null;
      }

      const leftStr = splitParts[0];
      const rightStr = splitParts[1];

      const leftParts: string[] = leftStr.length > 0 ? leftStr.split(':') : [];
      const rightParts: string[] = rightStr.length > 0 ? rightStr.split(':') : [];

      // 验证左右部分的每一段是否是合法的十六进制段（1-4位）
      const hexSegmentRegex = new RegExp('^[0-9a-fA-F]{1,4}$');
      for (const seg of leftParts) {
        if (!hexSegmentRegex.test(seg)) return null;
      }
      for (const seg of rightParts) {
        if (!hexSegmentRegex.test(seg)) return null;
      }

      // 计算缺失的段数
      const missingGroups = 8 - (leftParts.length + rightParts.length);
      if (missingGroups < 1) {
        return null;
      }

      // 构造中间的全零段
      const middleParts: string[] = [];
      for (let i = 0; i < missingGroups; i++) {
        middleParts.push('0000');
      }

      // 合并所有部分
      const allParts: string[] = [...leftParts, ...middleParts, ...rightParts];

      // 最终检查是否正好 8 段
      if (allParts.length !== 8) {
        return null;
      }

      // 每段填充前导零到 4 位
      return allParts.map((seg) => seg.padStart(4, '0')).join(':');
    }

    // 3. 处理未压缩的标准 IPv6
    const standardParts: string[] = ip.split(':');
    if (standardParts.length !== 8) {
      return null;
    }

    // 验证每一段
    const hexSegmentRegex = new RegExp('^[0-9a-fA-F]{1,4}$');
    for (const seg of standardParts) {
      if (!hexSegmentRegex.test(seg)) {
        return null;
      }
    }

    return standardParts.map((seg) => seg.padStart(4, '0')).join(':');
  }

  /**
   * 更严格的校验函数（包含更多IPv6特性检查）
   */
  static validateIPv6GlobalAddress(caseName: string, ip: string, isRoute: boolean): boolean {
    // 1. 空值检查
    if (!ip || typeof ip !== 'string') {
      console.error(caseName + "地址为空或非字符串")
      return false;
    }

    // 2. 去除两端空格
    const trimmedIp = ip.trim();

    // 3. 基本IPv6格式验证
    if (!CommonUtils.isValidIPv6(trimmedIp)) {
      console.error(caseName + "无效的IPV6格式")
      return false;
    }

    // 4. 检查本地/特殊地址
    const expanded = CommonUtils.expandIPv6(trimmedIp);
    if (!expanded) {
      console.error(caseName + "无法展开IPv6地址")
      return false;
    }

    const firstHex = expanded.substring(0, 4);
    const firstHexNum = parseInt(firstHex, 16);

    // 排除特殊地址范围
    // ::/128 未指定地址
    if (!isRoute) {
      if (expanded === '0000:0000:0000:0000:0000:0000:0000:0000') {
        console.error(caseName + "未指定地址(::/128)")
        return false;
      }

      // ::1/128 环回地址
      if (expanded === '0000:0000:0000:0000:0000:0000:0000:0001') {
        console.error(caseName + "环回地址(::1/128)")
        return false;
      }

      // fe80::/10 链路本地地址
      if (firstHexNum >= 0xfe80 && firstHexNum <= 0xfebf) {
        console.error(caseName + "链路本地地址(fe80::/10)")
        return false;
      }

      // fc00::/7 唯一本地地址
      if (firstHexNum >= 0xfc00 && firstHexNum <= 0xfdff) {
        console.error(caseName + "唯一本地地址(fc00::/7)")
        return false;
      }

      // ff00::/8 组播地址
      if (firstHexNum >= 0xff00 && firstHexNum <= 0xffff) {
        console.error(caseName + "组播地址(ff00::/8)")
        return false;
      }

      // 2000::/3 全局单播地址
      const firstThreeBits = firstHexNum >>> 13;
      if (firstThreeBits !== 0x1) {
        console.error(caseName + "非全局单播地址")
        return false;
      }
    }
    return true;
  }
}

