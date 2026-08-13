/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export interface EthernetMacAddressInfo {
    ifaceName: string;
    macAddr: string;
  }
  
  export interface EthernetMacAddrInfoList {
    status: number;
    macInfoListSize: number;
    macInfoList: EthernetMacAddressInfo[];
  }
  
  export interface EthernetNetAddr {
    family: number;
    prefixlen: number;
    port: number;
    address: string;
  }
  
  export interface EthernetNetAddrInfo {
    ifaceName: string;
    netAddrInfoSize: number;
    netAddrInfo: EthernetNetAddr[];
  }
  
  export interface EthernetNetAddrInfoList {
    status: number;
    netAddrListSize: number;
    netAddrList: EthernetNetAddrInfo[];
  }
  
  export interface EthernetAllInterfaceInfo {
    status: number;
    ifaceName: string;
    macAddr: string;
    netAddr: EthernetNetAddr;
  }
  
  export interface EthernetAllInterfaceInfoList {
    status: number;
    allInfoListSize: number;
    allInfoList: EthernetAllInterfaceInfo[];
  }
  
  export function OHEthGetNetAddress(): EthernetNetAddrInfoList;
  export function OHEthGetMacAddress(): EthernetMacAddrInfoList;
  
  declare namespace _default {
    function OHEthGetNetAddress(): EthernetNetAddrInfoList;
    function OHEthGetMacAddress(): EthernetMacAddrInfoList;
  }
  export default _default;
  